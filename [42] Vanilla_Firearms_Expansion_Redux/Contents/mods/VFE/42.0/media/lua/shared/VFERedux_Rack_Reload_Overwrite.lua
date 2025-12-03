require "TimedActions/ISReloadWeaponAction"
require "TimedActions/ISRackFirearm"
require "HBVCEF_Overrites"

local ISReloadWeaponAction_stop_old = ISReloadWeaponAction.stop
function ISReloadWeaponAction:stop()
    VFESetWeaponModel(self.gun, false)
    self:setOverrideHandModels(self.gun, nil)
    self.character:setPrimaryHandItem(self.gun);
    if self.gun:isTwoHandWeapon() then
        self.character:setSecondaryHandItem(self.gun);
    end
    return ISReloadWeaponAction_stop_old(self)
end

local ISReloadWeaponAction_animEvent_old = ISReloadWeaponAction.animEvent
function ISReloadWeaponAction:animEvent(event, parameter)
    if event == 'loadFinished' then
        VFESetWeaponModel(self.gun, false)
        return ISReloadWeaponAction_animEvent_old(self, event, parameter)
    end
    if event == 'changeWeaponSprite' then
        if parameter and parameter ~= '' then
            if parameter == 'open' then
                VFESetWeaponModel(self.gun, true)
                self:setOverrideHandModels(self.gun, nil)
            elseif parameter ~= 'original' then
                self.gun:setWeaponSprite(parameter)
                self:setOverrideHandModels(self.gun, nil)
            else
                VFESetWeaponModel(self.gun, false)
                self:setOverrideHandModels(self.gun, nil)
            end
        end
    else
        return ISReloadWeaponAction_animEvent_old(self, event, parameter)
    end
end

local ISRackFirearm_stop_old = ISRackFirearm.stop
function ISRackFirearm:stop()
    VFESetWeaponModel(self.gun, false)
    self:setOverrideHandModels(self.gun, nil)
    self.character:setPrimaryHandItem(self.gun);
    if self.gun:isTwoHandWeapon() then
        self.character:setSecondaryHandItem(self.gun);
    end
    return ISRackFirearm_stop_old(self)
end

local ISRackFirearm_animEvent_old = ISRackFirearm.animEvent
function ISRackFirearm:animEvent(event, parameter)
    if event == 'unloadFinished' then
        VFESetWeaponModel(self.gun, false)
        return ISRackFirearm_animEvent_old(self, event, parameter)
    end
    if event == 'rackingFinished' then
        VFESetWeaponModel(self.gun, false)
        return ISRackFirearm_animEvent_old(self, event, parameter)
    end
    if event == 'changeWeaponSprite' then
        if parameter and parameter ~= '' then
            if parameter == 'open' then
                VFESetWeaponModel(self.gun, true)
            elseif parameter ~= 'original' then
                self.gun:setWeaponSprite(parameter)
            else
                VFESetWeaponModel(self.gun, false)
            end
            self:setOverrideHandModels(self.gun, nil)
            self.character:setPrimaryHandItem(self.gun);
            if self.gun:isTwoHandWeapon() then
                self.character:setSecondaryHandItem(self.gun);
            end
        end
    else
        return ISRackFirearm_animEvent_old(self, event, parameter)
    end
end

local ISUnloadBulletsFromFirearm_animEvent_old = ISUnloadBulletsFromFirearm.animEvent
function ISUnloadBulletsFromFirearm:animEvent(event, parameter)
    if event == 'unloadFinished' then
        VFESetWeaponModel(self.gun, false)
        return ISUnloadBulletsFromFirearm_animEvent_old(self, event, parameter)
    end
    if event == 'changeWeaponSprite' then
        if parameter and parameter ~= '' then
            if parameter == 'open' then
                VFESetWeaponModel(self.gun, true)
            elseif parameter ~= 'original' then
                self.gun:setWeaponSprite(parameter)
            else
                VFESetWeaponModel(self.gun, false)
            end
            self:setOverrideHandModels(self.gun, nil)
            self.character:setPrimaryHandItem(self.gun);
            if self.gun:isTwoHandWeapon() then
                self.character:setSecondaryHandItem(self.gun);
            end
        end
    else
        return ISUnloadBulletsFromFirearm_animEvent_old(self, event, parameter)
    end
end

local ISUnloadBulletsFromFirearm_stop_old = ISUnloadBulletsFromFirearm.stop
function ISUnloadBulletsFromFirearm:stop()
    VFESetWeaponModel(self.gun, false)
    self:setOverrideHandModels(self.gun, nil)
    self.character:setPrimaryHandItem(self.gun);
    if self.gun:isTwoHandWeapon() then
        self.character:setSecondaryHandItem(self.gun);
    end
    return ISUnloadBulletsFromFirearm_stop_old(self)
end

Events.OnWeaponSwingHitPoint.Remove(ISReloadWeaponAction.onShoot)

local m1BlocParam = {
    casing = "Base.M60_Link",
    forwardOffset = 0.30,
    sideOffset = 0.10,
    heightOffset = 0.45,
    shellForce = 0.20,
    manualEjection = false,
    sideSpread = 45,
    heightSpread = 60
}

ISReloadWeaponAction.onShoot = function(player, weapon)
    if not weapon:isRanged() then return; end

    if MoodlesUI.getInstance() then
        MoodlesUI.getInstance():wiggle(MoodleType.Panic);
        MoodlesUI.getInstance():wiggle(MoodleType.Stress);
        MoodlesUI.getInstance():wiggle(MoodleType.Drunk);
        MoodlesUI.getInstance():wiggle(MoodleType.Tired);
        MoodlesUI.getInstance():wiggle(MoodleType.Endurance);
        local body = player:getBodyDamage():getBodyParts()
        for x = BodyPartType.ToIndex(BodyPartType.Hand_L), BodyPartType.ToIndex(BodyPartType.UpperArm_R), 1 do
            if body:get(x):getPain() then
                MoodlesUI.getInstance():wiggle(MoodleType.Pain);
                break
            end
        end
    end

    if getDebug() and player:isUnlimitedAmmo() then
        return;
    end

    if weapon:getFullType() == "Base.AssaultRifleM1" then
        if weapon:isRoundChambered() and weapon:getCurrentAmmoCount() == 0 then
            weapon:setWeaponSprite("AssaultRifleM1_Open")
            --self:setOverrideHandModels(self.gun, nil) this works in animations but not here
            player:setPrimaryHandItem(weapon);
            if weapon:isTwoHandWeapon() then
                player:setSecondaryHandItem(weapon);
            end
            player:getEmitter():playSound("M1Ping")
            if SpentCasingPhysics then
                SpentCasingPhysics.doSpawnCasing(player, weapon, m1BlocParam)
            end
        end
    end

    if weapon:haveChamber() then
        weapon:setRoundChambered(false);
        weapon:setSpentRoundChambered(true)
    end

    if not weapon:isRackAfterShoot() then
        if not weapon:isManuallyRemoveSpentRounds() then
            -- TODO: check for extraction jam
            weapon:setSpentRoundChambered(false)
            -- if weapon:getShellFallSound() then
            --     player:getEmitter():playSound(weapon:getShellFallSound())
            -- end
        end
        if weapon:getCurrentAmmoCount() >= weapon:getAmmoPerShoot() then
            if weapon:haveChamber() then
                weapon:setRoundChambered(true);
            end
            if not isClient() then
                weapon:setCurrentAmmoCount(weapon:getCurrentAmmoCount() - weapon:getAmmoPerShoot())
            end
            if (weapon:getJamGunChance() > 0) then
                weapon:checkJam(player, false)
            end
        end
    end
    if weapon:isManuallyRemoveSpentRounds() then
        weapon:setSpentRoundCount(weapon:getSpentRoundCount() + weapon:getAmmoPerShoot())
    end

    syncHandWeaponFields(player, weapon)
end

Events.OnWeaponSwingHitPoint.Add(ISReloadWeaponAction.onShoot)

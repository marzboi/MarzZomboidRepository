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

local m1BlocParam = {
    casing = "Base.m1Bloc", --to be done
    forwardOffset = 0.30,
    sideOffset = 0.10,
    heightOffset = 0.45,
    shellForce = 0.20,
    manualEjection = false,
    sideSpread = 45,
    heightSpread = 60
}

local old_ISReloadWeaponAction_onShoot = ISReloadWeaponAction.onShoot
Events.OnWeaponSwingHitPoint.Remove(ISReloadWeaponAction.onShoot)

ISReloadWeaponAction.onShoot = function(player, weapon)
    if weapon:getFullType() == "Base.AssaultRifleM1" then
        if weapon:isRoundChambered() and weapon:getCurrentAmmoCount() == 0 then
            weapon:setWeaponSprite("AssaultRifleM1_Open")
            player:setPrimaryHandItem(weapon);
            if weapon:isTwoHandWeapon() then
                player:setSecondaryHandItem(weapon);
            end
            player:getEmitter():playSound("M1Ping")
            if SpentCasingPhysics then
                -- SpentCasingPhysics.doSpawnCasing(player, weapon, m1BlocParam) -- If you are looking at this, why? ;)
            end
        end
    end

    old_ISReloadWeaponAction_onShoot(player, weapon)
end

Events.OnWeaponSwingHitPoint.Add(ISReloadWeaponAction.onShoot)

Hook.Attack.Remove(ISReloadWeaponAction.attackHook);

ISReloadWeaponAction.attackHook = function(character, chargeDelta, weapon)
    ISTimedActionQueue.clear(character)
    if character:isAttackStarted() then return; end
    if instanceof(character, "IsoPlayer") and not character:isAuthorizeMeleeAction() then
        return;
    end
    if weapon:isRanged() and not character:isDoShove() then
        if ISReloadWeaponAction.canShoot(character, weapon) then
            character:playSound(weapon:getSwingSound());
            local radius = weapon:getSoundRadius() *
                getSandboxOptions():getOptionByName("FirearmNoiseMultiplier"):getValue();
            if not character:isOutside() then
                radius = radius * 0.5
            end
            character:addWorldSoundUnlessInvisible(radius, weapon:getSoundVolume(), true);
            character:DoAttack(0);
        else
            character:DoAttack(0);
            character:setRangedWeaponEmpty(true);
        end
    elseif (not character:getVehicle() or character:isDoShove()) then
        ISTimedActionQueue.clear(character)
        if (chargeDelta == nil) then
            character:DoAttack(0);
        else
            character:DoAttack(chargeDelta);
        end
    end
end

Hook.Attack.Add(ISReloadWeaponAction.attackHook);

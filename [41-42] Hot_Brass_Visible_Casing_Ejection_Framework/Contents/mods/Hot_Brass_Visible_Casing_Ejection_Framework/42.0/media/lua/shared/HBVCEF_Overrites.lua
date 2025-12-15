require 'TimedActions/ISReloadWeaponAction'
require 'TimedActions/ISRackFirearm'

------- Racking ---------------
local ISRackFirearm_removeBullets = ISRackFirearm.removeBullet
function ISRackFirearm:removeBullet()
    if self.gun:isManuallyRemoveSpentRounds() then
        ISRackFirearm_removeBullets(self)
    else
        self.emptyRack = false
    end
end

function ISRackFirearm:ejectSpentRounds()
    if self.gun:getSpentRoundCount() > 0 then
        for i = 1, self.gun:getSpentRoundCount() do
            SpentCasingPhysics.rackCasing(self.character, self.gun, false)
        end
        self.gun:setSpentRoundCount(0)
        syncHandWeaponFields(self.character, self.gun)
    elseif self.gun:isSpentRoundChambered() then
        self.gun:setSpentRoundChambered(false)
        self.ejectingSpentRound = true
        self.racking = false
        syncHandWeaponFields(self.character, self.gun)
    else
        return
    end
end

local ISRackFirearm_animEvent = ISRackFirearm.animEvent
function ISRackFirearm:animEvent(event, parameter)
    if self.ejectingSpentRound then
        if event == 'ejectCasing' then
            SpentCasingPhysics.rackCasing(self.character, self.gun, false)
        end
    end
    if self.racking and not self.emptyRack then
        if event == 'ejectCasing' then
            SpentCasingPhysics.rackCasing(self.character, self.gun, true)
        end
    end
    return ISRackFirearm_animEvent(self, event, parameter)
end

local old_new = ISRackFirearm.new
function ISRackFirearm:new(character, gun)
    local o = old_new(self, character, gun)
    o.ejectingSpentRound = false
    o.racking = true
    o.emptyRack = true
    return o
end

------- Reloading -------------
function ISReloadWeaponAction:ejectSpentRounds()
    if self.gun:getSpentRoundCount() > 0 then
        for i = 1, self.gun:getSpentRoundCount() do
            SpentCasingPhysics.rackCasing(self.character, self.gun, false)
        end
        self.gun:setSpentRoundCount(0)
        syncHandWeaponFields(self.character, self.gun)
    elseif self.gun:isSpentRoundChambered() then
        self.gun:setSpentRoundChambered(false)
        SpentCasingAnimSync.scheduleRack(self.character, self.gun, false)
        syncHandWeaponFields(self.character, self.gun)
    else
        return
    end
end

------- OnShoot -------------
Events.OnWeaponSwingHitPoint.Remove(ISReloadWeaponAction.onShoot)
ISReloadWeaponAction.onShoot = function(player, weapon)
    if not weapon:isRanged() then return; end

    if MoodlesUI.getInstance() then
        MoodlesUI.getInstance():wiggle(MoodleType.PANIC);
        MoodlesUI.getInstance():wiggle(MoodleType.STRESS);
        MoodlesUI.getInstance():wiggle(MoodleType.DRUNK);
        MoodlesUI.getInstance():wiggle(MoodleType.TIRED);
        MoodlesUI.getInstance():wiggle(MoodleType.ENDURANCE);
        local body = player:getBodyDamage():getBodyParts()
        for x = BodyPartType.ToIndex(BodyPartType.Hand_L), BodyPartType.ToIndex(BodyPartType.UpperArm_R), 1 do
            if body:get(x):getPain() then
                MoodlesUI.getInstance():wiggle(MoodleType.PAIN);
                break
            end
        end
    end

    if getDebug() and player:isUnlimitedAmmo() then
        return;
    end

    if weapon:haveChamber() then
        weapon:setRoundChambered(false);
        weapon:setSpentRoundChambered(true)
    end
    if not weapon:isRackAfterShoot() then
        if not weapon:isManuallyRemoveSpentRounds() then
            -- TODO: check for extraction jam
            weapon:setSpentRoundChambered(false)
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

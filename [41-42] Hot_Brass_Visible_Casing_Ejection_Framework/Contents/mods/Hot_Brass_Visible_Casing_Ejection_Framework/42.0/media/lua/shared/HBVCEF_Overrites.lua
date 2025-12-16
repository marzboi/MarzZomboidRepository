require 'TimedActions/ISReloadWeaponAction'
require 'TimedActions/ISRackFirearm'

------- Racking ---------------
function ISRackFirearm:removeBullet()
    SpentCasingAnimSync.scheduleRack(self.character, self.gun, true)
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
        SpentCasingAnimSync.scheduleRack(self.character, self.gun, false)
        syncHandWeaponFields(self.character, self.gun)
    else
        return
    end
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

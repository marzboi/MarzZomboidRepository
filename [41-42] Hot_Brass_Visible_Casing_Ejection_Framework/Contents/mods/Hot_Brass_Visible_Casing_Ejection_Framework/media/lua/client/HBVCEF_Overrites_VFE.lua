require "TimedActions/ISReloadWeaponAction"
require "VFE_WeaponScriptOverwrite"
require "HBVCEF_Overrites"


Events.OnWeaponSwingHitPoint.Remove(ISReloadWeaponAction.onShoot);

ISReloadWeaponAction.onShoot = function(player, weapon)
    if not weapon:isRanged() then return; end
    if getDebug() and getDebugOptions():getBoolean("Cheat.Player.UnlimitedAmmo") then
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
        end
    end
    if weapon:haveChamber() then
        weapon:setRoundChambered(false);
    end
    if weapon:isRackAfterShoot() then
        -- shotgun need to be rack after each shot to rechamber round
        -- See ISReloadWeaponAction.OnPlayerAttackFinished()
        if weapon:haveChamber() then
            weapon:setSpentRoundChambered(true);
        end
    else
        -- automatic weapons eject the bullet cartridge
        if not weapon:isManuallyRemoveSpentRounds() then
            if weapon:getShellFallSound() then
                player:getEmitter():playSound(weapon:getShellFallSound())
            end
        end
        if weapon:getCurrentAmmoCount() >= weapon:getAmmoPerShoot() then
            -- remove ammo, add one to chamber if we still have some
            if weapon:haveChamber() then
                weapon:setRoundChambered(true);
            end
            weapon:setCurrentAmmoCount(weapon:getCurrentAmmoCount() - weapon:getAmmoPerShoot())
        end
    end
    if weapon:isManuallyRemoveSpentRounds() then
        weapon:setSpentRoundCount(weapon:getSpentRoundCount() + weapon:getAmmoPerShoot())
    end
    local modData = weapon:getModData()
    if modData.roundsNoJam == nil then
        modData.roundsNoJam = 0
    end
    if weapon:getCondition() < weapon:getConditionMax() then
        modData.roundsNoJam = modData.roundsNoJam + 1
    end
    if not weapon:isRackAfterShoot() then -- Jam is calculated on rack for these guns
        calculateWeaponJam(weapon)
    end
end

Events.OnWeaponSwingHitPoint.Add(ISReloadWeaponAction.onShoot);

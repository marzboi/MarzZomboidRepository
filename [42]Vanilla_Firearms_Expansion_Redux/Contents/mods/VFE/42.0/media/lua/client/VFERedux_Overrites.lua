ISReloadWeaponAction.onShoot = function(player, weapon)
    if not weapon:isRanged() then return; end

    -- for the dedicated server
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
    -- shotgun need to be rack after each shot to rechamber round
    -- See ISReloadWeaponAction.OnPlayerAttackFinished()
    -- Jam check is handled by rack action
    if not weapon:isRackAfterShoot() then
        -- automatic weapons eject the bullet cartridge
        if not weapon:isManuallyRemoveSpentRounds() then
            -- TODO: check for extraction jam
            weapon:setSpentRoundChambered(false)
            -- if weapon:getShellFallSound() then
            -- 	player:getEmitter():playSound(weapon:getShellFallSound()) -- letting the sound play at the casing falling
            -- end
        end
        if weapon:getCurrentAmmoCount() >= weapon:getAmmoPerShoot() then
            -- remove ammo, add one to chamber if we still have some
            if weapon:haveChamber() then
                weapon:setRoundChambered(true);
            end
            if not isClient() then
                weapon:setCurrentAmmoCount(weapon:getCurrentAmmoCount() - weapon:getAmmoPerShoot())
            end
            -- check if we jam feeding the round into the chamber
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

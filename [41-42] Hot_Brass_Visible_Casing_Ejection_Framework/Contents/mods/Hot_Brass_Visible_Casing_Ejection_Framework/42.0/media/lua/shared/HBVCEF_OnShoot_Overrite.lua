local _orig_ISReloadWeaponAction_onShoot = ISReloadWeaponAction.onShoot

Events.OnGameBoot.Add(function()
    if Events.OnWeaponSwingHitPoint and Events.OnWeaponSwingHitPoint.Remove then
        Events.OnWeaponSwingHitPoint.Remove(_orig_ISReloadWeaponAction_onShoot)
    end

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
end)

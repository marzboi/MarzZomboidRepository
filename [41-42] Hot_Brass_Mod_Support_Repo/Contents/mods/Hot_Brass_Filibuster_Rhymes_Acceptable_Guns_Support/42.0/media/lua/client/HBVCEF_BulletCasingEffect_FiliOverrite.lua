--- I gotta override my function for Filibuster to prevent spawnCasing when triggering fire on safe mode
local orig_SpentCasingPhysics_spawnCasing = SpentCasingPhysics.spawnCasing

Events.OnGameBoot.Add(function()
    if Events.OnWeaponSwing and Events.OnWeaponSwing.Remove then
        Events.OnWeaponSwing.Remove(orig_SpentCasingPhysics_spawnCasing)
    end

    function SpentCasingPhysics.spawnCasing(player, weapon)
        if not player or player:isDead() then return end
        if not weapon then return end
        local firemode = weapon:getFireMode()

        local params = SpentCasingPhysics.WeaponEjectionPortParams[weapon:getFullType()]
        if not params then return end

        if params.manualEjection then return end

        if weapon:isRoundChambered()
            and not weapon:isJammed()
            and weapon:haveChamber()
            and firemode ~= "Safe" then
            SpentCasingPhysics.doSpawnCasing(player, weapon, params, false)
        end
    end

    Events.OnWeaponSwing.Add(SpentCasingPhysics.spawnCasing)
end)

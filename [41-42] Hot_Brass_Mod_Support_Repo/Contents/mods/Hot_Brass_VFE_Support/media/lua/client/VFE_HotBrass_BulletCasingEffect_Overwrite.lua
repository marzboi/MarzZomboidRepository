local orig_SpentCasingPhysics_spawnCasing = SpentCasingPhysics.spawnCasing

local m60LinkParam = {
    casing         = "Base.M60_Link",
    forwardOffset  = 0.30,
    sideOffset     = 0.10,
    heightOffset   = 0.45,
    shellForce     = 0.35,
    manualEjection = false,
    sideSpread     = 45,
    heightSpreed   = 60
}

Events.OnGameBoot.Add(function()
    if Events.OnWeaponSwing and Events.OnWeaponSwing.Remove and orig_SpentCasingPhysics_spawnCasing then
        Events.OnWeaponSwing.Remove(orig_SpentCasingPhysics_spawnCasing)
    end

    function SpentCasingPhysics.spawnCasing(player, weapon)
        if not player or player:isDead() then return end
        if not weapon then return end

        local params = SpentCasingPhysics.WeaponEjectionPortParams[weapon:getFullType()]
        if not params then return end

        if params.manualEjection then return end

        if weapon:isRoundChambered() and not weapon:isJammed() and weapon:haveChamber() then
            if weapon:hasTag("M60_Link") then
                local brassCatcher = weapon:getRecoilpad()
                if brassCatcher then
                    player:getInventory():AddItem("Base.308Bullets_Casing")
                    player:getInventory():AddItem("Base.M60_Link")
                else
                    SpentCasingPhysics.doSpawnCasing(player, weapon, params)
                    SpentCasingPhysics.doSpawnCasing(player, weapon, m60LinkParam)
                end
            else
                SpentCasingPhysics.doSpawnCasing(player, weapon, params)
            end
        end
    end

    Events.OnWeaponSwing.Add(SpentCasingPhysics.spawnCasing)
end)

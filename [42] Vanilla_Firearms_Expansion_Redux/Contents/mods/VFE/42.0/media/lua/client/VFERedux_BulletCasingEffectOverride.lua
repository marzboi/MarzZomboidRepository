require "HBVCEF_BulletCasingEffect"

if SpentCasingPhysics then
    Events.OnWeaponSwing.Remove(SpentCasingPhysics.spawnCasing)

    local m60LinkParam = {
        casing = "Base.M60_Link",
        forwardOffset = 0.30,
        sideOffset = 0.10,
        heightOffset = 0.45,
        shellForce = 0.20,
        manualEjection = false,
        sideSpread = 45,
        heightSpread = 60
    }

    function SpentCasingPhysics.addCasing(
        player,
        weapon,
        square,
        casingType,
        startX,
        startY,
        startZ,
        velocityX,
        velocityY,
        velocityZ)
        if not square then return end

        local casingData = {
            player = player,
            weapon = weapon,
            square = square,
            casingType = casingType,
            x = startX,
            y = startY,
            z = startZ,
            velocityX = velocityX or 0,
            velocityY = velocityY or 0,
            velocityZ = velocityZ or 0.1,
            active = true,
            currentWorldItem = nil,
            floorBounces = SpentCasingPhysics.RANDOM:random(1, 2),
            hasHitFloor = false,
            repeatCasingSound = true,
        }

        casingData.currentWorldItem = square:AddWorldInventoryItem(casingType, startX, startY, startZ)

        table.insert(SpentCasingPhysics.activeCasings, casingData)
    end

    function SpentCasingPhysics.playCasingImpactSound(casing, square)
        if not casing or not casing.player then return end
        if not casing.repeatCasingSound then return end

        if casing.casingType == "Base.M1Bloc" then
            casing.player:getEmitter():playSound("M1PingDrop")
            casing.repeatCasingSound = false
        end

        local family = SpentCasingPhysics.getCasingSoundFamily(casing)
        local surfaceTypeName = SpentCasingPhysics.getSurfaceTypeFromSquare(square)

        local familyParams = SpentCasingPhysics.CasingImpactSoundParams[family]
        if not familyParams then return end

        local params = familyParams[surfaceTypeName] or familyParams.Concrete
        if not params then return end

        local count = params.variations or 1
        local idx = 1
        if count > 1 then
            idx = SpentCasingPhysics.RANDOM:random(1, count)
        end

        local soundName = params.prefix .. tostring(idx)
        casing.player:getEmitter():playSound(soundName)
    end

    function SpentCasingPhysics.spawnCasing(player, weapon)
        if not player or player:isDead() then return end
        if not weapon then return end

        local params = SpentCasingPhysics.WeaponEjectionPortParams[weapon:getFullType()]
        if not params then return end

        if params.manualEjection then return end

        if weapon:isRoundChambered() and not weapon:isJammed() and weapon:haveChamber() then
            if weapon:hasTag(VFETags.m60_link) then
                local brassCatcher = weapon:getWeaponPart('RecoilPad')
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
end

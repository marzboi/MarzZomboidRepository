require "HBVCEF_BulletCasingEffect_Server"

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
    if not casing then return end

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
    local idx = (count > 1) and SpentCasingPhysics.RANDOM:random(1, count) or 1
    local soundName = params.prefix .. tostring(idx)

    if isServer() then
        if casing.player then
            sendServerCommand(casing.player, "HBVCEF", "playCasingImpactSound", { sound = soundName })
        else
            sendServerCommand("HBVCEF", "playCasingImpactSound", { sound = soundName })
        end
        return
    end

    if casing.player then
        casing.player:getEmitter():playSound(soundName)
    end
end

function SpentCasingPhysics.spawnCasing(player, weapon)
    if not player or player:isDead() then return end
    if not weapon then return end
    if weapon:isRackAfterShoot() or weapon:isManuallyRemoveSpentRounds() then return end

    local params = SpentCasingPhysics.WeaponEjectionPortParams[weapon:getFullType()]
    if not params then return end

    if weapon:isRoundChambered() and not weapon:isJammed() and weapon:haveChamber() then
        if weapon:hasTag("M60_Link") then
            local brassCatcher = weapon:getWeaponPart('RecoilPad')
            if brassCatcher then
                player:getInventory():AddItem("Base.308Bullets_Casing")
                player:getInventory():AddItem("Base.M60_Link")
            else
                SpentCasingPhysics.doSpawnCasing(player, weapon, params, false, "Base.308Bullets_Casing")
                SpentCasingPhysics.doSpawnCasing(player, weapon, params, false, "Base.M60_Link")
            end
        else
            SpentCasingPhysics.doSpawnCasing(player, weapon, params)
        end
    end
end

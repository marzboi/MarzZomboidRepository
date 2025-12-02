SpentCasingPhysics.activeCasings           = {}
SpentCasingPhysics.RANDOM                  = newrandom()
SpentCasingPhysics.GRAVITY                 = 0.020
SpentCasingPhysics.XY_STEP                 = 0.10
SpentCasingPhysics.Z_STEP                  = 0.05
SpentCasingPhysics.GRAVITY_SCALE           = 1.0
SpentCasingPhysics.DRAG_XY                 = 0.97
SpentCasingPhysics.DRAG_Z                  = 0.995
SpentCasingPhysics.SETTLE_THRESHOLD        = 0.001
SpentCasingPhysics.BOUNCE_RESTITUTION      = 0.60
SpentCasingPhysics.BOUNCE_POSITION_CORRECT = 0.12
SpentCasingPhysics.BOUNCE_MIN_VELOCITY     = 0.004
SpentCasingPhysics.LOW_WALL_Z_THRESHOLD    = 0.25

SpentCasingPhysics.IsoDirections           = IsoDirections

SpentCasingPhysics.SurfaceType             = {
    Concrete = "Concrete",
    Dirt     = "Dirt",
    Grass    = "Grass",
    Puddles  = "Puddles",
    Snow     = "Snow",
    Wood     = "Wood",
}

SpentCasingPhysics.FOOTSTEP_TO_SURFACE     = {
    Asphalt    = SpentCasingPhysics.SurfaceType.Concrete,
    Concrete   = SpentCasingPhysics.SurfaceType.Concrete,
    Tile       = SpentCasingPhysics.SurfaceType.Concrete,
    Linoleum   = SpentCasingPhysics.SurfaceType.Concrete,

    Dirt       = SpentCasingPhysics.SurfaceType.Dirt,
    Gravel     = SpentCasingPhysics.SurfaceType.Dirt,
    Sand       = SpentCasingPhysics.SurfaceType.Dirt,
    Carpet     = SpentCasingPhysics.SurfaceType.Dirt,

    Grass      = SpentCasingPhysics.SurfaceType.Grass,
    Leaves     = SpentCasingPhysics.SurfaceType.Grass,

    Puddle     = SpentCasingPhysics.SurfaceType.Puddles,
    Water      = SpentCasingPhysics.SurfaceType.Puddles,

    Snow       = SpentCasingPhysics.SurfaceType.Snow,
    Ice        = SpentCasingPhysics.SurfaceType.Snow,

    Wood       = SpentCasingPhysics.SurfaceType.Wood,
    FloorBoard = SpentCasingPhysics.SurfaceType.Wood,
}

SpentCasingPhysics.CasingImpactSoundParams = {
    Bullet = {
        Concrete = { prefix = "Bullet_Concrete_", variations = 6 },
        Dirt     = { prefix = "Bullet_Dirt_", variations = 6 },
        Grass    = { prefix = "Bullet_Grass_", variations = 6 },
        Puddles  = { prefix = "Bullet_Puddles_", variations = 6 },
        Snow     = { prefix = "Bullet_Snow_", variations = 6 },
        Wood     = { prefix = "Bullet_Wood_", variations = 6 },
    },
    Shells = {
        Concrete = { prefix = "Shells_Concrete_", variations = 6 },
        Dirt     = { prefix = "Shells_Dirt_", variations = 6 },
        Grass    = { prefix = "Shells_Grass_", variations = 6 },
        Puddles  = { prefix = "Shells_Puddles_", variations = 6 },
        Snow     = { prefix = "Shells_Snow_", variations = 6 },
        Wood     = { prefix = "Shells_Wood_", variations = 6 },
    }
}

function SpentCasingPhysics.isVisuallyLowWall(wall)
    if not wall then return false end
    local props = wall.getProperties and wall:getProperties() or nil
    if not props then return false end

    if props:Is(IsoFlagType.transparentW)
        or props:Is(IsoFlagType.transparentN)
        or props:Is(IsoFlagType.HoppableW)
        or props:Is(IsoFlagType.HoppableN)
    then
        return true
    end
    return false
end

function SpentCasingPhysics.isWaterFloor(floor)
    if not floor then return false end
    local props = floor.getProperties and floor:getProperties() or nil
    if not props then return false end

    if props:Is(IsoFlagType.water) then
        return true
    end
    return false
end

function SpentCasingPhysics.isGrassFloor(floor)
    if not floor then return false end
    local props = floor.getProperties and floor:getProperties() or nil
    if not props then return false end

    if props then
        local mat = props:Val("FootstepMaterial")
        if mat == "Grass" then
            return true
        end
    end
    return false
end

function SpentCasingPhysics.getTileTopZ(square)
    if not square then return nil end

    local objects = square:getObjects()
    if not objects then return nil end

    local topZ = nil

    for i = 0, objects:size() - 1 do
        local obj = objects:get(i)
        if obj then
            local surfOff = nil

            if obj.getSurfaceOffsetNoTable then
                surfOff = obj:getSurfaceOffsetNoTable()
            end

            if (not surfOff or surfOff <= 0) and obj.getSurfaceOffset then
                local so = obj:getSurfaceOffset()
                if so and so > 0 then
                    surfOff = so
                end
            end

            if surfOff and surfOff > 0 then
                local z = surfOff / 96.0
                if not topZ or z > topZ then
                    topZ = z
                end
            end
        end
    end

    return topZ
end

function SpentCasingPhysics.getSurfaceTypeFromSquare(square)
    if not square then
        return SpentCasingPhysics.SurfaceType.Concrete
    end

    local floor = square:getFloor()
    if not floor then
        return SpentCasingPhysics.SurfaceType.Concrete
    end

    if SpentCasingPhysics.isWaterFloor(floor) then
        return SpentCasingPhysics.SurfaceType.Puddles
    end

    local props = floor.getProperties and floor:getProperties() or nil
    if not props then
        return SpentCasingPhysics.SurfaceType.Concrete
    end

    local mat = props:Val("FootstepMaterial")
    local surface = SpentCasingPhysics.FOOTSTEP_TO_SURFACE[mat]

    return surface or SpentCasingPhysics.SurfaceType.Concrete
end

function SpentCasingPhysics.getCasingSoundFamily(casing)
    if not casing then
        return "Bullet"
    end

    local weapon = casing.weapon

    if weapon and weapon.getAmmoType then
        local ammoType = weapon:getAmmoType()
        if ammoType and (ammoType == "Base.ShotgunShells"
                or string.find(ammoType, "ShotgunShells", 1, true)) then
            return "Shells"
        end
    end

    local ctype = casing.casingType or ""
    if string.find(ctype, "ShotgunShells", 1, true) then
        return "Shells"
    end

    return "Bullet"
end

function SpentCasingPhysics.playCasingImpactSound(casing, square)
    if not casing or not casing.player then return end

    local family          = SpentCasingPhysics.getCasingSoundFamily(casing)
    local surfaceTypeName = SpentCasingPhysics.getSurfaceTypeFromSquare(square)

    local familyParams    = SpentCasingPhysics.CasingImpactSoundParams[family]
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

function SpentCasingPhysics.GT()
    return GameTime.getInstance()
end

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
        player           = player,
        weapon           = weapon,
        square           = square,
        casingType       = casingType,
        x                = startX,
        y                = startY,
        z                = startZ,
        velocityX        = velocityX or 0,
        velocityY        = velocityY or 0,
        velocityZ        = velocityZ or 0.1,
        active           = true,
        currentWorldItem = nil,
        floorBounces     = SpentCasingPhysics.RANDOM:random(0, 2),
        hasHitFloor      = false,
    }

    casingData.currentWorldItem = square:AddWorldInventoryItem(casingType, startX, startY, startZ)

    table.insert(SpentCasingPhysics.activeCasings, casingData)
end

function SpentCasingPhysics.update()
    local dt    = SpentCasingPhysics.GT():getTimeDelta() or (1 / 60)
    local scale = dt * 60
    local i     = 1

    while i <= #SpentCasingPhysics.activeCasings do
        local casing = SpentCasingPhysics.activeCasings[i]
        local removed = false

        if not casing or not casing.square or not casing.active then
            table.remove(SpentCasingPhysics.activeCasings, i)
            removed = true
        else
            local prevZ      = casing.z or 0
            casing.velocityZ = casing.velocityZ - (SpentCasingPhysics.GRAVITY * SpentCasingPhysics.GRAVITY_SCALE * scale)

            casing.x         = casing.x + (casing.velocityX * SpentCasingPhysics.XY_STEP * scale)
            casing.y         = casing.y + (casing.velocityY * SpentCasingPhysics.XY_STEP * scale)
            casing.z         = casing.z + (casing.velocityZ * SpentCasingPhysics.Z_STEP * scale)

            casing.z         = math.max(0, casing.z)

            local worldX     = casing.square:getX() + casing.x
            local worldY     = casing.square:getY() + casing.y
            local worldZ     = casing.square:getZ()

            local dragXY     = math.pow(SpentCasingPhysics.DRAG_XY, scale)
            local dragZ      = math.pow(SpentCasingPhysics.DRAG_Z, scale)
            casing.velocityX = casing.velocityX * dragXY
            casing.velocityY = casing.velocityY * dragXY
            casing.velocityZ = casing.velocityZ * dragZ

            local localX     = worldX - casing.square:getX()
            local localY     = worldY - casing.square:getY()
            local edgeX      = localX
            local edgeY      = localY

            local willBounce = false
            local bounceAxis = nil

            local EDGE_TOL   = 0.15

            if casing.square then
                local sx     = casing.square:getX()
                local sy     = casing.square:getY()
                local sz     = casing.square:getZ()

                local nx, ny = nil, nil
                local dir    = nil

                if math.abs(casing.velocityX) >= math.abs(casing.velocityY) then
                    if casing.velocityX > 0 and edgeX >= 1.0 - EDGE_TOL then
                        nx, ny = sx + 1, sy
                        dir = SpentCasingPhysics.IsoDirections.E
                        bounceAxis = "x"
                    elseif casing.velocityX < 0 and edgeX <= EDGE_TOL then
                        nx, ny = sx - 1, sy
                        dir = SpentCasingPhysics.IsoDirections.W
                        bounceAxis = "x"
                    end
                else
                    if casing.velocityY > 0 and edgeY >= 1.0 - EDGE_TOL then
                        nx, ny = sx, sy + 1
                        dir = SpentCasingPhysics.IsoDirections.S
                        bounceAxis = "y"
                    elseif casing.velocityY < 0 and edgeY <= EDGE_TOL then
                        nx, ny = sx, sy - 1
                        dir = SpentCasingPhysics.IsoDirections.N
                        bounceAxis = "y"
                    end
                end

                if nx and ny and dir then
                    local neighbor = getCell():getGridSquare(nx, ny, sz)
                    if neighbor then
                        local block = false

                        local barrier = casing.square:getDoorOrWindowOrWindowFrame(dir, true)
                        if not barrier then
                            local revDir = SpentCasingPhysics.IsoDirections.reverse(dir)
                            barrier = neighbor:getDoorOrWindowOrWindowFrame(revDir, true)
                        end

                        if barrier and (instanceof(barrier, "IsoDoor") or instanceof(barrier, "IsoWindow")) then
                            local destroyed = barrier.isDestroyed and barrier:isDestroyed() or false
                            if not barrier:IsOpen() and not destroyed then
                                block = true
                            end
                        else
                            if casing.square:isWallTo(neighbor) then
                                local wall1 = casing.square:getWall(true)
                                local wall2 = neighbor:getWall(true)
                                local isLow = (wall1 and SpentCasingPhysics.isVisuallyLowWall(wall1)) or
                                    (wall2 and SpentCasingPhysics.isVisuallyLowWall(wall2))
                                if isLow then
                                    if casing.z < SpentCasingPhysics.LOW_WALL_Z_THRESHOLD then
                                        block = true
                                    end
                                else
                                    block = true
                                end
                            end
                        end

                        if block then
                            willBounce = true
                        end
                    end
                end
            end

            if willBounce and bounceAxis then
                if bounceAxis == "x" then
                    casing.velocityX = -casing.velocityX * SpentCasingPhysics.BOUNCE_RESTITUTION
                    casing.x = casing.x + (casing.velocityX * SpentCasingPhysics.BOUNCE_POSITION_CORRECT)
                    if math.abs(casing.velocityX) < SpentCasingPhysics.BOUNCE_MIN_VELOCITY then
                        casing.velocityX = 0
                    end
                else
                    casing.velocityY = -casing.velocityY * SpentCasingPhysics.BOUNCE_RESTITUTION
                    casing.y = casing.y + (casing.velocityY * SpentCasingPhysics.BOUNCE_POSITION_CORRECT)
                    if math.abs(casing.velocityY) < SpentCasingPhysics.BOUNCE_MIN_VELOCITY then
                        casing.velocityY = 0
                    end
                end

                worldX = casing.square:getX() + casing.x
                worldY = casing.square:getY() + casing.y
            end

            local targetTileX  = math.floor(worldX)
            local targetTileY  = math.floor(worldY)

            local checkZ       = worldZ
            local targetSquare = nil
            local drops        = 0

            while checkZ >= 0 do
                local sq = getCell():getGridSquare(targetTileX, targetTileY, checkZ)

                if not sq then
                    break
                end

                if sq:getFloor() then
                    targetSquare = sq
                    break
                end

                checkZ = checkZ - 1
                drops  = drops + 1
            end

            if not targetSquare then
                targetSquare = casing.square
            else
                if drops > 0 then
                    casing.z = casing.z + drops
                end
            end

            local localX2 = worldX - targetSquare:getX()
            local localY2 = worldY - targetSquare:getY()

            localX2 = PZMath.clamp_01(localX2)
            localY2 = PZMath.clamp_01(localY2)

            if casing.currentWorldItem then
                local wobj = casing.currentWorldItem:getWorldItem()
                if wobj then
                    if isServer() then
                        casing.square:transmitRemoveItemFromSquare(wobj)
                    end
                    casing.square:removeWorldObject(wobj)
                end
                casing.currentWorldItem = nil
            end

            local falling = (casing.velocityZ <= 0)

            local tileTopZ = nil
            if not casing.hasHitFloor and falling then
                tileTopZ = SpentCasingPhysics.getTileTopZ(targetSquare)
            end

            local surfaceZ = 0.0

            if tileTopZ then
                if prevZ >= tileTopZ and casing.z <= tileTopZ then
                    surfaceZ = tileTopZ
                end
            end

            if casing.z > surfaceZ then
                casing.currentWorldItem = targetSquare:AddWorldInventoryItem(
                    casing.casingType,
                    localX2,
                    localY2,
                    casing.z
                )
            else
                local floor = targetSquare and targetSquare:getFloor() or nil

                if surfaceZ == 0.0 then
                    casing.hasHitFloor = true
                end

                if surfaceZ == 0.0 and SpentCasingPhysics.isWaterFloor(floor) then
                    casing.active = false
                    table.remove(SpentCasingPhysics.activeCasings, i)
                    removed = true
                    SpentCasingPhysics.playCasingImpactSound(casing, targetSquare)
                else
                    local speedXY = math.sqrt(
                        casing.velocityX * casing.velocityX +
                        casing.velocityY * casing.velocityY
                    )

                    local canBounceHere =
                        casing.floorBounces and casing.floorBounces > 0 and
                        speedXY > SpentCasingPhysics.SETTLE_THRESHOLD
                    if surfaceZ == 0.0 and floor and SpentCasingPhysics.isGrassFloor(floor) then
                        canBounceHere = false
                    end

                    if canBounceHere then
                        casing.floorBounces     = casing.floorBounces - 1
                        casing.z                = surfaceZ + 0.05
                        casing.velocityZ        = math.abs(casing.velocityZ) * SpentCasingPhysics.BOUNCE_RESTITUTION
                        casing.velocityX        = casing.velocityX * 0.5
                        casing.velocityY        = casing.velocityY * 0.5

                        casing.currentWorldItem = targetSquare:AddWorldInventoryItem(
                            casing.casingType,
                            localX2,
                            localY2,
                            casing.z
                        )
                        SpentCasingPhysics.playCasingImpactSound(casing, targetSquare)
                    else
                        targetSquare:AddWorldInventoryItem(
                            casing.casingType,
                            localX2,
                            localY2,
                            surfaceZ
                        )
                        SpentCasingPhysics.playCasingImpactSound(casing, targetSquare)

                        casing.active = false
                        table.remove(SpentCasingPhysics.activeCasings, i)
                        removed = true
                    end
                end
            end

            if not removed then
                if targetSquare ~= casing.square then
                    casing.square = targetSquare
                end

                casing.x = PZMath.clamp_01(localX2)
                casing.y = PZMath.clamp_01(localY2)
            end
        end

        if not removed then
            i = i + 1
        end
    end
end

function SpentCasingPhysics.doSpawnCasing(player, weapon, params, racking)
    local forwardOffset = params.forwardOffset or 0.0
    local sideOffset    = params.sideOffset or 0.0
    local heightOffset  = params.heightOffset or 0.5
    local shellForce    = params.shellForce or 0.0
    local sideSpreed    = params.sideSpread or 10
    local heightSpreed  = params.heightSpreed or 10
    local ammoToEject   = params.casing
    if racking then
        ammoToEject = params.ammo
    end

    if not ammoToEject then return end

    local px, py, pz   = player:getX(), player:getY(), player:getZ()

    local angleDeg     = player:getDirectionAngle() or 0
    local angle        = math.rad(angleDeg)

    local fx           = math.cos(angle)
    local fy           = math.sin(angle)
    local rx           = math.cos(angle + math.pi / 2)
    local ry           = math.sin(angle + math.pi / 2)

    local spawnWorldX  = px + fx * forwardOffset + rx * sideOffset
    local spawnWorldY  = py + fy * forwardOffset + ry * sideOffset
    local targetSquare = player:getCurrentSquare()

    local startX       = spawnWorldX - targetSquare:getX()
    local startY       = spawnWorldY - targetSquare:getY()

    local stairFrac    = pz - targetSquare:getZ()
    local startZ       = stairFrac + heightOffset

    local velX         = (SpentCasingPhysics.RANDOM:random(sideSpreed) - 5) / 200
    local velY         = (SpentCasingPhysics.RANDOM:random(sideSpreed) - 5) / 200
    local velZ         = (SpentCasingPhysics.RANDOM:random(heightSpreed) + 25) / 200

    velX               = velX + rx * shellForce
    velY               = velY + ry * shellForce

    SpentCasingPhysics.addCasing(
        player,
        weapon,
        targetSquare,
        ammoToEject,
        startX,
        startY,
        startZ,
        velX,
        velY,
        velZ
    )
end

function SpentCasingPhysics.spawnCasing(player, weapon)
    if not player or player:isDead() then return end
    if not weapon then return end

    local params = SpentCasingPhysics.WeaponEjectionPortParams
        and SpentCasingPhysics.WeaponEjectionPortParams[weapon:getFullType()]
    if not params then return end
    if params.manualEjection then return end

    if weapon:isRoundChambered() and not weapon:isJammed() and weapon:haveChamber() then
        SpentCasingPhysics.doSpawnCasing(player, weapon, params)
    end
end

function SpentCasingPhysics.rackCasing(player, weapon, racking)
    if not player or player:isDead() then return end
    if not weapon then return end

    local params = SpentCasingPhysics.WeaponEjectionPortParams
        and SpentCasingPhysics.WeaponEjectionPortParams[weapon:getFullType()]
    if not params then return end

    if racking then
        SpentCasingPhysics.doSpawnCasing(player, weapon, params, racking)
    else
        SpentCasingPhysics.doSpawnCasing(player, weapon, params)
    end
end

function SpentCasingPhysics.getWeaponFromArgs(player, args)
    if not player or not args then return nil end
    if args.weaponId and player:getInventory() and player:getInventory().getItemById then
        local item = player:getInventory():getItemById(args.weaponId)
        if item then return item end
    end

    return player:getPrimaryHandItem()
end

function SpentCasingPhysics.onClientCommand(module, command, player, args)
    if module ~= "HBVCEF" then return end
    if not player then return end

    if command == "spawnCasing" then
        local weapon = SpentCasingPhysics.getWeaponFromArgs(player, args)
        if weapon then
            SpentCasingPhysics.spawnCasing(player, weapon)
        end
    elseif command == "rackCasing" then
        local weapon = SpentCasingPhysics.getWeaponFromArgs(player, args)
        if weapon then
            SpentCasingPhysics.rackCasing(player, weapon, args and args.racking)
        end
    end
end

Events.OnClientCommand.Add(SpentCasingPhysics.onClientCommand)
Events.OnTick.Add(SpentCasingPhysics.update)

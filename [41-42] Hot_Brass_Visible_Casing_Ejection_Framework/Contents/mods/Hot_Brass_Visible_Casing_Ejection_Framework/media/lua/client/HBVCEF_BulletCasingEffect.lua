require "ISBaseObject"

SpentCasingPhysics.activeCasings = {}
local RANDOM = newrandom()
local GRAVITY = 0.020
local XY_STEP = 0.10
local Z_STEP = 0.05
local GRAVITY_SCALE = 1.0
local DRAG_XY = 0.97
local DRAG_Z = 0.995
local SETTLE_THRESHOLD = 0.001
local BOUNCE_RESTITUTION = 0.60
local BOUNCE_POSITION_CORRECT = 0.12
local BOUNCE_MIN_VELOCITY = 0.004
local LOW_WALL_Z_THRESHOLD = 0.25

local IsoDirections = IsoDirections or getClass("zombie.iso.IsoDirections")

local function isVisuallyLowWall(wall)
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

local function squareIsWater(sq)
    if not sq then return false end

    local objects = sq:getObjects()
    if not objects then return false end

    for i = 0, objects:size() - 1 do
        local obj = objects:get(i)
        if obj then
            local props = obj:getProperties()
            if props and props:Is(IsoFlagType.water) then
                return true
            end
        end
    end

    return false
end

local gameTime
Events.OnGameTimeLoaded.Add(function() gameTime = GameTime.getInstance() end)
local function GT() return gameTime or GameTime.getInstance() end

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
        shellSound = false,
        floorBounces = RANDOM:random(0, 2)
    }

    casingData.currentWorldItem = square:AddWorldInventoryItem(casingType, startX, startY, startZ)

    table.insert(SpentCasingPhysics.activeCasings, casingData)
end

function SpentCasingPhysics.update()
    local dt = GT():getTimeDelta() or (1 / 60)
    local scale = dt * 60
    local i = 1

    while i <= #SpentCasingPhysics.activeCasings do
        local casing = SpentCasingPhysics.activeCasings[i]
        local removed = false

        if not casing or not casing.square or not casing.active then
            table.remove(SpentCasingPhysics.activeCasings, i)
            removed = true
        else
            casing.velocityZ = casing.velocityZ - (GRAVITY * GRAVITY_SCALE * scale)

            casing.x = casing.x + (casing.velocityX * XY_STEP * scale)
            casing.y = casing.y + (casing.velocityY * XY_STEP * scale)
            casing.z = casing.z + (casing.velocityZ * Z_STEP * scale)

            casing.z = math.max(0, casing.z)

            local worldX = casing.square:getX() + casing.x
            local worldY = casing.square:getY() + casing.y
            local worldZ = casing.square:getZ()

            local dragXY = math.pow(DRAG_XY, scale)
            local dragZ = math.pow(DRAG_Z, scale)
            casing.velocityX = casing.velocityX * dragXY
            casing.velocityY = casing.velocityY * dragXY
            casing.velocityZ = casing.velocityZ * dragZ

            local localX = worldX - casing.square:getX()
            local localY = worldY - casing.square:getY()
            local edgeX = localX
            local edgeY = localY

            local willBounce = false
            local bounceAxis = nil

            local EDGE_TOL = 0.15

            if casing.square then
                local sx = casing.square:getX()
                local sy = casing.square:getY()
                local sz = casing.square:getZ()

                local nx, ny = nil, nil
                local dir = nil

                if math.abs(casing.velocityX) >= math.abs(casing.velocityY) then
                    if casing.velocityX > 0 and edgeX >= 1.0 - EDGE_TOL then
                        nx, ny = sx + 1, sy
                        dir = IsoDirections.E
                        bounceAxis = "x"
                    elseif casing.velocityX < 0 and edgeX <= EDGE_TOL then
                        nx, ny = sx - 1, sy
                        dir = IsoDirections.W
                        bounceAxis = "x"
                    end
                else
                    if casing.velocityY > 0 and edgeY >= 1.0 - EDGE_TOL then
                        nx, ny = sx, sy + 1
                        dir = IsoDirections.S
                        bounceAxis = "y"
                    elseif casing.velocityY < 0 and edgeY <= EDGE_TOL then
                        nx, ny = sx, sy - 1
                        dir = IsoDirections.N
                        bounceAxis = "y"
                    end
                end

                if nx and ny and dir then
                    local neighbor = getCell():getGridSquare(nx, ny, sz)
                    if neighbor then
                        local block = false

                        local barrier = casing.square:getDoorOrWindowOrWindowFrame(dir, true)
                        if not barrier then
                            local revDir = IsoDirections.reverse(dir)
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
                                local isLow = (wall1 and isVisuallyLowWall(wall1)) or
                                    (wall2 and isVisuallyLowWall(wall2))
                                if isLow then
                                    if casing.z < LOW_WALL_Z_THRESHOLD then
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
                    casing.velocityX = -casing.velocityX * BOUNCE_RESTITUTION
                    casing.x = casing.x + (casing.velocityX * BOUNCE_POSITION_CORRECT)
                    if math.abs(casing.velocityX) < BOUNCE_MIN_VELOCITY then
                        casing.velocityX = 0
                    end
                else
                    casing.velocityY = -casing.velocityY * BOUNCE_RESTITUTION
                    casing.y = casing.y + (casing.velocityY * BOUNCE_POSITION_CORRECT)
                    if math.abs(casing.velocityY) < BOUNCE_MIN_VELOCITY then
                        casing.velocityY = 0
                    end
                end

                worldX = casing.square:getX() + casing.x
                worldY = casing.square:getY() + casing.y
            end

            local targetTileX = math.floor(worldX)
            local targetTileY = math.floor(worldY)

            local checkZ = worldZ
            local targetSquare = nil
            local drops = 0

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
                drops = drops + 1
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
                    casing.square:removeWorldObject(wobj)
                end
                casing.currentWorldItem = nil
            end

            if casing.z > 0 then
                casing.currentWorldItem = targetSquare:AddWorldInventoryItem(
                    casing.casingType,
                    localX2,
                    localY2,
                    casing.z
                )
            else
                if squareIsWater(targetSquare) then
                    casing.active = false
                    table.remove(SpentCasingPhysics.activeCasings, i)
                    removed = true
                else
                    local speedXY = math.sqrt(casing.velocityX * casing.velocityX + casing.velocityY * casing.velocityY)

                    if casing.floorBounces and casing.floorBounces > 0 and speedXY > SETTLE_THRESHOLD then
                        casing.floorBounces = casing.floorBounces - 1

                        casing.z = 0.05
                        casing.velocityZ = math.abs(casing.velocityZ) * BOUNCE_RESTITUTION
                        casing.velocityX = casing.velocityX * 0.5
                        casing.velocityY = casing.velocityY * 0.5

                        casing.currentWorldItem = targetSquare:AddWorldInventoryItem(
                            casing.casingType,
                            localX2,
                            localY2,
                            casing.z
                        )
                    else
                        targetSquare:AddWorldInventoryItem(
                            casing.casingType,
                            localX2,
                            localY2,
                            0.0
                        )

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
    local sideOffset = params.sideOffset or 0.0
    local heightOffset = params.heightOffset or 0.5
    local shellForce = params.shellForce or 0.0
    local sideSpreed = params.sideSpread or 10
    local heightSpreed = params.heightSpreed or 10
    local ammoToEject = params.casing
    if racking then
        ammoToEject = params.ammo
    end

    if not ammoToEject then return end

    local px, py, pz = player:getX(), player:getY(), player:getZ()

    local angleDeg = player:getDirectionAngle() or 0
    local angle = math.rad(angleDeg)

    local fx = math.cos(angle)
    local fy = math.sin(angle)
    local rx = math.cos(angle + math.pi / 2)
    local ry = math.sin(angle + math.pi / 2)

    local spawnWorldX = px + fx * forwardOffset + rx * sideOffset
    local spawnWorldY = py + fy * forwardOffset + ry * sideOffset
    local targetSquare = player:getCurrentSquare()

    local startX = spawnWorldX - targetSquare:getX()
    local startY = spawnWorldY - targetSquare:getY()

    local stairFrac = pz - targetSquare:getZ()
    local startZ = stairFrac + heightOffset

    local velX = (RANDOM:random(sideSpreed) - 5) / 200
    local velY = (RANDOM:random(sideSpreed) - 5) / 200
    local velZ = (RANDOM:random(heightSpreed) + 25) / 200

    velX = velX + rx * shellForce
    velY = velY + ry * shellForce

    SpentCasingPhysics.addCasing(player, weapon, targetSquare, ammoToEject, startX, startY, startZ, velX, velY, velZ)
end

function SpentCasingPhysics.spawnCasing(player, weapon)
    if not player or player:isDead() then return end
    if not weapon then return end

    local params = SpentCasingPhysics.WeaponEjectionPortParams[weapon:getFullType()]
    if not params then return end

    if params.manualEjection then return end

    if weapon:isRoundChambered() and not weapon:isJammed() and weapon:haveChamber() then
        SpentCasingPhysics.doSpawnCasing(player, weapon, params)
    end
end

function SpentCasingPhysics.rackCasing(player, weapon, racking)
    if not player or player:isDead() then return end
    if not weapon then return end

    local params = SpentCasingPhysics.WeaponEjectionPortParams[weapon:getFullType()]
    if not params then return end

    if racking then
        SpentCasingPhysics.doSpawnCasing(player, weapon, params, racking)
    end

    if not racking then
        SpentCasingPhysics.doSpawnCasing(player, weapon, params)
    end
end

Events.OnWeaponSwing.Add(SpentCasingPhysics.spawnCasing)
Events.OnTick.Add(SpentCasingPhysics.update)

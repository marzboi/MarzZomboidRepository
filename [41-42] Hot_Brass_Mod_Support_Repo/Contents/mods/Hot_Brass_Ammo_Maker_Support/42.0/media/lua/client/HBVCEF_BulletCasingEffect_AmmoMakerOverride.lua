require "HBVCEF_BulletCasingEffect"
local AMMO_MAKER = getActivatedMods():contains('\\2788256295/ammomaker')

if AMMO_MAKER then
    Events.OnTick.Remove(SpentCasingPhysics.update)

    function SpentCasingPhysics.update()
        local dt = SpentCasingPhysics.GT():getTimeDelta() or (1 / 60)
        local scale = dt * 60
        local i = 1

        while i <= #SpentCasingPhysics.activeCasings do
            local casing = SpentCasingPhysics.activeCasings[i]
            local removed = false

            if not casing or not casing.square or not casing.active then
                table.remove(SpentCasingPhysics.activeCasings, i)
                removed = true
            else
                local prevZ = casing.z or 0
                casing.velocityZ = casing.velocityZ -
                    (SpentCasingPhysics.GRAVITY * SpentCasingPhysics.GRAVITY_SCALE * scale)

                casing.x = casing.x + (casing.velocityX * SpentCasingPhysics.XY_STEP * scale)
                casing.y = casing.y + (casing.velocityY * SpentCasingPhysics.XY_STEP * scale)
                casing.z = casing.z + (casing.velocityZ * SpentCasingPhysics.Z_STEP * scale)

                casing.z = math.max(0, casing.z)

                local worldX = casing.square:getX() + casing.x
                local worldY = casing.square:getY() + casing.y
                local worldZ = casing.square:getZ()

                local dragXY = math.pow(SpentCasingPhysics.DRAG_XY, scale)
                local dragZ = math.pow(SpentCasingPhysics.DRAG_Z, scale)
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
                                    local wall1 = casing.square:getWall()
                                    local wall2 = neighbor:getWall()
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

    Events.OnTick.Add(SpentCasingPhysics.update)
end

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

local IsoDirections = IsoDirections or getClass("zombie.iso.IsoDirections")

local LOW_WALL_KEYWORDS = {
    "fencing",
    "fence",
    "railings",
    "railing",
    "counter",
    "curb",
    "curbs",
    "low_",
    "house_low",
    "balcony",
    "banister"
}

local function isVisuallyLowWall(wall)
    if not wall then return false end

    local name = nil

    if wall.getSpriteName then
        name = wall:getSpriteName()
    end

    if not name then
        local spr = wall:getSprite()
        if spr and spr.getName then
            name = spr:getName()
        end
    end

    if not name then return false end

    name = string.lower(name)

    for _, kw in ipairs(LOW_WALL_KEYWORDS) do
        if string.find(name, kw, 1, true) then
            return true
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
        shellSound = false
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

        if not casing.square or not casing.active then
            table.remove(SpentCasingPhysics.activeCasings, i)
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
                    if neighbor and casing.square:isWallTo(neighbor) then
                        local wall1 = casing.square:getWall(true)
                        local wall2 = neighbor:getWall(true)
                        local low = (wall1 and isVisuallyLowWall(wall1)) or (wall2 and isVisuallyLowWall(wall2))

                        if not low then
                            local passable = false
                            local obj = casing.square:getDoorOrWindowOrWindowFrame(dir, true)
                            if obj and (instanceof(obj, "IsoDoor") or instanceof(obj, "IsoWindow")) and obj:IsOpen() then
                                passable = true
                            end

                            if not passable then
                                willBounce = true
                            end
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
                if casing.z < 0.16 and not casing.shellSound then
                    casing.shellSound = true
                    if casing.weapon and casing.weapon:getShellFallSound() then
                        casing.player:getEmitter():playSound(casing.weapon:getShellFallSound())
                    end
                end
            else
                targetSquare:AddWorldInventoryItem(
                    casing.casingType,
                    localX2,
                    localY2,
                    0.0
                )

                if math.abs(casing.velocityX) < SETTLE_THRESHOLD
                    and math.abs(casing.velocityY) < SETTLE_THRESHOLD
                    and math.abs(casing.velocityZ) < SETTLE_THRESHOLD
                then
                    casing.active = false
                    table.remove(SpentCasingPhysics.activeCasings, i)
                    i = i - 1
                else
                    casing.active = false
                    table.remove(SpentCasingPhysics.activeCasings, i)
                    i = i - 1
                end
            end

            if targetSquare ~= casing.square then
                casing.square = targetSquare
            end

            casing.x = PZMath.clamp_01(localX2)
            casing.y = PZMath.clamp_01(localY2)

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

    if weapon:getCurrentAmmoCount() > 0 and not weapon:isJammed() and weapon:haveChamber() then
        SpentCasingPhysics.doSpawnCasing(player, weapon, params, false)
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

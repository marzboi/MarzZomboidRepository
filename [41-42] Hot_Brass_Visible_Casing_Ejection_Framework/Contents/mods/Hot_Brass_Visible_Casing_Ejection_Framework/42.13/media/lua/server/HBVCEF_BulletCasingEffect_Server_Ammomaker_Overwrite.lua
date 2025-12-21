-- require 'HBVCEF_BulletCasingEffect_Server'
-- local AMMO_MAKER = getActivatedMods():contains('\\2788256295/ammomaker')

-- local function getAmmoMakerType(ammoType)
--     print(ammoType)
--     local ammoTypeMapped = ammoMakerAmmoTypes[ammoType]
--     local ammoTypeData = ammoMakerAmmoData[ammoTypeMapped.ammoTypes[1]]
--     return ammoTypeData.casingType
-- end

-- if AMMO_MAKER then
--     function SpentCasingPhysics.doSpawnCasing(player, weapon, params, racking, optionalItem)
--         local forwardOffset = params.forwardOffset or 0.10
--         local sideOffset    = params.sideOffset or 0.10
--         local heightOffset  = params.heightOffset or 0.5
--         local shellForce    = params.shellForce or 0.20
--         local sideSpread    = params.sideSpread or 10
--         local heightSpread  = params.heightSpread or 10
--         local ejectAngle    = params.ejectAngle
--         local verticalForce = params.verticalForce or 0
--         local ammoType      = tostring(weapon:getAmmoType():getItemKey())

--         local itemToEject   = getAmmoMakerType(ammoType)
--         if racking then
--             itemToEject = ammoType
--         end
--         if optionalItem then
--             itemToEject = optionalItem
--         end
--         if not itemToEject then return end

--         local px, py, pz = player:getX(), player:getY(), player:getZ()

--         local angleDeg = player:getDirectionAngle() or 0
--         local angleRad = math.rad(angleDeg)

--         local fx = math.cos(angleRad)
--         local fy = math.sin(angleRad)
--         local rx = math.cos(angleRad + math.pi / 2)
--         local ry = math.sin(angleRad + math.pi / 2)

--         local spawnWorldX = px + fx * forwardOffset + rx * sideOffset
--         local spawnWorldY = py + fy * forwardOffset + ry * sideOffset
--         local targetSquare = player:getCurrentSquare()
--         if not targetSquare then return end

--         local startX = spawnWorldX - targetSquare:getX()
--         local startY = spawnWorldY - targetSquare:getY()

--         local stairFrac = pz - targetSquare:getZ()
--         local startZ = stairFrac + heightOffset

--         local velX = (SpentCasingPhysics.RANDOM:random(sideSpread) - 5) / 200.0
--         local velY = (SpentCasingPhysics.RANDOM:random(sideSpread) - 5) / 200.0

--         local velZ
--         if type(heightSpread) == "table" then
--             local minH = tonumber(heightSpread[1]) or 0
--             local maxH = tonumber(heightSpread[2]) or minH
--             if maxH < minH then
--                 minH, maxH = maxH, minH
--             end
--             local rawH = SpentCasingPhysics.RANDOM:random(minH, maxH)
--             velZ = rawH / 200.0
--         else
--             velZ = (SpentCasingPhysics.RANDOM:random(heightSpread) + 25) / 200.0
--         end

--         velZ = velZ + verticalForce

--         if shellForce ~= 0 then
--             local dirX, dirY
--             if ejectAngle ~= nil then
--                 local totalDeg = angleDeg + ejectAngle
--                 local totalRad = math.rad(totalDeg)
--                 dirX = math.cos(totalRad)
--                 dirY = math.sin(totalRad)
--             else
--                 dirX = rx
--                 dirY = ry
--             end

--             velX = velX + dirX * shellForce
--             velY = velY + dirY * shellForce
--         end

--         SpentCasingPhysics.addCasing(
--             player,
--             weapon,
--             targetSquare,
--             itemToEject,
--             startX,
--             startY,
--             startZ,
--             velX,
--             velY,
--             velZ
--         )
--     end
-- end

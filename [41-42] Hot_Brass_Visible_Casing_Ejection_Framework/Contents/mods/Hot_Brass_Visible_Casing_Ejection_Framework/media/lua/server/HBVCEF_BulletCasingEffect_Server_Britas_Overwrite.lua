require 'HBVCEF_BulletCasingEffect_Server'
local BRITAS = getActivatedMods():contains('Arsenal(26)GunFighter[MAIN MOD 2.0]')

if BRITAS then
    local CASING_MAPPER = {
        -- Pistol/Handgun Calibers
        ["Base.Bullets22"] = "Base.Brass22",
        ["Base.Bullets57"] = "Base.Brass57",
        ["Base.Bullets380"] = "Base.Brass380",
        ["Base.Bullets9mm"] = "Base.Brass9",
        ["Base.Bullets38"] = "Base.Brass38",
        ["Base.Bullets357"] = "Base.Brass357",
        ["Base.Bullets45"] = "Base.Brass45",
        ["Base.Bullets45LC"] = "Base.Brass45LC",
        ["Base.Bullets44"] = "Base.Brass44",
        ["Base.Bullets4570"] = "Base.Brass4570",
        ["Base.Bullets50MAG"] = "Base.Brass50MAG",

        -- Shotgun Shells
        ["Base.410gShotgunShells"] = "Base.Hull410g",
        ["Base.20gShotgunShells"] = "Base.Hull20g",
        ["Base.ShotgunShells"] = "Base.Hull12g",
        ["Base.10gShotgunShells"] = "Base.Hull10g",
        ["Base.4gShotgunShells"] = "Base.Hull4g",

        -- Rifle Calibers
        ["Base.223Bullets"] = "Base.Brass223",
        ["Base.556Bullets"] = "Base.Brass556",
        ["Base.545x39Bullets"] = "Base.Brass545x39",
        ["Base.762x39Bullets"] = "Base.Brass762x39",
        ["Base.308Bullets"] = "Base.Brass308",
        ["Base.762x51Bullets"] = "Base.Brass762x51",
        ["Base.762x54rBullets"] = "Base.Brass762x54r",
        ["Base.3006Bullets"] = "Base.Brass3006",
        ["Base.50BMGBullets"] = "Base.Brass50BMG",
    }

    function SpentCasingPhysics.doSpawnCasing(player, weapon, params, racking, optionalItem)
        local forwardOffset = params and params.forwardOffset or 0.10
        local sideOffset    = params and params.sideOffset or 0.10
        local heightOffset  = params and params.heightOffset or 0.5
        local shellForce    = params and params.shellForce or 0.20
        local sideSpread    = params and params.sideSpread or 10
        local heightSpread  = params and params.heightSpread or 10
        local ejectAngle    = params and params.ejectAngle
        local verticalForce = params and params.verticalForce or 0
        local ammoType      = tostring(weapon:getAmmoType())

        local itemToEject   = CASING_MAPPER[ammoType]
        if racking then
            itemToEject = ammoType
        end
        if optionalItem then
            itemToEject = optionalItem
        end
        if not itemToEject then return end

        local px, py, pz = player:getX(), player:getY(), player:getZ()

        local angleDeg = player:getDirectionAngle() or 0
        local angleRad = math.rad(angleDeg)

        local fx = math.cos(angleRad)
        local fy = math.sin(angleRad)
        local rx = math.cos(angleRad + math.pi / 2)
        local ry = math.sin(angleRad + math.pi / 2)

        local spawnWorldX = px + fx * forwardOffset + rx * sideOffset
        local spawnWorldY = py + fy * forwardOffset + ry * sideOffset
        local targetSquare = player:getCurrentSquare()
        if not targetSquare then return end

        local startX = spawnWorldX - targetSquare:getX()
        local startY = spawnWorldY - targetSquare:getY()

        local stairFrac = pz - targetSquare:getZ()
        local startZ = stairFrac + heightOffset

        local velX = (SpentCasingPhysics.RANDOM:random(sideSpread) - 5) / 200.0
        local velY = (SpentCasingPhysics.RANDOM:random(sideSpread) - 5) / 200.0

        local velZ
        if type(heightSpread) == "table" then
            local minH = tonumber(heightSpread[1]) or 0
            local maxH = tonumber(heightSpread[2]) or minH
            if maxH < minH then
                minH, maxH = maxH, minH
            end
            local rawH = SpentCasingPhysics.RANDOM:random(minH, maxH)
            velZ = rawH / 200.0
        else
            velZ = (SpentCasingPhysics.RANDOM:random(heightSpread) + 25) / 200.0
        end

        velZ = velZ + verticalForce

        if shellForce ~= 0 then
            local dirX, dirY
            if ejectAngle ~= nil then
                local totalDeg = angleDeg + ejectAngle
                local totalRad = math.rad(totalDeg)
                dirX = math.cos(totalRad)
                dirY = math.sin(totalRad)
            else
                dirX = rx
                dirY = ry
            end

            velX = velX + dirX * shellForce
            velY = velY + dirY * shellForce
        end

        SpentCasingPhysics.addCasing(
            player,
            weapon,
            targetSquare,
            itemToEject,
            startX,
            startY,
            startZ,
            velX,
            velY,
            velZ
        )
    end
end

require 'HBVCEF_BulletCasingEffect_Server'
require "GGS_ShellCasingEmitter"
local GGS = getActivatedMods():contains('\\GaelGunStore_B42')

if GGS then
    local CASING_BY_AMMO = {
        ["Base.Bullets9mm"] = "Base.pistol_casing",
        ["Base.9x39Bullets"] = "Base.rifle_casing",
        ["Base.Bullets22LR"] = "Base.pistol_casing",
        ["Base.Bullets32"] = "Base.revolver_casing",
        ["Base.Bullets38"] = "Base.revolver_casing",
        ["Base.Bullets44"] = "Base.revolver_casing",
        ["Base.Bullets45"] = "Base.pistol_casing",
        ["Base.Bullets50"] = "Base.rifle_casing",
        ["Base.Bullets50Magnum"] = "Base.revolver_casing",
        ["Base.308Bullets"] = "Base.rifle_casing",
        ["Base.Bullets357"] = "Base.revolver_casing",
        ["Base.545x39Bullets"] = "Base.rifle_casing",
        ["Base.556Bullets"] = "Base.rifle_casing",
        ["Base.762x39Bullets"] = "Base.rifle_casing",
        ["Base.762x54rBullets"] = "Base.rifle_casing",
        ["Base.792x57Bullets"] = "Base.rifle_casing",
        ["Base.ShotgunShells"] = "Base.shells_casing",
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
        local ammoType      = tostring(weapon:getAmmoType():getItemKey())

        local itemToEject   = CASING_BY_AMMO[ammoType]
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

    Events.OnWeaponSwing.Remove(handleWeaponShot)
    Events.OnPlayerUpdate.Remove(processCylinderCasingsOnReload)
end

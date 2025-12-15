SpentCasingAnimSync = {}
SpentCasingAnimSync.pending = {}
SpentCasingAnimSync.BASELINE_TICKS_PER_SECOND = 60
SpentCasingAnimSync.rackTimeParams = {
    ["boltactionnomag"] = { aiming = 20, notAiming = 45 },
    ["boltaction"]      = { aiming = 20, notAiming = 45 },
    ["shotgunsemi"]     = { aiming = 20, notAiming = 45 },
    ["handgun"]         = { aiming = 10, notAiming = 10 },
    ["default"]         = { aiming = 20, notAiming = 20 },
    ["fal"]             = { aiming = 60, notAiming = 60 },
    ["mp5"]             = { aiming = 50, notAiming = 40 },
}

function SpentCasingAnimSync.getRackTicksFor(player, weapon)
    local rackTimeParams = SpentCasingAnimSync.rackTimeParams

    if not player or not weapon then
        return rackTimeParams["default"].notAiming
    end

    local reloadType = weapon.getWeaponReloadType and weapon:getWeaponReloadType() or nil
    if reloadType then
        reloadType = string.lower(reloadType)
    end

    local params = rackTimeParams[reloadType] or rackTimeParams["default"]
    if not params then
        params = rackTimeParams["default"]
    end

    local aiming = player.isAiming and player:isAiming() or false
    if aiming then
        return params.aiming or rackTimeParams["default"].aiming
    else
        return params.notAiming or rackTimeParams["default"].notAiming
    end
end

function SpentCasingAnimSync.scheduleRack(player, weapon, racking)
    if not player or not weapon then return end

    local ticks = SpentCasingAnimSync.getRackTicksFor(player, weapon)
    local pid = tostring(player:getPlayerNum() or 0)
    local baseline = SpentCasingAnimSync.BASELINE_TICKS_PER_SECOND
    local seconds = math.max(1, math.floor(ticks or 1)) / baseline

    SpentCasingAnimSync.pending[pid] = {
        timeRemaining = seconds,
        weapon        = weapon,
        racking       = racking and true or false
    }
end

function SpentCasingAnimSync.onTick()
    local baseline = SpentCasingAnimSync.BASELINE_TICKS_PER_SECOND
    local dt = SpentCasingPhysics.GT():getRealworldSecondsSinceLastUpdate() or (1 / baseline)

    for pid, data in pairs(SpentCasingAnimSync.pending) do
        data.timeRemaining = data.timeRemaining - dt

        if data.timeRemaining <= 0 then
            local playerNum = tonumber(pid) or 0
            local player = getSpecificPlayer(playerNum)

            if player and data.weapon and SpentCasingPhysics and SpentCasingPhysics.rackCasing then
                SpentCasingPhysics.rackCasing(player, data.weapon, data.racking)
            end

            SpentCasingAnimSync.pending[pid] = nil
        end
    end
end

Events.OnTick.Add(SpentCasingAnimSync.onTick)

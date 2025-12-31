require "TimedActions/ISReloadWeaponAction"
-------------------------------------------------
-- Rate of Fire Control System
-------------------------------------------------
Events.OnGameStart.Add(function()
    RAFRateOfFire = {}

    RAFRateOfFire.lastFireTime = {}
    RAFRateOfFire.DEFAULT_RPM = 600
    RAFRateOfFire.RPMTagList = {
        { RAFTags.RPM1200, 1200 },
        { RAFTags.RPM1150, 1150 },
        { RAFTags.RPM1100, 1100 },
        { RAFTags.RPM1050, 1050 },
        { RAFTags.RPM1000, 1000 },
        { RAFTags.RPM950,  950 },
        { RAFTags.RPM900,  900 },
        { RAFTags.RPM850,  850 },
        { RAFTags.RPM800,  800 },
        { RAFTags.RPM750,  750 },
        { RAFTags.RPM700,  700 },
        { RAFTags.RPM650,  650 },
        { RAFTags.RPM600,  600 },
        { RAFTags.RPM550,  550 },
        { RAFTags.RPM500,  500 },
        { RAFTags.RPM450,  450 },
        { RAFTags.RPM400,  400 },
        { RAFTags.RPM350,  350 },
        { RAFTags.RPM300,  300 },
    }

    function RAFRateOfFire.getWeaponRPM(weapon)
        if not weapon then return RAFRateOfFire.DEFAULT_RPM end
        for _, entry in ipairs(RAFRateOfFire.RPMTagList) do
            local tag, rpm = entry[1], entry[2]
            if weapon:hasTag(tag) then return rpm end
        end
        return RAFRateOfFire.DEFAULT_RPM
    end

    function RAFRateOfFire.canFire(player, weapon)
        if not player then return false end

        local playerId = player:getPlayerNum()
        local now = getTimestampMs()

        local rpm = RAFRateOfFire.getWeaponRPM(weapon)
        if not rpm or rpm <= 0 then rpm = RAFRateOfFire.DEFAULT_RPM end

        local intervalMs = math.floor((60000 / rpm) + 0.5)

        local nextAllowed = RAFRateOfFire.lastFireTime[playerId] or 0

        if now >= nextAllowed then
            local newNext = nextAllowed + intervalMs
            if newNext < now then
                newNext = now + intervalMs
            end

            RAFRateOfFire.lastFireTime[playerId] = newNext
            return true
        end

        -- if now >= nextAllowed then
        --     RAFRateOfFire.lastFireTime[playerId] = now + intervalMs
        --     return true
        -- end

        return false
    end

    local old_attackHook = ISReloadWeaponAction.attackHook
    Hook.Attack.Remove(ISReloadWeaponAction.attackHook)

    ISReloadWeaponAction.attackHook = function(character, chargeDelta, weapon)
        if weapon:isRanged() and not character:isDoShove() then
            if not RAFRateOfFire.canFire(character, weapon) then return end
        end
        return old_attackHook(character, chargeDelta, weapon)
    end

    Hook.Attack.Add(ISReloadWeaponAction.attackHook)
end)

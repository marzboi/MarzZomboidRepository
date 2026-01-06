require "TimedActions/ISReloadWeaponAction"
-------------------------------------------------
-- Rate of Fire Control System
-------------------------------------------------
RAFEnabledMods = {}
RAFFunctions = {}
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
RAFRateOfFire.burstState = {}
RAFRateOfFire.BURST_DEFAULT_COUNT = 3
RAFRateOfFire.BURST_DELAY_MS = 500
RAFRateOfFire.burstCooldown = {}
RAFRateOfFire.BURSTTagList = {
    { RAFTags.BURST4, 4 },
    { RAFTags.BURST3, 3 },
    { RAFTags.BURST2, 2 },
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
        return true, intervalMs
    end

    return false
end

function RAFRateOfFire.canStartBurst(player)
    local playerId = player:getPlayerNum()
    local now = getTimestampMs()
    local cooldownEnd = RAFRateOfFire.burstCooldown[playerId] or 0
    return now >= cooldownEnd
end

function RAFRateOfFire.getWeaponBurstCount(weapon)
    if not weapon then return RAFRateOfFire.BURST_DEFAULT_COUNT end
    for _, entry in ipairs(RAFRateOfFire.BURSTTagList) do
        local tag, rpm = entry[1], entry[2]
        if weapon:hasTag(tag) then return rpm end
    end
    return RAFRateOfFire.BURST_DEFAULT_COUNT
end

function RAFRateOfFire.startBurst(player, weapon, intervalMs, Original_Attack_Hook, chargeDelta)
    local playerId = player:getPlayerNum()

    if RAFRateOfFire.burstState[playerId] then return false end
    if not RAFRateOfFire.canStartBurst(player) then return false end

    RAFRateOfFire.burstState[playerId] = {
        shotsRemaining = RAFRateOfFire.getWeaponBurstCount(weapon) - 1,
        intervalMs = intervalMs,
        weapon = weapon,
        attackHook = Original_Attack_Hook,
        chargeDelta = chargeDelta,
        nextShotTime = getTimestampMs() + intervalMs
    }
end

function RAFRateOfFire.burstTickHandler()
    local now = getTimestampMs()

    for playerId, state in pairs(RAFRateOfFire.burstState) do
        if state.shotsRemaining <= 0 then
            RAFRateOfFire.burstState[playerId] = nil
        elseif now >= state.nextShotTime then
            local player = getSpecificPlayer(playerId)

            if player and not player:isDead() and player:isAiming() then
                local weapon = state.weapon
                if weapon and ISReloadWeaponAction.canShoot(player, weapon) then
                    state.attackHook(player, state.chargeDelta, weapon)
                end
            end

            state.shotsRemaining = state.shotsRemaining - 1
            state.nextShotTime = now + state.intervalMs

            if state.shotsRemaining <= 0 then
                RAFRateOfFire.burstCooldown[playerId] = now + RAFRateOfFire.BURST_DELAY_MS
                RAFRateOfFire.burstState[playerId] = nil
            end
        end
    end
end

Events.OnGameStart.Add(function()
    local Firearms_Attack_hook
    local Original_Attack_Hook = ISReloadWeaponAction.attackHook
    if RAFEnabledMods.FIREARMS_BETA or RAFEnabledMods.FIREARMS then
        Firearms_Attack_hook = ISReloadWeaponAction.attackHookFirearms
        Hook.Attack.Remove(ISReloadWeaponAction.attackHookFirearms)
    end

    ISReloadWeaponAction.RAFattackHook = function(character, chargeDelta, weapon)
        if weapon:isRanged() and not character:isDoShove() then
            local canFire, intervalMs = RAFRateOfFire.canFire(character, weapon)
            if not canFire then return end

            if weapon:getFireMode() == "RealBurst" then
                if not RAFRateOfFire.canStartBurst(character) then return end

                if RAFEnabledMods.FIREARMS_BETA or RAFEnabledMods.FIREARMS then
                    local result = Firearms_Attack_hook(character, chargeDelta, weapon)
                    RAFRateOfFire.startBurst(character, weapon, intervalMs, Firearms_Attack_hook, chargeDelta)
                    return result
                else
                    local result = Original_Attack_Hook(character, chargeDelta, weapon)
                    RAFRateOfFire.startBurst(character, weapon, intervalMs, Original_Attack_Hook, chargeDelta)
                    return result
                end
            end
        end

        if RAFEnabledMods.FIREARMS_BETA or RAFEnabledMods.FIREARMS then
            return Firearms_Attack_hook(character, chargeDelta, weapon)
        else
            return Original_Attack_Hook(character, chargeDelta, weapon)
        end
    end

    Hook.Attack.Remove(ISReloadWeaponAction.attackHook)
    Hook.Attack.Add(ISReloadWeaponAction.RAFattackHook)
    Events.OnTick.Add(RAFRateOfFire.burstTickHandler)
end)

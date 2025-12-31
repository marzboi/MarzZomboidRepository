-------------------------------------------------
-- Rate of Fire Control System
-------------------------------------------------
RAFRateOfFire = {}

RAFRateOfFire.lastFireTime = {}
RAFRateOfFire.DEFAULT_RPM = 600
RAFRateOfFire.RPMTags = {
    [RAFTags.RPM1000] = 1000,
    [RAFTags.RPM950]  = 950,
    [RAFTags.RPM900]  = 900,
    [RAFTags.RPM850]  = 850,
    [RAFTags.RPM800]  = 800,
    [RAFTags.RPM750]  = 750,
    [RAFTags.RPM700]  = 700,
    [RAFTags.RPM650]  = 650,
    [RAFTags.RPM600]  = 600,
    [RAFTags.RPM550]  = 550,
    [RAFTags.RPM500]  = 500,
    [RAFTags.RPM450]  = 450,
    [RAFTags.RPM400]  = 400,
    [RAFTags.RPM350]  = 350,
    [RAFTags.RPM300]  = 300,
}

function RAFRateOfFire.getWeaponRPM(weapon)
    if not weapon then return RAFRateOfFire.DEFAULT_RPM end

    for tag, rpm in pairs(RAFRateOfFire.RPMTags) do
        if weapon:hasTag(tag) then
            return rpm
        end
    end

    return RAFRateOfFire.DEFAULT_RPM
end

function RAFRateOfFire.canFire(player, weapon)
    if not player then return false end

    local playerId = player:getPlayerNum()
    local currentTime = getTimestampMs() / 1000.0

    local lastTime = RAFRateOfFire.lastFireTime[playerId] or 0
    local elapsed = currentTime - lastTime

    local weaponRPM = RAFRateOfFire.getWeaponRPM(weapon)
    local interval = 60 / weaponRPM

    if elapsed >= interval or lastTime == 0 then
        RAFRateOfFire.lastFireTime[playerId] = currentTime
        return true
    end

    return false
end

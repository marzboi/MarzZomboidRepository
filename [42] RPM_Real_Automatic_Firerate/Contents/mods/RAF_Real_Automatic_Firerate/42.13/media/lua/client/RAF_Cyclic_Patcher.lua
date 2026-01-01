local function cyclicRatePatcher(character, weapon)
    if not weapon or not character then return end
    if not weapon:isRanged() then return end
    if ("Auto" == weapon:getFireMode()) and character:isAiming() then
        weapon:setFireMode("RealAuto")
        weapon:setRecoilDelay(1)
    elseif not character:isAiming() then
        weapon:setFireMode("Auto")
        weapon:setRecoilDelay(15)
    end
end

local function weaponUpdater()
    local character = getSpecificPlayer(0)
    if not character then return end

    local weapon = character:getPrimaryHandItem()
    if not weapon or not instanceof(weapon, "HandWeapon") then return end
    if weapon:getSubCategory() ~= "Firearm" then return end

    cyclicRatePatcher(character, weapon)
end

Events.OnPlayerUpdate.Add(weaponUpdater)

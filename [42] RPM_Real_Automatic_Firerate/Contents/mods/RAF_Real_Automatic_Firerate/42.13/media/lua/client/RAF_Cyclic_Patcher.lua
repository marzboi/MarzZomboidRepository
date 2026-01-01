RAFFunctions = {}
RAFFunctions.recoilDelayTable = {}

function RAFFunctions.recoilDelaySaver()
    local character = getSpecificPlayer(0)
    if not character then return end

    local weapon = character:getPrimaryHandItem()
    if not weapon or not instanceof(weapon, "HandWeapon") then return end
    if weapon:getSubCategory() ~= "Firearm" then return end

    local weaponName = weapon:getFullType()
    if not RAFFunctions.recoilDelayTable[weaponName] then
        local recoilDelay = weapon:getRecoilDelay()
        RAFFunctions.recoilDelayTable[weaponName] = recoilDelay
    end
end

function RAFFunctions.recoilDelayAdjuster(character, weapon)
    if not weapon or not character then return end
    if not weapon:isRanged() then return end

    if character:isAiming() and ("Auto" == weapon:getFireMode()) then
        weapon:setFireMode("RealAuto")
        weapon:setRecoilDelay(1)
    elseif not character:isAiming() and ("RealAuto" == weapon:getFireMode()) then
        weapon:setFireMode("Auto")
        weapon:setRecoilDelay(RAFFunctions.recoilDelayTable[weapon:getFullType()] or weapon:getRecoilDelay())
    end

    if character:isAiming() and ("Burst" == weapon:getFireMode()) then
        weapon:setFireMode("RealBurst")
        weapon:setRecoilDelay(1)
    elseif not character:isAiming() and ("RealBurst" == weapon:getFireMode()) then
        weapon:setFireMode("Burst")
        weapon:setRecoilDelay(RAFFunctions.recoilDelayTable[weapon:getFullType()] or weapon:getRecoilDelay())
    end
end

function RAFFunctions.weaponUpdater()
    local character = getSpecificPlayer(0)
    if not character then return end

    local weapon = character:getPrimaryHandItem()
    if not weapon or not instanceof(weapon, "HandWeapon") then return end
    if weapon:getSubCategory() ~= "Firearm" then return end

    RAFFunctions.recoilDelayAdjuster(character, weapon)
end

Events.OnEquipPrimary.Add(RAFFunctions.recoilDelaySaver)
Events.OnPlayerUpdate.Add(RAFFunctions.weaponUpdater)

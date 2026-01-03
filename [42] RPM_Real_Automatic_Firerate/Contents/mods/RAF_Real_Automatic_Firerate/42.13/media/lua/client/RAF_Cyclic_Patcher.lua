RAFFunctions = {}

function RAFFunctions.cyclicRatePatcher(character, weapon)
    if not weapon or not character then return end
    if not weapon:isRanged() then return end
    if ("Auto" == weapon:getFireMode()) or ("RealAuto" == weapon:getFireMode()) then
        if character:isAiming() then
            weapon:setFireMode("RealAuto")
            weapon:setRecoilDelay(1)
        elseif not character:isAiming() then
            weapon:setFireMode("Auto")
            weapon:setRecoilDelay(15)
        end
    end

    if ("Burst" == weapon:getFireMode()) or ("RealBurst" == weapon:getFireMode()) then
        if character:isAiming() then
            weapon:setFireMode("RealBurst")
            weapon:setRecoilDelay(1)
        elseif not character:isAiming() then
            weapon:setFireMode("Burst")
            weapon:setRecoilDelay(15)
        end
    end
end

function RAFFunctions.weaponUpdater()
    local character = getPlayer()
    if not character then return end

    local weapon = character:getPrimaryHandItem()
    if not weapon or not instanceof(weapon, "HandWeapon") then return end
    if weapon:getSubCategory() ~= "Firearm" then return end

    RAFFunctions.cyclicRatePatcher(character, weapon)
end

Events.OnPlayerUpdate.Add(RAFFunctions.weaponUpdater)

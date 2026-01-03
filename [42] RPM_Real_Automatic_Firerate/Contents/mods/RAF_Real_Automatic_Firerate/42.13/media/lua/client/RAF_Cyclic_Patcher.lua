RAFFunctions = RAFFunctions or {}

function RAFFunctions.isTempRAFMode(weapon)
    local mode = weapon and weapon:getFireMode()
    return mode == "RealAuto" or mode == "RealBurst"
end

function RAFFunctions.ensureBaseRecoilSaved(weapon)
    if not weapon then return end
    local weaponModData = weapon:getModData()

    if weaponModData.RAF_baseRecoilDelay == nil and weaponModData.RAF_originalRecoilDelay ~= nil then
        weaponModData.RAF_baseRecoilDelay = weaponModData.RAF_originalRecoilDelay
    end

    if weaponModData.RAF_baseRecoilDelay == nil then
        weaponModData.RAF_baseRecoilDelay = weapon:getRecoilDelay()
    end
end

function RAFFunctions.getBaseRecoil(weapon)
    if not weapon then return nil end
    local weaponModData = weapon:getModData()
    return (weaponModData and (weaponModData.RAF_baseRecoilDelay or weaponModData.RAF_originalRecoilDelay)) or nil
end

function RAFFunctions.refreshBaseRecoil(weapon)
    if not weapon then return end
    local weaponModData = weapon:getModData()

    if RAFFunctions.isTempRAFMode(weapon) and weapon:getRecoilDelay() == 1 and RAFFunctions.getBaseRecoil(weapon) ~= nil then
        return
    end

    weaponModData.RAF_baseRecoilDelay = weapon:getRecoilDelay()
end

function RAFFunctions.recoilDelayAdjuster(character, weapon)
    if not weapon or not character then return end
    if not weapon:isRanged() then return end

    local aiming = character:isAiming()
    local mode = weapon:getFireMode()

    if aiming and mode == "Auto" then
        RAFFunctions.ensureBaseRecoilSaved(weapon)
        weapon:setFireMode("RealAuto")
        weapon:setRecoilDelay(1)
    elseif (not aiming) and mode == "RealAuto" then
        weapon:setFireMode("Auto")
        weapon:setRecoilDelay(RAFFunctions.getBaseRecoil(weapon) or weapon:getRecoilDelay())
    elseif aiming and mode == "Burst" then
        RAFFunctions.ensureBaseRecoilSaved(weapon)
        weapon:setFireMode("RealBurst")
        weapon:setRecoilDelay(1)
    elseif (not aiming) and mode == "RealBurst" then
        weapon:setFireMode("Burst")
        weapon:setRecoilDelay(RAFFunctions.getBaseRecoil(weapon) or weapon:getRecoilDelay())
    end
end

function RAFFunctions.weaponUpdater()
    local character = getPlayer()
    if not character then return end

    local weapon = character:getPrimaryHandItem()
    if not weapon or not instanceof(weapon, "HandWeapon") then return end
    if weapon:getSubCategory() ~= "Firearm" then return end

    RAFFunctions.recoilDelayAdjuster(character, weapon)
end

Events.OnPlayerUpdate.Add(RAFFunctions.weaponUpdater)

require "TimedActions/ISRemoveWeaponUpgrade"
require "TimedActions/ISUpgradeWeapon"

local ISRemoveWeaponUpgrade_completeHook = ISRemoveWeaponUpgrade.complete
function ISRemoveWeaponUpgrade:complete()
    local res = ISRemoveWeaponUpgrade_completeHook(self)

    local weapon = self.weapon or self.gun or self.item
    if weapon and instanceof(weapon, "HandWeapon") then
        RAFFunctions.refreshBaseRecoil(weapon)
    end

    return res
end

local ISUpgradeWeapon_completeHook = ISUpgradeWeapon.complete
function ISUpgradeWeapon:complete()
    local res = ISUpgradeWeapon_completeHook(self)

    local weapon = self.weapon or self.gun or self.item
    if weapon and instanceof(weapon, "HandWeapon") then
        RAFFunctions.refreshBaseRecoil(weapon)
    end

    return res
end

require "TimedActions/ISRemoveWeaponUpgrade"
require "TimedActions/ISUpgradeWeapon"

local function modelSetter(weapon)
    VFESetWeaponModel(weapon, false)
    VFESetWeaponIcon(weapon)
end

local ISRemoveWeaponUpgrade_completeHook = ISRemoveWeaponUpgrade.complete
function ISRemoveWeaponUpgrade:complete()
    ISRemoveWeaponUpgrade_completeHook(self)
    modelSetter(self.weapon)
end

local ISUpgradeWeapon_completeHook = ISUpgradeWeapon.complete
function ISUpgradeWeapon:complete()
    ISUpgradeWeapon_completeHook(self)
    modelSetter(self.weapon)
end

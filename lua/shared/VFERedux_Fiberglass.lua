local ISRemoveWeaponUpgrade_performHook = ISRemoveWeaponUpgrade.perform
function ISRemoveWeaponUpgrade:perform()
    ISRemoveWeaponUpgrade_performHook(self)
    VFESetWeaponModel(self.weapon, false)
end

local ISUpgradeWeapon_performHook = ISUpgradeWeapon.perform
function ISUpgradeWeapon:perform()
    ISUpgradeWeapon_performHook(self)
    VFESetWeaponModel(self.weapon, false)
end

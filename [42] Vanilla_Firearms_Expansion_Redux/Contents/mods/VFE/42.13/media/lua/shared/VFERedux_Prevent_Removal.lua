require "TimedActions/ISRemoveWeaponUpgrade"
require "TimedActions/ISUpgradeWeapon"

local ISRemoveWeaponUpgrade_completeHook = ISRemoveWeaponUpgrade.complete
function ISRemoveWeaponUpgrade:complete()
    local part = self.weapon:getWeaponPart(self.partType)
    if part:getFullType() == "Base.MagazineAttachment" then return end
    ISRemoveWeaponUpgrade_completeHook(self)
end

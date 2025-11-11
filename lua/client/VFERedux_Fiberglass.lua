local function refreshSpriteNextTick(weapon)
    local function once()
        Events.OnTick.Remove(once)
        VFESetWeaponModel(weapon, false)
        VFESetWeaponIcon(weapon)
    end
    Events.OnTick.Add(once)
end

local ISRemoveWeaponUpgrade_completeHook = ISRemoveWeaponUpgrade.complete
function ISRemoveWeaponUpgrade:complete()
    refreshSpriteNextTick(self.weapon)
    ISRemoveWeaponUpgrade_completeHook(self)
end

local ISUpgradeWeapon_completeHook = ISUpgradeWeapon.complete
function ISUpgradeWeapon:complete()
    refreshSpriteNextTick(self.weapon)
    ISUpgradeWeapon_completeHook(self)
end

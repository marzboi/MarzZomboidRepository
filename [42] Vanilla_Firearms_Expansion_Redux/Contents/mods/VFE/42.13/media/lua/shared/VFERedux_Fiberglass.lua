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

local function fiberglassInitCheck(player, weapon)
    if not weapon or not player then return end
    local part = weapon:getWeaponPart('Stock')
    if weapon:getCategory() == "Weapon" and weapon:getSubCategory() == "Firearm" then
        if part and part:getFullType() == "Base.FiberglassStock" then
            VFESetWeaponModel(weapon, false)
            VFESetWeaponIcon(weapon)
        end
    end
end

Events.OnEquipPrimary.Add(function(player, weapon) fiberglassInitCheck(player, weapon) end)

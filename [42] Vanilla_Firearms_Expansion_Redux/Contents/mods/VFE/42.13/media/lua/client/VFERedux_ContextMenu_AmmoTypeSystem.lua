require "ISUI/ISInventoryPaneContextMenu"
require "TimedActions/ISInventoryTransferUtil"

local original_ISInventoryPaneContextMenu_doMagazineMenu = ISInventoryPaneContextMenu.doMagazineMenu
ISInventoryPaneContextMenu.doMagazineMenu = function(playerObj, magazine, context)
    if VFEAmmoMap.AltAmmoTypes[magazine:getAmmoType():getItemKey()] then
        local ammoTypeToSet = VFEAmmoMap.AltAmmoTypes[magazine:getAmmoType():getItemKey()]
        context:addOption(getText("IGUI_ContextMenu_SwitchAmmoType", ammoTypeToSet), playerObj,
            ISInventoryPaneContextMenu.onMagazineSwitchAmmoTypes, magazine, ammoTypeToSet);
    end

    return original_ISInventoryPaneContextMenu_doMagazineMenu(playerObj, magazine, context)
end

ISInventoryPaneContextMenu.onMagazineSwitchAmmoTypes = function(playerObj, magazine, ammoTypeFullType)
    if magazine:getCurrentAmmoCount() > 0 then
        ISInventoryPaneContextMenu.transferIfNeeded(playerObj, magazine)
        ISTimedActionQueue.add(ISUnloadBulletsFromMagazine:new(playerObj, magazine))
    end

    return ISReloadWeaponAction.SwitchAmmoType(magazine, ammoTypeFullType)
end

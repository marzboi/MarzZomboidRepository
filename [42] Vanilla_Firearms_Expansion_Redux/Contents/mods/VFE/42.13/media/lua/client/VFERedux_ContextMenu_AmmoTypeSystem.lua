require "ISUI/ISInventoryPaneContextMenu"
require "TimedActions/ISInventoryTransferUtil"

local original_ISInventoryPaneContextMenu_doMagazineMenu = ISInventoryPaneContextMenu.doMagazineMenu
ISInventoryPaneContextMenu.doMagazineMenu = function(playerObj, magazine, context)
    local altAmmoTypes = VFEAmmoMap.AltAmmoTypes[magazine:getAmmoType():getItemKey()]
    if altAmmoTypes then
        for _, ammoTypeToSet in ipairs(altAmmoTypes) do
            context:addOption(getText("IGUI_ContextMenu_SwitchAmmoType", ammoTypeToSet), playerObj,
                ISInventoryPaneContextMenu.onMagazineSwitchAmmoTypes, magazine, ammoTypeToSet);
        end
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

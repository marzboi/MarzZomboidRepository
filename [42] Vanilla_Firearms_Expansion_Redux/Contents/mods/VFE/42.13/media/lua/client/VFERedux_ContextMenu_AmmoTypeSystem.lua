require "ISUI/ISInventoryPaneContextMenu"
require "TimedActions/ISInventoryTransferUtil"

local original_ISInventoryPaneContextMenu_doMagazineMenu = ISInventoryPaneContextMenu.doMagazineMenu
ISInventoryPaneContextMenu.doMagazineMenu = function(playerObj, magazine, context)
    local altAmmoTypes = VFEAmmoMap.GetAltAmmoTypes(magazine:getAmmoType():getItemKey())
    if altAmmoTypes then
        local altAmmoOption = context:addOption(getText("IGUI_ContextMenu_SwitchAmmoType"))
        local subMenuAltAmmoOption = context:getNew(context)
        context:addSubMenu(altAmmoOption, subMenuAltAmmoOption)
        for _, ammoTypeToSet in ipairs(altAmmoTypes) do
            local ammoToSet = instanceItem(ammoTypeToSet)
            subMenuAltAmmoOption:addOption(getText("IGUI_ContextMenu_SubSwitchAmmoType", ammoToSet:getDisplayName()),
                playerObj,
                ISInventoryPaneContextMenu.onMagazineSwitchAmmoTypes, magazine, ammoTypeToSet);
        end
    end

    return original_ISInventoryPaneContextMenu_doMagazineMenu(playerObj, magazine, context)
end

ISInventoryPaneContextMenu.onMagazineSwitchAmmoTypes = function(playerObj, magazine, ammoTypeFullType)
    if magazine:getCurrentAmmoCount() > 0 then
        ISInventoryPaneContextMenu.transferIfNeeded(playerObj, magazine)
        ISTimedActionQueue.add(ISUnloadBulletsFromMagazine:new(playerObj, magazine))
        return ISReloadWeaponAction.SwitchAmmoType(magazine, ammoTypeFullType)
    else
        return ISReloadWeaponAction.SwitchAmmoType(magazine, ammoTypeFullType)
    end
end

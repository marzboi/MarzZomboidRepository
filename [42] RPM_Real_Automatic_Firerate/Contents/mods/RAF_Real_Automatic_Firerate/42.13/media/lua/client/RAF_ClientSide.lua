require 'ISUI/ISInventoryPaneContextMenu'
require 'RAF_SharedSide'

function RAFFunctions.OnPlayerUpdateFiremode(playerObj, weapon, newfiremode)
    if not isClient() then
        if RAFFunctions.recoilDelayAdjuster then
            RAFFunctions.recoilDelayAdjuster(playerObj, weapon)
        end
        return
    end

    if not weapon then return end

    sendClientCommand(playerObj, "RAF", "firemode", {
        itemId = weapon:getID(),
        firemode = newfiremode
    })
end

function RAFFunctions.RAF_OnServerCommand(module, command, args)
    if module ~= "RAF" or command ~= "applyWeapon" or not args then return end

    local playerObj = getSpecificPlayer(0)
    if not playerObj then return end

    local item = playerObj:getInventory():getItemWithIDRecursiv(args.itemId)
    if item and instanceof(item, "HandWeapon") then
        if args.firemode then item:setFireMode(args.firemode) end
        if args.recoilDelay then item:setRecoilDelay(args.recoilDelay) end
    end
end

ISInventoryPaneContextMenu.onChangefiremode = function(playerObj, weapon, newfiremode)
    if newfiremode == "Auto" then newfiremode = "RealAuto" end
    if newfiremode == "Burst" then newfiremode = "RealBurst" end
    weapon:setFireMode(newfiremode)
    playerObj:setFireMode(newfiremode)
    RAFFunctions.OnPlayerUpdateFiremode(playerObj, weapon, newfiremode)
end

ISInventoryPaneContextMenu.doChangeFireModeMenu = function(playerObj, weapon, context)
    local firemodeOption = context:addOption(getText("ContextMenu_ChangeFireMode"))
    local subMenuFiremode = context:getNew(context)
    context:addSubMenu(firemodeOption, subMenuFiremode)

    for i = 0, weapon:getFireModePossibilities():size() - 1 do
        local firemode = weapon:getFireModePossibilities():get(i)
        if firemode ~= weapon:getFireMode() then
            subMenuFiremode:addOption(getText("ContextMenu_FireMode_" .. firemode),
                playerObj, ISInventoryPaneContextMenu.onChangefiremode, weapon, firemode)
        end
    end
end

Events.OnServerCommand.Add(RAFFunctions.RAF_OnServerCommand)

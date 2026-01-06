require 'ISUI/ISInventoryPaneContextMenu'
require 'RAF_SharedSide'

function RAFFunctions.getFiremodeMenuKey(firemode)
    if firemode == "RealAuto" then return "Auto" end
    if firemode == "RealBurst" then return "Burst" end
    return firemode
end

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

if not RAFEnabledMods.G93 then
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

        local currentFiremodeKey = RAFFunctions.getFiremodeMenuKey(weapon:getFireMode())

        for i = 0, weapon:getFireModePossibilities():size() - 1 do
            local firemode = weapon:getFireModePossibilities():get(i)
            local firemodeKey = RAFFunctions.getFiremodeMenuKey(firemode)
            if firemodeKey ~= currentFiremodeKey then
                subMenuFiremode:addOption(getText("ContextMenu_FireMode_" .. firemode),
                    playerObj, ISInventoryPaneContextMenu.onChangefiremode, weapon, firemode)
            end
        end
    end
end

if RAFEnabledMods.G93 then
    function RAFFunctions.cyclicRatePatcher(character, weapon)
        if not weapon or not character then return end
        if not weapon:isRanged() then return end

        local aiming = character:isAiming()
        local mode = weapon:getFireMode()

        if mode == "Auto" or mode == "RealAuto" then
            if aiming then
                weapon:setFireMode("RealAuto")
                weapon:setRecoilDelay(1)
            elseif (not aiming) then
                weapon:setFireMode("Auto")
                weapon:setRecoilDelay(15)
            end
        end

        if mode == "Burst" or mode == "RealBurst" then
            if aiming then
                weapon:setFireMode("RealBurst")
                weapon:setRecoilDelay(1)
            elseif (not aiming) then
                weapon:setFireMode("Burst")
                weapon:setRecoilDelay(15)
            end
        end
    end

    function RAFFunctions.weaponUpdater()
        local character = getPlayer()
        if not character then return end

        local weapon = character:getPrimaryHandItem()
        if not weapon or not instanceof(weapon, "HandWeapon") then return end
        if weapon:getSubCategory() ~= "Firearm" then return end

        RAFFunctions.cyclicRatePatcher(character, weapon)
    end

    Events.OnPlayerUpdate.Add(RAFFunctions.weaponUpdater)
end

Events.OnServerCommand.Add(RAFFunctions.RAF_OnServerCommand)

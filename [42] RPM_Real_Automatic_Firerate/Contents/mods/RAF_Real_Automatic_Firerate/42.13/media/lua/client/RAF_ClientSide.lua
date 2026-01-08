require 'ISUI/ISInventoryPaneContextMenu'
require 'RAF_SharedSide'

function RAFFunctions.getFiremodeMenuKey(firemode)
    return firemode:match("^Real(.+)") or firemode
end

function RAFFunctions.isFiremodeStandard(firemode)
    if firemode == "Auto" or firemode == "Burst" or firemode == "Single" then
        return true
    else
        return false
    end
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

function RAFFunctions.FiremodeSwitchCheck(playerObj, weapon)
    if not playerObj or not weapon or not instanceof(weapon, "HandWeapon") or not weapon:isRanged() then return end
    local newfiremode = weapon:getFireMode()
    if RAFFunctions.isFiremodeStandard(newfiremode) then
        newfiremode = "Real" .. newfiremode
        weapon:setFireMode(newfiremode)
        playerObj:setFireMode(newfiremode)
        RAFFunctions.OnPlayerUpdateFiremode(playerObj, weapon, newfiremode)
    end
end

function RAFFunctions.OnServerCommand(module, command, args)
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
        if RAFFunctions.isFiremodeStandard(newfiremode) then
            newfiremode = "Real" .. newfiremode
        end
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
    function RAFFunctions.cyclicRatePatcher(character)
        if not character then return end
        local weapon = character:getPrimaryHandItem()
        if not weapon or not instanceof(weapon, "HandWeapon") then return end
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

    Events.OnPlayerUpdate.Add(RAFFunctions.cyclicRatePatcher)
end

Events.OnServerCommand.Add(RAFFunctions.OnServerCommand)
Events.OnWeaponSwing.Add(RAFFunctions.FiremodeSwitchCheck)

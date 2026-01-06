require 'RAF_SharedSide'

function RAFFunctions.calcRecoilDelayShadow(weapon)
    local shadow = instanceItem(weapon:getFullType())

    local parts = weapon:getAllWeaponParts()
    if parts then
        for i = 0, parts:size() - 1 do
            local part = parts:get(i)
            if part then
                local partCopy = instanceItem(part:getFullType())
                if partCopy and instanceof(partCopy, "WeaponPart") then
                    if shadow.canAttachWeaponPart == nil or shadow:canAttachWeaponPart(partCopy) then
                        shadow:attachWeaponPart(partCopy)
                    end
                end
            end
        end
    end
    return shadow:getRecoilDelay()
end

function RAFFunctions.recoilDelayAdjuster(player, weapon)
    if not weapon or not player then return end
    if not weapon:isRanged() then return end

    local mode = weapon:getFireMode()

    if mode == "RealAuto" or mode == "RealBurst" then
        weapon:setRecoilDelay(1)
    else
        weapon:setRecoilDelay(RAFFunctions.calcRecoilDelayShadow(weapon))
    end
end

function RAFFunctions.getWeaponById(player, itemId)
    if not player or not itemId then return nil end
    local item = player:getInventory():getItemById(itemId)
    if item and instanceof(item, "HandWeapon") then return item end
    return nil
end

function RAFFunctions.onClientCommand(module, command, player, args)
    if module ~= "RAF" then return end
    if command ~= "firemode" then return end
    if not player or not args then return end

    local weapon = RAFFunctions.getWeaponById(player, args.itemId)
    if not weapon then return end

    if args.firemode then weapon:setFireMode(args.firemode) end
    RAFFunctions.recoilDelayAdjuster(player, weapon)

    sendServerCommand(player, "RAF", "applyWeapon", {
        itemId = weapon:getID(),
        firemode = weapon:getFireMode(),
        recoilDelay = weapon:getRecoilDelay()
    })
end

Events.OnClientCommand.Add(RAFFunctions.onClientCommand)

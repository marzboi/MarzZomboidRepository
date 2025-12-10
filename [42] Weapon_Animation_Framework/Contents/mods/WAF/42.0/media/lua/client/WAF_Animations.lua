AnimationWeaponAction.pending = {}
AnimationWeaponAction.BASELINE_TICKS_PER_SECOND = 60

function AnimationWeaponAction.getGameTime()
    return GameTime.getInstance()
end

function AnimationWeaponAction.isWeaponReadyToFire(weapon)
    return weapon:isRoundChambered()
        and not weapon:isJammed()
        and weapon:haveChamber()
end

function AnimationWeaponAction.updateWeaponVisuals(player, weapon, attachmentType)
    weapon:attachWeaponPart(instanceItem(attachmentType), true)
    player:resetEquippedHandsModels()
end

function AnimationWeaponAction.restoreUnfiredState(player, weapon)
    if not weapon or not player then return end

    if AnimationWeaponAction.isWeaponReadyToFire(weapon) then
        AnimationWeaponAction.updateWeaponVisuals(player, weapon, "SlideAttachment_Unfired")
    end
end

function AnimationWeaponAction.scheduleRestore(player, weapon, ticks)
    if not player or not weapon then return end

    local playerId = tostring(player:getPlayerNum() or 0)
    local validTicks = math.max(1, math.floor(ticks or 1))
    local seconds = validTicks / AnimationWeaponAction.BASELINE_TICKS_PER_SECOND

    AnimationWeaponAction.pending[playerId] = {
        timeRemaining = seconds,
        weapon = weapon,
        action = function()
            AnimationWeaponAction.restoreUnfiredState(player, weapon)
        end
    }
end

function AnimationWeaponAction.scheduleAction(player, weapon, delayTicks, action)
    if not player or not weapon then return end

    local playerId = tostring(player:getPlayerNum() or 0) .. "_delayed"
    local validTicks = math.max(1, math.floor(delayTicks or 1))
    local seconds = validTicks / AnimationWeaponAction.BASELINE_TICKS_PER_SECOND

    AnimationWeaponAction.pending[playerId] = {
        timeRemaining = seconds,
        weapon = weapon,
        action = action
    }
end

function AnimationWeaponAction.animateFiring(player, weapon, ticks)
    if not weapon or not player then return end

    if AnimationWeaponAction.isWeaponReadyToFire(weapon) then
        AnimationWeaponAction.updateWeaponVisuals(player, weapon, "SlideAttachment_Fired")
        AnimationWeaponAction.scheduleRestore(player, weapon, ticks)
    end
end

function AnimationWeaponAction.animateRack(player, weapon, restoreTicks, delayTicks)
    if not weapon or not player then return end

    AnimationWeaponAction.scheduleAction(player, weapon, delayTicks, function()
        AnimationWeaponAction.animateFiring(player, weapon, restoreTicks)
    end)
end

function AnimationWeaponAction.hasSlideAttached(weapon)
    return weapon:getWeaponPart('Slide') ~= nil
end

function AnimationWeaponAction.findSlideAttachmentPoint(weapon)
    local weaponModel = ScriptManager.instance:getModelScript(weapon:getOriginalWeaponSprite())

    for i = 0, weaponModel:getAttachmentCount() - 1 do
        local partList = weaponModel:getAttachment(i)
        if partList:getId() == "slide" then
            return true
        end
    end

    return false
end

function AnimationWeaponAction.initializeSlide(player, weapon)
    if not weapon or not player then return end
    if AnimationWeaponAction.hasSlideAttached(weapon) then return end

    if AnimationWeaponAction.findSlideAttachmentPoint(weapon) then
        weapon:attachWeaponPart(instanceItem("SlideAttachment_Unfired"), true)
    end
end

function AnimationWeaponAction.processPendingUpdates()
    local deltaTime = AnimationWeaponAction.getGameTime():getRealworldSecondsSinceLastUpdate()
        or (1 / AnimationWeaponAction.BASELINE_TICKS_PER_SECOND)

    for playerId, data in pairs(AnimationWeaponAction.pending) do
        data.timeRemaining = data.timeRemaining - deltaTime

        if data.timeRemaining <= 0 then
            if data.action then
                data.action()
            else
                local playerNum = tonumber(playerId) or 0
                local player = getSpecificPlayer(playerNum)

                if player and data.weapon then
                    AnimationWeaponAction.restoreUnfiredState(player, data.weapon)
                end
            end

            AnimationWeaponAction.pending[playerId] = nil
        end
    end
end

Events.OnEquipPrimary.Add(AnimationWeaponAction.initializeSlide)
Events.OnWeaponSwing.Add(function(player, weapon)
    AnimationWeaponAction.animateFiring(player, weapon, 10)
end)
Events.OnTick.Add(AnimationWeaponAction.processPendingUpdates)

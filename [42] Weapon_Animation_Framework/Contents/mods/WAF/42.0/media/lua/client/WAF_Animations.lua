AnimationWeaponAction.pending = {}
AnimationWeaponAction.BASELINE_TICKS_PER_SECOND = 60
function AnimationWeaponAction.GT()
    return GameTime.getInstance()
end

function AnimationWeaponAction.update(player, weapon)
    if not weapon or not player then return end
    if weapon:isRoundChambered() and not weapon:isJammed() and weapon:haveChamber() then
        weapon:attachWeaponPart(instanceItem("SlideAttachment"), true)
        player:resetEquippedHandsModels()
    end
end

function AnimationWeaponAction.scheduleUpdate(player, weapon, ticks)
    if not player or not weapon then return end

    local pid = tostring(player:getPlayerNum() or 0)
    local t = math.max(1, math.floor(ticks or 1))
    local seconds = t / AnimationWeaponAction.BASELINE_TICKS_PER_SECOND

    AnimationWeaponAction.pending[pid] = {
        timeRemaining = seconds,
        weapon = weapon,
    }
end

function AnimationWeaponAction.animateWeaponFiring(player, weapon, ticks)
    if not weapon or not player then return end
    if weapon:isRackAfterShoot() then return end

    if weapon:isRoundChambered() and not weapon:isJammed() and weapon:haveChamber() then
        weapon:attachWeaponPart(instanceItem("SlideAttachment50"), true)
        player:resetEquippedHandsModels()
        AnimationWeaponAction.scheduleUpdate(player, weapon, ticks)
    end
end

function AnimationWeaponAction.attachPart(player, weapon)
    if not weapon or not player then return end
    if weapon:getSubCategory() == "Firearm" then
        local slide = weapon:getWeaponPart('Slide')

        if slide then return end

        local weaponModel = ScriptManager.instance:getModelScript(weapon:getOriginalWeaponSprite())
        for i = 0, weaponModel:getAttachmentCount() - 1 do
            local partList = weaponModel:getAttachment(i)
            if partList and partList:getId() == "slide" then
                weapon:attachWeaponPart(instanceItem("SlideAttachment"), true)
            end
        end
    end
end

function AnimationWeaponAction.onTick()
    local dt = AnimationWeaponAction.GT():getRealworldSecondsSinceLastUpdate() or
        (1 / AnimationWeaponAction.BASELINE_TICKS_PER_SECOND)
    for pid, data in pairs(AnimationWeaponAction.pending) do
        data.timeRemaining = data.timeRemaining - dt
        if data.timeRemaining <= 0 then
            local playerNum = tonumber(pid) or 0
            local player = getSpecificPlayer(playerNum)
            if player and data.weapon then AnimationWeaponAction.update(player, data.weapon) end
            AnimationWeaponAction.pending[pid] = nil
        end
    end
end

function AnimationWeaponAction.rackAction(player, weapon, percentage)
    if not (player and weapon) then return end

    local slide = weapon:getWeaponPart("Slide")
    if not slide then return end

    local pctToStep = { [0] = 0, [10] = 1, [20] = 2, [30] = 3, [40] = 4, [50] = 5, [60] = 4, [70] = 3, [80] = 2, [90] = 1,
        [100] = 0 }
    local step = pctToStep[percentage]

    local slideType = slide:getFullType()
    local targetType = "SlideAttachment"

    if step ~= nil then
        targetType = ("SlideAttachment%02d"):format(step * 10)
        if slideType == "SlideAttachment50" and step < 5 and percentage <= 50 then return end
        if slideType == targetType then return end
    end

    weapon:attachWeaponPart(instanceItem(targetType), true)
    player:resetEquippedHandsModels()
end

Events.OnEquipPrimary.Add(AnimationWeaponAction.attachPart)
Events.OnWeaponSwing.Add(function(player, weapon) AnimationWeaponAction.animateWeaponFiring(player, weapon, 10) end)
Events.OnTick.Add(AnimationWeaponAction.onTick)

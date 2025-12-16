AnimationWeaponAction = {}

function AnimationWeaponAction.Adjust(Name, Property, Value)
    local Item = ScriptManager.instance:getItem(Name)
    if not Item then return end
    Item:DoParam(Property .. " = " .. Value)
end

function AnimationWeaponAction.addToModelWeaponPart(itemName, partsTable)
    local itemScript = ScriptManager.instance:getItem(itemName)

    if itemScript then
        for _, partData in ipairs(partsTable) do
            if partData[1] and partData[2] and partData[3] and partData[4] then
                local modelPartString = partData[1] .. " " .. partData[2] .. " " .. partData[3] .. " " .. partData[4]
                itemScript:DoParam("ModelWeaponPart = " .. modelPartString)
            end
        end
    end
end

function AnimationWeaponAction.addAttachmentPoint(weapon, maxOffset)
    local weaponModel = ScriptManager.instance:getModelScript(weapon)
    local slideModel  = ScriptManager.instance:getModelScript("Base.SlideHolder")

    local slideSet    = {
        slide = true,
        slide00 = true,
        slide10 = true,
        slide20 = true,
        slide30 = true,
        slide40 = true,
        slide50 = true
    }

    for i = 0, slideModel:getAttachmentCount() - 1 do
        local pt = slideModel:getAttachment(i)
        if pt and slideSet[pt:getId()] then
            weaponModel:addAttachment(pt)
        end
    end

    local offsetStep = maxOffset / 6
    local cumulativeOffset = 0

    local function slideIndex(id)
        local n = id:match("^slide(%d%d)$")
        if not n then return nil end
        local num = tonumber(n)
        if not num then return nil end
        if num % 10 ~= 0 then return nil end
        local idx = (num / 10) + 1
        if idx < 1 or idx > 6 then return nil end
        return idx
    end

    for i = 0, weaponModel:getAttachmentCount() - 1 do
        local attachment = weaponModel:getAttachment(i)
        if attachment then
            local idx = slideIndex(attachment:getId())
            if idx then
                cumulativeOffset = cumulativeOffset + offsetStep
                local o = attachment:getOffset()
                attachment:getOffset():set(o:x(), o:y() + cumulativeOffset, o:z())
            end
        end
    end
end

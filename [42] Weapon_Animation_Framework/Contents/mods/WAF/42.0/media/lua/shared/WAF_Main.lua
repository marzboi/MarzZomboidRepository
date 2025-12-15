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

AnimationWeaponAction = {}

function AnimationWeaponAction.Adjust(Name, Property, Value)
    local Item = ScriptManager.instance:getItem(Name)
    if not Item then return end
    Item:DoParam(Property .. " = " .. Value)
end

function AnimationWeaponAction.addToModelWeaponPart(itemName, partKeys, partsTable)
    if type(partKeys) == "string" then
        partKeys = { partKeys }
    end

    local itemScript = ScriptManager.instance:getItem(itemName)

    if itemScript then
        for _, partKey in ipairs(partKeys) do
            if partsTable[partKey] then
                local partData = partsTable[partKey]
                local modelPartString = partData[1] .. " " .. partData[2] .. " " .. partData[3] .. " " .. partData[4]
                itemScript:DoParam("ModelWeaponPart = " .. modelPartString)
            end
        end
    end
end

local DEParts = {
    DESlideUnfired = { "SlideAttachment_Unfired", "DE_unfired", "slide", "slide" },
    DESlideFired = { "SlideAttachment_Fired", "DE_fired", "slide", "slide" }
}

AnimationWeaponAction.Adjust("Base.Pistol3", "WeaponSprite", "DE_frame")
AnimationWeaponAction.addToModelWeaponPart("Base.Pistol3", { "DESlideUnfired", "DESlideFired" }, DEParts)

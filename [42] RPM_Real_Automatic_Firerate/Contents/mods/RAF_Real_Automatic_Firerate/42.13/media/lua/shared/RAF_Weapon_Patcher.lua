local function Adjust(Name, Property, Value)
    local Item = ScriptManager.instance:getItem(Name)
    if not Item then return end
    Item:DoParam(Property .. " = " .. Value)
end

Events.OnInitWorld.Add(function()
    Adjust("Base.AssaultRifle", "FireModePossibilities", "Auto/Single/Burst")
end)

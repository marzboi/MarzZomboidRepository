local function Adjust(Name, Property, Value)
    local Item = ScriptManager.instance:getItem(Name)
    if not Item then return end
    Item:DoParam(Property .. " = " .. Value)
end

if SpentCasingPhysics then
    -- Hot Brass Bullets --
    Adjust("Base.57Bullets", "icon", "57_Round")
    Adjust("Base.57Bullets", "WorldStaticModel", "New_57_Round")

    Adjust("Base.46Bullets", "icon", "46_Round")
    Adjust("Base.46Bullets", "WorldStaticModel", "New_46_Round")
end

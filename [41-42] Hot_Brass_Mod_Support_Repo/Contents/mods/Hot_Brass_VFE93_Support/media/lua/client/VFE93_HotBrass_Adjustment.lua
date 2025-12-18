local function Adjust(Name, Property, Value)
    local Item = ScriptManager.instance:getItem(Name)
    if not Item then return end
    Item:DoParam(Property .. " = " .. Value)
end

--- VFES Ammo models
Adjust("Base.46Bullets", "WorldStaticModel", "New_46_Round")
Adjust("Base.57Bullets", "WorldStaticModel", "New_57_Round")

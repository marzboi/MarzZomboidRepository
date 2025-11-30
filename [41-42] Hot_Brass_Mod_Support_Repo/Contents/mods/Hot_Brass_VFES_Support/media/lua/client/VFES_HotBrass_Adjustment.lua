local function Adjust(Name, Property, Value)
    local Item = ScriptManager.instance:getItem(Name)
    if not Item then return end
    Item:DoParam(Property .. " = " .. Value)
end

--- VFES Ammo models
Adjust("Base.545Bullets", "WorldStaticModel", "New_545_Round")

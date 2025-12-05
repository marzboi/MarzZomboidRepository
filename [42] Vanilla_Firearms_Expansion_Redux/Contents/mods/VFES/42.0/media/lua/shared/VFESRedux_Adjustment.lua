local function Adjust(Name, Property, Value)
    local Item = ScriptManager.instance:getItem(Name)
    if not Item then return end
    Item:DoParam(Property .. " = " .. Value)
end

-- Hot Brass Bullets --
Adjust("Base.545Bullets", "WorldStaticModel", "New_545_Round")

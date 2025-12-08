local function Adjust(Name, Property, Value)
    local Item = ScriptManager.instance:getItem(Name)
    if not Item then return end
    Item:DoParam(Property .. " = " .. Value)
end

-- Hot Brass Bullets --
Adjust("Base.545Bullets", "icon", "545_Round")
Adjust("Base.545Bullets", "WorldStaticModel", "New_545_Round")

Adjust("Base.939Bullets", "icon", "939_Round")
Adjust("Base.939Bullets", "WorldStaticModel", "New_939_Round")

Adjust("Base.76254Bullets", "icon", "76254_Round")
Adjust("Base.76254Bullets", "WorldStaticModel", "New_76254_Round")

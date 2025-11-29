local function Adjust(Name, Property, Value)
    local Item = ScriptManager.instance:getItem(Name)
    if not Item then return end
    Item:DoParam(Property .. " = " .. Value)
end

Adjust("Base.762x51Bullets", "WorldStaticModel", "New_308_Round")
Adjust("Base.762x39Bullets", "WorldStaticModel", "New_762_Round")
Adjust("Base.Bullets22", "WorldStaticModel", "New_22_Round")
Adjust("Base.Bullets3006", "WorldStaticModel", "New_308_Round")
Adjust("Base.Bullets10mm", "WorldStaticModel", "New_45_Round")
Adjust("Base.Bullets4440", "WorldStaticModel", "New_44_Round")
Adjust("Base.Bullets357", "WorldStaticModel", "New_44_Round")

Adjust("Base.DoubleBarrelShotgun", "ManuallyRemoveSpentRounds", "true")
Adjust("Base.DoubleBarrelShotgunSawnoff", "ManuallyRemoveSpentRounds", "true")
Adjust("Base.DoubleBarrelShotgunSawnoffStock", "ManuallyRemoveSpentRounds", "true")

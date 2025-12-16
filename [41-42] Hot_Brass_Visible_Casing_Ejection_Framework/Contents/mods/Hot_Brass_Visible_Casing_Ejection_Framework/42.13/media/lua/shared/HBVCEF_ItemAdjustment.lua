local function Adjust(Name, Property, Value)
    local Item = ScriptManager.instance:getItem(Name)
    if not Item then return end
    Item:DoParam(Property .. " = " .. Value)
end

-- AMMO MODELS
Adjust("Base.Bullets9mm", "WorldStaticModel", "New_9mm_Round")
Adjust("Base.Bullets45", "WorldStaticModel", "New_45_Round")
Adjust("Base.Bullets44", "WorldStaticModel", "New_44_Round")
Adjust("Base.Bullets38", "WorldStaticModel", "New_38_Round")
Adjust("Base.308Bullets", "WorldStaticModel", "New_308_Round")
Adjust("Base.223Bullets", "WorldStaticModel", "New_223_Round")
Adjust("Base.556Bullets", "WorldStaticModel", "New_556_Round")
Adjust("Base.ShotgunShells", "WorldStaticModel", "New_Shotgun_Round")

-- AMMO ICONS
Adjust("Base.ShotgunShells", "icon", "Shotgun_Round")
Adjust("Base.Bullets9mm", "icon", "9mm_Round")
Adjust("Base.Bullets45", "icon", "45_Round")
Adjust("Base.Bullets44", "icon", "44_Round")
Adjust("Base.Bullets38", "icon", "38_Round")
Adjust("Base.308Bullets", "icon", "308_Round")
Adjust("Base.556Bullets", "icon", "556_Round")
Adjust("Base.223Bullets", "icon", "223_Round")

-- --Shotgun Modifiers
Adjust("Base.DoubleBarrelShotgun", "ManuallyRemoveSpentRounds", "true")
Adjust("Base.DoubleBarrelShotgunSawnoff", "ManuallyRemoveSpentRounds", "true")

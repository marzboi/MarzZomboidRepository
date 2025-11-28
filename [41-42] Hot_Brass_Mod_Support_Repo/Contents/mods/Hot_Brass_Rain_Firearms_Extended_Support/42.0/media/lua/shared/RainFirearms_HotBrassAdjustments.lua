local function doParam(Name, Property, Value)
    local item = ScriptManager.instance:getItem(Name)
    if not item then return end
    item:DoParam(Property .. " = " .. Value)
end

-- AMMO MODELS
doParam("Base.Bullets9mm", "WorldStaticModel", "New_9mm_Round")
doParam("Base.Bullets38", "WorldStaticModel", "New_38_Round")
doParam("Base.Bullets44", "WorldStaticModel", "New_44_Round")
doParam("Base.Bullets45", "WorldStaticModel", "New_45_Round")
doParam("Base.223Bullets", "WorldStaticModel", "New_223_Round")
doParam("Base.556Bullets", "WorldStaticModel", "New_556_Round")
doParam("Base.308Bullets", "WorldStaticModel", "New_308_Round")
doParam("Base.ShotgunShells", "WorldStaticModel", "New_Shotgun_Round")
doParam("Base.762x39Bullets", "WorldStaticModel", "New_762_Round")
doParam("Base.762Bullets", "WorldStaticModel", "New_308_Round")

-- Shotgun Modifiers
doParam("Base.DoubleBarrelShotgun", "ManuallyRemoveSpentRounds", "true")
doParam("Base.DoubleBarrelShotgunSawnoff", "ManuallyRemoveSpentRounds", "true")
doParam("Base.DoubleBarrelShotgunSawnoffStockless", "ManuallyRemoveSpentRounds", "true")

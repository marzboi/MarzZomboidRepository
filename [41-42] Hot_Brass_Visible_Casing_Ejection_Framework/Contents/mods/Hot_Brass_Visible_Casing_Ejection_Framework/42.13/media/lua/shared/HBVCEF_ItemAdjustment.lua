local function Adjust(Name, Property, Value)
    local Item = ScriptManager.instance:getItem(Name)
    if not Item then return end
    Item:DoParam(Property .. " = " .. Value)
end

Events.OnInitWorld.Add(function()
    -- --Shotgun Modifiers
    Adjust("Base.DoubleBarrelShotgun", "ManuallyRemoveSpentRounds", "true")
    Adjust("Base.DoubleBarrelShotgunSawnoff", "ManuallyRemoveSpentRounds", "true")

    -- Vanilla
    -- WorldStaticModel
    Adjust("Base.223Bullets", "WorldStaticModel", "New_223_Round")
    Adjust("Base.308Bullets", "WorldStaticModel", "New_308_Round")
    Adjust("Base.556Bullets", "WorldStaticModel", "New_556_Round")
    Adjust("Base.Bullets38", "WorldStaticModel", "New_38_Round")
    Adjust("Base.Bullets44", "WorldStaticModel", "New_44_Round")
    Adjust("Base.Bullets45", "WorldStaticModel", "New_45_Round")
    Adjust("Base.Bullets9mm", "WorldStaticModel", "New_9mm_Round")
    Adjust("Base.ShotgunShells", "WorldStaticModel", "New_Shotgun_Round")
    -- Ammo icons
    Adjust("Base.223Bullets", "icon", "223_Round")
    Adjust("Base.308Bullets", "icon", "308_Round")
    Adjust("Base.556Bullets", "icon", "556_Round")
    Adjust("Base.Bullets38", "icon", "38_Round")
    Adjust("Base.Bullets44", "icon", "44_Round")
    Adjust("Base.Bullets45", "icon", "45_Round")
    Adjust("Base.Bullets9mm", "icon", "9mm_Round")
    Adjust("Base.ShotgunShells", "icon", "Shotgun_Round")

    -- VFE and Addons
    -- WorldStaticModel
    Adjust("Base.22Bullets", "WorldStaticModel", "New_22_Round")
    Adjust("Base.308BulletsLinked", "WorldStaticModel", "New_Linked308_Round")
    Adjust("Base.46Bullets", "WorldStaticModel", "New_46_Round")
    Adjust("Base.545Bullets", "WorldStaticModel", "New_545_Round")
    Adjust("Base.57Bullets", "WorldStaticModel", "New_57_Round")
    Adjust("Base.76254Bullets", "WorldStaticModel", "New_76254_Round")
    Adjust("Base.762Bullets", "WorldStaticModel", "New_762_Round")
    Adjust("Base.939Bullets", "WorldStaticModel", "New_939_Round")
    -- Ammo icons
    Adjust("Base.22Bullets", "icon", "22_Round")
    Adjust("Base.308BulletsLinked", "icon", "Linked308_Round")
    Adjust("Base.46Bullets", "icon", "46_Round")
    Adjust("Base.545Bullets", "icon", "545_Round")
    Adjust("Base.57Bullets", "icon", "57_Round")
    Adjust("Base.76254Bullets", "icon", "76254_Round")
    Adjust("Base.762Bullets", "icon", "762_Round")
    Adjust("Base.939Bullets", "icon", "939_Round")

    -- Guns of 93
    -- WorldStaticModel
    Adjust("Base.3006Bullets", "WorldStaticModel", "New_3006_Round")
    Adjust("Base.792Bullets", "WorldStaticModel", "New_792_Round")
    -- Ammo icons
    Adjust("Base.3006Bullets", "icon", "3006_Round")
    Adjust("Base.792Bullets", "icon", "792_Round")
end)

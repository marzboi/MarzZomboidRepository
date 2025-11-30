local function Adjust(Name, Property, Value)
    local Item = ScriptManager.instance:getItem(Name)
    if not Item then return end
    Item:DoParam(Property .. " = " .. Value)
end

--- Vanilla Ammo Models
Adjust("Base.ShotgunShells", "WorldStaticModel", "New_Shotgun_Round")
Adjust("Base.Bullets9mm", "WorldStaticModel", "New_9mm_Round")
Adjust("Base.Bullets45", "WorldStaticModel", "New_45_Round")
Adjust("Base.Bullets44", "WorldStaticModel", "New_44_Round")
Adjust("Base.Bullets38", "WorldStaticModel", "New_38_Round")
Adjust("Base.308Bullets", "WorldStaticModel", "New_308_Round")
Adjust("Base.556Bullets", "WorldStaticModel", "New_556_Round")
Adjust("Base.223Bullets", "WorldStaticModel", "New_223_Round")

--- VFE New ammo Models
Adjust("Base.762Bullets", "WorldStaticModel", "New_762_Round")
Adjust("Base.22Bullets", "WorldStaticModel", "New_22_Round")
Adjust("Base.308BulletsLinked", "WorldStaticModel", "New_Linked308_Round")

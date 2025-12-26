require "HBVCEF_ModelWeaponEjectCasings"
require "HBVCEF_Compatibility_Mods"

local function Adjust(Name, Property, Value)
    local Item = ScriptManager.instance:getItem(Name)
    if not Item then return end
    Item:DoParam(Property .. " = " .. Value)
end

if not SpentCasingPhysics.G93 and not SpentCasingPhysics.GGS then
    Events.OnInitWorld.Add(function()
        -- --Shotgun Modifiers
        Adjust("Base.DoubleBarrelShotgun", "ManuallyRemoveSpentRounds", "true")
        Adjust("Base.DoubleBarrelShotgunSawnoff", "ManuallyRemoveSpentRounds", "true")

        -- Vanilla
        Adjust("Base.223Bullets", "WorldStaticModel", "New_223_Round")
        Adjust("Base.308Bullets", "WorldStaticModel", "New_308_Round")
        Adjust("Base.556Bullets", "WorldStaticModel", "New_556_Round")
        Adjust("Base.Bullets38", "WorldStaticModel", "New_38_Round")
        Adjust("Base.Bullets44", "WorldStaticModel", "New_44_Round")
        Adjust("Base.Bullets45", "WorldStaticModel", "New_45_Round")
        Adjust("Base.Bullets9mm", "WorldStaticModel", "New_9mm_Round")
        Adjust("Base.ShotgunShells", "WorldStaticModel", "New_Shotgun_Round")

        Adjust("Base.223Bullets", "icon", "223_Round")
        Adjust("Base.308Bullets", "icon", "308_Round")
        Adjust("Base.556Bullets", "icon", "556_Round")
        Adjust("Base.Bullets38", "icon", "38_Round")
        Adjust("Base.Bullets44", "icon", "44_Round")
        Adjust("Base.Bullets45", "icon", "45_Round")
        Adjust("Base.Bullets9mm", "icon", "9mm_Round")
        Adjust("Base.ShotgunShells", "icon", "Shotgun_Round")

        -- VFE and Addons
        if SpentCasingPhysics.VFE then
            Adjust("Base.22Bullets", "WorldStaticModel", "New_22_Round")
            Adjust("Base.308BulletsLinked", "WorldStaticModel", "New_Linked308_Round")
            Adjust("Base.762Bullets", "WorldStaticModel", "New_762_Round")

            Adjust("Base.22Bullets", "icon", "22_Round")
            Adjust("Base.308BulletsLinked", "icon", "Linked308_Round")
            Adjust("Base.762Bullets", "icon", "762_Round")
        end

        if SpentCasingPhysics.VFES then
            Adjust("Base.545Bullets", "WorldStaticModel", "New_545_Round")
            Adjust("Base.76254Bullets", "WorldStaticModel", "New_76254_Round")
            Adjust("Base.939Bullets", "WorldStaticModel", "New_939_Round")

            Adjust("Base.545Bullets", "icon", "545_Round")
            Adjust("Base.76254Bullets", "icon", "76254_Round")
            Adjust("Base.939Bullets", "icon", "939_Round")
        end

        if SpentCasingPhysics.VFE93 then
            Adjust("Base.46Bullets", "WorldStaticModel", "New_46_Round")
            Adjust("Base.57Bullets", "WorldStaticModel", "New_57_Round")

            Adjust("Base.46Bullets", "icon", "46_Round")
            Adjust("Base.57Bullets", "icon", "57_Round")
        end

        if SpentCasingPhysics.FIREARMS or SpentCasingPhysics.FIREARMS_BETA then
            Adjust("Base.Bullets10mm", "WorldStaticModel", "New_10mm_Round")
            Adjust("Base.Bullets22", "WorldStaticModel", "New_22_Round")
            Adjust("Base.762x51Bullets", "WorldStaticModel", "New_308_Round")
            Adjust("Base.762x39Bullets", "WorldStaticModel", "New_762_Round")
            Adjust("Base.Bullets3006", "WorldStaticModel", "New_3006_Round")
            Adjust("Base.Bullets4440", "WorldStaticModel", "New_44_Round")
            Adjust("Base.Bullets357", "WorldStaticModel", "New_357_Round")

            Adjust("Base.Bullets10mm", "icon", "10mm_Round")
            Adjust("Base.Bullets22", "icon", "22_Round")
            Adjust("Base.762x51Bullets", "icon", "308_Round")
            Adjust("Base.762x39Bullets", "icon", "762_Round")
            Adjust("Base.Bullets3006", "icon", "3006_Round")
            Adjust("Base.Bullets4440", "icon", "44_Round")
            Adjust("Base.Bullets357", "icon", "357_Round")
        end
    end)
end

require "HBVCEF_ModelWeaponEjectCasings"

SpentCasingPhysics.G93                  = getActivatedMods():contains('Guns93')
SpentCasingPhysics.VFE                  = getActivatedMods():contains('VFExpansion1')
SpentCasingPhysics.VFES                 = getActivatedMods():contains('VFExpansion2')
SpentCasingPhysics.VFE93                = getActivatedMods():contains('VFExpansion3')
SpentCasingPhysics.FIREARMS             = getActivatedMods():contains('firearmmod')
SpentCasingPhysics.FIREARMS_REVAMP      = getActivatedMods():contains('firearmmodRevamp')
SpentCasingPhysics.BRITAS               = getActivatedMods():contains('Arsenal(26)GunFighter[MAIN MOD 2.0]')

SpentCasingPhysics.BRITAS_CASING_MAPPER = {
    -- Pistol/Handgun Calibers
    ["Base.Bullets22"] = "Base.Brass22",
    ["Base.Bullets57"] = "Base.Brass57",
    ["Base.Bullets380"] = "Base.Brass380",
    ["Base.Bullets9mm"] = "Base.Brass9",
    ["Base.Bullets38"] = "Base.Brass38",
    ["Base.Bullets357"] = "Base.Brass357",
    ["Base.Bullets45"] = "Base.Brass45",
    ["Base.Bullets45LC"] = "Base.Brass45LC",
    ["Base.Bullets44"] = "Base.Brass44",
    ["Base.Bullets4570"] = "Base.Brass4570",
    ["Base.Bullets50MAG"] = "Base.Brass50MAG",

    -- Shotgun Shells
    ["Base.410gShotgunShells"] = "Base.Hull410g",
    ["Base.20gShotgunShells"] = "Base.Hull20g",
    ["Base.ShotgunShells"] = "Base.Hull12g",
    ["Base.10gShotgunShells"] = "Base.Hull10g",
    ["Base.4gShotgunShells"] = "Base.Hull4g",

    -- Rifle Calibers
    ["Base.223Bullets"] = "Base.Brass223",
    ["Base.556Bullets"] = "Base.Brass556",
    ["Base.545x39Bullets"] = "Base.Brass545x39",
    ["Base.762x39Bullets"] = "Base.Brass762x39",
    ["Base.308Bullets"] = "Base.Brass308",
    ["Base.762x51Bullets"] = "Base.Brass762x51",
    ["Base.762x54rBullets"] = "Base.Brass762x54r",
    ["Base.3006Bullets"] = "Base.Brass3006",
    ["Base.50BMGBullets"] = "Base.Brass50BMG",
}

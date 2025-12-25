require "HBVCEF_ModelWeaponEjectCasings"

SpentCasingPhysics.G93           = getActivatedMods():contains('\\guns93')
SpentCasingPhysics.GGS           = getActivatedMods():contains('\\GaelGunStore_B42')
SpentCasingPhysics.VFE           = getActivatedMods():contains('\\VFExpansionReduxb42')
SpentCasingPhysics.VFES          = getActivatedMods():contains('\\VFExpansion2Reduxb42')
SpentCasingPhysics.VFE93         = getActivatedMods():contains('\\VFExpansion3Reduxb42')
SpentCasingPhysics.FIREARMS      = getActivatedMods():contains('\\2256623447/firearmmod')
SpentCasingPhysics.FIREARMS_BETA = getActivatedMods():contains('\\2256623447/firearmmodbeta')


SpentCasingPhysics.GGS_CASING_BY_AMMO = {
    ["Base.Bullets9mm"] = "Base.pistol_casing",
    ["Base.9x39Bullets"] = "Base.rifle_casing",
    ["Base.Bullets22LR"] = "Base.pistol_casing",
    ["Base.Bullets32"] = "Base.revolver_casing",
    ["Base.Bullets38"] = "Base.revolver_casing",
    ["Base.Bullets44"] = "Base.revolver_casing",
    ["Base.Bullets45"] = "Base.pistol_casing",
    ["Base.Bullets50"] = "Base.rifle_casing",
    ["Base.Bullets50Magnum"] = "Base.revolver_casing",
    ["Base.308Bullets"] = "Base.rifle_casing",
    ["Base.Bullets357"] = "Base.revolver_casing",
    ["Base.545x39Bullets"] = "Base.rifle_casing",
    ["Base.556Bullets"] = "Base.rifle_casing",
    ["Base.762x39Bullets"] = "Base.rifle_casing",
    ["Base.762x54rBullets"] = "Base.rifle_casing",
    ["Base.792x57Bullets"] = "Base.rifle_casing",
    ["Base.ShotgunShells"] = "Base.shells_casing",
}

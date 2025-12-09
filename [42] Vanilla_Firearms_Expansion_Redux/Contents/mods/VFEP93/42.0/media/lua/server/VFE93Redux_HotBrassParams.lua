local vfe93Params = {

    ["Base.scar17"] = {
        casing         = "Base.308Bullets_Casing",
        ammo           = "Base.308Bullets",
        forwardOffset  = 0.35,
        sideOffset     = 0.10,
        heightOffset   = 0.45,
        shellForce     = 1.20,
        sideSpread     = 60,
        heightSpreed   = 30,
        manualEjection = false
    },

    ["Base.M4A1"] = {
        casing         = "Base.556Bullets_Casing",
        ammo           = "Base.556Bullets",
        forwardOffset  = 0.30,
        sideOffset     = 0.10,
        heightOffset   = 0.45,
        shellForce     = 1.20,
        sideSpread     = 60,
        heightSpreed   = 30,
        manualEjection = false
    },

    ["Base.Block2"] = {
        casing         = "Base.556Bullets_Casing",
        ammo           = "Base.556Bullets",
        forwardOffset  = 0.30,
        sideOffset     = 0.10,
        heightOffset   = 0.45,
        shellForce     = 1.20,
        sideSpread     = 60,
        heightSpreed   = 30,
        manualEjection = false
    },

    ["Base.SPR"] = {
        casing         = "Base.556Bullets_Casing",
        ammo           = "Base.556Bullets",
        forwardOffset  = 0.30,
        sideOffset     = 0.10,
        heightOffset   = 0.45,
        shellForce     = 1.20,
        sideSpread     = 60,
        heightSpreed   = 30,
        manualEjection = false
    },

    ["Base.SPRSD"] = {
        casing         = "Base.556Bullets_Casing",
        ammo           = "Base.556Bullets",
        forwardOffset  = 0.30,
        sideOffset     = 0.10,
        heightOffset   = 0.45,
        shellForce     = 1.20,
        sideSpread     = 60,
        heightSpreed   = 30,
        manualEjection = false
    },

    ["Base.Vector45"] = {
        casing         = "Base.Bullets45_Casing",
        ammo           = "Base.Bullets45",
        forwardOffset  = 0.50,
        sideOffset     = 0.0,
        heightOffset   = 0.50,
        shellForce     = 0.60,
        sideSpread     = 60,
        heightSpreed   = 60,
        manualEjection = false
    },

    ["Base.Vector9"] = {
        casing         = "Base.Bullets9mm_Casing",
        ammo           = "Base.Bullets9mm",
        forwardOffset  = 0.50,
        sideOffset     = 0.0,
        heightOffset   = 0.50,
        shellForce     = 0.60,
        sideSpread     = 60,
        heightSpreed   = 60,
        manualEjection = false
    },

    ["Base.P90"] = {
        casing         = "Base.57Bullets_Casing",
        ammo           = "Base.57Bullets",
        forwardOffset  = 0.15,
        sideOffset     = 0.10,
        heightOffset   = 0.40,
        shellForce     = 0.0,
        sideSpread     = 10,
        heightSpreed   = 10,
        manualEjection = false
    },

    ["Base.MP7"] = {
        casing         = "Base.46Bullets_Casing",
        ammo           = "Base.46Bullets",
        forwardOffset  = 0.40,
        sideOffset     = 0.0,
        heightOffset   = 0.45,
        shellForce     = 0.60,
        sideSpread     = 30,
        heightSpreed   = 30,
        manualEjection = false
    },

    ["Base.FN57"] = {
        casing         = "Base.57Bullets_Casing",
        ammo           = "Base.57Bullets",
        forwardOffset  = 0.45,
        sideOffset     = 0.0,
        heightOffset   = 0.50,
        shellForce     = 0.75,
        sideSpread     = 30,
        heightSpreed   = 90,
        manualEjection = false
    },

    ["Base.CP33"] = {
        casing         = "Base.22Bullets_Casing",
        ammo           = "Base.22Bullets",
        forwardOffset  = 0.35,
        sideOffset     = 0.0,
        heightOffset   = 0.50,
        shellForce     = 0.70,
        sideSpread     = 30,
        heightSpreed   = 60,
        manualEjection = false
    },

    ["Base.1522"] = {
        casing         = "Base.22Bullets_Casing",
        ammo           = "Base.22Bullets",
        forwardOffset  = 0.25,
        sideOffset     = 0.10,
        heightOffset   = 0.45,
        shellForce     = 0.75,
        sideSpread     = 30,
        heightSpreed   = 60,
        manualEjection = false
    },

    ["Base.n418sd"] = {
        casing         = "Base.556Bullets_Casing",
        ammo           = "Base.556Bullets",
        forwardOffset  = 0.30,
        sideOffset     = 0.10,
        heightOffset   = 0.45,
        shellForce     = 1.20,
        sideSpread     = 60,
        heightSpreed   = 30,
        manualEjection = false
    },

    ["Base.n418"] = {
        casing         = "Base.556Bullets_Casing",
        ammo           = "Base.556Bullets",
        forwardOffset  = 0.30,
        sideOffset     = 0.10,
        heightOffset   = 0.45,
        shellForce     = 1.20,
        sideSpread     = 60,
        heightSpreed   = 30,
        manualEjection = false
    },

    ["Base.AA12"] = {
        casing         = "Base.ShotgunShells_Casing",
        ammo           = "Base.ShotgunShells",
        forwardOffset  = 0.30,
        sideOffset     = 0.10,
        heightOffset   = 0.45,
        shellForce     = 0.60,
        sideSpread     = 60,
        heightSpreed   = 30,
        manualEjection = false
    },
}

if SpentCasingPhysics then
    for weapon, data in pairs(vfe93Params) do
        SpentCasingPhysics.registerWeapon(
            weapon,
            data.casing,
            data.ammo,
            data.forwardOffset,
            data.sideOffset,
            data.heightOffset,
            data.shellForce,
            data.manualEjection,
            data.sideSpread,
            data.heightSpread,
            data.ejectAngle,
            data.verticalForce
        )
    end
end

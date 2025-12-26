if SpentCasingPhysics.FIREARMS then
    local firearmsParams = {

        -- Pistols

        ["Base.Pistol"] = {
            casing = "Base.Bullets9mm_Casing",
            ammo = "Base.Bullets9mm",
            forwardOffset = 0.50,
            sideOffset = 0.0,
            heightOffset = 0.45,
            shellForce = 0.45,
            manualEjection = false,
            sideSpread = 25,
            heightSpread = 25
        },

        ["Base.Pistol2"] = {
            casing = "Base.Bullets45_Casing",
            ammo = "Base.Bullets45",
            forwardOffset = 0.50,
            sideOffset = 0.0,
            heightOffset = 0.45,
            shellForce = 0.65,
            manualEjection = false,
            sideSpread = 30,
            heightSpread = 30
        },

        ["Base.Pistol3"] = {
            casing = "Base.Bullets44_Casing",
            ammo = "Base.Bullets44",
            forwardOffset = 0.50,
            sideOffset = 0.0,
            heightOffset = 0.45,
            shellForce = 0.85,
            manualEjection = false,
            sideSpread = 55,
            heightSpread = 55
        },

        ["Base.Glock17"] = {
            casing = "Base.Bullets9mm_Casing",
            ammo = "Base.Bullets9mm",
            forwardOffset = 0.50,
            sideOffset = 0.0,
            heightOffset = 0.45,
            shellForce = 0.45,
            manualEjection = false,
            sideSpread = 25,
            heightSpread = 25
        },

        ["Base.ColtDelta"] = {
            casing = "Base.Bullets45_Casing",
            ammo = "Base.Bullets45",
            forwardOffset = 0.50,
            sideOffset = 0.0,
            heightOffset = 0.45,
            shellForce = 0.75,
            manualEjection = false,
            sideSpread = 50,
            heightSpread = 55
        },

        ["Base.ColtAce"] = {
            casing = "Base.22Bullets_Casing",
            ammo = "Base.22Bullets",
            forwardOffset = 0.50,
            sideOffset = 0.0,
            heightOffset = 0.45,
            shellForce = 0.45,
            manualEjection = false,
            sideSpread = 25,
            heightSpread = 25
        },

        -- Lever Rifles

        ["Base.Winchester94"] = {
            casing = "Base.Bullets357_Casing",
            ammo = "Base.Bullets357",
            forwardOffset = 0.27,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.25,
            manualEjection = true
        },

        ["Base.Winchester94_Sawn"] = {
            casing = "Base.Bullets357_Casing",
            ammo = "Base.Bullets357",
            forwardOffset = 0.27,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.25,
            manualEjection = true
        },

        ["Base.Marlin1894"] = {
            casing = "Base.Bullets44_Casing",
            ammo = "Base.Bullets44",
            forwardOffset = 0.27,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.15,
            manualEjection = true
        },

        ["Base.Marlin1894_Sawn"] = {
            casing = "Base.Bullets44_Casing",
            ammo = "Base.Bullets44",
            forwardOffset = 0.27,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.15,
            manualEjection = true
        },

        -- Revolvers

        ["Base.Revolver"] = {
            casing = "Base.Bullets45_Casing",
            ammo = "Base.Bullets45",
            forwardOffset = 0.40,
            sideOffset = 0.0,
            heightOffset = 0.30,
            shellForce = 0.10,
            manualEjection = true,
            sideSpread = 40,
            heightSpread = 60
        },

        ["Base.Revolver_Short"] = {
            casing = "Base.Bullets38_Casing",
            ammo = "Base.Bullets38",
            forwardOffset = 0.40,
            sideOffset = 0.0,
            heightOffset = 0.30,
            shellForce = 0.10,
            manualEjection = true,
            sideSpread = 40,
            heightSpread = 60
        },

        ["Base.Revolver_Long"] = {
            casing = "Base.Bullets44_Casing",
            ammo = "Base.Bullets44",
            forwardOffset = 0.40,
            sideOffset = 0.0,
            heightOffset = 0.30,
            shellForce = 0.0,
            manualEjection = true,
            sideSpread = 40,
            heightSpread = 60
        },

        ["Base.ColtPython"] = {
            casing = "Base.Bullets357_Casing",
            ammo = "Base.Bullets357",
            forwardOffset = 0.40,
            sideOffset = 0.0,
            heightOffset = 0.30,
            shellForce = 0.0,
            manualEjection = true,
            sideSpread = 40,
            heightSpread = 60
        },

        ["Base.ColtPythonHunter"] = {
            casing = "Base.Bullets357_Casing",
            ammo = "Base.Bullets357",
            forwardOffset = 0.40,
            sideOffset = 0.0,
            heightOffset = 0.30,
            shellForce = 0.0,
            manualEjection = true,
            sideSpread = 40,
            heightSpread = 60
        },

        ["Base.ColtAnaconda"] = {
            casing = "Base.Bullets44_Casing",
            ammo = "Base.Bullets44",
            forwardOffset = 0.40,
            sideOffset = 0.0,
            heightOffset = 0.30,
            shellForce = 0.0,
            manualEjection = true,
            sideSpread = 40,
            heightSpread = 60
        },

        ["Base.ColtPeacemaker"] = {
            casing = "Base.Bullets4440_Casing",
            ammo = "Base.Bullets4440",
            forwardOffset = 0.40,
            sideOffset = 0.0,
            heightOffset = 0.30,
            shellForce = 0.0,
            manualEjection = true,
            sideSpread = 40,
            heightSpread = 60
        },

        ["Base.ColtSingleAction22"] = {
            casing = "Base.Bullets22_Casing",
            ammo = "Base.Bullets22",
            forwardOffset = 0.40,
            sideOffset = 0.0,
            heightOffset = 0.30,
            shellForce = 0.0,
            manualEjection = true,
            sideSpread = 40,
            heightSpread = 60
        },

        -- Shotguns

        ["Base.DoubleBarrelShotgun"] = {
            casing = "Base.ShotgunShells_Casing",
            ammo = "Base.ShotgunShells",
            forwardOffset = 0.27,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.15,
            manualEjection = true,
            sideSpread = 40,
            heightSpread = 40
        },

        ["Base.DoubleBarrelShotgunSawnoff"] = {
            casing = "Base.ShotgunShells_Casing",
            ammo = "Base.ShotgunShells",
            forwardOffset = 0.27,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.15,
            manualEjection = true,
            sideSpread = 40,
            heightSpread = 40
        },

        ["Base.DoubleBarrelShotgunSawnoffNoStock"] = {
            casing = "Base.ShotgunShells_Casing",
            ammo = "Base.ShotgunShells",
            forwardOffset = 0.27,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.15,
            manualEjection = true,
            sideSpread = 40,
            heightSpread = 40
        },

        ["Base.Shotgun"] = {
            casing = "Base.ShotgunShells_Casing",
            ammo = "Base.ShotgunShells",
            forwardOffset = 0.27,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.15,
            manualEjection = true,
            sideSpread = 45,
            heightSpread = 40
        },

        ["Base.ShotgunSawnoff"] = {
            casing = "Base.ShotgunShells_Casing",
            ammo = "Base.ShotgunShells",
            forwardOffset = 0.27,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.15,
            manualEjection = true,
            sideSpread = 45,
            heightSpread = 40
        },

        ["Base.Mossberg500"] = {
            casing = "Base.ShotgunShells_Casing",
            ammo = "Base.ShotgunShells",
            forwardOffset = 0.27,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.25,
            manualEjection = true,
            sideSpread = 60,
            heightSpread = 50
        },

        ["Base.Mossberg500Tactical"] = {
            casing = "Base.ShotgunShells_Casing",
            ammo = "Base.ShotgunShells",
            forwardOffset = 0.27,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.25,
            manualEjection = true,
            sideSpread = 65,
            heightSpread = 50
        },

        ["Base.Remington870"] = {
            casing = "Base.ShotgunShells_Casing",
            ammo = "Base.ShotgunShells",
            forwardOffset = 0.27,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.25,
            manualEjection = true,
            sideSpread = 65,
            heightSpread = 50
        },

        ["Base.Remington870Wood"] = {
            casing = "Base.ShotgunShells_Casing",
            ammo = "Base.ShotgunShells",
            forwardOffset = 0.27,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.25,
            manualEjection = true,
            sideSpread = 65,
            heightSpread = 50
        },

        ["Base.Remington870Sawnoff"] = {
            casing = "Base.ShotgunShells_Casing",
            ammo = "Base.ShotgunShells",
            forwardOffset = 0.27,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.25,
            manualEjection = true,
            sideSpread = 65,
            heightSpread = 50
        },

        ["Base.M37"] = {
            casing = "Base.ShotgunShells_Casing",
            ammo = "Base.ShotgunShells",
            forwardOffset = 0.27,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.25,
            manualEjection = true,
            sideSpread = 65,
            heightSpread = 50
        },

        ["Base.M37Sawnoff"] = {
            casing = "Base.ShotgunShells_Casing",
            ammo = "Base.ShotgunShells",
            forwardOffset = 0.27,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.25,
            manualEjection = true,
            sideSpread = 65,
            heightSpread = 50
        },

        ["Base.SPAS12"] = {
            casing = "Base.ShotgunShells_Casing",
            ammo = "Base.ShotgunShells",
            forwardOffset = 0.27,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.25,
            manualEjection = true,
            sideSpread = 65,
            heightSpread = 50
        },

        ["Base.LAW12"] = {
            casing = "Base.ShotgunShells_Casing",
            ammo = "Base.ShotgunShells",
            forwardOffset = 0.27,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.25,
            manualEjection = true,
            sideSpread = 65,
            heightSpread = 50
        },

        -- Rifles

        ["Base.AssaultRifle"] = {
            casing = "Base.556Bullets_Casing",
            ammo = "Base.556Bullets",
            forwardOffset = 0.30,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.71,
            manualEjection = false,
            sideSpread = 45,
            heightSpread = 60
        },

        ["Base.M60"] = {
            casing = "Base.762x51Bullets_Casing",
            ammo = "Base.762x51Bullets",
            forwardOffset = 0.30,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.30,
            manualEjection = false,
            sideSpread = 45,
            heightSpread = 60
        },

        ["Base.AKM"] = {
            casing = "Base.762x39Bullets_Casing",
            ammo = "Base.762x39Bullets",
            forwardOffset = 0.30,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.85,
            manualEjection = false,
            sideSpread = 45,
            heightSpread = 60
        },

        ["Base.FN_FAL"] = {
            casing = "Base.762x51Bullets_Casing",
            ammo = "Base.762x51Bullets",
            forwardOffset = 0.30,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.30,
            manualEjection = false,
            sideSpread = 45,
            heightSpread = 60
        },

        ["Base.G3"] = {
            casing = "Base.762x51Bullets_Casing",
            ammo = "Base.762x51Bullets",
            forwardOffset = 0.30,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.30,
            manualEjection = false,
            sideSpread = 45,
            heightSpread = 60
        },

        ["Base.M4"] = {
            casing = "Base.556Bullets_Casing",
            ammo = "Base.556Bullets",
            forwardOffset = 0.30,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.65,
            manualEjection = false,
            sideSpread = 45,
            heightSpread = 60
        },

        -- SMGs

        ["Base.MP5"] = {
            casing = "Base.Bullets9mm_Casing",
            ammo = "Base.Bullets9mm",
            forwardOffset = 0.40,
            sideOffset = 0.0,
            heightOffset = 0.45,
            shellForce = 0.45,
            manualEjection = false,
            sideSpread = 25,
            heightSpread = 25
        },

        ["Base.MP5SD"] = {
            casing = "Base.Bullets9mm_Casing",
            ammo = "Base.Bullets9mm",
            forwardOffset = 0.40,
            sideOffset = 0.0,
            heightOffset = 0.45,
            shellForce = 0.45,
            manualEjection = false,
            sideSpread = 25,
            heightSpread = 25
        },

        ["Base.MP510"] = {
            casing = "Base.Bullets10mm_Casing",
            ammo = "Base.Bullets10mm",
            forwardOffset = 0.40,
            sideOffset = 0.0,
            heightOffset = 0.45,
            shellForce = 0.45,
            manualEjection = false,
            sideSpread = 25,
            heightSpread = 25
        },

        ["Base.UZI"] = {
            casing = "Base.Bullets10mm_Casing",
            ammo = "Base.Bullets10mm",
            forwardOffset = 0.40,
            sideOffset = 0.0,
            heightOffset = 0.45,
            shellForce = 0.45,
            manualEjection = false,
            sideSpread = 25,
            heightSpread = 25
        },

        ["Base.Mac10"] = {
            casing = "Base.Bullets45_Casing",
            ammo = "Base.Bullets45",
            forwardOffset = 0.40,
            sideOffset = 0.0,
            heightOffset = 0.45,
            shellForce = 0.45,
            manualEjection = false,
            sideSpread = 25,
            heightSpread = 25
        },

        -- Bolt Action

        ["Base.VarmintRifle"] = {
            casing = "Base.223Bullets_Casing",
            ammo = "Base.223Bullets",
            forwardOffset = 0.30,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.30,
            manualEjection = true,
            sideSpread = 45,
            heightSpread = 75
        },

        ["Base.HuntingRifle"] = {
            casing = "Base.308Bullets_Casing",
            ammo = "Base.308Bullets",
            forwardOffset = 0.30,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.30,
            manualEjection = true,
            sideSpread = 45,
            heightSpread = 75
        },

        ["Base.HuntingRifle_Sawn"] = {
            casing = "Base.308Bullets_Casing",
            ammo = "Base.308Bullets",
            forwardOffset = 0.30,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.30,
            manualEjection = true,
            sideSpread = 45,
            heightSpread = 75
        },

        ["Base.Rugerm7722"] = {
            casing = "Base.Bullets22_Casing",
            ammo = "Base.Bullets22",
            forwardOffset = 0.30,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.30,
            manualEjection = true,
            sideSpread = 45,
            heightSpread = 75
        },

        ["Base.SKS"] = {
            casing = "Base.762x39Bullets_Casing",
            ammo = "Base.762x39Bullets",
            forwardOffset = 0.30,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.85,
            manualEjection = false,
            sideSpread = 45,
            heightSpread = 60
        },

        ["Base.M24Rifle"] = {
            casing = "Base.762x51Bullets_Casing",
            ammo = "Base.762x51Bullets",
            forwardOffset = 0.30,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.30,
            manualEjection = true,
            sideSpread = 45,
            heightSpread = 75
        },

        ["Base.AssaultRifle2"] = {
            casing = "Base.762x51Bullets_Casing",
            ammo = "Base.762x51Bullets",
            forwardOffset = 0.30,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.30,
            manualEjection = false,
            sideSpread = 45,
            heightSpread = 60
        },

        ["Base.M1Garand"] = {
            casing = "Base.Bullets3006_Casing",
            ammo = "Base.Bullets3006",
            forwardOffset = 0.30,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.30,
            manualEjection = false,
            sideSpread = 45,
            heightSpread = 60
        },

        --old ones

        ["Base.M16A2"] = {
            casing = "Base.556Bullets_Casing",
            ammo = "Base.556Bullets",
            forwardOffset = 0.30,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.71,
            manualEjection = false,
            sideSpread = 45,
            heightSpread = 60
        },

        ["Base.M733"] = {
            casing = "Base.556Bullets_Casing",
            ammo = "Base.556Bullets",
            forwardOffset = 0.30,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.65,
            manualEjection = false,
            sideSpread = 45,
            heightSpread = 60
        },

        ["Base.AR15"] = {
            casing = "Base.556Bullets_Casing",
            ammo = "Base.556Bullets",
            forwardOffset = 0.30,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.71,
            manualEjection = false,
            sideSpread = 45,
            heightSpread = 60
        },

        ["Base.AK47"] = {
            casing = "Base.762x39Bullets_Casing",
            ammo = "Base.762x39Bullets",
            forwardOffset = 0.30,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.85,
            manualEjection = false,
            sideSpread = 45,
            heightSpread = 60
        },

        ["Base.Winchester73"] = {
            casing = "Base.Bullets4440_Casing",
            ammo = "Base.Bullets4440",
            forwardOffset = 0.27,
            sideOffset = 0.10,
            heightOffset = 0.45,
            shellForce = 0.15,
            manualEjection = true,
            sideSpread = 45,
            heightSpread = 40
        },
    }

    for weapon, data in pairs(firearmsParams) do
        SpentCasingPhysics.registerWeapon(
            weapon,
            data.forwardOffset,
            data.sideOffset,
            data.heightOffset,
            data.shellForce,
            data.sideSpread,
            data.heightSpread,
            data.ejectAngle,
            data.verticalForce
        )
    end
end

if SpentCasingPhysics.FIREARMS_REVAMP then
    local firearmsRevampedParams = {
        ---AssaultRifle

        ["Base.AssaultRifle"] = {
            casing         = "Base.556Bullets_Casing",
            ammo           = "Base.556Bullets",
            forwardOffset  = 0.30,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.65,
            sideSpread     = 60,
            heightSpread   = 30,
            manualEjection = false
        },

        ["Base.FN_FAL"] = {
            casing         = "Base.762x51Bullets_Casing",
            ammo           = "Base.762x51Bullets",
            forwardOffset  = 0.40,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 1.20,
            sideSpread     = 60,
            heightSpread   = 90,
            manualEjection = false
        },

        ["Base.M16A2"] = {
            casing         = "Base.556Bullets_Casing",
            ammo           = "Base.556Bullets",
            forwardOffset  = 0.30,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.65,
            sideSpread     = 60,
            heightSpread   = 30,
            manualEjection = false
        },

        ["Base.M733"] = {
            casing         = "Base.556Bullets_Casing",
            ammo           = "Base.556Bullets",
            forwardOffset  = 0.30,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.65,
            manualEjection = false,
            sideSpread     = 45,
            heightSpread   = 60
        },

        ["Base.Mini14"] = {
            casing         = "Base.556Bullets_Casing",
            ammo           = "Base.556Bullets",
            forwardOffset  = 0.35,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.55,
            sideSpread     = 40,
            heightSpread   = 70,
            manualEjection = false
        },

        ["Base.AC556"] = {
            casing         = "Base.556Bullets_Casing",
            ammo           = "Base.556Bullets",
            forwardOffset  = 0.30,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.65,
            manualEjection = false,
            sideSpread     = 45,
            heightSpread   = 60
        },

        ["Base.M60M"] = {
            casing         = "Base.762x51Bullets_Casing",
            ammo           = "Base.762x51Bullets",
            forwardOffset  = 0.30,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.76,
            sideSpread     = 40,
            heightSpread   = 50,
            manualEjection = false
        },

        ["Base.BrowningAR"] = {
            casing         = "Base.Bullets3006_Casing",
            ammo           = "Base.Bullets3006",
            forwardOffset  = 0.30,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.76,
            sideSpread     = 40,
            heightSpread   = 50,
            manualEjection = false
        },

        ["Base.AK47"] = {
            casing         = "Base.762x39Bullets_Casing",
            ammo           = "Base.762x39Bullets",
            forwardOffset  = 0.35,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.80,
            sideSpread     = 90,
            heightSpread   = 95,
            manualEjection = false
        },

        ---Handguns

        ["Base.Pistol"] = {
            casing         = "Base.Bullets9mm_Casing",
            ammo           = "Base.Bullets9mm",
            forwardOffset  = 0.50,
            sideOffset     = 0.0,
            heightOffset   = 0.45,
            shellForce     = 0.30,
            sideSpread     = 45,
            heightSpread   = 60,
            manualEjection = false
        },

        ["Base.Pistol2"] = {
            casing         = "Base.Bullets45_Casing",
            ammo           = "Base.Bullets45",
            forwardOffset  = 0.50,
            sideOffset     = 0.0,
            heightOffset   = 0.45,
            shellForce     = 0.60,
            sideSpread     = 45,
            heightSpread   = 90,
            manualEjection = false
        },

        ["Base.Pistol_M45A1"] = {
            casing         = "Base.Bullets45_Casing",
            ammo           = "Base.Bullets45",
            forwardOffset  = 0.50,
            sideOffset     = 0.0,
            heightOffset   = 0.45,
            shellForce     = 0.30,
            sideSpread     = 45,
            heightSpread   = 90,
            manualEjection = false
        },

        ["Base.Pistol3"] = {
            casing         = "Base.Bullets44_Casing",
            ammo           = "Base.Bullets44",
            forwardOffset  = 0.50,
            sideOffset     = 0.0,
            heightOffset   = 0.45,
            shellForce     = 0.30,
            sideSpread     = 30,
            heightSpread   = 60,
            manualEjection = false
        },

        ["Base.Glock17"] = {
            casing         = "Base.Bullets9mm_Casing",
            ammo           = "Base.Bullets9mm",
            forwardOffset  = 0.50,
            sideOffset     = 0.0,
            heightOffset   = 0.45,
            shellForce     = 0.45,
            sideSpread     = 45,
            heightSpread   = 90,
            manualEjection = false
        },

        ["Base.ColtAce"] = {
            casing         = "Base.Bullets22_Casing",
            ammo           = "Base.Bullets22",
            forwardOffset  = 0.50,
            sideOffset     = 0.0,
            heightOffset   = 0.45,
            shellForce     = 0.45,
            manualEjection = false,
            sideSpread     = 25,
            heightSpread   = 25
        },

        ["Base.Pistol_Compact"] = {
            casing         = "Base.Bullets9mm_Casing",
            ammo           = "Base.Bullets9mm",
            forwardOffset  = 0.50,
            sideOffset     = 0.0,
            heightOffset   = 0.45,
            shellForce     = 0.45,
            sideSpread     = 45,
            heightSpread   = 90,
            manualEjection = false
        },

        ---Lever Rifles

        ["Base.Winchester94"] = {
            casing         = "Base.Bullets44_Casing",
            ammo           = "Base.Bullets44",
            forwardOffset  = 0.27,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.25,
            manualEjection = true,
            sideSpread     = 45,
            heightSpread   = 34,
        },

        ["Base.Winchester73"] = {
            casing         = "Base.Bullets357_Casing",
            ammo           = "Base.Bullets357",
            forwardOffset  = 0.27,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.25,
            manualEjection = true,
            sideSpread     = 45,
            heightSpread   = 34,
        },

        ["Base.Rossi92"] = {
            casing         = "Base.Bullets38_Casing",
            ammo           = "Base.Bullets38",
            forwardOffset  = 0.27,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.25,
            manualEjection = true,
            sideSpread     = 45,
            heightSpread   = 34,
        },

        ["Base.Winchester94Sawn"] = {
            casing         = "Base.Bullets44_Casing",
            ammo           = "Base.Bullets44",
            forwardOffset  = 0.27,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.25,
            manualEjection = true,
            sideSpread     = 45,
            heightSpread   = 34,
        },

        ["Base.Winchester73Sawn"] = {
            casing         = "Base.Bullets357_Casing",
            ammo           = "Base.Bullets357",
            forwardOffset  = 0.27,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.25,
            manualEjection = true,
            sideSpread     = 45,
            heightSpread   = 34,
        },

        ["Base.Rossi92Sawn"] = {
            casing         = "Base.Bullets38_Casing",
            ammo           = "Base.Bullets38",
            forwardOffset  = 0.27,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.25,
            manualEjection = true,
            sideSpread     = 45,
            heightSpread   = 34,
        },

        ["Base.M1887"] = {
            casing         = "Base.ShotgunShells_Casing",
            ammo           = "Base.ShotgunShells",
            forwardOffset  = 0.27,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.25,
            manualEjection = true,
            sideSpread     = 45,
            heightSpread   = 34,
        },

        ["Base.M1887Short"] = {
            casing         = "Base.ShotgunShells_Casing",
            ammo           = "Base.ShotgunShells",
            forwardOffset  = 0.27,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.25,
            manualEjection = true,
            sideSpread     = 45,
            heightSpread   = 34,
        },

        ["Base.M1887Sawn"] = {
            casing         = "Base.ShotgunShells_Casing",
            ammo           = "Base.ShotgunShells",
            forwardOffset  = 0.27,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.25,
            manualEjection = true,
            sideSpread     = 45,
            heightSpread   = 34,
        },

        --- Revolvers

        ["Base.Revolver"] = {
            casing         = "Base.Bullets45_Casing",
            ammo           = "Base.Bullets45",
            forwardOffset  = 0.40,
            sideOffset     = 0.0,
            heightOffset   = 0.30,
            shellForce     = 0.10,
            manualEjection = true,
            sideSpread     = 40,
            heightSpread   = 60
        },

        ["Base.Revolver_Long"] = {
            casing         = "Base.Bullets357_Casing",
            ammo           = "Base.Bullets357",
            forwardOffset  = 0.40,
            sideOffset     = 0.0,
            heightOffset   = 0.30,
            shellForce     = 0.0,
            manualEjection = true,
            sideSpread     = 40,
            heightSpread   = 60
        },

        ["Base.Revolver_Short"] = {
            casing         = "Base.Bullets38_Casing",
            ammo           = "Base.Bullets38",
            forwardOffset  = 0.40,
            sideOffset     = 0.0,
            heightOffset   = 0.30,
            shellForce     = 0.10,
            manualEjection = true,
            sideSpread     = 40,
            heightSpread   = 60
        },

        ["Base.Revolver_M29"] = {
            casing         = "Base.Bullets44_Casing",
            ammo           = "Base.Bullets44",
            forwardOffset  = 0.40,
            sideOffset     = 0.0,
            heightOffset   = 0.30,
            shellForce     = 0.10,
            manualEjection = true,
            sideSpread     = 40,
            heightSpread   = 60
        },

        ["Base.ColtPython"] = {
            casing         = "Base.Bullets357_Casing",
            ammo           = "Base.Bullets357",
            forwardOffset  = 0.40,
            sideOffset     = 0.0,
            heightOffset   = 0.30,
            shellForce     = 0.0,
            manualEjection = true,
            sideSpread     = 40,
            heightSpread   = 60
        },

        ["Base.ColtPythonStubby"] = {
            casing         = "Base.Bullets357_Casing",
            ammo           = "Base.Bullets357",
            forwardOffset  = 0.40,
            sideOffset     = 0.0,
            heightOffset   = 0.30,
            shellForce     = 0.0,
            manualEjection = true,
            sideSpread     = 40,
            heightSpread   = 60
        },

        ["Base.ColtPythonHunter"] = {
            casing         = "Base.Bullets357_Casing",
            ammo           = "Base.Bullets357",
            forwardOffset  = 0.40,
            sideOffset     = 0.0,
            heightOffset   = 0.30,
            shellForce     = 0.0,
            manualEjection = true,
            sideSpread     = 40,
            heightSpread   = 60
        },

        ["Base.ColtAnaconda"] = {
            casing         = "Base.Bullets44_Casing",
            ammo           = "Base.Bullets44",
            forwardOffset  = 0.40,
            sideOffset     = 0.0,
            heightOffset   = 0.30,
            shellForce     = 0.0,
            manualEjection = true,
            sideSpread     = 40,
            heightSpread   = 60
        },

        ["Base.ColtPeacemaker"] = {
            casing         = "Base.Bullets357_Casing",
            ammo           = "Base.Bullets357",
            forwardOffset  = 0.40,
            sideOffset     = 0.0,
            heightOffset   = 0.30,
            shellForce     = 0.0,
            manualEjection = true,
            sideSpread     = 40,
            heightSpread   = 60
        },

        ["Base.ColtSingleAction22"] = {
            casing         = "Base.Bullets22_Casing",
            ammo           = "Base.Bullets22",
            forwardOffset  = 0.40,
            sideOffset     = 0.0,
            heightOffset   = 0.30,
            shellForce     = 0.0,
            manualEjection = true,
            sideSpread     = 40,
            heightSpread   = 60
        },

        ---Bolt Actions Rifles

        ["Base.VarmintRifle_Sawn"] = {
            casing         = "Base.223Bullets_Casing",
            ammo           = "Base.223Bullets",
            forwardOffset  = 0.30,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.30,
            manualEjection = true,
            sideSpread     = 45,
            heightSpread   = 75
        },

        ["Base.HuntingRifle_Sawn"] = {
            casing         = "Base.308Bullets_Casing",
            ammo           = "Base.308Bullets",
            forwardOffset  = 0.30,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.30,
            manualEjection = true,
            sideSpread     = 45,
            heightSpread   = 75
        },

        ["Base.Rugerm7722_Sawn"] = {
            casing         = "Base.Bullets22_Casing",
            ammo           = "Base.Bullets22",
            forwardOffset  = 0.30,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.30,
            manualEjection = true,
            sideSpread     = 45,
            heightSpread   = 75
        },

        ["Base.VarmintRifle"] = {
            casing         = "Base.223Bullets_Casing",
            ammo           = "Base.223Bullets",
            forwardOffset  = 0.30,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.30,
            manualEjection = true,
            sideSpread     = 45,
            heightSpread   = 75
        },

        ["Base.HuntingRifle"] = {
            casing         = "Base.308Bullets_Casing",
            ammo           = "Base.308Bullets",
            forwardOffset  = 0.30,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.30,
            manualEjection = true,
            sideSpread     = 45,
            heightSpread   = 75
        },

        ["Base.Rugerm7722"] = {
            casing         = "Base.Bullets22_Casing",
            ammo           = "Base.Bullets22",
            forwardOffset  = 0.30,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.30,
            manualEjection = true,
            sideSpread     = 45,
            heightSpread   = 75
        },

        ["Base.M24Rifle"] = {
            casing         = "Base.762x51Bullets_Casing",
            ammo           = "Base.762x51Bullets",
            forwardOffset  = 0.15,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.30,
            sideSpread     = 30,
            heightSpread   = 30,
            manualEjection = true
        },

        ["Base.M1903Springfield_Sawn"] = {
            casing         = "Base.Bullets3006_Casing",
            ammo           = "Base.Bullets3006",
            forwardOffset  = 0.30,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.30,
            manualEjection = true,
            sideSpread     = 45,
            heightSpread   = 75
        },

        ["Base.M1903Springfield"] = {
            casing         = "Base.Bullets3006_Casing",
            ammo           = "Base.Bullets3006",
            forwardOffset  = 0.30,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.30,
            manualEjection = true,
            sideSpread     = 45,
            heightSpread   = 75
        },

        ["Base.SKS"] = {
            casing         = "Base.762x39Bullets_Casing",
            ammo           = "Base.762x39Bullets",
            forwardOffset  = 0.35,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.55,
            sideSpread     = 90,
            heightSpread   = 60,
            manualEjection = false
        },

        ["Base.SKSMag"] = {
            casing         = "Base.762x39Bullets_Casing",
            ammo           = "Base.762x39Bullets",
            forwardOffset  = 0.35,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.55,
            sideSpread     = 90,
            heightSpread   = 60,
            manualEjection = false
        },

        ["Base.AssaultRifle2"] = {
            casing         = "Base.762x51Bullets_Casing",
            ammo           = "Base.762x51Bullets",
            forwardOffset  = 0.30,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.30,
            manualEjection = false,
            sideSpread     = 45,
            heightSpread   = 60
        },

        ["Base.M14A1"] = {
            casing         = "Base.762x51Bullets_Casing",
            ammo           = "Base.762x51Bullets",
            forwardOffset  = 0.30,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.30,
            manualEjection = false,
            sideSpread     = 45,
            heightSpread   = 60
        },

        ["Base.M1Garand"] = {
            casing         = "Base.Bullets3006_Casing",
            ammo           = "Base.Bullets3006",
            forwardOffset  = 0.30,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.30,
            manualEjection = false,
            sideSpread     = 45,
            heightSpread   = 60
        },

        ["Base.Winchester77"] = {
            casing         = "Base.Bullets22_Casing",
            ammo           = "Base.Bullets22",
            forwardOffset  = 0.30,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.30,
            manualEjection = false,
            sideSpread     = 45,
            heightSpread   = 60
        },

        ["Base.Winchester77_Sawn"] = {
            casing         = "Base.Bullets22_Casing",
            ammo           = "Base.Bullets22",
            forwardOffset  = 0.30,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.30,
            manualEjection = false,
            sideSpread     = 45,
            heightSpread   = 60
        },

        --- short

        ["Base.AssaultRifleShort"] = {
            casing         = "Base.556Bullets_Casing",
            ammo           = "Base.556Bullets",
            forwardOffset  = 0.30,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.65,
            sideSpread     = 60,
            heightSpread   = 30,
            manualEjection = false
        },

        ["Base.M16A2Short"] = {
            casing         = "Base.556Bullets_Casing",
            ammo           = "Base.556Bullets",
            forwardOffset  = 0.30,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.65,
            sideSpread     = 60,
            heightSpread   = 30,
            manualEjection = false
        },

        ["Base.AR15Short"] = {
            casing         = "Base.556Bullets_Casing",
            ammo           = "Base.556Bullets",
            forwardOffset  = 0.30,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.65,
            sideSpread     = 60,
            heightSpread   = 30,
            manualEjection = false
        },

        ["Base.FN_FALShort"] = {
            casing         = "Base.762x51Bullets_Casing",
            ammo           = "Base.762x51Bullets",
            forwardOffset  = 0.40,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 1.20,
            sideSpread     = 60,
            heightSpread   = 90,
            manualEjection = false
        },

        ["Base.Mini14Short"] = {
            casing         = "Base.556Bullets_Casing",
            ammo           = "Base.556Bullets",
            forwardOffset  = 0.35,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.55,
            sideSpread     = 40,
            heightSpread   = 70,
            manualEjection = false
        },

        ["Base.AC556Short"] = {
            casing         = "Base.556Bullets_Casing",
            ammo           = "Base.556Bullets",
            forwardOffset  = 0.30,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.65,
            manualEjection = false,
            sideSpread     = 45,
            heightSpread   = 60
        },

        ["Base.Mini14Sawn"] = {
            casing         = "Base.556Bullets_Casing",
            ammo           = "Base.556Bullets",
            forwardOffset  = 0.35,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.55,
            sideSpread     = 40,
            heightSpread   = 70,
            manualEjection = false
        },

        ["Base.BrowningARShort"] = {
            casing         = "Base.Bullets3006_Casing",
            ammo           = "Base.Bullets3006",
            forwardOffset  = 0.30,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.76,
            sideSpread     = 40,
            heightSpread   = 50,
            manualEjection = false
        },

        ["Base.VarmintRifleShort"] = {
            casing         = "Base.223Bullets_Casing",
            ammo           = "Base.223Bullets",
            forwardOffset  = 0.30,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.30,
            manualEjection = true,
            sideSpread     = 45,
            heightSpread   = 75
        },

        ["Base.HuntingRifleShort"] = {
            casing         = "Base.308Bullets_Casing",
            ammo           = "Base.308Bullets",
            forwardOffset  = 0.30,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.30,
            manualEjection = true,
            sideSpread     = 45,
            heightSpread   = 75
        },

        ["Base.SKSShort"] = {
            casing         = "Base.762x39Bullets_Casing",
            ammo           = "Base.762x39Bullets",
            forwardOffset  = 0.35,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.55,
            sideSpread     = 90,
            heightSpread   = 60,
            manualEjection = false
        },

        ["Base.SKSMagShort"] = {
            casing         = "Base.762x39Bullets_Casing",
            ammo           = "Base.762x39Bullets",
            forwardOffset  = 0.35,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.55,
            sideSpread     = 90,
            heightSpread   = 60,
            manualEjection = false
        },

        ["Base.SKSSawn"] = {
            casing         = "Base.762x39Bullets_Casing",
            ammo           = "Base.762x39Bullets",
            forwardOffset  = 0.35,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.55,
            sideSpread     = 90,
            heightSpread   = 60,
            manualEjection = false
        },

        ["Base.SKSMagSawn"] = {
            casing         = "Base.762x39Bullets_Casing",
            ammo           = "Base.762x39Bullets",
            forwardOffset  = 0.35,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.55,
            sideSpread     = 90,
            heightSpread   = 60,
            manualEjection = false
        },

        ["Base.AssaultRifle2Short"] = {
            casing         = "Base.762x51Bullets_Casing",
            ammo           = "Base.762x51Bullets",
            forwardOffset  = 0.30,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.30,
            manualEjection = false,
            sideSpread     = 45,
            heightSpread   = 60
        },

        ["Base.M14A1Short"] = {
            casing         = "Base.762x51Bullets_Casing",
            ammo           = "Base.762x51Bullets",
            forwardOffset  = 0.30,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.30,
            manualEjection = false,
            sideSpread     = 45,
            heightSpread   = 60
        },

        ["Base.M1903SpringfieldShort"] = {
            casing         = "Base.Bullets3006_Casing",
            ammo           = "Base.Bullets3006",
            forwardOffset  = 0.30,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.30,
            manualEjection = true,
            sideSpread     = 45,
            heightSpread   = 75
        },

        --- SMG

        ["Base.MP5"] = {
            casing         = "Base.Bullets9mm_Casing",
            ammo           = "Base.Bullets9mm",
            forwardOffset  = 0.30,
            sideOffset     = 0.0,
            heightOffset   = 0.50,
            shellForce     = 0.60,
            sideSpread     = 60,
            heightSpread   = 60,
            manualEjection = false
        },

        ["Base.UZI"] = {
            casing         = "Base.Bullets9mm_Casing",
            ammo           = "Base.Bullets9mm",
            forwardOffset  = 0.40,
            sideOffset     = 0.0,
            heightOffset   = 0.50,
            shellForce     = 0.60,
            sideSpread     = 30,
            heightSpread   = 60,
            manualEjection = false
        },

        ["Base.M633"] = {
            casing         = "Base.Bullets9mm_Casing",
            ammo           = "Base.Bullets9mm",
            forwardOffset  = 0.40,
            sideOffset     = 0.0,
            heightOffset   = 0.50,
            shellForce     = 0.60,
            sideSpread     = 30,
            heightSpread   = 60,
            manualEjection = false
        },

        ["Base.Mac10"] = {
            casing         = "Base.Bullets45_Casing",
            ammo           = "Base.Bullets45",
            forwardOffset  = 0.10,
            sideOffset     = 0.10,
            heightOffset   = 0.50,
            shellForce     = 0.60,
            sideSpread     = 60,
            heightSpread   = 60,
            manualEjection = false
        },

        ["Base.M3Grease"] = {
            casing         = "Base.Bullets45_Casing",
            ammo           = "Base.Bullets45",
            forwardOffset  = 0.10,
            sideOffset     = 0.10,
            heightOffset   = 0.50,
            shellForce     = 0.60,
            sideSpread     = 60,
            heightSpread   = 60,
            manualEjection = false
        },

        --- sHOTGUNS

        ["Base.DoubleBarrelShotgun"] = {
            casing         = "Base.ShotgunShells_Casing",
            ammo           = "Base.ShotgunShells",
            forwardOffset  = 0.27,
            sideOffset     = 0.0,
            heightOffset   = 0.45,
            shellForce     = 0.15,
            sideSpread     = 30,
            heightSpread   = 30,
            manualEjection = true
        },

        ["Base.DoubleBarrelShotgunSawnoff"] = {
            casing         = "Base.ShotgunShells_Casing",
            ammo           = "Base.ShotgunShells",
            forwardOffset  = 0.27,
            sideOffset     = 0.0,
            heightOffset   = 0.45,
            shellForce     = 0.15,
            sideSpread     = 30,
            heightSpread   = 30,
            manualEjection = true
        },

        ["Base.Shotgun"] = {
            casing         = "Base.ShotgunShells_Casing",
            ammo           = "Base.ShotgunShells",
            forwardOffset  = 0.27,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.15,
            sideSpread     = 30,
            heightSpread   = 30,
            manualEjection = true
        },

        ["Base.ShotgunSawnoff"] = {
            casing         = "Base.ShotgunShells_Casing",
            ammo           = "Base.ShotgunShells",
            forwardOffset  = 0.27,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.15,
            sideSpread     = 30,
            heightSpread   = 30,
            manualEjection = true
        },

        ["Base.Mossberg500"] = {
            casing         = "Base.ShotgunShells_Casing",
            ammo           = "Base.ShotgunShells",
            forwardOffset  = 0.27,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.25,
            manualEjection = true,
            sideSpread     = 60,
            heightSpread   = 50
        },

        ["Base.Mossberg500Tactical"] = {
            casing         = "Base.ShotgunShells_Casing",
            ammo           = "Base.ShotgunShells",
            forwardOffset  = 0.27,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.25,
            manualEjection = true,
            sideSpread     = 65,
            heightSpread   = 50
        },

        ["Base.Remington870Wood"] = {
            casing         = "Base.ShotgunShells_Casing",
            ammo           = "Base.ShotgunShells",
            forwardOffset  = 0.27,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.25,
            manualEjection = true,
            sideSpread     = 65,
            heightSpread   = 50
        },

        ["Base.Remington870Sawnoff"] = {
            casing         = "Base.ShotgunShells_Casing",
            ammo           = "Base.ShotgunShells",
            forwardOffset  = 0.27,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.25,
            manualEjection = true,
            sideSpread     = 65,
            heightSpread   = 50
        },

        ["Base.SPAS12"] = {
            casing         = "Base.ShotgunShells_Casing",
            ammo           = "Base.ShotgunShells",
            forwardOffset  = 0.27,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.25,
            manualEjection = true,
            sideSpread     = 65,
            heightSpread   = 50
        },

        ["Base.LAW12"] = {
            casing         = "Base.ShotgunShells_Casing",
            ammo           = "Base.ShotgunShells",
            forwardOffset  = 0.27,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.25,
            manualEjection = true,
            sideSpread     = 65,
            heightSpread   = 50
        },

        ["Base.ShotgunShort"] = {
            casing         = "Base.ShotgunShells_Casing",
            ammo           = "Base.ShotgunShells",
            forwardOffset  = 0.27,
            sideOffset     = 0.10,
            heightOffset   = 0.45,
            shellForce     = 0.15,
            sideSpread     = 30,
            heightSpread   = 30,
            manualEjection = true
        },

        ["Base.DoubleBarrelShotgunShort"] = {
            casing         = "Base.ShotgunShells_Casing",
            ammo           = "Base.ShotgunShells",
            forwardOffset  = 0.27,
            sideOffset     = 0.0,
            heightOffset   = 0.45,
            shellForce     = 0.15,
            sideSpread     = 30,
            heightSpread   = 30,
            manualEjection = true
        },

        ["Base.OUShotgun"] = {
            casing         = "Base.ShotgunShells_Casing",
            ammo           = "Base.ShotgunShells",
            forwardOffset  = 0.27,
            sideOffset     = 0.0,
            heightOffset   = 0.45,
            shellForce     = 0.15,
            sideSpread     = 30,
            heightSpread   = 30,
            manualEjection = true
        },

        ["Base.OUShotgunShort"] = {
            casing         = "Base.ShotgunShells_Casing",
            ammo           = "Base.ShotgunShells",
            forwardOffset  = 0.27,
            sideOffset     = 0.0,
            heightOffset   = 0.45,
            shellForce     = 0.15,
            sideSpread     = 30,
            heightSpread   = 30,
            manualEjection = true
        },

        ["Base.OUShotgunSawnoff"] = {
            casing         = "Base.ShotgunShells_Casing",
            ammo           = "Base.ShotgunShells",
            forwardOffset  = 0.27,
            sideOffset     = 0.0,
            heightOffset   = 0.45,
            shellForce     = 0.15,
            sideSpread     = 30,
            heightSpread   = 30,
            manualEjection = true
        },
    }

    for weapon, data in pairs(firearmsRevampedParams) do
        SpentCasingPhysics.registerWeapon(
            weapon,
            data.forwardOffset,
            data.sideOffset,
            data.heightOffset,
            data.shellForce,
            data.sideSpread,
            data.heightSpread,
            data.ejectAngle,
            data.verticalForce
        )
    end
end

if SpentCasingPhysics.VFE then
    local vfeParams = {

        --- Shotguns

        ["Base.Shotgun"] = {
            forwardOffset = 0.27,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.25,
            sideSpread    = 30,
            heightSpread  = 30,
            ejectAngle    = 75,
        },

        ["Base.Shotgun2"] = {
            forwardOffset = 0.27,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.25,
            sideSpread    = 30,
            heightSpread  = 30,
            ejectAngle    = 75,
        },

        ["Base.ShotgunSemi"] = {
            forwardOffset = 0.27,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.35,
            sideSpread    = 30,
            heightSpread  = 30,
        },

        ["Base.ShotgunSemi2"] = {
            forwardOffset = 0.27,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.35,
            sideSpread    = 30,
            heightSpread  = 30,
        },

        ["Base.ShotgunSawnoff"] = {
            forwardOffset = 0.27,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.25,
            sideSpread    = 30,
            heightSpread  = 30,
            ejectAngle    = 75,
        },

        ["Base.ShotgunSawnoffNoStock"] = {
            forwardOffset = 0.27,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.25,
            sideSpread    = 30,
            heightSpread  = 30,
            ejectAngle    = 75,
        },

        ["Base.DoubleBarrelShotgun"] = {
            forwardOffset = 0.27,
            sideOffset    = 0.0,
            heightOffset  = 0.45,
            shellForce    = 0.15,
            sideSpread    = 30,
            heightSpread  = { 80, 100 },
            ejectAngle    = 180,
        },

        ["Base.DoubleBarrelShotgunSawnoff"] = {
            forwardOffset = 0.27,
            sideOffset    = 0.0,
            heightOffset  = 0.45,
            shellForce    = 0.15,
            sideSpread    = 30,
            heightSpread  = { 80, 100 },
            ejectAngle    = 180,
        },

        ["Base.DoubleBarrelShotgunSawnoffNoStock"] = {
            forwardOffset = 0.27,
            sideOffset    = 0.0,
            heightOffset  = 0.45,
            shellForce    = 0.15,
            sideSpread    = 30,
            heightSpread  = { 80, 100 },
            ejectAngle    = 180,
        },

        ["Base.Spas12"] = {
            forwardOffset = 0.27,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.25,
            sideSpread    = 30,
            heightSpread  = 30,
            ejectAngle    = 75,
        },

        ["Base.Spas12Folded"] = {
            forwardOffset = 0.27,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.25,
            sideSpread    = 30,
            heightSpread  = 30,
            ejectAngle    = 75,
        },

        ["Base.ShotgunSilent"] = {
            forwardOffset = 0.35,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.25,
            sideSpread    = 30,
            heightSpread  = 30,
            ejectAngle    = 75,
        },

        --- Rifles

        ["Base.AK47Unfolded"] = {
            forwardOffset = 0.35,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.85,
            sideSpread    = 60,
            heightSpread  = 90,
            ejectAngle    = 55,
        },

        ["Base.AK47Folded"] = {
            forwardOffset = 0.35,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.85,
            sideSpread    = 60,
            heightSpread  = 90,
            ejectAngle    = 55,
        },

        ["Base.AK47"] = {
            forwardOffset = 0.35,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.85,
            sideSpread    = 60,
            heightSpread  = 90,
            ejectAngle    = 55,
        },

        ["Base.MAK90"] = {
            forwardOffset = 0.30,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.80,
            sideSpread    = 60,
            heightSpread  = 90,
            ejectAngle    = 55,
        },

        ["Base.SKS"] = {
            forwardOffset = 0.35,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.40,
            sideSpread    = 30,
            heightSpread  = { 70, 90 },
            ejectAngle    = 25,
        },

        ["Base.SKSSpiker"] = {
            forwardOffset = 0.35,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.40,
            sideSpread    = 30,
            heightSpread  = { 70, 90 },
            ejectAngle    = 25,
        },

        ["Base.1022"] = {
            forwardOffset = 0.30,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.55,
            sideSpread    = 60,
            heightSpread  = 30,
        },

        ["Base.Mini14Unfolded"] = {
            forwardOffset = 0.35,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.50,
            sideSpread    = 90,
            heightSpread  = { 80, 90 },
            ejectAngle    = 25,
        },

        ["Base.Mini14Folded"] = {
            forwardOffset = 0.35,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.50,
            sideSpread    = 90,
            heightSpread  = { 80, 90 },
            ejectAngle    = 25,
        },

        ["Base.Mini14"] = {
            forwardOffset = 0.35,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.50,
            sideSpread    = 90,
            heightSpread  = { 80, 90 },
            ejectAngle    = 25,
        },

        ["Base.FAL"] = {
            forwardOffset = 0.40,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.85,
            sideSpread    = 60,
            heightSpread  = 90,
            ejectAngle    = 80,
        },

        ["Base.FALClassic"] = {
            forwardOffset = 0.40,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.85,
            sideSpread    = 60,
            heightSpread  = 90,
            ejectAngle    = 80,
        },

        ["Base.CAR15"] = {
            forwardOffset = 0.30,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.85,
            sideSpread    = 60,
            heightSpread  = 30,
            ejectAngle    = 75,
        },

        ["Base.CAR15Folded"] = {
            forwardOffset = 0.30,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.85,
            sideSpread    = 60,
            heightSpread  = 30,
            ejectAngle    = 75,
        },

        ["Base.CAR15D"] = {
            forwardOffset = 0.30,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.85,
            sideSpread    = 10,
            heightSpread  = 30,
            ejectAngle    = 65,
        },

        ["Base.CAR15DFolded"] = {
            forwardOffset = 0.30,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.75,
            sideSpread    = 60,
            heightSpread  = 30,
            ejectAngle    = 75,
        },

        ["Base.AssaultRifle2"] = {
            forwardOffset = 0.35,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.55,
            sideSpread    = 90,
            heightSpread  = { 80, 90 },
            ejectAngle    = 25,
        },

        ["Base.AssaultRifleM1"] = {
            forwardOffset = 0.35,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.40,
            sideSpread    = 90,
            heightSpread  = { 80, 90 },
            ejectAngle    = 10,
            verticalForce = 0.1,
        },

        ["Base.AssaultRifle"] = {
            forwardOffset = 0.30,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.75,
            sideSpread    = 60,
            heightSpread  = 30,
            ejectAngle    = 75,
        },

        ["Base.AssaultRifleMasterkeyShotgun"] = {
            forwardOffset = 0.50,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.60,
            sideSpread    = 60,
            heightSpread  = 30,
        },

        ["Base.AssaultRifleMasterkey"] = {
            forwardOffset = 0.30,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.75,
            sideSpread    = 60,
            heightSpread  = 30,
            ejectAngle    = 75,
        },

        ["Base.M60MMG"] = {
            forwardOffset = 0.30,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.80,
            sideSpread    = 60,
            heightSpread  = 30,
        },

        ["Base.M60MMG_Bipod"] = {
            forwardOffset = 0.30,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.80,
            sideSpread    = 60,
            heightSpread  = 30,
        },

        ["Base.HuntingRifle"] = {
            forwardOffset = 0.30,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.45,
            sideSpread    = 30,
            heightSpread  = 30,
        },

        ["Base.VarmintRifle"] = {
            forwardOffset = 0.15,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.45,
            sideSpread    = 30,
            heightSpread  = 30,
        },

        ["Base.SniperRifle"] = {
            forwardOffset = 0.25,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.65,
            sideSpread    = 30,
            ejectAngle    = 45,
            heightSpread  = { 70, 100 },
        },

        ["Base.CampCarbine"] = {
            forwardOffset = 0.35,
            sideOffset    = 0.0,
            heightOffset  = 0.45,
            shellForce    = 0.60,
            sideSpread    = 45,
            heightSpread  = 60,
        },

        ["Base.LeverRifle"] = {
            forwardOffset = 0.35,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.25,
            sideSpread    = 30,
            heightSpread  = 30,
        },

        ["Base.LeverRifle2"] = {
            forwardOffset = 0.30,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.35,
            sideSpread    = 30,
            heightSpread  = 60,
        },

        --- Smgs

        ["Base.MP5"] = {
            forwardOffset = 0.30,
            sideOffset    = 0.0,
            heightOffset  = 0.50,
            shellForce    = 0.60,
            sideSpread    = 60,
            heightSpread  = 60,
        },

        ["Base.MP5SD"] = {
            forwardOffset = 0.30,
            sideOffset    = 0.0,
            heightOffset  = 0.50,
            shellForce    = 0.60,
            sideSpread    = 60,
            heightSpread  = 60,
        },

        ["Base.MP5Unfolded"] = {
            forwardOffset = 0.30,
            sideOffset    = 0.0,
            heightOffset  = 0.50,
            shellForce    = 0.60,
            sideSpread    = 60,
            heightSpread  = 60,
        },

        ["Base.MP5Folded"] = {
            forwardOffset = 0.30,
            sideOffset    = 0.0,
            heightOffset  = 0.50,
            shellForce    = 0.60,
            sideSpread    = 60,
            heightSpread  = 60,
        },

        ["Base.MAC10Unfolded"] = {
            forwardOffset = 0.45,
            sideOffset    = 0.0,
            heightOffset  = 0.50,
            shellForce    = 0.60,
            sideSpread    = 60,
            heightSpread  = 60,
        },

        ["Base.MAC10Folded"] = {
            forwardOffset = 0.45,
            sideOffset    = 0.0,
            heightOffset  = 0.50,
            shellForce    = 0.60,
            sideSpread    = 30,
            heightSpread  = 60,
        },

        ["Base.UziUnfolded"] = {
            forwardOffset = 0.40,
            sideOffset    = 0.0,
            heightOffset  = 0.50,
            shellForce    = 0.60,
            sideSpread    = 30,
            heightSpread  = 60,
        },

        ["Base.UziFolded"] = {
            forwardOffset = 0.40,
            sideOffset    = 0.0,
            heightOffset  = 0.50,
            shellForce    = 0.60,
            sideSpread    = 30,
            heightSpread  = 60,
        },

        --- Pistols

        ["Base.Tec9"] = {
            forwardOffset = 0.45,
            sideOffset    = 0.0,
            heightOffset  = 0.50,
            shellForce    = 0.60,
            sideSpread    = 45,
            heightSpread  = 60,
        },

        ["Base.Pistol"] = {
            forwardOffset = 0.40,
            sideOffset    = 0.0,
            heightOffset  = 0.50,
            shellForce    = 0.60,
            sideSpread    = 45,
            heightSpread  = 60,
        },

        ["Base.Pistol2"] = {
            forwardOffset = 0.40,
            sideOffset    = 0.0,
            heightOffset  = 0.50,
            shellForce    = 0.60,
            sideSpread    = 45,
            heightSpread  = 90,
        },

        ["Base.Pistol3"] = {
            forwardOffset = 0.40,
            sideOffset    = 0.0,
            heightOffset  = 0.50,
            shellForce    = 0.30,
            sideSpread    = 30,
            heightSpread  = 60,
        },

        ["Base.MK23SOCOM"] = {
            forwardOffset = 0.40,
            sideOffset    = 0.0,
            heightOffset  = 0.50,
            shellForce    = 0.60,
            sideSpread    = 50,
            heightSpread  = 45,
        },

        ["Base.Glock"] = {
            forwardOffset = 0.40,
            sideOffset    = 0.0,
            heightOffset  = 0.50,
            shellForce    = 0.45,
            sideSpread    = 45,
            heightSpread  = 90,
        },

        ["Base.Glock18"] = {
            forwardOffset = 0.40,
            sideOffset    = 0.0,
            heightOffset  = 0.50,
            shellForce    = 0.45,
            sideSpread    = 45,
            heightSpread  = 90,
        },

        ["Base.P229"] = {
            forwardOffset = 0.40,
            sideOffset    = 0.0,
            heightOffset  = 0.50,
            shellForce    = 0.60,
            sideSpread    = 45,
            heightSpread  = 90,
        },

        ["Base.CZ75"] = {
            forwardOffset = 0.40,
            sideOffset    = 0.0,
            heightOffset  = 0.50,
            shellForce    = 0.79,
            sideSpread    = 30,
            heightSpread  = 90,
        },

        ["Base.MK2"] = {
            forwardOffset = 0.40,
            sideOffset    = 0.0,
            heightOffset  = 0.50,
            shellForce    = 0.60,
            sideSpread    = 30,
            heightSpread  = 60,
        },

        ["Base.MK2SD"] = {
            forwardOffset = 0.40,
            sideOffset    = 0.0,
            heightOffset  = 0.50,
            shellForce    = 0.60,
            sideSpread    = 30,
            heightSpread  = 60,
        },

        ["Base.Revolver"] = {
            forwardOffset = 0.10,
            sideOffset    = 0.0,
            heightOffset  = 0.30,
            shellForce    = 0.10,
            sideSpread    = 30,
            heightSpread  = 30,
        },

        ["Base.Revolver_Short"] = {
            forwardOffset = 0.10,
            sideOffset    = 0.0,
            heightOffset  = 0.30,
            shellForce    = 0.10,
            sideSpread    = 30,
            heightSpread  = 30,
        },

        ["Base.Revolver_Long"] = {
            forwardOffset = 0.10,
            sideOffset    = 0.0,
            heightOffset  = 0.30,
            shellForce    = 0.10,
            sideSpread    = 30,
            heightSpread  = 30,
        },

        --- Combination Gun

        ["Base.M2400_Shotgun"] = {
            forwardOffset = 0.30,
            sideOffset    = 0.0,
            heightOffset  = 0.40,
            shellForce    = 0.30,
            sideSpread    = 10,
            heightSpread  = { 80, 100 },
            ejectAngle    = 180,
        },

        ["Base.M2400_Rifle"] = {
            forwardOffset = 0.30,
            sideOffset    = 0.0,
            heightOffset  = 0.40,
            shellForce    = 0.30,
            sideSpread    = 10,
            heightSpread  = { 80, 100 },
            ejectAngle    = 180,
        },
    }
    for weapon, data in pairs(vfeParams) do
        SpentCasingPhysics.registerWeapon(
            weapon,
            data.forwardOffset,
            data.sideOffset,
            data.heightOffset,
            data.shellForce,
            data.sideSpread,
            data.heightSpread,
            data.ejectAngle,
            data.verticalForce
        )
    end
end

if SpentCasingPhysics.VFES then
    local vfesParams = {

        ["Base.HK416"] = {
            forwardOffset = 0.30,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.80,
            sideSpread    = 60,
            heightSpread  = 30,
            ejectAngle    = 65,
        },

        ["Base.Galil"] = {
            forwardOffset = 0.35,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.90,
            sideSpread    = 60,
            heightSpread  = 60,
            ejectAngle    = 45,
        },

        ["Base.AK104"] = {
            forwardOffset = 0.35,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.85,
            sideSpread    = 60,
            heightSpread  = 90,
            ejectAngle    = 65,
        },

        ["Base.AK74"] = {
            forwardOffset = 0.35,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.85,
            sideSpread    = 60,
            heightSpread  = 90,
            ejectAngle    = 65,
        },

        ["Base.AKS74U"] = {
            forwardOffset = 0.35,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.85,
            sideSpread    = 60,
            heightSpread  = 90,
            ejectAngle    = 65,
        },

        ["Base.AK105"] = {
            forwardOffset = 0.35,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.85,
            sideSpread    = 60,
            heightSpread  = 90,
            ejectAngle    = 65,
        },

        ["Base.Saiga12"] = {
            forwardOffset = 0.35,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.70,
            sideSpread    = 10,
            heightSpread  = 10,
            ejectAngle    = 45,
        },

        ["Base.MP153"] = {
            forwardOffset = 0.30,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.30,
            sideSpread    = 10,
            heightSpread  = 10,
            ejectAngle    = 65,
        },

        ["Base.MP153sawn"] = {
            forwardOffset = 0.30,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.30,
            sideSpread    = 10,
            heightSpread  = 10,
            ejectAngle    = 65,
        },

        ["Base.Mosin"] = {
            forwardOffset = 0.25,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.65,
            sideSpread    = 30,
            ejectAngle    = 45,
            heightSpread  = { 70, 100 },
        },

        ["Base.SVD"] = {
            forwardOffset = 0.35,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.90,
            sideSpread    = 30,
            heightSpread  = 60,
            ejectAngle    = 35,
        },

        ["Base.SV98"] = {
            forwardOffset = 0.25,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.65,
            sideSpread    = 30,
            ejectAngle    = 45,
            heightSpread  = { 70, 100 },
        },

        ["Base.VSS"] = {
            forwardOffset = 0.30,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.90,
            sideSpread    = 30,
            heightSpread  = 60,
            ejectAngle    = 45,
        },

        ["Base.SVT40"] = {
            forwardOffset = 0.35,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.60,
            sideSpread    = 30,
            heightSpread  = { 90, 110 },
            ejectAngle    = 10,
        },

        ["Base.UMP45"] = {
            forwardOffset = 0.35,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.60,
            sideSpread    = 30,
            heightSpread  = 10,
        },

        ["Base.Vityaz"] = {
            forwardOffset = 0.30,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.60,
            sideSpread    = 30,
            heightSpread  = 60,
        },

        ["Base.Bizon"] = {
            forwardOffset = 0.30,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.60,
            sideSpread    = 30,
            heightSpread  = 60,
        },

        ["Base.PPSH"] = {
            forwardOffset = 0.35,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.10,
            sideSpread    = 60,
            heightSpread  = { 60, 80 },
            ejectAngle    = 0,
        },

        ["Base.Makarov"] = {
            forwardOffset = 0.40,
            sideOffset    = 0.0,
            heightOffset  = 0.50,
            shellForce    = 0.60,
            sideSpread    = 30,
            heightSpread  = 60,
        },

        ["Base.USP45"] = {
            forwardOffset = 0.40,
            sideOffset    = 0.0,
            heightOffset  = 0.50,
            shellForce    = 0.60,
            sideSpread    = 50,
            heightSpread  = 45,
        },

        ["Base.M249"] = {
            forwardOffset = 0.35,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 1.20,
            sideSpread    = 60,
            heightSpread  = 30,
        },

        ["Base.PKM"] = {
            forwardOffset = 0.30,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.10,
            sideSpread    = 60,
            heightSpread  = { 0, 1 },
            ejectAngle    = 340,
            verticalForce = -0.2,
        },
    }

    for weapon, data in pairs(vfesParams) do
        SpentCasingPhysics.registerWeapon(
            weapon,
            data.forwardOffset,
            data.sideOffset,
            data.heightOffset,
            data.shellForce,
            data.sideSpread,
            data.heightSpread,
            data.ejectAngle,
            data.verticalForce
        )
    end
end

if SpentCasingPhysics.VFE93 then
    local vfe93Params = {

        ["Base.scar17"] = {
            forwardOffset = 0.35,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.85,
            sideSpread    = 60,
            heightSpreed  = 30,
            ejectAngle    = 75,
        },

        ["Base.M4A1"] = {
            forwardOffset = 0.30,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.75,
            sideSpread    = 60,
            heightSpreed  = 30,
            ejectAngle    = 60,
        },

        ["Base.Block2"] = {
            forwardOffset = 0.30,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.75,
            sideSpread    = 60,
            heightSpreed  = 30,
            ejectAngle    = 60,
        },

        ["Base.SPR"] = {
            forwardOffset = 0.30,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.75,
            sideSpread    = 60,
            heightSpreed  = 30,
            ejectAngle    = 60,
        },

        ["Base.SPRSD"] = {
            forwardOffset = 0.30,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.75,
            sideSpread    = 60,
            heightSpreed  = 30,
            ejectAngle    = 60,
        },

        ["Base.Vector45"] = {
            forwardOffset = 0.50,
            sideOffset    = 0.0,
            heightOffset  = 0.50,
            shellForce    = 0.60,
            sideSpread    = 60,
            heightSpreed  = 60,
        },

        ["Base.Vector9"] = {
            forwardOffset = 0.50,
            sideOffset    = 0.0,
            heightOffset  = 0.50,
            shellForce    = 0.60,
            sideSpread    = 60,
            heightSpreed  = 60,
        },

        ["Base.P90"] = {
            forwardOffset = 0.15,
            sideOffset    = 0.10,
            heightOffset  = 0.40,
            shellForce    = 0.50,
            sideSpread    = 10,
            heightSpreed  = { 0, 1 },
            ejectAngle    = 0,
            verticalForce = -0.2,
        },

        ["Base.MP7"] = {
            forwardOffset = 0.40,
            sideOffset    = 0.0,
            heightOffset  = 0.45,
            shellForce    = 0.60,
            sideSpread    = 30,
            heightSpreed  = 30,
        },

        ["Base.FN57"] = {
            forwardOffset = 0.45,
            sideOffset    = 0.0,
            heightOffset  = 0.50,
            shellForce    = 0.75,
            sideSpread    = 30,
            heightSpreed  = 90,
        },

        ["Base.CP33"] = {
            forwardOffset = 0.35,
            sideOffset    = 0.0,
            heightOffset  = 0.50,
            shellForce    = 0.70,
            sideSpread    = 30,
            heightSpreed  = 60,
        },

        ["Base.1522"] = {
            forwardOffset = 0.25,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.75,
            sideSpread    = 30,
            heightSpreed  = 60,
        },

        ["Base.n418sd"] = {
            forwardOffset = 0.30,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.75,
            sideSpread    = 60,
            heightSpreed  = 30,
            ejectAngle    = 60,
        },

        ["Base.n418"] = {
            forwardOffset = 0.30,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.75,
            sideSpread    = 60,
            heightSpreed  = 30,
            ejectAngle    = 60,
        },

        ["Base.AA12"] = {
            forwardOffset = 0.30,
            sideOffset    = 0.10,
            heightOffset  = 0.45,
            shellForce    = 0.60,
            sideSpread    = 60,
            heightSpreed  = 30,
        },
    }

    for weapon, data in pairs(vfe93Params) do
        SpentCasingPhysics.registerWeapon(
            weapon,
            data.forwardOffset,
            data.sideOffset,
            data.heightOffset,
            data.shellForce,
            data.sideSpread,
            data.heightSpread,
            data.ejectAngle,
            data.verticalForce
        )
    end
end

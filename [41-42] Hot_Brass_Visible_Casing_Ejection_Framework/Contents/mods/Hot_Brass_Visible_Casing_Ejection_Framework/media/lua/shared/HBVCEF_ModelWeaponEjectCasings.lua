SpentCasingPhysics = {}

---Vanilla Weapons
SpentCasingPhysics.WeaponEjectionPortParams = {
    --Pistols
    ["Base.Pistol3"] = {
        forwardOffset = 0.50,
        sideOffset = 0.0,
        heightOffset = 0.45,
        shellForce = 0.30,
    },

    ["Base.Pistol2"] = {
        forwardOffset = 0.50,
        sideOffset = 0.0,
        heightOffset = 0.45,
        shellForce = 0.25,
    },

    ["Base.Revolver_Short"] = {
        forwardOffset = 0.15,
        sideOffset = 0.0,
        heightOffset = 0.35,
        shellForce = 0.10,
    },

    ["Base.Revolver"] = {
        forwardOffset = 0.15,
        sideOffset = 0.0,
        heightOffset = 0.35,
        shellForce = 0.10,
    },

    ["Base.Pistol"] = {
        forwardOffset = 0.50,
        sideOffset = 0.0,
        heightOffset = 0.45,
        shellForce = 0.25,
    },

    ["Base.Revolver_Long"] = {
        forwardOffset = 0.15,
        sideOffset = 0.0,
        heightOffset = 0.35,
        shellForce = 0.10,
    },

    --Shotguns
    ["Base.DoubleBarrelShotgun"] = {
        forwardOffset = 0.27,
        sideOffset = 0.10,
        heightOffset = 0.45,
        shellForce = 0.15,
    },

    ["Base.DoubleBarrelShotgunSawnoff"] = {
        forwardOffset = 0.27,
        sideOffset = 0.10,
        heightOffset = 0.45,
        shellForce = 0.15,
    },

    ["Base.Shotgun"] = {
        forwardOffset = 0.27,
        sideOffset = 0.10,
        heightOffset = 0.45,
        shellForce = 0.15,
    },

    ["Base.ShotgunSawnoff"] = {
        forwardOffset = 0.27,
        sideOffset = 0.10,
        heightOffset = 0.45,
        shellForce = 0.15,
    },

    --Rifles
    ["Base.AssaultRifle2"] = {
        forwardOffset = 0.40,
        sideOffset = 0.08,
        heightOffset = 0.45,
        shellForce = 0.55,
    },

    ["Base.AssaultRifle"] = {
        forwardOffset = 0.30,
        sideOffset = 0.10,
        heightOffset = 0.45,
        shellForce = 0.45,
    },

    ["Base.VarmintRifle"] = {
        forwardOffset = 0.30,
        sideOffset = 0.10,
        heightOffset = 0.45,
        shellForce = 0.30,
    },

    ["Base.HuntingRifle"] = {
        forwardOffset = 0.30,
        sideOffset = 0.10,
        heightOffset = 0.45,
        shellForce = 0.30,
    },
}

function SpentCasingPhysics.registerWeapon(
    weapon,
    forwardOffset,
    sideOffset,
    heightOffset,
    shellForce,
    sideSpread,
    heightSpread,
    ejectAngle,
    verticalForce)
    SpentCasingPhysics.WeaponEjectionPortParams[weapon] = {
        forwardOffset = forwardOffset or 0,
        sideOffset    = sideOffset or 0,
        heightOffset  = heightOffset or 0,
        shellForce    = shellForce or 0,
        sideSpread    = sideSpread or 10,
        heightSpread  = heightSpread or 10,
        ejectAngle    = ejectAngle,
        verticalForce = verticalForce,
    }
end

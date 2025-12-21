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

if SpentCasingPhysics then
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

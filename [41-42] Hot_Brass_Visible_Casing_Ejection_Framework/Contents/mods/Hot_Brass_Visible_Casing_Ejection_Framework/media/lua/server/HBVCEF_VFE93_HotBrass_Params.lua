local VFE93 = getActivatedMods():contains('VFExpansion3')

if VFE93 then
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

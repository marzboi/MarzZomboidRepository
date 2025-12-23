local VFE = getActivatedMods():contains('VFExpansion1')

if VFE then
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

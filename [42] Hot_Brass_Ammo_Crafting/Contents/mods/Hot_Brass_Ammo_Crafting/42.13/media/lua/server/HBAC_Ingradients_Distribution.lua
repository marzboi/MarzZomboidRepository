require "Items/ProceduralDistributions"

local function addItem(distName, itemFullType, weight)
    local dist = ProceduralDistributions.list[distName]
    if not dist or not dist.items then
        return
    end
    table.insert(dist.items, itemFullType)
    table.insert(dist.items, weight)
end

local function mergeHBACDistributions()
    local hasVFE   = SpentCasingPhysicsAmmoCraft and SpentCasingPhysicsAmmoCraft.VFE
    local hasVFES  = SpentCasingPhysicsAmmoCraft and SpentCasingPhysicsAmmoCraft.VFES
    local hasVFE93 = SpentCasingPhysicsAmmoCraft and SpentCasingPhysicsAmmoCraft.VFE93

    -- Gun stores
    addItem("GunStoreMagsAmmo", "Base.PrimerBox", 6)
    addItem("GunStoreMagsAmmo", "Base.9mmProjectileBox", 6)
    addItem("GunStoreMagsAmmo", "Base.45ProjectileBox", 5)
    addItem("GunStoreMagsAmmo", "Base.38ProjectileBox", 4)
    addItem("GunStoreMagsAmmo", "Base.44ProjectileBox", 3)
    addItem("GunStoreMagsAmmo", "Base.ShotgunPelletsBox", 4)
    addItem("GunStoreMagsAmmo", "Base.556ProjectileBox", 3)
    addItem("GunStoreMagsAmmo", "Base.223ProjectileBox", 3)
    addItem("GunStoreMagsAmmo", "Base.308ProjectileBox", 2)

    addItem("GunStoreCounter", "Base.ReloadingTool", 2)
    addItem("GunStoreCounter", "Base.PrimerBox", 4)

    addItem("GunStoreShelf", "Base.PrimerBox", 2)
    addItem("GunStoreShelf", "Base.9mmProjectileBox", 2)
    addItem("GunStoreShelf", "Base.45ProjectileBox", 1.5)
    addItem("GunStoreShelf", "Base.ShotgunPelletsBox", 1.5)

    -- Police ammo storage
    addItem("PoliceStorageAmmunition", "Base.9mmProjectileBox", 6)
    addItem("PoliceStorageAmmunition", "Base.45ProjectileBox", 5)
    addItem("PoliceStorageAmmunition", "Base.38ProjectileBox", 2)
    addItem("PoliceStorageAmmunition", "Base.44ProjectileBox", 1)
    addItem("PoliceStorageAmmunition", "Base.ShotgunPelletsBox", 4)
    addItem("PoliceStorageAmmunition", "Base.PrimerBox", 1)

    -- Army / surplus
    addItem("ArmyStorageAmmunition", "Base.PrimerBox", 4)
    addItem("ArmyStorageAmmunition", "Base.ReloadingTool", 0.5)
    addItem("ArmyStorageAmmunition", "Base.556ProjectileBox", 6)
    addItem("ArmyStorageAmmunition", "Base.223ProjectileBox", 4)
    addItem("ArmyStorageAmmunition", "Base.308ProjectileBox", 3)

    addItem("ArmySurplusAmmoBoxes", "Base.PrimerBox", 2)
    addItem("ArmySurplusAmmoBoxes", "Base.ReloadingTool", 0.25)
    addItem("ArmySurplusAmmoBoxes", "Base.556ProjectileBox", 4)
    addItem("ArmySurplusAmmoBoxes", "Base.223ProjectileBox", 2)
    addItem("ArmySurplusAmmoBoxes", "Base.308ProjectileBox", 2)

    -- Garages / pawn
    addItem("GarageFirearms", "Base.9mmProjectileBox", 1.5)
    addItem("GarageFirearms", "Base.45ProjectileBox", 1.2)
    addItem("GarageFirearms", "Base.38ProjectileBox", 1)
    addItem("GarageFirearms", "Base.ShotgunPelletsBox", 1.2)
    addItem("GarageFirearms", "Base.PrimerBox", 0.5)
    addItem("GarageFirearms", "Base.ReloadingTool", 0.1)

    addItem("GarageTools", "Base.ReloadingTool", 0.25)
    addItem("GarageTools", "Base.PrimerBox", 0.4)

    addItem("PawnShopTools", "Base.ReloadingTool", 0.75)
    addItem("PawnShopTools", "Base.PrimerBox", 1.5)

    addItem("PawnShopGunsSpecial", "Base.9mmProjectileBox", 1.5)
    addItem("PawnShopGunsSpecial", "Base.45ProjectileBox", 1.2)
    addItem("PawnShopGunsSpecial", "Base.308ProjectileBox", 1)
    addItem("PawnShopGunsSpecial", "Base.PrimerBox", 0.8)

    addItem("MechanicTools", "Base.ReloadingTool", 0.15)
    addItem("StoreShelfMechanics", "Base.ReloadingTool", 0.1)

    -- VFE: 7.62 and .22
    if hasVFE then
        addItem("GunStoreMagsAmmo", "Base.22ProjectileBox", 4)
        addItem("GunStoreMagsAmmo", "Base.762ProjectileBox", 2)

        addItem("PoliceStorageAmmunition", "Base.22ProjectileBox", 1.5)

        addItem("ArmyStorageAmmunition", "Base.762ProjectileBox", 4)
        addItem("ArmySurplusAmmoBoxes", "Base.762ProjectileBox", 3)
    end

    -- VFES: 5.45 / 7.62x54 / 9x39
    if hasVFES then
        addItem("GunStoreMagsAmmo", "Base.545ProjectileBox", 1.5)
        addItem("GunStoreMagsAmmo", "Base.76254ProjectileBox", 1)
        addItem("GunStoreMagsAmmo", "Base.939ProjectileBox", 1)

        addItem("ArmyStorageAmmunition", "Base.545ProjectileBox", 3)
        addItem("ArmyStorageAmmunition", "Base.76254ProjectileBox", 2)
        addItem("ArmyStorageAmmunition", "Base.939ProjectileBox", 2)

        addItem("ArmySurplusAmmoBoxes", "Base.545ProjectileBox", 2)
        addItem("ArmySurplusAmmoBoxes", "Base.76254ProjectileBox", 1.5)
        addItem("ArmySurplusAmmoBoxes", "Base.939ProjectileBox", 1.5)
    end

    -- VFE93: 5.7 / 4.6
    if hasVFE93 then
        addItem("GunStoreMagsAmmo", "Base.57ProjectileBox", 1)
        addItem("GunStoreMagsAmmo", "Base.46ProjectileBox", 1)

        addItem("ArmyStorageAmmunition", "Base.57ProjectileBox", 1.5)
        addItem("ArmyStorageAmmunition", "Base.46ProjectileBox", 1.5)

        addItem("ArmySurplusAmmoBoxes", "Base.57ProjectileBox", 1)
        addItem("ArmySurplusAmmoBoxes", "Base.46ProjectileBox", 1)
    end
end

Events.OnPreDistributionMerge.Add(mergeHBACDistributions)

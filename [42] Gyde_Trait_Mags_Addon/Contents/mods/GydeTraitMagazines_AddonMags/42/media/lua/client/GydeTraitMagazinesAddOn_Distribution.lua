require 'Items/ProceduralDistributions'
require "Items/ItemPicker"

GydeTraitMagsAddon = GydeTraitMagsAddon or {};

local sBvars = SandboxVars.GydeTraitMagsAddon
local sBvarsAddOn = SandboxVars.GydeTraitMagsAddon;

-- Assign SandboxVars SpawnRate to a specific multiplier
local spawnRateMultipliers = {
    [1] = 0.1,
    [2] = 0.5,
    [3] = 1,
    [4] = 2,
    [5] = 3,
}

-- Gets the spawn rate multiplier set in SandboxVars
local function getSpawnRateMultiplier()
    return spawnRateMultipliers[sBvars.SpawnRate] or 1
end

-- Function to insert item into distribution tables with adjusted multiplier
local function insertItem(distributionTable, item, baseChance)
	local spawnMultiplier = getSpawnRateMultiplier()
	local newSpawnRate = baseChance * spawnMultiplier -- Calculates new spawn rate based on multiplier

	-- Insert into loot table
	table.insert(distributionTable.items, item)
	table.insert(distributionTable.items, newSpawnRate)
end

Events.OnInitGlobalModData.Add(function()

	-- Artisan
	if sBvarsAddOn.SpawnArtisan then
		local magazineType = "Base.ArtisanMag"

		-- Generic Spawn Locations --
    	insertItem(SuburbsDistributions["all"]["postbox"], magazineType, 0.3)
		insertItem(ProceduralDistributions["list"]["ShelfGeneric"], magazineType, 1)
    	insertItem(ProceduralDistributions["list"]["MagazineRackMixed"], magazineType, 1)
    	insertItem(ProceduralDistributions["list"]["MagazineRackNewspaper"], magazineType, 1)
    	insertItem(ProceduralDistributions["list"]["CrateBooks"], magazineType, 0.8)
    	insertItem(ProceduralDistributions["list"]["LibraryBooks"], magazineType, 3)
    	insertItem(ProceduralDistributions["list"]["BookstoreBooks"], magazineType, 3)
    	insertItem(ProceduralDistributions["list"]["PostOfficeBooks"], magazineType, 0.3)

		-- Unique Locations --
		insertItem(ProceduralDistributions["list"]["MechanicShelfBooks"], magazineType, 2)
		insertItem(ProceduralDistributions["list"]["LivingRoomShelf"], magazineType, 0.5)
		insertItem(ProceduralDistributions["list"]["LivingRoomShelfNoTapes"], magazineType, 0.5)
    end

	-- Gardener
    if sBvarsAddOn.SpawnGardener then
        local magazineType = "Base.GardenerMag"
        -- Generic Spawn Locations --

        insertItem(SuburbsDistributions["all"]["postbox"], magazineType, 0.2)
        insertItem(ProceduralDistributions["list"]["ShelfGeneric"], magazineType, 0.2)
        insertItem(ProceduralDistributions["list"]["MagazineRackMixed"], magazineType, 1)
        insertItem(ProceduralDistributions["list"]["MagazineRackNewspaper"], magazineType, 1)
        insertItem(ProceduralDistributions["list"]["CrateBooks"], magazineType, 0.8)
        insertItem(ProceduralDistributions["list"]["LibraryBooks"], magazineType, 2)
        insertItem(ProceduralDistributions["list"]["BookstoreBooks"], magazineType, 2)
        insertItem(ProceduralDistributions["list"]["PostOfficeBooks"], magazineType, 0.5)

        -- Unique Locations --
        insertItem(ProceduralDistributions["list"]["LivingRoomShelf"], magazineType, 1.5)
        insertItem(ProceduralDistributions["list"]["LivingRoomShelfNoTapes"], magazineType, 0.5)
        insertItem(ProceduralDistributions["list"]["ClassroomDesk"], magazineType, 0.01)
        insertItem(ProceduralDistributions["list"]["GigamartSchool"], magazineType, 0.5)
        insertItem(ProceduralDistributions["list"]["CafeShelfBooks"], magazineType, 0.5)
        insertItem(ProceduralDistributions["list"]["StoreShelfMedical"], magazineType, 1)
        insertItem(ProceduralDistributions["list"]["ArmyStorageMedical"], magazineType, 1)
    end
	
	-- Mason
	if sBvarsAddOn.SpawnMason then
		local magazineType = "Base.MasonMag"
		-- Generic Spawn Locations --

    	insertItem(SuburbsDistributions["all"]["postbox"], magazineType, 0.2)
		insertItem(ProceduralDistributions["list"]["ShelfGeneric"], magazineType, 0.2)
    	insertItem(ProceduralDistributions["list"]["MagazineRackMixed"], magazineType, 1)
    	insertItem(ProceduralDistributions["list"]["MagazineRackNewspaper"], magazineType, 1)
    	insertItem(ProceduralDistributions["list"]["CrateBooks"], magazineType, 0.8)
    	insertItem(ProceduralDistributions["list"]["LibraryBooks"], magazineType, 2)
    	insertItem(ProceduralDistributions["list"]["BookstoreBooks"], magazineType, 2)
    	insertItem(ProceduralDistributions["list"]["PostOfficeBooks"], magazineType, 0.5)

		-- Unique Locations --
		insertItem(ProceduralDistributions["list"]["LivingRoomShelf"], magazineType, 1.5)
		insertItem(ProceduralDistributions["list"]["LivingRoomShelfNoTapes"], magazineType, 0.5)
		insertItem(ProceduralDistributions["list"]["ClassroomDesk"], magazineType, 0.01)
		insertItem(ProceduralDistributions["list"]["GigamartSchool"], magazineType, 0.5)
		insertItem(ProceduralDistributions["list"]["CafeShelfBooks"], magazineType, 0.5)
		insertItem(ProceduralDistributions["list"]["StoreShelfMedical"], magazineType, 1)
		insertItem(ProceduralDistributions["list"]["ArmyStorageMedical"], magazineType, 1)
	end

	-- Adrenaline Junkie
    if sBvarsAddOn.SpawnAdrenalineJunkie then
        local magazineType = "Base.AdrenalineJunkieMag"

        -- Generic Spawn Locations --
        insertItem(SuburbsDistributions["all"]["postbox"], magazineType, 0.2)
        insertItem(ProceduralDistributions["list"]["ShelfGeneric"], magazineType, 0.2)
        insertItem(ProceduralDistributions["list"]["MagazineRackMixed"], magazineType, 1)
        insertItem(ProceduralDistributions["list"]["MagazineRackNewspaper"], magazineType, 1)
        insertItem(ProceduralDistributions["list"]["CrateBooks"], magazineType, 0.8)
        insertItem(ProceduralDistributions["list"]["LibraryBooks"], magazineType, 2)
        insertItem(ProceduralDistributions["list"]["BookstoreBooks"], magazineType, 2)
        insertItem(ProceduralDistributions["list"]["PostOfficeBooks"], magazineType, 0.5)

        -- Unique Locations --
        insertItem(ProceduralDistributions["list"]["LivingRoomShelf"], magazineType, 1)
        insertItem(ProceduralDistributions["list"]["LivingRoomShelfNoTapes"], magazineType, 0.5)
    end
	
	-- Baseball Player
    if sBvarsAddOn.SpawnBaseballPlayer then
        local magazineType = "Base.BaseballPlayerMag"

        -- Generic Spawn Locations --
        insertItem(ProceduralDistributions["list"]["ShelfGeneric"], magazineType, 0.1)
        insertItem(ProceduralDistributions["list"]["MagazineRackMixed"], magazineType, 0.2)
        insertItem(ProceduralDistributions["list"]["MagazineRackNewspaper"], magazineType, 0.2)
        insertItem(ProceduralDistributions["list"]["CrateBooks"], magazineType, 0.2)
        insertItem(ProceduralDistributions["list"]["LibraryBooks"], magazineType, 0.5)
        insertItem(ProceduralDistributions["list"]["BookstoreBooks"], magazineType, 0.5)
        insertItem(ProceduralDistributions["list"]["PostOfficeBooks"], magazineType, 0.25)

        -- Unique Locations --
        insertItem(ProceduralDistributions["list"]["LivingRoomShelf"], magazineType, 0.2)
        insertItem(ProceduralDistributions["list"]["LivingRoomShelfNoTapes"], magazineType, 0.2)
        insertItem(ProceduralDistributions["list"]["SchoolLockers"], magazineType, 0.02)
        insertItem(ProceduralDistributions["list"]["GigamartSchool"], magazineType, 0.75)
        insertItem(ProceduralDistributions["list"]["ClassroomDesk"], magazineType, 0.01)
    end
	
	-- Herbalist
    if sBvarsAddOn.SpawnHerbalist then
        local magazineType = "Base.HerbalistMag2"

        -- Generic Spawn Locations --
        insertItem(SuburbsDistributions["all"]["postbox"], magazineType, 0.2)
        insertItem(ProceduralDistributions["list"]["ShelfGeneric"], magazineType, 0.2)
        insertItem(ProceduralDistributions["list"]["MagazineRackMixed"], magazineType, 1)
        insertItem(ProceduralDistributions["list"]["MagazineRackNewspaper"], magazineType, 1)
        insertItem(ProceduralDistributions["list"]["CrateBooks"], magazineType, 0.5)
        insertItem(ProceduralDistributions["list"]["LibraryBooks"], magazineType, 1)
        insertItem(ProceduralDistributions["list"]["BookstoreBooks"], magazineType, 1.25)
        insertItem(ProceduralDistributions["list"]["PostOfficeBooks"], magazineType, 0.5)

        -- Unique Locations --
        insertItem(ProceduralDistributions["list"]["LivingRoomShelf"], magazineType, 0.5)
        insertItem(ProceduralDistributions["list"]["LivingRoomShelfNoTapes"], magazineType, 0.5)
        insertItem(ProceduralDistributions["list"]["BedroomSidetable"], magazineType, 1.5) -- ( ͡° ͜ʖ ͡°)
    end
	
	-- Sewer
    if sBvarsAddOn.SpawnSewer then
        local magazineType = "Base.SewerMag"

        -- Generic Spawn Locations --
        insertItem(SuburbsDistributions["all"]["postbox"], magazineType, 0.2)
        insertItem(ProceduralDistributions["list"]["ShelfGeneric"], magazineType, 0.2)
        insertItem(ProceduralDistributions["list"]["MagazineRackMixed"], magazineType, 1)
        insertItem(ProceduralDistributions["list"]["MagazineRackNewspaper"], magazineType, 1)
        insertItem(ProceduralDistributions["list"]["CrateBooks"], magazineType, 0.8)
        insertItem(ProceduralDistributions["list"]["LibraryBooks"], magazineType, 2)
        insertItem(ProceduralDistributions["list"]["BookstoreBooks"], magazineType, 2)
        insertItem(ProceduralDistributions["list"]["PostOfficeBooks"], magazineType, 0.5)

        -- Unique Locations --
        insertItem(ProceduralDistributions["list"]["LivingRoomShelf"], magazineType, 1)
        insertItem(ProceduralDistributions["list"]["LivingRoomShelfNoTapes"], magazineType, 0.5)
    end

-- Wilderness Knowledge
    if sBvarsAddOn.SpawnWildernessKnowledge then
        local magazineType = "Base.WildernessKnowledgeMag"

        -- Generic Spawn Locations --
        insertItem(SuburbsDistributions["all"]["postbox"], magazineType, 0.2)
        insertItem(ProceduralDistributions["list"]["ShelfGeneric"], magazineType, 0.2)
        insertItem(ProceduralDistributions["list"]["MagazineRackMixed"], magazineType, 0.3)
        insertItem(ProceduralDistributions["list"]["MagazineRackNewspaper"], magazineType, 0.3)
        insertItem(ProceduralDistributions["list"]["CrateBooks"], magazineType, 0.4)
        insertItem(ProceduralDistributions["list"]["LibraryBooks"], magazineType, 1.5)
        insertItem(ProceduralDistributions["list"]["BookstoreBooks"], magazineType, 1)
        insertItem(ProceduralDistributions["list"]["PostOfficeBooks"], magazineType, 0.05)

        -- Unique Locations --
        insertItem(ProceduralDistributions["list"]["LivingRoomShelf"], magazineType, 0.1)
        insertItem(ProceduralDistributions["list"]["LivingRoomShelfNoTapes"], magazineType, 0.05)
        insertItem(ProceduralDistributions["list"]["StoreShelfMedical"], magazineType, 0.5)
        insertItem(ProceduralDistributions["list"]["MedicalOfficeBooks"], magazineType, 1)
        insertItem(ProceduralDistributions["list"]["CampingStoreBooks"], magazineType, 1)
    end
	
-- Hunter
	if sBvarsAddOn.SpawnHunter then
		local magazineType = "Base.HunterMag"

		-- Generic Spawn Locations --
		insertItem(SuburbsDistributions["all"]["postbox"], magazineType, 0.2)
		insertItem(ProceduralDistributions["list"]["ShelfGeneric"], magazineType, 0.2)
    	insertItem(ProceduralDistributions["list"]["MagazineRackMixed"], magazineType, 0.3)
    	insertItem(ProceduralDistributions["list"]["MagazineRackNewspaper"], magazineType, 0.3)
    	insertItem(ProceduralDistributions["list"]["CrateBooks"], magazineType, 0.4)
    	insertItem(ProceduralDistributions["list"]["LibraryBooks"], magazineType, 1.5)
    	insertItem(ProceduralDistributions["list"]["BookstoreBooks"], magazineType, 1)
    	insertItem(ProceduralDistributions["list"]["PostOfficeBooks"], magazineType, 0.05)

		-- Unique Locations --
		insertItem(ProceduralDistributions["list"]["LivingRoomShelf"], magazineType, 0.1)
		insertItem(ProceduralDistributions["list"]["LivingRoomShelfNoTapes"], magazineType, 0.05)
		insertItem(ProceduralDistributions["list"]["HuntingLockers"], magazineType, 0.5)
		insertItem(ProceduralDistributions["list"]["PoliceEvidence"], magazineType, 1)
		insertItem(ProceduralDistributions["list"]["PoliceLockers"], magazineType, 1)
	end

	ItemPickerJava.Parse()
end)
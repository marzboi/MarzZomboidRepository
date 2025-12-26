function VFESurvivorAmmo(zombie)
	if not zombie:getOutfitName() then return false end
	local outfit = tostring(zombie:getOutfitName())

	-- Sandbox vars later perhaps
	local loseBulletChance = 50
	local ammoBoxChance = 20
	local magazineChance = 40
	local utilityItemChance = 40

	local loseBulletRolls = 8
	local ammoBoxRolls = 3
	local magazineRolls = 2
	local utilityItemRolls = 5

	local bulletList = {}
	local ammoBoxList = {}
	local magazineList = {}

	local inv = zombie:getInventory()
	local attachedWeapons = zombie:getAttachedItems()
	local weaponsNum = attachedWeapons:size()
	local backpackinv = nil
	-- get backpack
	for i = 0, inv:getItems():size() - 1 do
		local itemBackpack = inv:getItems():get(i)
		if itemBackpack:getCategory() == "Container" and zombie:isEquipped(itemBackpack) then
			backpackinv = itemBackpack:getInventory()
		end
	end
	if outfit == "Survivalist" or outfit == "Survivalist02" or outfit == "Survivalist03" then
		-- For every weapon attached, get the ammo and magazine
		for i = 0, weaponsNum - 1 do
			local item = attachedWeapons:getItemByIndex(i)
			if item:isRanged() then
				local bullet = item:getAmmoType()
				local box = item:getAmmoBox()
				local mag = item:getMagazineType()
				table.insert(bulletList, bullet)
				table.insert(ammoBoxList, box)
				table.insert(magazineList, mag)
			end
		end
		for i, v in ipairs(bulletList) do
			for j = 1, loseBulletRolls do
				if loseBulletChance >= ZombRand(1, 100) then
					inv:AddItem(v)
				end
			end
		end
		for i, v in ipairs(ammoBoxList) do
			for j = 1, ammoBoxRolls do
				if ammoBoxChance >= ZombRand(1, 100) then
					if backpackinv then
						backpackinv:AddItem(v)
					else
						inv:AddItem(v)
					end
				end
			end
		end
		for i, v in ipairs(magazineList) do
			for j = 1, magazineRolls do
				if magazineChance >= ZombRand(1, 100) then
					local mag = inv:AddItem(v)
					mag:setCurrentAmmoCount(ZombRand(0, mag:getMaxAmmo()))
				end
			end
		end
		for j = 1, utilityItemRolls do
			if utilityItemChance >= ZombRand(1, 100) then
				local k = ZombRand(1, 6)
				if k == 1 then
					if backpackinv then
						backpackinv:AddItem("WaterBottleFull")
					else
						inv:AddItem("WaterBottleFull")
					end
				elseif k == 2 then
					if backpackinv then
						backpackinv:AddItem("DehydratedMeatStick")
					else
						inv:AddItem("DehydratedMeatStick")
					end
				elseif k == 3 then
					if backpackinv then
						backpackinv:AddItem("BeefJerky")
					else
						inv:AddItem("BeefJerky")
					end
				elseif k == 4 then
					if backpackinv then
						backpackinv:AddItem("CleaningKit")
					else
						inv:AddItem("CleaningKit")
					end
				elseif k == 5 then
					if backpackinv then
						backpackinv:AddItem("DuctTape")
					else
						inv:AddItem("DuctTape")
					end
				end
			end
		end
	end
end

function VFESurvivorAmmoSandboxLoader()
	if SandboxVars.VFE.SurvivorWeapons then Events.OnZombieDead.Add(VFESurvivorAmmo) end
end

Events.OnGameStart.Add(VFESurvivorAmmoSandboxLoader);

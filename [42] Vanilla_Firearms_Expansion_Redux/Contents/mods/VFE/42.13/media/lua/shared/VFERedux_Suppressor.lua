require "ISUI/ISInventoryPaneContextMenu"

VFESuppressorContext = {}

VFESuppressorContext.callAction = function(item, index, player, suppressor)
	if player:getPrimaryHandItem() ~= item or player:getSecondaryHandItem() ~= item then
		ISTimedActionQueue.add(ISEquipWeaponAction:new(player, item, 50, true, true));
	end
	if item and item:getContainer() == player:getInventory() then
		ISTimedActionQueue.add(VFESuppressorContextAction:new(item, index, player, suppressor, CharacterActionAnims
			.Craft, 15))
	end
end

VFESuppressorContextAction = ISBaseTimedAction:derive("VFESuppressorContextAction");

function VFESuppressorContextAction:new(item, index, character, suppressor, anim, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.index = index;
	o.suppressor = suppressor;
	o.stopOnWalk = false;
	o.stopOnRun = true;
	o.maxTime = time;
	o.caloriesModifier = 6;
	o.animation = anim
	o.useProgressBar = false;
	if character:isTimedActionInstant() then
		o.maxTime = 1;
	end
	return o;
end

function VFESuppressorContextAction:isValid()
	local returnvalue = true
	if self.index % 3 == 1 then
		if VFESuppressorSet[self.index + 2] ~= "NULL" then
			if not self.suppressor or self.suppressor:getContainer() ~= self.character:getInventory() then
				returnvalue = false;
			end
		end
	end
	if not self.item or self.item:getContainer() ~= self.character:getInventory() then
		returnvalue = false;
	end
	return returnvalue;
end

function VFESuppressorContextAction:waitToStart()
	return false;
end

function VFESuppressorContextAction:start()
	self.item:setJobType("Using Suppressor");
	self.item:setJobDelta(0.0);
	self:setOverrideHandModels(self.item:getStaticModel(), nil)
	self:setActionAnim(self.animation);
end

function VFESuppressorContextAction:perform()
	VFESuppressor(self.item, self.index, self.character, self.suppressor)
	ISBaseTimedAction.perform(self);
end

function VFESuppressorContextAction:update()
	self.item:setJobDelta(self:getJobDelta());
	self.character:setMetabolicTarget(Metabolics.UsingTools);
end

function VFESuppressorContextAction:stop()
	ISBaseTimedAction.stop(self);
	self.item:setJobDelta(0.0);
end

local function SuppressorModifierRecalc(item)
	item:getModData().scriptStats = {
		ScriptName = item:getDisplayName() or "",
		MinDamage = item:getMinDamage() or nil,
		MaxDamage = item:getMaxDamage() or nil,
		TreeDamage = item:getTreeDamage() or nil,
		DoorDamage = item:getDoorDamage() or nil,
		PushBackMod = item:getPushBackMod() or nil,
		KnockdownMod = item:getKnockdownMod() or nil,
		MaxRange = item:getMaxRange() or nil,
		MinRange = item:getMinRange() or nil,
		BaseSpeed = item:getBaseSpeed() or nil,
		EnduranceMod = item:getEnduranceMod() or nil,
		CriticalChance = item:getCriticalChance() or nil,
		ConditionLowerChance = item:getConditionLowerChance() or nil,
		HitChance = item:getHitChance() or nil,
		SoundRadius = item:getSoundRadius() or nil,
		SoundVolume = item:getSoundVolume() or nil,
		SoundGain = item:getSoundGain() or nil,
		RecoilDelay = item:getRecoilDelay() or nil,
		AimingTime = item:getAimingTime() or nil,
		ReloadTime = item:getReloadTime() or nil,
		AimingPerkRangeModifier = item:getAimingPerkRangeModifier() or nil,
		AimingPerkCritModifier = item:getAimingPerkCritModifier() or nil,
		AimingPerkHitChanceModifier = item:getAimingPerkHitChanceModifier() or nil,
	}
end

function VFESuppressor(item, index, player, suppressor)
	local hotBar = getPlayerHotbar(player:getPlayerNum())
	local itemName = item:getFullType()
	local hasSuppressorSuffix = string.find(itemName, "sd") or string.find(itemName, "SD")

	local targetWeaponIndex
	local separateSuppressorType

	if hasSuppressorSuffix then
		targetWeaponIndex = index - 1
		separateSuppressorType = VFESuppressorSet[index + 1]
	else
		targetWeaponIndex = index + 1
		separateSuppressorType = VFESuppressorSet[index + 2]
	end

	local result = player:getInventory():AddItem(VFESuppressorSet[targetWeaponIndex])

	result:setCondition(item:getCondition())
	result:setHaveBeenRepaired(item:getHaveBeenRepaired())
	result:setBloodLevel(item:getBloodLevel())
	result:setFavorite(item:isFavorite())

	if item:haveChamber() and item:isRoundChambered() then
		result:setRoundChambered(true)
	end
	if item:isSpentRoundChambered() then
		result:setSpentRoundChambered(true)
	end
	if item:isJammed() then
		result:setJammed(true)
	end
	if item:isContainsClip() then
		result:setContainsClip(true)
	end
	result:setCurrentAmmoCount(item:getCurrentAmmoCount())
	result:setSpentRoundCount(item:getSpentRoundCount())
	result:setFireMode(item:getFireMode())

	local modData = result:getModData()
	for k, v in pairs(item:getModData()) do
		modData[k] = v
	end

	if modData.suppressor == nil then
		modData.suppressor = {}
	end

	local clip = item:getWeaponPart("Clip")
	local scope = item:getWeaponPart("Scope")
	local sling = item:getWeaponPart("Sling")
	local canon = item:getWeaponPart("Canon")
	local stock = item:getWeaponPart("Stock")
	local pad = item:getWeaponPart("RecoilPad")
	local JungleMag = item:getWeaponPart("JungleMag")
	local Bipod = item:getWeaponPart("Bipod")

	if scope then result:attachWeaponPart(scope) end
	if sling then result:attachWeaponPart(sling) end
	if canon then result:attachWeaponPart(canon) end
	if stock then result:attachWeaponPart(stock) end
	if pad then result:attachWeaponPart(pad) end
	if clip then result:attachWeaponPart(clip) end
	if JungleMag then result:attachWeaponPart(JungleMag) end
	if Bipod then result:attachWeaponPart(Bipod) end

	if hasSuppressorSuffix then
		if separateSuppressorType and separateSuppressorType ~= "NULL" then
			local newSuppressor = player:getInventory():AddItem(separateSuppressorType)

			if modData.suppressor.Condition then
				newSuppressor:setCondition(modData.suppressor.Condition)
			else
				newSuppressor:setCondition(item:getCondition())
			end

			if modData.suppressor.HaveBeenRepaired then
				newSuppressor:setHaveBeenRepaired(modData.suppressor.HaveBeenRepaired)
			end

			if modData.suppressor.Favorite then
				newSuppressor:setFavorite(modData.suppressor.Favorite)
			end

			newSuppressor:setBloodLevel(item:getBloodLevel())

			local suppressorModData = newSuppressor:getModData()
			if modData.suppressor.modData then
				for k, v in pairs(modData.suppressor.modData) do
					suppressorModData[k] = v
				end
			end

			local playerModData = player:getModData()
			if playerModData.suppressorHotbar and playerModData.suppressorHotbar.rifle == item then
				if not hotBar.attachedItems[playerModData.suppressorHotbar.slot] then
					hotBar:attachItem(
						newSuppressor,
						playerModData.suppressorHotbar.slotDef.attachments[newSuppressor:getAttachmentType()],
						playerModData.suppressorHotbar.slot,
						playerModData.suppressorHotbar.slotDef,
						true
					)
				end
				playerModData.suppressorHotbar = nil
			end

			modData.suppressor = {}
		end

		if modData.suppressor.baseModifier then
			modData.modifier = modData.suppressor.baseModifier
			modData.suppressor.baseModifier = nil
		else
			modData.modifier = nil
		end
	else
		if suppressor then
			if modData.modifier then
				modData.suppressor.baseModifier = modData.modifier
			end

			modData.suppressor.Condition = suppressor:getCondition()
			modData.suppressor.HaveBeenRepaired = suppressor:getHaveBeenRepaired()
			modData.suppressor.Favorite = suppressor:isFavorite()

			modData.suppressor.modData = {}
			for k, v in pairs(suppressor:getModData()) do
				modData.suppressor.modData[k] = v
			end

			if modData.suppressor.modData and modData.suppressor.modData.modifier then
				modData.modifier = modData.suppressor.modData.modifier
			end

			local playerModData = player:getModData()
			if hotBar:isInHotbar(suppressor) then
				playerModData.suppressorHotbar = {}
				playerModData.suppressorHotbar.rifle = result
				local suppressorSlot = suppressor:getAttachedSlot()
				playerModData.suppressorHotbar.slot = suppressorSlot
				playerModData.suppressorHotbar.slotDef = hotBar.availableSlot[suppressorSlot].def
				hotBar:removeItem(suppressor, false)
			else
				playerModData.suppressorHotbar = nil
			end

			player:getInventory():DoRemoveItem(suppressor)
		end
	end

	if hotBar:isInHotbar(item) then
		local itemSlot = item:getAttachedSlot()
		hotBar:removeItem(item, false)
		local slotDef = hotBar.availableSlot[itemSlot].def
		hotBar:attachItem(result, slotDef.attachments[result:getAttachmentType()], itemSlot, slotDef, false)

		hotBar.needsRefresh = true
		hotBar:update()
	end

	result:setAmmoType(item:getAmmoType())
	VFEAmmoMap.SaveAmmoFullType(result, result:getAmmoType():getItemKey())
	VFESetWeaponModel(result, false)
	VFESetWeaponIcon(result)

	player:getInventory():DoRemoveItem(item)
	player:setPrimaryHandItem(result)
	if result:isTwoHandWeapon() then
		player:setSecondaryHandItem(result)
	end

	if modData.modifier then
		SuppressorModifierRecalc(result)
	end
end

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
	local result = nil
	local seperateSuppressor = nil
	local suppressorName = ""

	if item:getSubCategory() == "Firearm" then
		if VFESuppressorSet[index + 2] ~= "NULL" then
			seperateSuppressor = VFESuppressorSet[index + 2]
		end
		result = player:getInventory():AddItem(VFESuppressorSet[index + 1])
	else
		if VFESuppressorSet[index + 1] ~= "NULL" then
			seperateSuppressor = VFESuppressorSet[index + 1]
		end
		result = player:getInventory():AddItem(VFESuppressorSet[index - 1])
	end

	result:setBloodLevel(item:getBloodLevel())
	result:setFavorite(item:isFavorite())

	local modData = result:getModData()
	for k, v in pairs(item:getModData()) do
		modData[k] = v
	end

	if modData.rifle == nil then
		modData.rifle = {}
	end
	if modData.suppressor == nil then
		modData.suppressor = {}
	end

	if item:getSubCategory() == "Firearm" then
		modData.rifle.Condition = item:getCondition()
		result:setCurrentAmmoCount(item:getCurrentAmmoCount())
		result:setSpentRoundCount(item:getSpentRoundCount())

		if (modData.modifier) then
			modData.rifle.modifier = modData.modifier
		end

		if result:haveChamber() and item:isRoundChambered() then
			result:setRoundChambered(true)
		end
		if item:getHaveBeenRepaired() then
			modData.rifle.HaveBeenRepaired = item:getHaveBeenRepaired()
		end
		if item:isRoundChambered() then
			modData.rifle.RoundChambered = true
		else
			modData.rifle.RoundChambered = false
		end
		if item:isSpentRoundChambered() then
			modData.rifle.SpentRoundChambered = true
		else
			modData.rifle.SpentRoundChambered = false
		end
		if item:isJammed() then
			modData.rifle.Jammed = true
		else
			modData.rifle.Jammed = false
		end
		if item:isContainsClip() then
			modData.rifle.ContainsClip = true
		else
			modData.rifle.ContainsClip = false
		end
		modData.rifle.CurrentAmmoCount = item:getCurrentAmmoCount()

		modData.rifle.FireMode = item:getFireMode()

		local clip = item:getWeaponPart("Clip")
		local scope = item:getWeaponPart("Scope")
		local sling = item:getWeaponPart("Sling")
		local canon = item:getWeaponPart("Canon")
		local stock = item:getWeaponPart("Stock")
		local pad = item:getWeaponPart("RecoilPad")
		local JungleMag = item:getWeaponPart("JungleMag")
		local Bipod = item:getWeaponPart("Bipod")

		if scope then
			result:attachWeaponPart(scope)
		end
		if sling then
			result:attachWeaponPart(sling)
		end
		if canon then
			result:attachWeaponPart(canon)
		end
		if stock then
			result:attachWeaponPart(stock)
		end
		if pad then
			result:attachWeaponPart(pad)
		end
		if clip then
			result:attachWeaponPart(clip)
		end
		if JungleMag then
			result:attachWeaponPart(JungleMag)
		end
		if Bipod then
			result:attachWeaponPart(Bipod)
		end

		if seperateSuppressor then
			result:setCondition(suppressor:getCondition())
			result:setHaveBeenRepaired(suppressor:getHaveBeenRepaired())

			modData.suppressor.modData = {}
			for k, v in pairs(suppressor:getModData()) do
				modData.suppressor.modData[k] = v
			end
			modData.suppressor.Favorite = suppressor:isFavorite()

			local playerModData = player:getModData()

			if hotBar:isInHotbar(suppressor) then -- hotbar
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
		else
			if modData.suppressor.Condition then
				result:setCondition(modData.suppressor.Condition)
			end
			if modData.suppressor.HaveBeenRepaired then
				result:setHaveBeenRepaired(modData.suppressor.HaveBeenRepaired)
			end
		end
		if (modData.suppressor.modifier) then
			modData.modifier = modData.suppressor.modifier
		else
			modData.modifier = nil
		end
	else
		if seperateSuppressor then
			local playerModData = player:getModData()
			local newSuppressor = player:getInventory():AddItem(seperateSuppressor)
			if modData.suppressor.Favorite then
				newSuppressor:setFavorite(modData.suppressor.Favorite)
			end
			local suppressorModData = newSuppressor:getModData() -- Mod Data
			if modData.suppressor.modData then
				for k, v in pairs(modData.suppressor.modData) do
					suppressorModData[k] = v
				end
			end
			modData.suppressor.modData = nil

			newSuppressor:setCondition(item:getCondition())
			newSuppressor:setHaveBeenRepaired(item:getHaveBeenRepaired())
			newSuppressor:setBloodLevel(item:getBloodLevel())
			if playerModData.suppressorHotbar then
				if not hotBar.attachedItems[playerModData.suppressorHotbar.slot] and playerModData.suppressorHotbar.rifle == item then
					hotBar:attachItem(newSuppressor,
						playerModData.suppressorHotbar.slotDef.attachments[newSuppressor:getAttachmentType()],
						playerModData.suppressorHotbar.slot, playerModData.suppressorHotbar.slotDef, true)
					playerModData.suppressorHotbar = nil
				else
					playerModData.suppressorHotbar = nil
				end
			end
		else
			modData.suppressor.Condition = item:getCondition()
			if modData.suppressor.HaveBeenRepaired then
				modData.suppressor.HaveBeenRepaired = item:getHaveBeenRepaired()
			end
		end
		if (modData.modifier) then
			modData.suppressor.modifier = modData.modifier
		end

		local clip = item:getWeaponPart("Clip")
		local scope = item:getWeaponPart("Scope")
		local sling = item:getWeaponPart("Sling")
		local canon = item:getWeaponPart("Canon")
		local stock = item:getWeaponPart("Stock")
		local pad = item:getWeaponPart("RecoilPad")
		local JungleMag = item:getWeaponPart("JungleMag")
		local Bipod = item:getWeaponPart("Bipod")

		if scope then
			result:attachWeaponPart(scope)
		end
		if sling then
			result:attachWeaponPart(sling)
		end
		if canon then
			result:attachWeaponPart(canon)
		end
		if stock then
			result:attachWeaponPart(stock)
		end
		if pad then
			result:attachWeaponPart(pad)
		end
		if clip then
			result:attachWeaponPart(clip)
		end
		if JungleMag then
			result:attachWeaponPart(JungleMag)
		end
		if Bipod then
			result:attachWeaponPart(Bipod)
		end

		if modData.rifle.Condition then
			result:setCondition(modData.rifle.Condition)
		end
		if modData.rifle.HaveBeenRepaired then
			result:setHaveBeenRepaired(modData.rifle.HaveBeenRepaired)
		end
		if modData.rifle.RoundChambered then
			result:setRoundChambered(true)
		end
		if modData.rifle.SpentRoundChambered then
			result:setSpentRoundChambered(true)
		end
		if modData.rifle.Jammed then
			result:setJammed(true)
		end
		if modData.rifle.ContainsClip then
			result:setContainsClip(true)
		end
		if modData.rifle.CurrentAmmoCount then
			result:setCurrentAmmoCount(modData.rifle.CurrentAmmoCount)
		end
		if modData.rifle.FireMode then
			result:setFireMode(modData.rifle.FireMode)
		end

		if (modData.rifle.modifier) then
			modData.modifier = modData.rifle.modifier
		else
			modData.modifier = nil
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

	VFESetWeaponModel(result, false)
	VFESetWeaponIcon(result)

	player:getInventory():DoRemoveItem(item)
	player:setPrimaryHandItem(result);
	if result:isTwoHandWeapon() then
		player:setSecondaryHandItem(result);
	end

	if (modData.modifier) then
		SuppressorModifierRecalc(result)
	end
end

local function manageMagazineAttachment(weapon)
	if not weapon then return end
	local Magazine = weapon:isContainsClip()
	local jungleMag = weapon:getWeaponPart('JungleMag')
	local coupled556 = jungleMag and
		(jungleMag:getFullType() == 'Base.Coupled556' or jungleMag:getFullType() == 'Base.Coupled556_Hidden')
	local coupled762 = jungleMag and
		(jungleMag:getFullType() == 'Base.Coupled762' or jungleMag:getFullType() == 'Base.Coupled762_Hidden')

	if Magazine then
		weapon:attachWeaponPart(instanceItem("MagazineAttachment"), true)
		if coupled556 then
			weapon:attachWeaponPart(instanceItem("Base.Coupled556"), true)
		end
		if coupled762 then
			weapon:attachWeaponPart(instanceItem("Base.Coupled762"), true)
		end
	end

	if not Magazine then
		weapon:detachWeaponPart(weapon:getWeaponPart("Clip"))
		if coupled556 then
			weapon:attachWeaponPart(instanceItem("Base.Coupled556_Hidden"), true)
		end
		if coupled762 then
			weapon:attachWeaponPart(instanceItem("Base.Coupled762_Hidden"), true)
		end
	end
end

local function magazineInitCheck()
	local weapon = getPlayer():getPrimaryHandItem()
	if not weapon then return end
	if weapon:isContainsClip() then
		weapon:attachWeaponPart(instanceItem("MagazineAttachment"), true)
	end
end

local ISInsertMagazine_complete = ISInsertMagazine.complete
function ISInsertMagazine:complete()
	manageMagazineAttachment(self.gun)
	ISInsertMagazine_complete(self)
end

local ISEjectMagazine_complete = ISEjectMagazine.complete
function ISEjectMagazine:complete()
	manageMagazineAttachment(self.gun)
	ISEjectMagazine_complete(self)
end

Events.OnEquipPrimary.Add(magazineInitCheck)

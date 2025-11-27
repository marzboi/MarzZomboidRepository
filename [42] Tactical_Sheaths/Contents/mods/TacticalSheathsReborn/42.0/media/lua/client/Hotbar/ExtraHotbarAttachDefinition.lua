require "Hotbar/ISHotbarAttachDefinition"
if not ISHotbarAttachDefinition then
	return
end

local KnifeSheathBack = {
	type = "KnifeSheathBack",
	name = "KnifeSheathBack",
	animset = "belt right",
	attachments = {
		Knife = "Knife in Sheath (Back)",
	},
}
table.insert(ISHotbarAttachDefinition, KnifeSheathBack);

local KnifeSheathLeg = {
	type = "KnifeSheathLeg",
	name = "KnifeSheathLeg",
	animset = "belt right",
	attachments = {
		Knife = "Knife in Sheath (Leg)",
	},
}
table.insert(ISHotbarAttachDefinition, KnifeSheathLeg);

local KatanaSheath = {
	type = "KatanaSheath",
	name = "KatanaSheath",
	animset = "back",
	attachments = {
		Katana = "Katana in Sheath (Back)",
	},
}
table.insert(ISHotbarAttachDefinition, KatanaSheath);

local KatanaSheathHip = {
	type = "KatanaSheathHip",
	name = "KatanaSheathHip",
	animset = "belt left",
	attachments = {
		Katana = "Katana in Sheath (Hip)",
	},
}
table.insert(ISHotbarAttachDefinition, KatanaSheathHip);

local KnifeSheathLeftLeg = {
	type = "KnifeSheathLeftLeg",
	name = "KnifeSheathLeftLeg",
	animset = "belt left",
	attachments = {
		Knife = "Knife in Left Sheath (Leg)",
	},
}
table.insert(ISHotbarAttachDefinition, KnifeSheathLeftLeg);

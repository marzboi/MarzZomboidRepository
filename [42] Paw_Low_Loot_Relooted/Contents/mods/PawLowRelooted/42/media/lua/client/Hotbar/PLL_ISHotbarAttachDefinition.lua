if not ISHotbarAttachDefinition then return end


local PLL_HolsterRight = {
	type = "PLLHolsterRight",
	name = "Military Right Holster",
	animset = "holster right",
	attachments = {
		Holster = "PLL Holster Right",
	},
}
table.insert(ISHotbarAttachDefinition, PLL_HolsterRight);

local PLL_HolsterLeft = {
	type = "PLLHolsterLeft",
	name = "Military Left Holster",
	animset = "holster left",
	attachments = {
		Holster = "PLL Holster Left",
	},
}
table.insert(ISHotbarAttachDefinition, PLL_HolsterLeft);

local HolsterRightThigh = {
	type = "HolsterRightThigh",
	name = "Tactical Holster",
	animset = "holster right",
	attachments = {
		Holster = "Holster Right Thigh",
	},
}

table.insert(ISHotbarAttachDefinition, HolsterRightThigh);

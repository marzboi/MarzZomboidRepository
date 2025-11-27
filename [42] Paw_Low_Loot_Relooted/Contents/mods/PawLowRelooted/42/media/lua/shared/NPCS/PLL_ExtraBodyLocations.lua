local AdditionalBodyLocations = {
    "Pupils",
    "Wig",
    "Belt419",
    "Belt420",
    "Belt421",
    "TorsoRig",
    "TorsoRig2",
    "waistbags",
    "waistbagsComplete",
    "waistbagsf",
    "Kneepads",
    "NeckPiece",
    "armbandas",
    "UpperArms",
    "LowerArms",
    "UpperLegs",
    "LowerLegs",
    "PLL Holster Right",
    "PLL Holster Left",
    "Shield in Lhand",
}

local group = BodyLocations.getGroup("Human")
for _, location in ipairs(AdditionalBodyLocations) do
    local bodyLocation = BodyLocation.new(group, location)
    group:getAllLocations():add(bodyLocation)
end

local AdditionalBodyLocations = {
    "KnifeSheathLeg",
    "KnifeSheathBack",
    "KnifeSheathLeftLeg",
    "KatanaSheath",
    "KatanaSheathHip",
}

local group = BodyLocations.getGroup("Human")
for _, location in ipairs(AdditionalBodyLocations) do
    local bodyLocation = BodyLocation.new(group, location)
    group:getAllLocations():add(bodyLocation)
end

if getActivatedMods():contains("\\PLLootRelooted") then
    group:setExclusive("KnifeSheathLeg", "PLL Holster Right")
    group:setExclusive("KnifeSheathLeftLeg", "PLL Holster Left")
end

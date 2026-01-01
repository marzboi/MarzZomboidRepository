require 'HBVCEF_Compatibility_Mods'
local function removeVanillaGunPowderRecipe()
    local recipe = getScriptManager():getCraftRecipe("GatherGunpowder")
    if recipe then
        recipe:getInputs():clear()
        recipe:getOutputs():clear()
        recipe:Load(recipe:getName(), [[
        {
            inputs
            {
                item 1 [Base.FakeGenericItem],
            }
            outputs
            {
                item 1 Base.FakeGenericItem,
            }
        }
        ]])
    end
end

Events.OnInitGlobalModData.Add(removeVanillaGunPowderRecipe)

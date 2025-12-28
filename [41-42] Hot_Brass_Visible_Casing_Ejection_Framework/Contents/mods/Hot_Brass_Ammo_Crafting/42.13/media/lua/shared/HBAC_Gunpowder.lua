Events.OnInitWorld.Add(function()
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
end)

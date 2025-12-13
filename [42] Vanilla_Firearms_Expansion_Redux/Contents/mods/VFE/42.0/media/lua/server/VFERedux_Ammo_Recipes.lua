--- Gonna remove vanilla cartons and use my condense carton recipe
Events.OnGameStart.Add(function()
    local recipe = getScriptManager():getCraftRecipe("PlaceBoxesOf556AmmoInCarton")
    if not recipe then return end
    recipe:getInputs():clear()

    local recipe = getScriptManager():getCraftRecipe("PlaceBoxesOf223AmmoInCarton")
    if not recipe then return end
    recipe:getInputs():clear()

    local recipe = getScriptManager():getCraftRecipe("PlaceBoxesOf308AmmoInCarton")
    if not recipe then return end
    recipe:getInputs():clear()

    local recipe = getScriptManager():getCraftRecipe("PlaceBoxesOf9mmBulletsInCarton")
    if not recipe then return end
    recipe:getInputs():clear()

    local recipe = getScriptManager():getCraftRecipe("PlaceBoxesOf45AutoBulletsInCarton")
    if not recipe then return end
    recipe:getInputs():clear()

    local recipe = getScriptManager():getCraftRecipe("PlaceBoxesOf38SpecialBulletsInCarton")
    if not recipe then return end
    recipe:getInputs():clear()

    local recipe = getScriptManager():getCraftRecipe("PlaceBoxesOf44MagnumBulletsInCarton")
    if not recipe then return end
    recipe:getInputs():clear()

    local recipe = getScriptManager():getCraftRecipe("PlaceBoxesOfShotgunShellsInCarton")
    if not recipe then return end
    recipe:getInputs():clear()
end)

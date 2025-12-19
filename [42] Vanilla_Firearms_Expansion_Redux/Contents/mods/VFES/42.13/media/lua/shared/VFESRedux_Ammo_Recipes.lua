Events.OnInitWorld.Add(function()
    -- Add new ammotypes to open box of 50 bullets
    local recipe = getScriptManager():getCraftRecipe("OpenBoxOfBullets50")
    if not recipe then return end
    recipe:Load(recipe:getName(), [[
    {
    itemMapper ammoTypes
        {
            Base.545Bullets = Base.545Box,
            Base.939Bullets = Base.939Box,
            Base.76254Bullets = Base.76254Box,
        }
    }
    ]]
    )

    -- Add new ammotypes to open cartons of boxes scripts
    local recipe = getScriptManager():getCraftRecipe("OpenCartonOfBullets")
    if not recipe then return end
    recipe:Load(recipe:getName(), [[
    {
    itemMapper ammoTypes
        {
            Base.545Box = Base.545Carton,
            Base.939Box = Base.939Carton,
            Base.76254Box = Base.76254Carton,
        }
    }
    ]]
    )

    -- Add new ammotypes to putting boxes in cartons
    local recipe = getScriptManager():getCraftRecipe("PlaceBoxesOfAmmoInCarton")
    if not recipe then return end
    recipe:Load(recipe:getName(), [[
    {
    itemMapper ammoTypes
        {
            Base.545Carton = Base.545Box,
            Base.939Carton = Base.939Box,
            Base.76254Carton = Base.76254Box,
        }
    }
    ]]
    )

    -- Add new ammotypes to put bullets in boxes scripts
    local recipe = getScriptManager():getCraftRecipe("place_ammo_in_box")
    if not recipe then return end
    recipe:Load(recipe:getName(), [[
    {
    itemMapper ammoType
        {
            Base.545Box = Base.545Bullets,
            Base.939Box = Base.939Bullets,
            Base.76254Box = Base.76254Bullets,
        }
    }
    ]]
    )

    -- Add new ammotypes to open pack of bullets
    local recipe = getScriptManager():getCraftRecipe("OpenPackOfAmmo")
    if not recipe then return end
    recipe:Load(recipe:getName(), [[
    {
    itemMapper ammoType
        {
            Base.545Box = Base.545Pack,
            Base.939Box = Base.939Pack,
            Base.76254Box = Base.76254Pack,
        }
    }
    ]]
    )

    -- Add new ammotypes to packing of ammo
    local recipe = getScriptManager():getCraftRecipe("PackBoxesAmmo")
    if not recipe then return end
    recipe:Load(recipe:getName(), [[
    {
    itemMapper ammoType
        {
            Base.545Pack = Base.545Box,
            Base.939Pack = Base.939Box,
            Base.76254Pack = Base.76254Box,
        }
    }
    ]]
    )

    -- Add new ammotypes to open case of bullets
    local recipe = getScriptManager():getCraftRecipe("OpenCaseOfAmmo")
    if not recipe then return end
    recipe:Load(recipe:getName(), [[
    {
    itemMapper ammoType
        {
            Base.545Pack = Base.545Case,
            Base.939Pack = Base.939Case,
            Base.76254Pack = Base.76254Case,
        }
    }
    ]]
    )

    -- Add new ammotypes to casing of ammo
    local recipe = getScriptManager():getCraftRecipe("CaseBoxesAmmo")
    if not recipe then return end
    recipe:Load(recipe:getName(), [[
    {
    itemMapper ammoType
        {
            Base.545Case = Base.545Pack,
            Base.939Case = Base.939Pack,
            Base.76254Case = Base.76254Pack,
        }
    }
    ]]
    )

    -- Add new ammotypes to open crate of bullets
    local recipe = getScriptManager():getCraftRecipe("OpenCrateOfAmmo")
    if not recipe then return end
    recipe:Load(recipe:getName(), [[
    {
    itemMapper ammoType
        {
            Base.545Case = Base.545Crate,
            Base.939Case = Base.939Crate,
            Base.76254Case = Base.76254Crate,
        }
    }
    ]]
    )

    -- Add new ammotypes to crating of ammo
    local recipe = getScriptManager():getCraftRecipe("CrateBoxesAmmo")
    if not recipe then return end
    recipe:Load(recipe:getName(), [[
    {
    itemMapper ammoType
        {
            Base.545Crate = Base.545Case,
            Base.939Crate = Base.939Case,
            Base.76254Crate = Base.76254Case,
        }
    }
    ]]
    )
end)

Events.OnInitWorld.Add(function()
    -- Add new ammoType to open box of 50 bullets
    local recipe = getScriptManager():getCraftRecipe("OpenBoxOf50Bullets")
    if not recipe then return end
    recipe:Load(recipe:getName(), [[
    {
    itemMapper ammoType
        {
            Base.57Bullets = Base.57Box,
            Base.46Bullets = Base.46Box,
        }
    }
    ]]
    )

    -- Add new ammoType to put bullets in boxes scripts
    local recipe = getScriptManager():getCraftRecipe("place50BulletsInBox")
    if not recipe then return end
    recipe:Load(recipe:getName(), [[
    {
    itemMapper ammoType
        {
            Base.57Box = Base.57Bullets,
            Base.46Box = Base.46Bullets,
        }
    }
    ]]
    )

    -- Add new ammoType to open cartons of boxes scripts
    local recipe = getScriptManager():getCraftRecipe("OpenCartonOfBoxesOfAmmo")
    if not recipe then return end
    recipe:Load(recipe:getName(), [[
    {
    itemMapper ammoType
        {
            Base.57Box = Base.57Carton,
            Base.46Box = Base.46Carton,
        }
    }
    ]]
    )

    -- Add new ammoType to putting boxes in cartons
    local recipe = getScriptManager():getCraftRecipe("PlaceBoxesOfAmmoInCarton")
    if not recipe then return end
    recipe:Load(recipe:getName(), [[
    {
    itemMapper ammoType
        {
            Base.57Carton = Base.57Box,
            Base.46Carton = Base.46Box,
        }
    }
    ]]
    )

    -- Add new ammoType to open pack of bullets
    local recipe = getScriptManager():getCraftRecipe("OpenPackOfAmmo")
    if not recipe then return end
    recipe:Load(recipe:getName(), [[
    {
    itemMapper ammoType
        {
            Base.57Box = Base.57Pack,
            Base.46Box = Base.46Pack,
        }
    }
    ]]
    )

    -- Add new ammoType to packing of ammo
    local recipe = getScriptManager():getCraftRecipe("PackBoxesAmmo")
    if not recipe then return end
    recipe:Load(recipe:getName(), [[
    {
    itemMapper ammoType
        {
            Base.57Pack = Base.57Box,
            Base.46Pack = Base.46Box,
        }
    }
    ]]
    )

    -- Add new ammoType to open case of bullets
    local recipe = getScriptManager():getCraftRecipe("OpenCaseOfAmmo")
    if not recipe then return end
    recipe:Load(recipe:getName(), [[
    {
    itemMapper ammoType
        {
            Base.57Pack = Base.57Case,
            Base.46Pack = Base.46Case,
        }
    }
    ]]
    )

    -- Add new ammoType to casing of ammo
    local recipe = getScriptManager():getCraftRecipe("CaseBoxesAmmo")
    if not recipe then return end
    recipe:Load(recipe:getName(), [[
    {
    itemMapper ammoType
        {
            Base.57Case = Base.57Pack,
            Base.46Case = Base.46Pack,
        }
    }
    ]]
    )

    -- Add new ammoType to open crate of bullets
    local recipe = getScriptManager():getCraftRecipe("OpenCrateOfAmmo")
    if not recipe then return end
    recipe:Load(recipe:getName(), [[
    {
    itemMapper ammoType
        {
            Base.57Case = Base.57Crate,
            Base.46Case = Base.46Crate,
        }
    }
    ]]
    )

    -- Add new ammoType to crating of ammo
    local recipe = getScriptManager():getCraftRecipe("CrateBoxesAmmo")
    if not recipe then return end
    recipe:Load(recipe:getName(), [[
    {
    itemMapper ammoType
        {
            Base.57Crate = Base.57Case,
            Base.46Crate = Base.46Case,
        }
    }
    ]]
    )
end)

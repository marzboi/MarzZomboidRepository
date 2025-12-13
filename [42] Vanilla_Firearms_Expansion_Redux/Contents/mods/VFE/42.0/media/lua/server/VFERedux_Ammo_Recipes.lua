--- Gonna remove vanilla cartons and use my condense carton recipe
local recipesToRemove = {
    "PlaceBoxesOf556AmmoInCarton",
    "PlaceBoxesOf223AmmoInCarton",
    "PlaceBoxesOf308AmmoInCarton",
    "PlaceBoxesOf9mmBulletsInCarton",
    "PlaceBoxesOf45AutoBulletsInCarton",
    "PlaceBoxesOf38SpecialBulletsInCarton",
    "PlaceBoxesOf44MagnumBulletsInCarton",
    "PlaceBoxesOfShotgunShellsInCarton"
}

-- Remove Individual Carton CraftRecipes
for i = 1, #recipesToRemove do
    local recipe = getScriptManager():getCraftRecipe(recipesToRemove[i])
    if recipe then
        recipe:getInputs():clear()
        recipe:getOutputs():clear()
        recipe:Load(recipe:getName(), [[
        {
            inputs
            {
                item 1 [Base.FakeItem],
            }
            outputs
            {
                item 1 Base.FakeItem,
            }
        }
        ]])
    end
end

-- Add new ammotypes to open box of 50 bullets
local recipe = getScriptManager():getCraftRecipe("OpenBoxOfBullets50")
if not recipe then return end
recipe:getInputs():clear()
recipe:Load(recipe:getName(), [[
    {
    inputs
        {
            item 1 [Base.Bullets9mmBox;Base.Bullets45Box;Base.Bullets38Box;Base.223Box;Base.556Box;Base.762Box;Base.22Box]
            mappers[ammoTypes]
            flags[Prop2;AllowFavorite;InheritFavorite],
        }
    }
    ]]
)
recipe:Load(recipe:getName(), [[
    {
    itemMapper ammoTypes
        {
            Base.762Bullets = Base.762Box,
            Base.22Bullets  = Base.22Box,
        }
    }
    ]])

-- Add new ammotypes to open cartons of boxes scripts
local recipe = getScriptManager():getCraftRecipe("OpenCartonOfBullets")
if not recipe then return end
recipe:getInputs():clear()
recipe:Load(recipe:getName(), [[
    {
    inputs
        {
            item 1 [Base.Bullets9mmCarton;Base.Bullets45Carton;Base.Bullets38Carton;Base.Bullets44Carton;Base.223Carton;Base.308Carton;Base.ShotgunShellsCarton;Base.556Carton;Base.762Carton;Base.22Carton]
            mappers[ammoTypes]
            flags[AllowFavorite;InheritFavorite],
        }
    }
    ]]
)
recipe:Load(recipe:getName(), [[
    {
        itemMapper ammoTypes
        {
            Base.762Box           = Base.762Carton,
            Base.22Box            = Base.22Carton,
        }
    }
    ]]
)

-- Add new ammotypes to put bullets in boxes scripts
local recipe = getScriptManager():getCraftRecipe("place_ammo_in_box")
if not recipe then return end
recipe:getInputs():clear()
recipe:Load(recipe:getName(), [[
    {
    inputs
        {
            item 20 [Base.Bullets44;Base.308Bullets;25:Base.ShotgunShells;50:Base.223Bullets;50:Base.556Bullets;50:Base.Bullets9mm;50:Base.Bullets45;50:Base.Bullets38;50:Base.762Bullets;50:Base.22Bullets]
            mappers[ammoType]
            flags[AllowFavorite;InheritFavorite;IsExclusive],
        }
    }
    ]]
)
recipe:Load(recipe:getName(), [[
    {
        itemMapper ammoType
        {
            Base.762Box           = Base.762Bullets,
            Base.22Box            = Base.22Bullets,
        }
    }
    ]]
)

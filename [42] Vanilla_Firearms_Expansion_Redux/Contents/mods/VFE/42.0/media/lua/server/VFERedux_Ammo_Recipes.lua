--- Gonna remove vanilla cartons and use my condense carton recipe
local recipesToRemove = {
    "PlaceBoxesOf556AmmoInCarton",
    "PlaceBoxesOf223AmmoInCarton",
    "PlaceBoxesOf308AmmoInCarton",
    "PlaceBoxesOf9mmBulletsInCarton",
    "PlaceBoxesOf45AutoBulletsInCarton",
    "PlaceBoxesOf38SpecialBulletsInCarton",
    "PlaceBoxesOf44MagnumBulletsInCarton",
    "PlaceBoxesOfShotgunShellsInCarton",
    "OpenBoxOfBullets20",
    "OpenBoxOfShotgunShells"
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
            item 1 tags[base:ammo] mappers[ammoTypes] flags[Prop2;AllowFavorite;InheritFavorite],
        }
    itemMapper ammoTypes
        {
            Base.Bullets44 = Base.Bullets44Box,
            Base.308Bullets = Base.308Box,
            Base.ShotgunShells = Base.ShotgunShellsBox,
            Base.762Bullets = Base.762Box,
            Base.22Bullets = Base.22Box,
        }
    }
    ]]
)

-- Add new ammotypes to open cartons of boxes scripts
local recipe = getScriptManager():getCraftRecipe("OpenCartonOfBullets")
if not recipe then return end
recipe:getInputs():clear()
recipe:Load(recipe:getName(), [[
    {
    inputs
        {
            item 1 tags[base:ammo] mappers[ammoTypes] flags[AllowFavorite;InheritFavorite],
        }
    itemMapper ammoTypes
        {
            Base.762Box = Base.762Carton,
            Base.22Box = Base.22Carton,
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
            item 50 tags[base:ammo] mappers[ammoType] flags[AllowFavorite;InheritFavorite;IsExclusive],
        }
    itemMapper ammoType
        {
            Base.762Box = Base.762Bullets,
            Base.22Box = Base.22Bullets,
        }
    }
    ]]
)

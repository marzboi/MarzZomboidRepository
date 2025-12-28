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

local function patchAmmoCraftingRecipes()
    local scriptManager = getScriptManager()

    local gatherGunpowderLightRecipe = scriptManager:getCraftRecipe("GatherGunpowderFromLightRounds")
    if gatherGunpowderLightRecipe then
        local recipeName = gatherGunpowderLightRecipe:getName()
        local projectileMappings = {}
        local casingMappings = {}

        if SpentCasingPhysics.VFE then
            table.insert(projectileMappings, "Base.22ProjectileBox = Base.22Bullets,")
            table.insert(casingMappings, "Base.22Bullets_Casing = Base.22Bullets,")
        end

        if SpentCasingPhysics.VFE93 then
            table.insert(projectileMappings, "Base.57ProjectileBox = Base.57Bullets,")
            table.insert(projectileMappings, "Base.46ProjectileBox = Base.46Bullets,")
            table.insert(casingMappings, "Base.57Bullets_Casing = Base.57Bullets,")
            table.insert(casingMappings, "Base.46Bullets_Casing = Base.46Bullets,")
        end

        if #projectileMappings > 0 then
            local recipeData = "{itemMapper projectile {" ..
                table.concat(projectileMappings, " ") ..
                "} itemMapper casing {" .. table.concat(casingMappings, " ") .. "}}"
            gatherGunpowderLightRecipe:Load(recipeName, recipeData)
        end
    end

    local gatherGunpowderMediumRecipe = scriptManager:getCraftRecipe("GatherGunpowderFromMediumRounds")
    if gatherGunpowderMediumRecipe then
        local recipeName = gatherGunpowderMediumRecipe:getName()
        local projectileMappings = {}
        local casingMappings = {}

        if SpentCasingPhysics.VFE then
            table.insert(projectileMappings, "Base.762ProjectileBox = Base.762Bullets,")
            table.insert(casingMappings, "Base.762Bullets_Casing = Base.762Bullets,")
        end

        if SpentCasingPhysics.VFES then
            table.insert(projectileMappings, "Base.545ProjectileBox = Base.545Bullets,")
            table.insert(projectileMappings, "Base.939ProjectileBox = Base.939Bullets,")
            table.insert(casingMappings, "Base.545Bullets_Casing = Base.545Bullets,")
            table.insert(casingMappings, "Base.939Bullets_Casing = Base.939Bullets,")
        end

        if #projectileMappings > 0 then
            local recipeData = "{itemMapper projectile {" ..
                table.concat(projectileMappings, " ") ..
                "} itemMapper casing {" .. table.concat(casingMappings, " ") .. "}}"
            gatherGunpowderMediumRecipe:Load(recipeName, recipeData)
        end
    end

    local gatherGunpowderHeavyRecipe = scriptManager:getCraftRecipe("GatherGunpowderFromHeavyRounds")
    if gatherGunpowderHeavyRecipe then
        local recipeName = gatherGunpowderHeavyRecipe:getName()
        local projectileMappings = {}
        local casingMappings = {}

        if SpentCasingPhysics.VFES then
            table.insert(projectileMappings, "Base.76254ProjectileBox = Base.76254Bullets,")
            table.insert(casingMappings, "Base.76254Bullets_Casing = Base.76254Bullets,")
        end

        if #projectileMappings > 0 then
            local recipeData = "{itemMapper projectile {" ..
                table.concat(projectileMappings, " ") ..
                "} itemMapper casing {" .. table.concat(casingMappings, " ") .. "}}"
            gatherGunpowderHeavyRecipe:Load(recipeName, recipeData)
        end
    end

    local makeLightRoundRecipe = scriptManager:getCraftRecipe("MakeLightRound")
    if makeLightRoundRecipe then
        local recipeName = makeLightRoundRecipe:getName()
        local ammoMappings = {}

        if SpentCasingPhysics.VFE then
            table.insert(ammoMappings, "Base.22Bullets = Base.22Bullets_Casing;Base.22ProjectileBox,")
        end

        if SpentCasingPhysics.VFE93 then
            table.insert(ammoMappings, "Base.57Bullets = Base.57Bullets_Casing;Base.57ProjectileBox,")
            table.insert(ammoMappings, "Base.46Bullets = Base.46Bullets_Casing;Base.46ProjectileBox,")
        end

        if #ammoMappings > 0 then
            local recipeData = "{itemMapper ammoType {" .. table.concat(ammoMappings, " ") .. "}}"
            makeLightRoundRecipe:Load(recipeName, recipeData)
        end
    end

    local makeMediumRoundRecipe = scriptManager:getCraftRecipe("MakeMediumRound")
    if makeMediumRoundRecipe then
        local recipeName = makeMediumRoundRecipe:getName()
        local ammoMappings = {}

        if SpentCasingPhysics.VFE then
            table.insert(ammoMappings, "Base.762Bullets = Base.762Bullets_Casing;Base.762ProjectileBox,")
        end

        if SpentCasingPhysics.VFES then
            table.insert(ammoMappings, "Base.545Bullets = Base.545Bullets_Casing;Base.545ProjectileBox,")
            table.insert(ammoMappings, "Base.939Bullets = Base.939Bullets_Casing;Base.939ProjectileBox,")
        end

        if #ammoMappings > 0 then
            local recipeData = "{itemMapper ammoType {" .. table.concat(ammoMappings, " ") .. "}}"
            makeMediumRoundRecipe:Load(recipeName, recipeData)
        end
    end

    local makeHeavyRoundRecipe = scriptManager:getCraftRecipe("MakeHeavyRound")
    if makeHeavyRoundRecipe then
        local recipeName = makeHeavyRoundRecipe:getName()
        local ammoMappings = {}

        if SpentCasingPhysics.VFES then
            table.insert(ammoMappings, "Base.76254Bullets = Base.76254Bullets_Casing;Base.76254ProjectileBox,")
        end

        if #ammoMappings > 0 then
            local recipeData = "{itemMapper ammoType {" .. table.concat(ammoMappings, " ") .. "}}"
            makeHeavyRoundRecipe:Load(recipeName, recipeData)
        end
    end
end

Events.OnInitGlobalModData.Add(removeVanillaGunPowderRecipe)
Events.OnInitGlobalModData.Add(patchAmmoCraftingRecipes)

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

        if SpentCasingPhysics.VFE then
            gatherGunpowderLightRecipe:Load(recipeName, [[{
            itemMapper projectile
            {Base.22ProjectileBox  = Base.22Bullets,}
            itemMapper casing
            {Base.22Bullets_Casing  = Base.22Bullets,}
            }]])
        end

        if SpentCasingPhysics.VFE93 then
            gatherGunpowderLightRecipe:Load(recipeName, [[{
            itemMapper projectile
            {Base.57ProjectileBox  = Base.57Bullets,
            Base.46ProjectileBox  = Base.46Bullets,}
            itemMapper casing
            {Base.57Bullets_Casing  = Base.57Bullets,
            Base.46Bullets_Casing  = Base.46Bullets,}
            }]])
        end
    end

    local gatherGunpowderMediumRecipe = scriptManager:getCraftRecipe("GatherGunpowderFromMediumRounds")
    if gatherGunpowderMediumRecipe then
        local recipeName = gatherGunpowderMediumRecipe:getName()

        if SpentCasingPhysics.VFE then
            gatherGunpowderMediumRecipe:Load(recipeName, [[{
            itemMapper projectile
            {Base.762ProjectileBox = Base.762Bullets,}
            itemMapper casing
            {Base.762Bullets_Casing = Base.762Bullets}
            }]])
        end

        if SpentCasingPhysics.VFES then
            gatherGunpowderMediumRecipe:Load(recipeName, [[{
            itemMapper projectile
            {Base.545ProjectileBox = Base.545Bullets,
            Base.939ProjectileBox = Base.939Bullets,}
            itemMapper casing
            {Base.545Bullets_Casing = Base.545Bullets,
            Base.939Bullets_Casing = Base.939Bullets,}
            }]])
        end
    end

    local gatherGunpowderHeavyRecipe = scriptManager:getCraftRecipe("GatherGunpowderFromHeavyRounds")
    if gatherGunpowderHeavyRecipe then
        local recipeName = gatherGunpowderHeavyRecipe:getName()

        if SpentCasingPhysics.VFES then
            gatherGunpowderHeavyRecipe:Load(recipeName, [[{
            itemMapper projectile
            {Base.76254ProjectileBox = Base.76254Bullets,}
            itemMapper casing
            {Base.76254Bullets_Casing = Base.76254Bullets,}
            }]])
        end
    end
end

Events.OnInitGlobalModData.Add(removeVanillaGunPowderRecipe)
Events.OnInitGlobalModData.Add(patchAmmoCraftingRecipes)

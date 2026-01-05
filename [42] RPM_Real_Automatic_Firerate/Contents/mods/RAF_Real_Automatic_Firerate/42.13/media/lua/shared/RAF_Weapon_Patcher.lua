require 'RAF_Compatibility_Mods'

local function Adjust(Name, Property, Value)
    local Item = ScriptManager.instance:getItem(Name)
    if not Item then return end
    Item:DoParam(Property .. " = " .. Value)
end

local function AddTagsToItem(weapon, tags)
    local weaponScript = ScriptManager.instance:getItem(weapon);

    if weaponScript then
        local weaponItem = instanceItem(weapon);
        local currentTags = weaponItem:getTags();
        local newList = {};

        for i, addValue in ipairs(type(tags) ~= "table" and { tags } or tags) do
            if not currentTags:contains(addValue) then
                table.insert(newList, addValue);
            end
        end

        if #newList > 0 then
            weaponScript:DoParam("Tags = " .. table.concat(newList, "; "));
        end
    end

    return weaponScript;
end


Events.OnInitWorld.Add(function()
    Adjust("Base.AssaultRifle", "FireModePossibilities", "Auto/Single/Burst")
    AddTagsToItem("Base.AssaultRifle", { "rpm:800", "burst:3" })

    if RAFEnabledMods.VFE then
        Adjust("Base.CAR15", "FireModePossibilities", "Auto/Single/Burst")
        Adjust("Base.CAR15Folded", "FireModePossibilities", "Auto/Single/Burst")
        Adjust("Base.CAR15D", "FireModePossibilities", "Auto/Single/Burst")
        Adjust("Base.CAR15DFolded", "FireModePossibilities", "Auto/Single/Burst")
        Adjust("Base.AssaultRifleMasterkey", "FireModePossibilities", "Auto/Single/Burst")

        Adjust("Base.MP5", "FireModePossibilities", "Auto/Single/Burst")
        Adjust("Base.MP5SD", "FireModePossibilities", "Auto/Single/Burst")
        Adjust("Base.MP5Unfolded", "FireModePossibilities", "Auto/Single/Burst")
        Adjust("Base.MP5Folded", "FireModePossibilities", "Auto/Single/Burst")
    end

    if RAFEnabledMods.VFES then
        Adjust("Base.HK416", "FireModePossibilities", "Auto/Single/Burst")
    end

    if RAFEnabledMods.VFE93 then
        Adjust("Base.scar17", "FireModePossibilities", "Auto/Single/Burst")
        Adjust("Base.M4A1", "FireModePossibilities", "Auto/Single/Burst")
        Adjust("Base.Block2", "FireModePossibilities", "Auto/Single/Burst")
        Adjust("Base.n418", "FireModePossibilities", "Auto/Single/Burst")
        Adjust("Base.n418sd", "FireModePossibilities", "Auto/Single/Burst")
    end

    if RAFEnabledMods.FIREARMS or RAFEnabledMods.FIREARMS_BETA then
        Adjust("Base.M4", "FireModePossibilities", "Auto/Single/Burst")
        AddTagsToItem("Base.M4", { "rpm:800", "burst:3" })
        Adjust("Base.MP5", "FireModePossibilities", "Auto/Single/Burst")
        AddTagsToItem("Base.MP5", { "rpm:800", "burst:2" })
        Adjust("Base.MP5SD", "FireModePossibilities", "Auto/Single/Burst")
        AddTagsToItem("Base.MP5SD", { "rpm:800", "burst:2" })
        Adjust("Base.MP510", "FireModePossibilities", "Auto/Single/Burst")
        AddTagsToItem("Base.MP510", { "rpm:800", "burst:2" })
    end

    if RAFEnabledMods.G93 then
        AddTagsToItem("Base.AR15", { "rpm:800", "burst:3" })
        AddTagsToItem("Base.HBAR", { "rpm:800", "burst:3" })
        AddTagsToItem("Base.CAR15", { "rpm:800", "burst:3" })
        AddTagsToItem("Base.Dissy", { "rpm:800", "burst:3" })
        AddTagsToItem("Base.M727", { "rpm:800", "burst:3" })
        AddTagsToItem("Base.M723", { "rpm:800", "burst:3" })
        AddTagsToItem("Base.M733", { "rpm:800", "burst:3" })
        AddTagsToItem("Base.M635", { "rpm:800", "burst:3" })
        AddTagsToItem("Base.M249", "rpm:750")
        AddTagsToItem("Base.M60", "rpm:550")
        AddTagsToItem("Base.AKM", "rpm:650")
        AddTagsToItem("Base.MP5", { "rpm:800", "burst:2" })
        AddTagsToItem("Base.M3GreaseGun", "rpm:300")
    end
end)

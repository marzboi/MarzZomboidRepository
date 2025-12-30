local function cyclicRatePatcher(player, weapon)
    if not weapon or not player then return end
    if weapon:getCategory() == "Weapon" and weapon:getSubCategory() == "Firearm" then
        if not weapon:isRanged() then
            return
        end
        weapon:setCyclicRateMultiplier(4.0)
    end
end

Events.OnEquipPrimary.Add(function(player, weapon) cyclicRatePatcher(player, weapon) end)

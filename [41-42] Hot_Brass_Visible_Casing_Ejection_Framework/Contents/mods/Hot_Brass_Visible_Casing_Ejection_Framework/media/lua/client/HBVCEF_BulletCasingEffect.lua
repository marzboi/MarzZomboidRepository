require "ISBaseObject"

SpentCasingPhysics = SpentCasingPhysics or {}

local function HBVCEF_onWeaponSwing(player, weapon)
    if not player or not weapon then return end

    if isClient() and player.isLocalPlayer and not player:isLocalPlayer() then
        return
    end

    local params = SpentCasingPhysics.WeaponEjectionPortParams
        and SpentCasingPhysics.WeaponEjectionPortParams[weapon:getFullType()]
    if not params then return end
    if params.manualEjection then return end

    if isClient() then
        sendClientCommand("HBVCEF", "spawnCasing", {
            weaponId = weapon:getID(),
        })
    else
        if SpentCasingPhysics.spawnCasing then
            SpentCasingPhysics.spawnCasing(player, weapon)
        end
    end
end

Events.OnWeaponSwing.Add(HBVCEF_onWeaponSwing)

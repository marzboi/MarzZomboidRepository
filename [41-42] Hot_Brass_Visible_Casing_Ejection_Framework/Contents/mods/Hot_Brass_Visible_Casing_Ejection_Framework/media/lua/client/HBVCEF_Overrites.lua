require "TimedActions/ISReloadWeaponAction"
require "TimedActions/ISRackFirearm"
local client = isClient()

------- Racking ---------------
local ISRackFirearm_removeBullets = ISRackFirearm.removeBullet
function ISRackFirearm:removeBullet()
    if self.gun:isManuallyRemoveSpentRounds() then
        ISRackFirearm_removeBullets(self)
    else
        self.emptyRack = false
    end
end

function ISRackFirearm:ejectSpentRounds()
    if self.gun:getSpentRoundCount() > 0 then
        for i = 1, self.gun:getSpentRoundCount() do
            if isClient() then
                sendClientCommand("HBVCEF", "rackCasing", {
                    weaponId = self.gun:getID(),
                    racking  = false,
                })
            else
                SpentCasingPhysics.rackCasing(self.character, self.gun, false)
            end
        end
        self.gun:setSpentRoundCount(0)
    elseif self.gun:isSpentRoundChambered() then
        self.gun:setSpentRoundChambered(false)
        self.ejectingSpentRound = true
        self.racking = false
    else
        return
    end
end

local ISRackFirearm_animEvent = ISRackFirearm.animEvent
function ISRackFirearm:animEvent(event, parameter)
    if event == 'ejectCasing' then
        if self.ejectingSpentRound then
            if client then
                sendClientCommand("HBVCEF", "rackCasing", {
                    weaponId = self.gun:getID(),
                    racking  = false,
                })
            else
                SpentCasingPhysics.rackCasing(self.character, self.gun, false)
            end
        end
        if self.racking and not self.emptyRack then
            if client then
                sendClientCommand("HBVCEF", "rackCasing", {
                    weaponId = self.gun:getID(),
                    racking  = true,
                })
            else
                SpentCasingPhysics.rackCasing(self.character, self.gun, true)
            end
        end
    end
    return ISRackFirearm_animEvent(self, event, parameter)
end

local old_new = ISRackFirearm.new
function ISRackFirearm:new(character, gun)
    local o = old_new(self, character, gun)
    o.ejectingSpentRound = false
    o.racking = true
    o.emptyRack = true
    return o
end

------- Reloading -------------
function ISReloadWeaponAction:ejectSpentRounds()
    if self.gun:getSpentRoundCount() > 0 then
        for i = 1, self.gun:getSpentRoundCount() do
            if client then
                sendClientCommand("HBVCEF", "rackCasing", {
                    weaponId = self.gun:getID(),
                    racking  = false,
                })
            else
                SpentCasingPhysics.rackCasing(self.character, self.gun, false)
            end
        end
        self.gun:setSpentRoundCount(0)
    elseif self.gun:isSpentRoundChambered() then
        self.gun:setSpentRoundChambered(false)
        if client then
            sendClientCommand("HBVCEF", "rackCasing", {
                weaponId = self.gun:getID(),
                racking  = false,
            })
        else
            SpentCasingPhysics.rackCasing(self.character, self.gun, false)
        end
    else
        return
    end
end

Events.OnWeaponSwingHitPoint.Remove(ISReloadWeaponAction.onShoot);

ISReloadWeaponAction.onShoot = function(player, weapon)
    if not weapon:isRanged() then return; end
    if getDebug() and getDebugOptions():getBoolean("Cheat.Player.UnlimitedAmmo") then
        return;
    end
    if weapon:haveChamber() then
        weapon:setRoundChambered(false);
    end
    if weapon:isRackAfterShoot() then
        if weapon:haveChamber() then
            weapon:setSpentRoundChambered(true);
        end
    else
        if weapon:getCurrentAmmoCount() >= weapon:getAmmoPerShoot() then
            if weapon:haveChamber() then
                weapon:setRoundChambered(true);
            end
            weapon:setCurrentAmmoCount(weapon:getCurrentAmmoCount() - weapon:getAmmoPerShoot())
        end
    end
    if weapon:isManuallyRemoveSpentRounds() then
        weapon:setSpentRoundCount(weapon:getSpentRoundCount() + weapon:getAmmoPerShoot())
    end
    if weapon:getCondition() < weapon:getConditionMax() and weapon:getJamGunChance() > 0 and weapon:getCurrentAmmoCount() > 0 then
        local baseJamChance = weapon:getJamGunChance();
        if baseJamChance == 0 then
            return;
        end
        baseJamChance = baseJamChance + ((weapon:getConditionMax() - weapon:getCondition()) / 4)
        if baseJamChance > 7 then
            baseJamChance = 7;
        end
        if ZombRand(100) < baseJamChance then
            weapon:setJammed(true);
        end
    end
end

Events.OnWeaponSwingHitPoint.Add(ISReloadWeaponAction.onShoot);

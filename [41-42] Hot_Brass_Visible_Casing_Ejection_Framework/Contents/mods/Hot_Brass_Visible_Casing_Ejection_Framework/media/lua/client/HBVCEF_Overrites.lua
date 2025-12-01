------- Racking ---------------
function ISRackFirearm:removeBullet()
    SpentCasingAnimSync.scheduleRack(self.character, self.gun, true)
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
        SpentCasingAnimSync.scheduleRack(self.character, self.gun, false)
    else
        return
    end
end

------- Reloading -------------
function ISReloadWeaponAction:ejectSpentRounds()
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
        SpentCasingAnimSync.scheduleRack(self.character, self.gun, false)
    else
        return
    end
end

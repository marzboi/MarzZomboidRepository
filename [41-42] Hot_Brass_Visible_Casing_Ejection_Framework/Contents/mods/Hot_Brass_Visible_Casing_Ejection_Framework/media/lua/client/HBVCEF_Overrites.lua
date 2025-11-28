------- Racking ---------------
function ISRackFirearm:removeBullet()
    SpentCasingAnimSync.scheduleRack(self.character, self.gun, true)
end

function ISRackFirearm:ejectSpentRounds()
    if self.gun:getSpentRoundCount() > 0 then
        for i = 1, self.gun:getSpentRoundCount() do
            SpentCasingPhysics.rackCasing(self.character, self.gun, false)
        end
        self.gun:setSpentRoundCount(0)
    elseif self.gun:isSpentRoundChambered() then
        self.gun:setSpentRoundChambered(false)
        SpentCasingAnimSync.scheduleRack(self.character, self.gun, false)
    else
        return
    end
    -- if self.gun:getShellFallSound() then
    --     self.character:getEmitter():playSound(self.gun:getShellFallSound())
    -- end
end

------- Reloading -------------
function ISReloadWeaponAction:ejectSpentRounds()
    if self.gun:getSpentRoundCount() > 0 then
        for i = 1, self.gun:getSpentRoundCount() do
            SpentCasingPhysics.rackCasing(self.character, self.gun, false)
        end
        self.gun:setSpentRoundCount(0)
    elseif self.gun:isSpentRoundChambered() then
        self.gun:setSpentRoundChambered(false)
        SpentCasingAnimSync.scheduleRack(self.character, self.gun, false)
    else
        return
    end
    -- if self.gun:getShellFallSound() then
    --     self.character:getEmitter():playSound(self.gun:getShellFallSound())
    -- end
end

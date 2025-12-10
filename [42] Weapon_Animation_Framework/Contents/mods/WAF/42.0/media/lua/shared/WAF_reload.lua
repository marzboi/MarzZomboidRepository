require "TimedActions/ISRackFirearm"

-- local rackBullet = ISRackFirearm.rackBullet

-- function ISRackFirearm:rackBullet()
--     rackBullet(self)
--     AnimationWeaponAction.animateWeaponFiring(self.character, self.gun, 10)
-- end

local ISRackFirearm_animEvent_old = ISRackFirearm.animEvent
function ISRackFirearm:animEvent(event, parameter)
    if event == 'playReloadSound' then
        if parameter == 'rack' then
            if self.gun:getRackSound() then
                AnimationWeaponAction.animateWeaponFiring(self.character, self.gun, 10)
            end
        end
    end
    return ISRackFirearm_animEvent_old(self, event, parameter)
end

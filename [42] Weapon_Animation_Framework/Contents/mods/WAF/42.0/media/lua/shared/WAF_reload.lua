require "TimedActions/ISRackFirearm"

local ISRackFirearm_animEvent_old = ISRackFirearm.animEvent
function ISRackFirearm:animEvent(event, parameter)
    if event == 'rackStart' then
        AnimationWeaponAction.rackStart(self.character, self.gun)
    end
    if event == 'rackEnd' then
        AnimationWeaponAction.rackEnd(self.character, self.gun)
    end
    return ISRackFirearm_animEvent_old(self, event, parameter)
end

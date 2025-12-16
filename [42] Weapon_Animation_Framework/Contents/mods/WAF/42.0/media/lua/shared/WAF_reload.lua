require "TimedActions/ISRackFirearm"

local ISRackFirearm_animEvent_old = ISRackFirearm.animEvent
function ISRackFirearm:animEvent(event, parameter)
    if event == 'rack00' then
        AnimationWeaponAction.rackAction(self.character, self.gun, 0)
    elseif event == 'rack10' then
        AnimationWeaponAction.rackAction(self.character, self.gun, 10)
    elseif event == 'rack20' then
        AnimationWeaponAction.rackAction(self.character, self.gun, 20)
    elseif event == 'rack30' then
        AnimationWeaponAction.rackAction(self.character, self.gun, 30)
    elseif event == 'rack40' then
        AnimationWeaponAction.rackAction(self.character, self.gun, 40)
    elseif event == 'rack50' then
        AnimationWeaponAction.rackAction(self.character, self.gun, 50)
    elseif event == 'rack60' then
        AnimationWeaponAction.rackAction(self.character, self.gun, 60)
    elseif event == 'rack70' then
        AnimationWeaponAction.rackAction(self.character, self.gun, 70)
    elseif event == 'rack80' then
        AnimationWeaponAction.rackAction(self.character, self.gun, 80)
    elseif event == 'rack90' then
        AnimationWeaponAction.rackAction(self.character, self.gun, 90)
    elseif event == 'rack100' then
        AnimationWeaponAction.rackAction(self.character, self.gun, 100)
    elseif event == 'rackDone' then
        AnimationWeaponAction.rackAction(self.character, self.gun)
    end
    return ISRackFirearm_animEvent_old(self, event, parameter)
end

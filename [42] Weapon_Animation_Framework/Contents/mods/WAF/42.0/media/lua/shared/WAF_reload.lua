require "TimedActions/ISRackFirearm"

local rackBullet = ISRackFirearm.rackBullet

function ISRackFirearm:rackBullet()
    rackBullet(self)
    AnimationWeaponAction.animateFiring(self.character, self.gun, 10)
end

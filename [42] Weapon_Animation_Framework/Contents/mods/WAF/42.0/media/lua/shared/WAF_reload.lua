require "TimedActions/ISRackFirearm"

local rackBullet = ISRackFirearm.rackBullet

function ISRackFirearm:rackBullet()
    rackBullet(self)
    AnimationWeaponAction.animateWeaponFiring(self.character, self.gun, 10)
end

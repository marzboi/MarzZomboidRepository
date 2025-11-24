require "TimedActions/ISBaseTimedAction"
AnimationFramework = ISBaseTimedAction:derive("ISSwitchLasetAction");

function AnimationFramework:animateWeaponFiring()
    if not self.weapon or not self.character then return end
    self.gun:attachWeaponPart(instanceItem("HammerAttachment_fired"), true)
    self:setOverrideHandModels(self.gun, nil)
end

function AnimationFramework.attachPart(player, weapon)
    if not weapon or not player then return end
    local weaponModel = ScriptManager.instance:getModelScript(weapon:getOriginalWeaponSprite())
    for i = 0, weaponModel:getAttachmentCount() - 1 do
        local partList = weaponModel:getAttachment(i)
        if partList:getId() == "hammer" then
            weapon:attachWeaponPart(instanceItem("HammerAttachment_unfired"), true)
        end
    end
end

function AnimationFramework:isValid()
    return true
end

function AnimationFramework:update()
end

function AnimationFramework:new(character, time, weapon)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.weapon = weapon
    o.character = character;
    o.stopOnWalk = true;
    o.stopOnRun = true;
    o.maxTime = time;
    return o;
end

Events.OnWeaponSwing.Add(AnimationFramework.animateWeaponFiring)
Events.OnEquipPrimary.Add(AnimationFramework.attachPart)

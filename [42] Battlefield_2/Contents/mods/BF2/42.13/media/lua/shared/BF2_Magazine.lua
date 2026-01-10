require "TimedActions/ISInsertMagazine"
require "TimedActions/ISEjectMagazine"

local function manageMagazineAttachment(weapon)
    if not weapon then return end
    local isMagazineIn = weapon:isContainsClip()
    local Magazine = weapon:getMagazineType()

    if isMagazineIn then
        weapon:attachWeaponPart(instanceItem("BF2.556Magazine"), true)
    end

    if not isMagazineIn then
        weapon:detachWeaponPart(weapon:getWeaponPart("Clip"))
    end
end

local ISInsertMagazine_complete = ISInsertMagazine.complete
function ISInsertMagazine:complete()
    manageMagazineAttachment(self.gun)
    return ISInsertMagazine_complete(self)
end

local ISEjectMagazine_complete = ISEjectMagazine.complete
function ISEjectMagazine:complete()
    manageMagazineAttachment(self.gun)
    return ISEjectMagazine_complete(self)
end

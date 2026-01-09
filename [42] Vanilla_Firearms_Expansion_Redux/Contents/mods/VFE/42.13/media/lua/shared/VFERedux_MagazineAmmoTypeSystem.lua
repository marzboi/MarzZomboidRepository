require "TimedActions/ISInsertMagazine"
require "TimedActions/ISEjectMagazine"
require "TimedActions/ISReloadWeaponAction"
require "TimedActions/ISBaseTimedAction"
require "TimedActions/ISUnloadBulletsFromMagazine"
require "TimedActions/ISReloadWeaponAction"

ISSwitchMagazineAmmoType = ISBaseTimedAction:derive("ISSwitchMagazineAmmoType")

VFEAmmoMap = VFEAmmoMap or {}
VFEAmmoMap.MOD_DATA_KEY = "VFEAmmoFullType"

VFEAmmoMap.AmmoGroups = VFEAmmoMap.AmmoGroups or {
    { "Base.556Bullets", "Base.223Bullets" },
}

VFEAmmoMap.GetAltAmmoTypes = function(ammoKey)
    for _, group in ipairs(VFEAmmoMap.AmmoGroups) do
        for _, ammo in ipairs(group) do
            if ammo == ammoKey then
                local alts = {}
                for _, alt in ipairs(group) do
                    if alt ~= ammoKey then
                        table.insert(alts, alt)
                    end
                end
                return alts
            end
        end
    end
    return nil
end

VFEAmmoMap.ItemFullTypeToAmmoType = VFEAmmoMap.ItemFullTypeToAmmoType or {
    ["Base.556Bullets"] = AmmoType.BULLETS_556,
    ["Base.223Bullets"] = AmmoType.BULLETS_223,
    ["Base.308Bullets"] = AmmoType.BULLETS_308,
}

function VFEAmmoMap.SaveAmmoFullType(item, ammoFullType)
    if not item or not ammoFullType then return end
    local itemModData = item:getModData()
    itemModData[VFEAmmoMap.MOD_DATA_KEY] = ammoFullType
end

function VFEAmmoMap.RestoreAmmoType(item)
    if not item then return end
    local itemModData = item:getModData()
    if not itemModData then return end

    local ammoFullType = itemModData[VFEAmmoMap.MOD_DATA_KEY]
    if not ammoFullType then return end

    local ammoEnum = VFEAmmoMap.ItemFullTypeToAmmoType[ammoFullType]
    if not ammoEnum then return end

    if item.getAmmoType and item:getAmmoType() ~= ammoEnum then
        item:setAmmoType(ammoEnum)
    end
end

ISReloadWeaponAction.SwitchAmmoType = function(item, ammoFullType)
    local ammoEnum = VFEAmmoMap.ItemFullTypeToAmmoType[ammoFullType]
    if not ammoEnum then return end

    item:setAmmoType(ammoEnum)
    VFEAmmoMap.SaveAmmoFullType(item, ammoFullType)
end

function ISInsertMagazine:loadAmmo()
    local gun = self.gun
    local mag = self.magazine
    local char = self.character

    local ammoChanged = (mag:getAmmoType() ~= gun:getAmmoType())

    if ammoChanged and gun:isRoundChambered() then
        local oldAmmoFullType = gun:getAmmoType() and gun:getAmmoType():getItemKey()
        if oldAmmoFullType then
            local roundItem = char:getInventory():AddItem(oldAmmoFullType)
            if isClient() and roundItem then
                sendAddItemToContainer(char:getInventory(), roundItem)
            end
        end

        if gun.setSpentRoundChambered then gun:setSpentRoundChambered(false) end
        if gun.setRoundChambered then gun:setRoundChambered(false) end
    end

    gun:setAmmoType(mag:getAmmoType())

    local gunAmmoFullType = mag:getAmmoType():getItemKey()
    VFEAmmoMap.SaveAmmoFullType(gun, gunAmmoFullType)

    char:getInventory():Remove(mag)
    char:removeFromHands(mag)

    gun:setCurrentAmmoCount(mag:getCurrentAmmoCount())
    gun:setContainsClip(true)
    char:clearVariable("isLoading")

    local canChamber = (not gun:isRoundChambered())
        and (gun:getCurrentAmmoCount() >= gun:getAmmoPerShoot())

    if ammoChanged and canChamber then
        ISTimedActionQueue.addAfter(self, ISRackFirearm:new(char, gun))
    elseif (not isServer() and not isClient()) and canChamber then
        ISTimedActionQueue.addAfter(self, ISRackFirearm:new(char, gun))
    end

    sendRemoveItemFromContainer(char:getInventory(), mag)
    syncHandWeaponFields(char, gun)
end

function ISEjectMagazine:unloadAmmo()
    if self.gun:isContainsClip() then
        local newMag = instanceItem(self.gun:getMagazineType())
        newMag:setCurrentAmmoCount(self.gun:getCurrentAmmoCount())
        newMag:setAmmoType(self.gun:getAmmoType())

        local magAmmoFullType = self.gun:getAmmoType():getItemKey()
        VFEAmmoMap.SaveAmmoFullType(newMag, magAmmoFullType)

        self.character:getInventory():AddItem(newMag)
        self.gun:setContainsClip(false)
        self.gun:setCurrentAmmoCount(0)

        sendAddItemToContainer(self.character:getInventory(), newMag)
        syncHandWeaponFields(self.character, self.gun)
    end
end

local function restoreContainer(container)
    if not container then return end
    local items = container:getItems()
    for i = 0, items:size() - 1 do
        local item = items:get(i)
        VFEAmmoMap.RestoreAmmoType(item)

        if item.getInventory and item:getInventory() then
            restoreContainer(item:getInventory())
        end
    end
end

local function restorePlayer(playerObj)
    if not playerObj then return end
    restoreContainer(playerObj:getInventory())
    VFEAmmoMap.RestoreAmmoType(playerObj:getPrimaryHandItem())
    VFEAmmoMap.RestoreAmmoType(playerObj:getSecondaryHandItem())
end

Events.OnGameStart.Add(function()
    for i = 0, getNumActivePlayers() - 1 do
        restorePlayer(getSpecificPlayer(i))
    end
end)

Events.OnCreatePlayer.Add(function(_, playerObj)
    restorePlayer(playerObj)
end)

function ISSwitchMagazineAmmoType:isValid()
    return self.magazine and self.magazine:getContainer() == self.character:getInventory()
end

function ISSwitchMagazineAmmoType:perform()
    ISReloadWeaponAction.SwitchAmmoType(self.magazine, self.ammoTypeFullType)
    ISBaseTimedAction.perform(self)
end

function ISSwitchMagazineAmmoType:new(character, magazine, ammoTypeFullType)
    local o = ISBaseTimedAction.new(self, character)
    o.character = character
    o.magazine = magazine
    o.ammoTypeFullType = ammoTypeFullType
    o.maxTime = 0
    return o
end

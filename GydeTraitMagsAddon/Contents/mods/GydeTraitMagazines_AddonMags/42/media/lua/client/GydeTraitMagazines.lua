local old_ISReadABookPerform = ISReadABook.perform
local old_isValid = ISReadABook.isValid

local sBvars = SandboxVars.GydeTraitMags
local sBvarsAddOn = SandboxVars.GydeTraitMagsAddon;

-- Im keeping this here for future references in regards to skills internal naming
-- {"Aiming", "Axe", "Blacksmith", "Blunt", "Butchering", "Carving", "Cooking", "Doctor", "Electricity", "Farming", "Fishing", "Fitness", "FlintKnapping", "Glassmaking", "Husbandry", "Lightfoot", "LongBlade", "Maintenance", "Masonry", "Mechanics", "MetalWelding", "Nimble", "PlantScavenging", "Pottery", "Reloading", "SmallBlade", "SmallBlunt", "Sneak", "Spear", "Sprinting", "Strength", "Tailoring", "Tracking", "Trapping", "Woodwork"}

-- Map magazines to their corresponding traits and skill bonuses
local magazineTraits = {
    ["Base.NutritionistMag"] = {
        trait = "Nutritionist",
        skills = {}
    },
    ["Base.OutdoorsmanMag"] = {
        trait = "Outdoorsman",
        skills = {}
    },
    ["Base.HandyMag"] = {
        trait = "Handy",
        skills = { Carpentry = 1, Maintenance = 1 }
    },
    ["Base.AxeManMag"] = {
        trait = "Axeman",
        skills = {}
    },
    ["Base.BurglarMag"] = {
        trait = "Burglar",
        skills = {}
    },
    ["Base.SpeedDemonMag"] = {
        positive = {
            trait = "SpeedDemon",
            skills = {}
        },
        negative = {
            trait = "SundayDriver",
            skills = {}
        }
    },
    ["Base.OrganizedMag"] = {
        positive = {
            trait = "Organized",
            skills = {}
        },
        negative = {
            trait = "Disorganized",
            skills = {}
        }
    },
    ["Base.FastLearnerMag"] = {
        positive = {
            trait = "FastLearner",
            skills = {}
        },
        negative = {
            trait = "SlowLearner",
            skills = {}
        }
    },
    ["Base.FastReaderMag"] = {
        positive = {
            trait = "FastReader",
            skills = {}
        },
        negative = {
            trait = "SlowReader",
            skills = {}
        }
    },
    ["Base.GracefulMag"] = {
        positive = {
            trait = "Graceful",
            skills = {}
        },
        negative = {
            trait = "Clumsy",
            skills = {}
        }
    },
    ["Base.DextrousMag"] = {
        positive = {
            trait = "Dextrous",
            skills = {}
        },
        negative = {
            trait = "AllThumbs",
            skills = {}
        }
    },
    ["Base.InconspicuousMag"] = {
        positive = {
            trait = "Inconspicuous",
            skills = {}
        },
        negative = {
            trait = "Conspicuous",
            skills = {}
        }
    },
    ["Base.KeenHearingMag"] = {
        positive = {
            trait = "KeenHearing",
            skills = {}
        },
        negative = {
            trait = "HardOfHearing",
            skills = {}
        }
    }
}

-- Add additional magazines
if magazineTraits then
    local magazineTraitsAddOn = {
        ["Base.ArtisanMag"] = {
            trait = "Artisan",
            skills = { Glassmaking = 1, Pottery = 1 }
        },
        ["Base.GardenerMag"] = {
            trait = "Gardener",
            skills = { Farming = 1 }
        },
        ["Base.MasonMag"] = {
            trait = "Mason",
            skills = { Masonry = 2 }
        },
        ["Base.AdrenalineJunkieMag"] = {
            trait = "AdrenalineJunkie",
            skills = {}
        },
        ["Base.BaseballPlayerMag"] = {
            trait = "BaseballPlayer",
            skills = { Blunt = 1 }
        },
        ["Base.HerbalistMag2"] = {
            trait = "Herbalist",
            skills = { PlantScavenging = 1 }
        },
        ["Base.SewerMag"] = {
            trait = "Sewer",
            skills = { Tailoring = 1 }
        },
        ["Base.WildernessKnowledgeMag"] = {
            trait = "WildernessKnowledge",
            skills = { Carving = 1, PlantScavenging = 1, FlintKnapping = 1, Maintenance = 1 }
        },
        ["Base.HunterMag"] = {
            trait = "Hunter",
            skills = { Aiming = 1, Reloading = 1, Trapping = 1 }
        },
    }

    for k, v in pairs(magazineTraitsAddOn) do
        magazineTraits[k] = v
    end
end


-- Helper Function: Check if the player can read a magazine.
local function CheckIfCanRead()
    if sBvars.DaysBeforeRead == 0 then return true end

    local player = getPlayer()
    local daysSurvived = player:getHoursSurvived() / 24

    return daysSurvived >= sBvars.DaysBeforeRead
end

-- Helper Function: Make character say something.
local function DisplayMessage(character, messageKey)
    if not character.hasDisplayedMessage then
        character:Say(getText(messageKey), 0.55, 0.55, 0.55, UIFont.Dialogue, 0, "default")
        character.hasDisplayedMessage = true
    end
end

-- Will level up skill to start of next level
local function AddSkillPoints(character, skills)
    local player = getPlayer()
    if player then
        player:Say("Adding Skill Points!")
    end

    if not character or not skills then return end
    print('Hello')
    local xp = character:getXp(); if not xp then return end
    local MAX_LEVEL = 10
    for skill, _ in pairs(skills) do
        local perk = Perks[skill]
        if perk then
            local cur = character:getPerkLevel(perk) or 0
            local target = math.min(cur + 1, MAX_LEVEL)
            if target > cur then
                xp:setXPToLevel(perk, target)
                if character.setPerkLevel then character:setPerkLevel(perk, target) end
            end
        end
    end
end

-- Override ISReadABook:isValid
function ISReadABook:isValid()
    local magazineType = self.item:getFullType()
    local traitData = magazineTraits[magazineType]

    if traitData and not CheckIfCanRead() then
        DisplayMessage(self.character, "IGUI_PlayerText_CantReadYet")
        return false
    end

    -- Special case for Deaf trait.
    if magazineType == "Base.KeenHearingMag" and self.character:getTraits():contains("Deaf") then
        if not self.hasDisplayedDeafMessage then
            local randomDeafMessageIndex = ZombRand(1, 4)
            local deafMessageKey = "IGUI_PlayerText_AmDeaf" .. tostring(randomDeafMessageIndex)
            self.character:Say(getText(deafMessageKey), 0.55, 0.55, 0.55, UIFont.Dialogue, 0, "default")
            self.hasDisplayedDeafMessage = true
        end
        return false
    end

    return old_isValid(self)
end

-- Override ISReadABook:perform
function ISReadABook:perform(...)
    local magazineType = self.item:getFullType()
    local traitData = magazineTraits[magazineType]

    if traitData then
        local traits = self.character:getTraits()
        local modData = self.character:getModData()

        if traitData.positive then
            -- Handle traits with counterparts
            if traits:contains(traitData.negative.trait) then
                modData["StartedWith" .. traitData.negative.trait] = true
                traits:remove(traitData.negative.trait)

                if sBvars.ReplaceTraits and not traits:contains(traitData.positive.trait) then
                    traits:add(traitData.positive.trait)
                    if sBvarsAddOn.AddExpPoints then
                        AddSkillPoints(self.character, traitData.skills)
                    end
                end
            elseif not traits:contains(traitData.positive.trait) then
                if not modData["StartedWith" .. traitData.negative.trait] or sBvars.ReplaceTraits then
                    traits:add(traitData.positive.trait)
                    if sBvarsAddOn.AddExpPoints then
                        AddSkillPoints(self.character, traitData.skills)
                    end
                end
            elseif sBvars.ReadRemove then
                traits:remove(traitData.positive.trait)
            end
        else
            -- Handle simple traits
            if not traits:contains(traitData.trait) then
                traits:add(traitData.trait)
                if sBvarsAddOn.AddExpPoints then
                    AddSkillPoints(self.character, traitData.skills)
                end
            elseif sBvars.ReadRemove then
                traits:remove(traitData.trait)
            end
        end
    end

    -- Delete the magazine after reading if enabled and it's from the mod.
    if sBvars.ReadDelete and magazineTraits[magazineType] then
        self.character:getInventory():Remove(self.item)
        return
    end

    print("GTM: old_ISReadABookPerform.")
    return old_ISReadABookPerform(self, ...)
end

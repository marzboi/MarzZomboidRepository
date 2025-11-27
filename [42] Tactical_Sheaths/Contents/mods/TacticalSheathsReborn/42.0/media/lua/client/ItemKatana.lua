local function updateKatana()
    if not ScriptManager.instance then return end

    local item = ScriptManager.instance:getItem("Base.Katana")
    if not item then return end

    item:DoParam("AttachmentType = Katana")
end

local function updateRainsKatana()
    if not ScriptManager.instance then return end

    local item = ScriptManager.instance:getItem("RainsToolsandBlades.KatanaB")
    if not item then return end

    item:DoParam("AttachmentType = Katana")
end

Events.OnGameBoot.Add(updateKatana)

if getActivatedMods():contains("\\B42RainsAxesAndBlades") then
    Events.OnGameBoot.Add(updateRainsKatana)
end

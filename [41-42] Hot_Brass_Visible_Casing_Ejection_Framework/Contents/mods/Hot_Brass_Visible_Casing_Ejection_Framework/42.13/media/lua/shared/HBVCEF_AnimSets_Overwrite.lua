local function HB_InitAnimVars(player)
    if not player then return end
    player:setVariable("HB_Racking", true)
end

Events.OnCreatePlayer.Add(function(_, player)
    HB_InitAnimVars(player)
end)

Events.OnGameStart.Add(function()
    HB_InitAnimVars(getPlayer())
end)

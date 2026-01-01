require 'ISUI/ISInventoryPaneContextMenu'

--Why does burst fire consumes 3 shots per ammo lol, even for racking. let me fix that here
ISInventoryPaneContextMenu.onChangefiremode = function(playerObj, weapon, newfiremode)
    weapon:setFireMode(newfiremode);
    playerObj:setFireMode(newfiremode)
end

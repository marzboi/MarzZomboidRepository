require 'ISUI/ISInventoryPaneContextMenu'

ISInventoryPaneContextMenu.onChangefiremode = function(playerObj, weapon, newfiremode)
    weapon:setFireMode(newfiremode);
    playerObj:setFireMode(newfiremode)
end

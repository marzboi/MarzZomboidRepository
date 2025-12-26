-- local KEY_INCREASE = Keyboard.KEY_NUMPAD8
-- local KEY_DECREASE = Keyboard.KEY_NUMPAD9
-- local STEP = 0.01

-- local function onKeyPressed(key)
--     if key ~= KEY_INCREASE and key ~= KEY_DECREASE then return end

--     local player = getPlayer()
--     if not player then return end

--     local weapon = player:getPrimaryHandItem()
--     if not weapon then
--         print("No item in primary hand")
--         return
--     end

--     if not instanceof(weapon, "HandWeapon") then
--         print("Item is not a weapon")
--         return
--     end

--     local current = weapon:getCyclicRateMultiplier()
--     local newValue = current

--     if key == KEY_INCREASE then
--         newValue = current + STEP
--     elseif key == KEY_DECREASE then
--         newValue = current - STEP
--     end

--     weapon:setCyclicRateMultiplier(newValue)

--     print(string.format(
--         "CyclicRateMultiplier: %.2f -> %.2f",
--         current,
--         newValue
--     ))
-- end

-- Events.OnKeyPressed.Add(onKeyPressed)

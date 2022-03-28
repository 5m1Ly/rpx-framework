Px = exports['px-base']:getTable()

local loaded, playerData, items = false, nil, nil

RegisterNetEvent('px-base:character:loaded', function()
	setUp()
end)

function setUp()

	playerData = Px.getPlayerData()

	while playerData == nil do
		Citizen.Wait(0)
	end

	mainLoop()

	SendNUIMessage({
		action = 'setup',
		items = playerData.data.items
	})

end

function openInv()

	playerData = Px.getPlayerData()

	while playerData == nil do
		Citizen.Wait(0)
	end

	SendNUIMessage({
		action = 'open',
		items = playerData.data.items
	})

end

-- function mainLoop()
-- 	loaded = true
	Citizen.CreateThread(function()
		while true do
			if IsDisabledControlReleased(0, 37) then
				-- tab
				openInv()
			elseif IsDisabledControlReleased(0, 157) then
				-- 1
			elseif IsDisabledControlReleased(0, 158) then
				-- 2
			elseif IsDisabledControlReleased(0, 160) then
				-- 3
			elseif IsDisabledControlReleased(0, 164) then
				-- 4
			elseif IsDisabledControlReleased(0, 165) then
				-- 5
			end
			Citizen.Wait(0)
		end
	end)
-- end
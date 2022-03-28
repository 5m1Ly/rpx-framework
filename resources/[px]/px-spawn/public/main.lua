Px = exports['px-base']:getTable()

RegisterNetEvent('px-spawn:spawn')
AddEventHandler('px-spawn:spawn', function()
	
	-- do stuff later on
	local pos = vector4(325.14959716797, -203.9727935791, 54.086261749268, 175.60536193848)
	Px.rule:teleport(pos)

	Citizen.SetTimeout(1000, function()
		TriggerEvent('px-base:character:loaded')
	end)

end)
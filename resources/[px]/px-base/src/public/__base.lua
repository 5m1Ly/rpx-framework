Px = {}

Px.cfg = cfg
Px.types = types
Px.vehicles = vehicles
Px.weapons = weapons
Px.items = items
Px.jobs = jobs

exports('getTable', function()
	return Px
end)

RegisterCommand('create', function()
	TriggerServerEvent('players:add')
end, false)

RegisterCommand('test', function()
	TriggerServerEvent('players:print')
end, false)
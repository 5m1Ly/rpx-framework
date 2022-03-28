Px = exports['px-base']:getTable()

function vec3()

    local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)

	SendNUIMessage({
		action = 'copy',
		string = string.format('vector3(%s, %s, %s)', coords.x, coords.y, coords.z)
	})

end

function vec4()

    local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)
	local heading = GetEntityHeading(ped)

	SendNUIMessage({
		action = 'copy',
		string = string.format('vector4(%s, %s, %s, %s)', coords.x, coords.y, coords.z, heading)
	})

end


RegisterCommand('copy-vec3', function()
	vec3()
end)

RegisterCommand('copy-vec4', function(source)
	vec4()
end)
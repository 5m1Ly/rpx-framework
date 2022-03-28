Px.rule = {
    data = {
        frozen = false,
        visable = {
            loc = true,
            net = true,
        },
        ghost = false,
        prevloc = nil
    }
}

function Px.getPlayerData()
	local retval = nil
	Px.triggerCallback('px-base:getPlayerData', function(data)
		retval = data
	end)
	while retval == nil do
		Citizen.Wait(0)
	end
	return retval
end

function Px.rule:teleport(pos)
	if type(pos) == 'vector3' then
		SetEntityCoords(GetPlayerPed(), pos, true, false, false, false)
	elseif type(pos) == 'vector4' then
		SetEntityCoords(GetPlayerPed(), pos.xyz, true, false, false, false)
		SetEntityHeading(GetPlayerPed(), pos.w)
	end
end

function Px.rule:freeze()
	Px.rule.data.frozen = not Px.rule.data.frozen
	FreezeEntityPosition(GetPlayerPed(), Px.rule.data.frozen)
end

function Px.rule:visable(client, server)
	local player = GetPlayerPed()
	Px.rule.data.visable.loc = client
	Px.rule.data.visable.net = server
	SetEntityVisible(player, Px.rule.data.visable.loc, 0)
	NetworkSetEntityInvisibleToNetwork(player, Px.rule.data.visable.net)
end

function Px.rule:camTeleport(pos, clientVis)
	if Px.rule.data.prevloc == nil then
		Px.rule.data.prevloc = GetEntityCoords(GetPlayerPed())
		clientVis = clientVis ~= nil and clientVis or false
		Px.rule:visable(clientVis, false) 
		Px.rule:teleport(pos)
		Px.rule:freeze()
	else
		Px.rule:teleport(Px.rule.data.prevloc)
		Px.rule.data.prevloc = nil
		clientVis = clientVis ~= nil and clientVis or true
		Px.rule:visable(clientVis, true)
		Px.rule:freeze()
	end
end

function Px.rule:setPedModel(model)
	local ped = Px.models:load(model)
	
end
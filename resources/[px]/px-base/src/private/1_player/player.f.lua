Px.players = {} -- table to store active players in memory
Px.player = {} -- table to store functions in memory

local highestTableIndex = nil

function getPlayersTableIndex()
	if #Px.players > 0 then
		local i = 1
		for key in pairs(Px.players) do
			if i == #Px.players then
				return key + 1
			else
				i = i + 1
			end
		end
	else
		return 1
	end
end

function Px.player:newTableIndex()
	local index = nil
	if #Px.players == 0 and highestTableIndex ~= nil then
		index = highestTableIndex + 1
	else
		index = getPlayersTableIndex()
	end
	while index == nil do
		Wait(0)
	end
    return index
end

function Px.player:new(src, name, cb)
    
    local i = Px.player:newTableIndex()
    
    Px.players[i] = Player:new({
		source = i,
		name = name
	})
	
    Wait(10)
	Px.players[i]:setIds(src)
	
    Wait(10)
	Px.players[i]:set()

    cb(Px.players[i])

end

function Px.player:remove(src, cb)

	if highestTableIndex == nil or src > highestTableIndex then
		highestTableIndex = src
	end

    if Px.players[src] ~= nil then

		local charSaved = false

        if Px.players[src].data ~= nil then
            charSaved = Px.players[src].data:check(Px.players[src].clientId, Px.players[src].data, true)
        end
		
		while not charSaved do
			Wait(0)
		end

		Px.players[src]:save()
    
	end

	Wait(10)

	Px.players[src] = nil

    cb()

end

function Px.player:getBySource(src)
	src = source or src
	if Px.players[src] ~= nil then
		return Px.players[src]
	end
end

function Px.player:getByClientId(clientId)
	for src, player in pairs(Px.players) do
		if player.clientId == clientId then
			return player
		end
	end
end

Px.createCallback('px-base:getPlayerData', function(src, cb)
	src = source or src
	cb(Px.player:getBySource(src))
end)
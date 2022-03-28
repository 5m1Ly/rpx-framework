Px.character = {}

function Px.character:login(src, ssn, info)
    
    src = source or src

	local clientId = Px.players[src].clientId
    Px.players[src].data = Character:new()
    
    local data = nil
    
    if ssn == nil and info ~= nil then 
		data = { 
			info = info 
		}
	else
        data = Px.players[src].data:fetch(clientId, ssn)
    end

    while data == nil do
        Wait(0)
    end

	local result = Px.players[src].data:check(clientId, data, true)

    while result == nil do
        Wait(0)
    end

	Px.players[src].characters = nil

	return result

end

function Px.character:logout(src)
    src = source or src
    Px.players[src].data = nil
end
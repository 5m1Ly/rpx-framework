AddEventHandler('playerConnecting', function(name, kick, defer)
    defer.defer()
    Px.pools:connect(name, kick, defer, source)
end)

AddEventHandler('playerJoined', function()

end)

AddEventHandler('playerDropped', function(reason)

	local src = source
	
    Px.player:remove(src, function()
        print('Player left, removed player from player table.')
    end)

end)
Px.pools = {
    d = nil
}


function Px.pools:msg(name, percentage, action)
    local bar, perc = Px.pools:perc(percentage)
    local message = string.format("Hallo %s, welkom bij 5 pixel.\n %s (%s, %s)", name, bar, perc, action)
    Px.pools.d.update(message)
end

function Px.pools:join()
    Px.pools.d.done()
    Px.pools.d = nil
end

function Px.pools:connect(name, kick, deferrals, src)

	src = source or src
    Wait(0)

    while Px.pools.d ~= nil do
        Wait(10)
    end

    Px.pools.d = deferrals

    Px.pools:msg(name, 10, 'Gegevens onvangen')
    Wait(500)

    Px.pools:msg(name, 20, 'Gegevens laden')
    Wait(500)

    Px.pools:msg(name, 30, 'Gegevens opslaan')
    Wait(500)

    Px.player:new(src, name, function(player)

        Px.pools:msg(name, 35, 'Gegeven opgeslagen')
        Wait(500)
        
        Px.pools:msg(name, 40, 'Identifiers controleren')
        Wait(500)
        
        Px.pools:msg(name, 45, 'Ban status controleren')
        Wait(500)
        
        Px.pools:msg(name, 50, 'Prio ophalen')
        Wait(500)
        
        Px.pools:msg(name, 60, 'Perms ophalen')
        Wait(500)
        
        Px.pools:msg(name, 70, 'Perms controleren')
        Wait(500)
        
        Px.pools:msg(name, 80, 'Karakters ophalen')
        Wait(500)
        
        Px.pools:msg(name, 90, 'Karakters ophalen')
        Wait(500)

        Px.pools:msg(name, 100, 'klaar...')
        Wait(500)

        Px.pools:join()

    end)

end
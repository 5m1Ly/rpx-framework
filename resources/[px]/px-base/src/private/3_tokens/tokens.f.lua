Px.tokens = {}

function Px.tokens:new(src)

    src = source or src

    local player = Px.players[src]

    Px.players[src].tokens = player.tokens ~= nil and player.tokens or Tokens:new({
        name = player.name,
        made = {}
    })

end

function Px.tokens:create(src, resource)

    src = source or src

    local tkn = nil

    Px.players[src].tokens:create(resource, function(token) tkn = token end)

    while tkn == nil do
        Wait(1)
    end

    return tkn

end

function Px.tokens:check(src, resource, token, refresh)

    src = source or src

    local success = nil
    local tkn = nil

    Px.players[src].tokens:check(resource, token, function(result)
        success = result
        tkn = (result == true and refresh == true) and Px.tokens:create(src, resource) or false
    end)

    while tkn == nil do
        Wait(1)
    end

    return success, tkn

end
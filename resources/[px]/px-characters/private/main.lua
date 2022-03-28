Px = exports['px-base']:getTable()

local resource = GetCurrentResourceName()

RegisterServerEvent('px-characters:getCharData')
AddEventHandler('px-characters:getCharData', function()
    local src = source
    Px.tokens:new(src)
    local token = Px.tokens:create(src, resource)
    local player = Px.player:getBySource(src)
    TriggerClientEvent('px-characters:setup', src, token, player.characters)
end)

RegisterServerEvent('px-characters:create')
AddEventHandler('px-characters:create', function(token, info)
    local src = source
    local success = Px.tokens:check(src, resource, token, false)
    if success then
        if Px.character:login(src, nil, info) then
			Px.debug(Px.player:getBySource(src))
			TriggerClientEvent('px-spawn:spawn', src)
		end
    end
end)

RegisterServerEvent('px-characters:login')
AddEventHandler('px-characters:login', function(token, ssn)
    local src = source
    local success = Px.tokens:check(src, resource, token, false)
    if success then
        if Px.character:login(src, ssn) then
			Px.debug(Px.player:getBySource(src))
			TriggerClientEvent('px-spawn:spawn', src)
		end
    end
end)
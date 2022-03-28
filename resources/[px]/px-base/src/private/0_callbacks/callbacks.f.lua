Px.callbacks = {}

function Px.createCallback(name, cb)
    Px.callbacks[name] = cb
end

function Px.triggerCallback(name, source, cb, ...)
    local src = source
    if Px.callbacks[name] then
        Px.callbacks[name](src, cb, ...)
    end
end

RegisterNetEvent('px-base:server:triggerCallback', function(name, ...)
    local src = source
    Px.triggerCallback(name, src, function(...)
        TriggerClientEvent('px-base:client:triggerCallback', src, name, ...)
    end, ...)
end)
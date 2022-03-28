Px.callbacks = {}

function Px.triggerCallback(name, cb, ...)
    Px.callbacks[name] = cb
    TriggerServerEvent('px-base:server:triggerCallback', name, ...)
end

RegisterNetEvent('px-base:client:triggerCallback', function(name, ...)
    if Px.callbacks[name] then
        Px.callbacks[name](...)
        Px.callbacks[name] = nil
    end
end)
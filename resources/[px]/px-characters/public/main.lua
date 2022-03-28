Px = exports['px-base']:getTable()

Px.cam:create(cfg.cam.name, cfg.cam.pos, cfg.cam.rot, cfg.cam.fov)

AddEventHandler('playerSpawned', function()
    Px.keys:toggle({ 'default' })
	preSetup()
end)

local last_token = nil
local characters = nil

function preSetup()
	last_token = nil
	characters = nil
	Px.cam:toggle(cfg.cam.name, cfg.pos)
    Px.keys:toggle({ 'movement', 'combat' })
	Px.skin:set('mp_m_freemode_01')
    TriggerServerEvent('px-characters:getCharData')
end

function onExit()
	Px.cam:toggle(cfg.cam.name)
    Px.keys:toggle({ 'movement', 'combat' })
end

RegisterNetEvent('px-characters:setup')
AddEventHandler('px-characters:setup', function(token, chars)
    last_token = token
    if chars[1] ~= nil then
		characters = chars
    else
		Px.skin:set('mp_m_freemode_01')
	end
end)

RegisterNUICallback('create', function(data)
    for i = 1, #data do
        if data[i] == nil then return end
    end
    local info = {
        firstname = data[1],
        lastname = data[2],
        nationality = data[3],
        birthdate = data[4],
        gender = data[5]
    }
    TriggerServerEvent('px-characters:create', last_token, info)
	onExit()
end)

RegisterCommand('newchar', function(source, args, rawCommand)
    local info = {
        firstname = 'Jhonnie',
        lastname = 'Flodder',
        nationality = 'Los Santos',
        birthdate = '31-08-1994',
        gender = 0
    }
    TriggerServerEvent('px-characters:create', last_token, info)
	onExit()
end)

RegisterCommand('select', function(source, args, rawCommand)
	local cid = tonumber(args[1])
	local selected = characters[cid]
	TriggerServerEvent('px-characters:login', last_token, selected.ssn)
	onExit()
end)

RegisterCommand('logout', function(source, args, rawCommand)
	preSetup()
end)
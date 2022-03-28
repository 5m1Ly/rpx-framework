-- player class
Player = {
	source = 0,
	name = "",
	clientId = "",
	characters = nil,
	data = nil
}

function Player:new(tbl)
	tbl = tbl or {}
	setmetatable(tbl, self)
	self.__index = self
	self.ids = {}
	return tbl
end

function Player:createId()
	local id = 'PXL'..Px.types:randomInt(4)..Px.types:randomStr(4)..Px.types:randomInt(4)..Px.types:randomStr(4)
	local result = exports.oxmysql:fetchSync('SELECT COUNT(*) AS count FROM players WHERE clientId = ?', { id })
	if result[1] ~= nil and result[1].count ~= 0 then
		return self:createId()
	else
		return id
	end
end

function Player:id(specified)
	if self.ids ~= nil then
		if specified ~= nil then
			local id = self.ids[specified]
			if id ~= nil then
				return id
			else
				print('Requested identifier ('..specified..') from player '..self.name..'but he dont have it')
			end
		else
			return self.ids
		end
	else
		-- drop player
		print('Player '..self.name..' doesnt have any identifiers')
	end
end

function Player:setIds(src)
	local identifiers = GetPlayerIdentifiers(src)
	for _, id in pairs(identifiers) do
        self.ids[Px.types:splitStr(id, ':')[1]] = Px.types:splitStr(id, ':')[2]
	end
end

function Player:fetchClientId()
	local retval = nil
	for k, v in pairs(self.ids) do
		local result = exports.oxmysql:fetchSync('SELECT clientId FROM players WHERE identifiers LIKE ?', { '%'..v..'%' })
		if result[1] ~= nil then
			retval = result[1].clientId
			break
		end
	end
	return retval
end

function Player:fetchChars(what)
	local retval = nil
	local result = exports.oxmysql:fetchSync('SELECT ssn, info FROM characters WHERE clientId = ?', { self.clientId })
	if result[1] ~= nil then
		retval = {}
		for cid, char in pairs(result) do
			local ins = { ssn = char.ssn, info = json.decode(char.info) }
			table.insert(retval, ins)
		end
	end
	return retval
end

function Player:set()
	local clientId = self:fetchClientId()
	self.clientId = clientId or self:createId()
	local chars = self:fetchChars()
    self.characters = chars or {}
	print('^2SUCCESS: Data set for player ^5'..self.name..'^2!^7')
end

function Player:save(cb)
	exports.oxmysql:insert('INSERT INTO players (name, clientId, identifiers) VALUES (:name, :clientId, :ids) ON DUPLICATE KEY UPDATE name = :name, identifiers = :ids', {
		name = self.name,
		clientId = self.clientId,
		ids = json.encode(self.ids),
	}, function(col)
		if col ~= nil then
			if col == 0 then
				print('^2SUCCESS: Saved player data (^5ssn: '..self.name..', clientId: '..self.clientId..'^2)!^7')
			else
				print('^2SUCCESS: Saved new player data (^5ssn: '..self.name..', clientId: '..self.clientId..', column: '..col..'^2)^7')
			end
		else
			print('^1ERROR: Not able to save player data (^5ssn: '..self.name..', clientId: '..self.clientId..'^1)^7')
		end
		if cb ~= nil and type(cb) == 'function' then cb() end
	end)
end
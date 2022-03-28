Tokens = {
	name = '',
	made = {}
}

function Tokens:brew(resource)
	local token = 'TKN'..Px.types:randomInt(2)..Px.types:randomStr(3)..Px.types:randomInt(1)..Px.types:randomStr(4)..Px.types:randomInt(3)
	table.insert(self.made[resource], token)
	return token
end

function Tokens:create(resource, cb)
	self.made[resource] = self.made[resource] or {}
	local token = self:brew(resource)
	while token == nil do
		Wait(0)
	end
	cb(token)
end

function Tokens:deleteAll(resource)
    for i = 1, #self.made[resource] do
        table.remove(self.made[resource], i)
    end
    print('^2removed all tokens for player ^5'..self.name..' ^2and resource ^5'..resource..'^2!^7')
end

function Tokens:delete(resource, token)
	local retval = nil
	local success = false
	if token ~= nil and type(token) == 'string' then
		for i = 1, #self.made[resource] do
			if self.made[resource][i] == token then
				table.remove(self.made[resource], i)
				retval = '^2removed token (^5'..token..'^2) for player ^5'..self.name..' ^2and resource ^5'..resource..'^2!^7'
				success = true
				break
            elseif i == #self.made[resource] then
                self:deleteAll(resource)
			end
		end
	else
        self:deleteAll(resource)
        retval = '^1Token (^5'..token..'^1) submited by ^5'..self.name..' ^1was not equal to a string!^7'
	end
	return retval, success
end

function Tokens:check(resource, token, cb)
	local success = false
	if self.made[resource] ~= nil then
		local info = ''
		info, success = self:delete(resource, token)
		Wait(50)
		info = info ~= nil and info or '^1Token (^5'..token..'^1) submited by ^5'..self.name..' ^1wasn\'t found! ^7(^4format: TKN00AAA0AAAA000^7)'
		print(info)
	end
	cb(success)
end

function Tokens:new(tbl)
	tbl = tbl or {}
	setmetatable(tbl, self)
	self.__index = self
	return tbl
end
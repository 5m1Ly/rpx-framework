-- player class
Character = {
	ssn = '',
	location = vector4(-1005.6795043945, -479.95294189453, 50.027164459229, 30.863929748535),
	info = {
		firstname = 'Jhon',
		lastname = 'Doe',
		nationality = 'Los Santos',
		birthdate = '01/01/2003',
		phone = '555-555-5555'
	},
	funds = {
		['cash'] = 25000,
		['bank'] = 75000
	},
	meta = {
		stats = {
			health = 200,
			armor = 0,
		},
		dna = {
			finger = '',
			hair = '',
			slime = '',
			blood = ''
		}
	},
	job = {
		id = 0,
		grade = 0,
		payment = 7.5,
		serial = ''
	},
	inv = {
		weight = 30000,
		slots = 30,
		items = {}
	},
	clothes = {},
	accessoires = {}
}

function Character:new(tbl)
	tbl = tbl or {}
	setmetatable(tbl, self)
	self.__index = self
	return tbl
end

-- extra functions
function Character:createSSN()
    local s = '-'
	local ssn = '555'..s..Px.types:randomInt(2)..s..Px.types:randomInt(4)
	local result = exports.oxmysql:fetchSync('SELECT COUNT(*) AS count FROM characters WHERE ssn = ?', { ssn })
	if result[1] ~= nil and result[1].count ~= 0 then
		return self:createSSN()
	else
		return ssn
	end
end

function Character:createId(_type)

	local col = ''
	local val = ''
	
	if _type == 'phone' then
		col = 'info'
		val = Px.types:randomInt(3)..'-555-'..Px.types:randomInt(4)
	elseif _type == 'finger' then
		col = 'meta'
		val = 'F'..Px.types:randomInt(2)..Px.types:randomStr(3)..Px.types:randomInt(2)..Px.types:randomStr(3)
	elseif _type == 'hair' then
		col = 'meta'
		val = 'H'..Px.types:randomInt(2)..Px.types:randomStr(3)..Px.types:randomInt(2)..Px.types:randomStr(3)
	elseif _type == 'slime' then
		col = 'meta'
		val = 'S'..Px.types:randomInt(2)..Px.types:randomStr(3)..Px.types:randomInt(2)..Px.types:randomStr(3)
	elseif _type == 'blood' then
		local bloodtypes = {
			"A+",
			"A-",
			"B+",
			"B-",
			"AB+",
			"AB-",
			"O+",
			"O-"
		}
		val = bloodtypes[math.random(1, #bloodtypes)]
	elseif _type == 'weapon_serial' then
		col = 'job'
		val = 'W'..Px.types:randomInt(1)..Px.types:randomStr(4)..Px.types:randomInt(2)..Px.types:randomStr(3)
	end

	if col ~= '' then
		local result = exports.oxmysql:fetchSync('SELECT COUNT(*) AS count FROM characters WHERE ? = ?', { col, val })
		if result[1] ~= nil and result[1].count ~= 0 then
			return self:createId(_type)
		else
			return val
		end
	else
		return val
	end

end

function Character:starterItems()
    
    local items = {}

    for slot, item in pairs(Px.cfg.starterItems) do
        
        local info = {}

        if item.name == 'card-id' then
            info = {
                { label = 'Naam: ', value = self.info.firstname..' '..self.info.lastname },
                { label = 'Nationaliteit: ', value = self.info.nationality },
                { label = 'Geboorte Datum: ', value = self.info.birthdate },
                { label = 'Social Security Nummer: ', value = self.ssn }
            }
        elseif item.name == 'card-drive' then
            info = {
                { label = 'Naam', value = self.info.firstname..' '..self.info.lastname },
                { label = 'Nationaliteit', value = self.info.nationality },
                { label = 'Geboorte Datum', value = self.info.birthdate },
                { label = 'Social Security Nummer', value = self.ssn },
                { label = 'Classes', value = 'M, C, B, A+, C CDL, B CDL, A CDL' }
            }
        end

		local add = { name = item.name, amount = item.amount, info = info }
	
        table.insert(items, add)

    end

    return items

end

-- basic functions
function Character:fetch(clientId, ssn)

	local data = nil

	local result = exports.oxmysql:fetchSync('SELECT * FROM characters WHERE ssn = ?', { ssn })
	if result[1] ~= nil then
		local pos = json.decode(result[1].location)
		result[1].location = vector4(pos.x, pos.y, pos.z, pos.w)
		result[1].info = json.decode(result[1].info)
		result[1].funds = json.decode(result[1].funds)
		result[1].meta = json.decode(result[1].meta)
		result[1].job = json.decode(result[1].job)
		result[1].inv = json.decode(result[1].inv)
		data = result[1]
	end

	while data == nil do
		Wait(0)		
	end

	return data

end

function Character:check(clientId, data, saveData)

	self.ssn                = data.ssn or self:createSSN()
	
	self.location           = data.location or self.location

	self.info.firstname     = data.info.firstname or self.info.firstname
	self.info.lastname      = data.info.lastname or self.info.lastname
	self.info.nationality   = data.info.nationality or self.info.nationality
	self.info.birthdate     = data.info.birthdate or self.info.birthdate
	self.info.phone         = data.info.phone or self:createId('phone')

	self.funds              = data.funds or self.funds

    self.meta               = data.meta or {
		stats = {},
		dna = {}
	}

	self.meta.stats.health  = (data.meta and data.meta.stats and data.meta.stats.health) ~= nil and data.meta.stats.health or 200
	self.meta.stats.armor   = (data.meta and data.meta.stats and data.meta.stats.armor) ~= nil and data.meta.stats.armor or 0
	
    self.meta.dna.finger    = (data.meta and data.meta.dna and data.meta.dna.finger) ~= nil and data.meta.dna.finger or self:createId('finger')
	self.meta.dna.hair      = (data.meta and data.meta.dna and data.meta.dna.hair) ~= nil and data.meta.dna.hair or self:createId('hair')
	self.meta.dna.slime     = (data.meta and data.meta.dna and data.meta.dna.slime) ~= nil and data.meta.dna.slime or self:createId('slime')
	self.meta.dna.blood     = (data.meta and data.meta.dna and data.meta.dna.blood) ~= nil and data.meta.dna.blood or self:createId('blood')

    self.job = {}
	self.job.id             = (data.job and data.job.id) ~= nil and data.job.id or 1
	self.job.grade          = (data.job and data.job.grade) ~= nil and data.job.grade or 1
	self.job.serial         = (data.job and data.job.serial) ~= nil and data.job.serial or self:createId('weapon_serial')
	self.job.payment        = (Px.jobs[self.job.id] and Px.jobs[self.job.id].grades and Px.jobs[self.job.id].grades[self.job.grade]) ~= nil and Px.jobs[self.job.id].grades[self.job.grade].payment or Px.jobs[1].grades[1].payment

    self.inv = {}
	self.inv.weight         = (data.inv and data.inv.weight) ~= nil and data.inv.weight or self.inv.weight
	self.inv.slots          = (data.inv and data.inv.slots) ~= nil and data.inv.slots or self.inv.slots
	self.inv.items          = (data.inv and data.inv.items) ~= nil and data.inv.items or self:starterItems()

	self.clothes = data.clothes or self.clothes
	self.accessoires = data.accessoires or self.accessoires

	-- remove default save
    local retval = false
	if saveData then
		self:save(clientId, function() retval = true end) -- save character data
		while not retval do
			Wait(1)
		end
	else
		retval = true
	end


    return retval -- returns boolean aftet character data has been saved

end

function Character:save(clientId, cb)
	exports.oxmysql:insert('INSERT INTO characters (clientId, ssn, location, info, funds, meta, job, inv) VALUES (:clientId, :ssn, :location, :info, :funds, :meta, :job, :inv) ON DUPLICATE KEY UPDATE location = :location, funds = :funds, meta = :meta, job = :job, inv = :inv', {
		clientId = clientId,
		ssn = self.ssn,
		location = json.encode(self.location),
		info = json.encode(self.info),
		funds = json.encode(self.funds),
		meta = json.encode(self.meta),
		job = json.encode(self.job),
		inv = json.encode(self.inv)
	}, function(col)
		if col ~= nil then
			if col == 0 then
				print('^2SUCCESS: saved character data (^5ssn: '..self.ssn..', clientId: '..clientId..'^2)!^7')
			else
				print('^2SUCCESS: saved new character data (^5ssn: '..self.ssn..', clientId: '..clientId..', column: '..col..'^2)^7')
			end
		else
			print('^1ERROR: not able to save character data (^5ssn: '..self.ssn..', clientId: '..clientId..'^2)^7')
		end
		if cb ~= nil and type(cb) == 'function' then cb() end
	end)
end
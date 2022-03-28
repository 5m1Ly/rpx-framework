Datatypes = {
    charset = {}
}

function Datatypes:new(tbl)

    tbl = tbl or {}
	setmetatable(tbl, self)
	self.__index = self

    for i = 65, 90 do table.insert(self.charset, string.char(i)) end
    for i = 97, 122 do table.insert(self.charset, string.char(i)) end

	return tbl

end

-- integer functions
function Datatypes:randomInt(length)
    if length > 0 then
        return self:randomInt(length - 1) .. math.random(0, 9)
    else
        return ''
    end
end

function Datatypes:numToDottedString(amount, decimal_length)
    local decimal = string.rep('%d', (decimal_length or 2))
    amount = string.gsub(tostring(amount), "^(-?%d+)("..decimal..")$", '%1,%2')
    while true do  
        amount, k = string.gsub(amount, '^(-?%d+)(%d%d%d)', '%1.%2')
        if (k == 0) then break end
    end
    return amount
end

-- string functions
function Datatypes:dottedStringToNum(str)
    while true do  
        str, k = string.gsub(str, "^(-?%d+)[%.%,](%d+)", '%1%2')
        if (k == 0) then break end
    end
    return str
end

function Datatypes:randomStr(length)
    if length > 0 then
        return self:randomStr(length - 1) .. self.charset[math.random(1, #self.charset)]
    else
        return ''
    end
end

function Datatypes:splitStr(str, delimiter)
	local result = {}
    local from = 1
    local delim_from, delim_to = string.find(str, delimiter, from)
	while delim_from do
		table.insert(result, string.sub(str, from, delim_from - 1))
		from = delim_to + 1
        delim_from, delim_to = string.find(str, delimiter, from)
	end
	table.insert(result, string.sub(str, from))
	return result
end

-- table functions
function Datatypes:findValueInTable(tbl, find)
    local found, key, value = false, nil, nil
    for k, v in pairs(tbl) do
        if v == find then
            found = true; key = k; value = v; break
        end
    end
    return found, key, value
end

types = Datatypes:new()
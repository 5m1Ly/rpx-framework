Component = {
    property_1 = 0,
    property_2 = '',
    property_3 = true,
    property_4 = {},
    property_5 = function() end
}

function Component:new(tbl)
	tbl = tbl or {}
	setmetatable(tbl, self)
	self.__index = self
	return tbl
end
Control = {
    keys = {},
    inControl = true
}

function Control:disable()
    self.inControl = false
    Citizen.CreateThread(function()
        while not self.inControl do
			self:loop()
            Wait(0)
        end
    end)
end

function Control:loop()
	for i = 1, #self.keys do
		DisableControlAction(2, self.keys[i], true)
	end
end

function Control:enable()
    self.inControl = true
end

function Control:new(tbl)
	tbl = tbl or {}
	setmetatable(tbl, self)
	self.__index = self
	return tbl
end
Px.models = {
	loaded = {}
}

function Px.models:load(name)
	local model = type(name) == 'number' and name or GetHashKey(name)
	RequestModel(model)
	while not HasModelLoaded(model) do
		RequestModel(model)
		Citizen.Wait(0)
	end
	table.insert(Px.models.loaded, model)
	return #Px.models.loaded, model
end

function Px.models:unload(model)
	SetModelAsNoLongerNeeded(model)
	local found, key, value = Px.types:findValueInTable(Px.models.loaded, model)
	while found == nil do
		Citizen.Wait(0)
	end
	if key ~= nil then table.remove(Px.models.loaded, key) end
	return found
end
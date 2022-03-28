Px.cast = {}
Px.cast.types = {
	'EXTRASUNNY'
}
Px.cast.cycles = {
	'default',
	'hud_def_blur'
}

function Px.cast:time(time)
	time = (time and time.x and time.y and time.z) ~= nil and time or vector3(12, 0, 0)
	NetworkOverrideClockTime(time)
end

function Px.cast:cycle(cycle)
	cycle = (type(cycle) == 'string' and cycle) or type(cycle) == 'number' and Px.cast.cycles[cycle] or Px.cast.cycles[1]
	SetTimecycleModifier(cycle)
	SetTimecycleModifierStrength(1.0)
end

function Px.cast:weather(cat)
	cat = (type(cat) == 'string' and cat) or type(cat) == 'number' and Px.cast.types[cat] or Px.cast.types[1]
	SetWeatherTypePersist(cat)
	SetWeatherTypeNow(cat)
	SetWeatherTypeNowPersist(cat)
end

function Px.cast:rain(intensity)
	SetRainFxIntensity(intensity) -- intensity number (0.0)
end



Px.cam = {}
Px.cam.set = {}

function Px.cam:create(name, pos, rot, fov)
	if name ~= (nil or '') then
		if Px.cam.set[name] == nil then
			pos = type(pos) == 'vector3'	and pos		or vector3(0.0, 0.0, 0.0)
			rot = type(rot) == 'vector3'	and rot		or vector3(0.0, 0.0, 0.0)
			fov = type(fov) == 'number'		and fov		or 90.0
			Px.cam.set[name] = {
				cam = CreateCamWithParams('DEFAULT_SCRIPTED_CAMERA', pos, rot, fov, false, 0),
				pos = pos,
			}
			SetCamActive(Px.cam.set[name].cam, false)
		else
			print('camera with the name '..name..' already exist cant create...')
		end
	else
		print('camera can\'t be created without a proper name...')
	end
end

function Px.cam:toggle(name, pos)
	local info = Px.cam.set[name]
	if info.cam ~= nil then
		local active = not IsCamActive(info.cam)
		local tp = vector3(info.pos.xy, (info.pos.z + 30))
		if pos ~= nil then
			tp = pos
			Px.rule:camTeleport(tp, true)
		else
			Px.rule:camTeleport(tp, false)
		end
		if not active then
			ClearFocus()
		else
			SetFocusPosAndVel(info.pos, 0.0, 0.0, 0.0)
		end
		SetCamActive(info.cam, active)
		RenderScriptCams(active, false, 1.0, false, false)
	else
		print('camera with the name '..name..' doesn\'t exist cant activate...')
	end
end
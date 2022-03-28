local function length(tbl)

	local ret = 0

	for k, v in pairs(tbl) do
		ret = ret + 1
	end

	return ret

end

local function printTable(tbl, indent)

    indent = indent or 0

	for k, v in pairs(tbl) do

		local _type = type(v)
		local tabs = string.rep("    ", indent)
        local key = ("%s^3%s^0"):format(tabs, k)

        if _type == "table" then

			local length = length(v)
			if length > 0 then

				print(("%s^3 (^5#%d^3): ^4{^0"):format(key, length))
				printTable(v, indent + 1)
				print(("%s^4}^0"):format(tabs))

			else

				print(("%s^3: ^1{ !!empty table!! }^0"):format(key))

			end

        elseif _type == 'boolean' then
            print(("%s^3:^1 %s ^0"):format(key, v))
        elseif _type == "function" then
            print(("%s^3:^9 %s ^0"):format(key, v))
        elseif _type == 'number' then
            print(("%s^3:^5 %s ^0"):format(key, v))
        elseif _type == 'string' then
            print(("%s^3:^2 '%s' ^0"):format(key, v))
        else
            print(("%s^3:^2 %s ^0"):format(key, v))
        end
    
	end

end

RegisterServerEvent('px-base:debug', function(table, indent)
    
	local resource = GetInvokingResource() or "px-base"

    print('\b\b\x1b[36m:debug]\x1b[0m')

    printTable(table, indent)

    print('\b\b\x1b[36m:debug]\x1b[0m')

end)

function Px.debug(table, indent)
    TriggerEvent('px-base:debug', table, indent)
end

function Px.error(resource, msg)
    print('\b\b\x1b[31m:error]\x1b[0m '..msg)
end

function Px.success(resource, msg)
    print('\b\b\x1b[32m:log]\x1b[0m '..msg)
end
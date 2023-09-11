api = api or class({})

local baseUrl = "https://dota2skirmish.com/api/"
local timeout = 5000
CUSTOM_GAME_TYPE = "Skirmish"

function api:GetUrl(endpoint)
	local url = baseUrl
	local ret = url..endpoint
	print("URL:", ret)

	return ret
end

function api:Request(endpoint, okCallback, failCallback, method, payload)
	print(endpoint)
	print(okCallback)
	print(failCallback)
	print(method)
	print(payload)
	if okCallback == nil then
		okCallback = function()
		end
	end

	if failCallback == nil then
		failCallback = function()
		end
	end

	if method == nil then
		method = "GET"
	end

	local request = CreateHTTPRequestScriptVM(method, self:GetUrl(endpoint))

	if request == nil then
		print("Failed to create http request. skipping")
		return failCallback();
	end

	request:SetHTTPRequestAbsoluteTimeoutMS(timeout)

	local header_key = nil

	if IsDedicatedServer() then
		header_key = GetDedicatedServerKeyV2("dotabackend_api")
	else
		local key = LoadKeyValues("scripts/vscripts/components/api/backend_key.kv")

		if key then
			header_key = key.server_key
		end
	end

	print(header_key)
	-- TODO fix
	--CustomNetTables:SetTableValue("game_options", "server_key", {header_key})

	request:SetHTTPRequestHeaderValue("X-Dota-Server-Key", header_key)
	request:SetHTTPRequestHeaderValue("X-Dota-Game-Type", CUSTOM_GAME_TYPE)

	-- encode payload
	-- print(payload)
	if payload ~= nil then
		local encoded = json.encode(payload)
		request:SetHTTPRequestRawPostBody("application/json", encoded)
	end

	print("About to send request...")
	request:Send(function(result)
		print(result)
		local code = result.StatusCode;
		print("Result status code:", code)

		local fail = function(message)
			if (code == nil) then
				code = 0
			end
			print("Request to " .. endpoint .. " failed with message " .. message .. " (" .. tostring(code) .. ")")
			failCallback();
		end

		if code == 0 then
			return fail("Request timeout")
		elseif code >= 500 then
			return fail("Server Error")
		elseif code == 204 then
			return okCallback();
		else
			local obj, pos, err = json.decode(result.Body)

			if err then
				return fail("Json error: " .. tostring(err))
			end

			if obj == nil then
				return fail("Unknown Server error")
			end

			if obj.error ~= nil and obj.error ~= "" then
				return fail(object.error)
			end
			-- TODO object error handling
			if code >= 200 and code < 400 then
				return okCallback(obj);
			else
				return fail("Wtf")
			end
		end
	end)
end
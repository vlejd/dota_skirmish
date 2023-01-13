if Util == nil then
	Util = class({})
end


function DisplayError(playerID, message)
	local player = PlayerResource:GetPlayer(playerID)
	if player then
		CustomGameEventManager:Send_ServerToPlayer(player, "CreateIngameErrorMessage", {
			message = message
		})
	end
end

function tablelength(T)
	local count = 0
	for _ in pairs(T) do
		count = count + 1
	end
	return count
end

function sqr(a)
	return a * a;
end

function dist2(a, b)
	return sqr(a.x - b.x) + sqr(a.y - b.y);
end

function getRandomValueFromArray(myArray)
	local val = myArray[RandomInt(1, #myArray)]
	return val
end


function Util:fixPosition(poz)
	print("fixPosition")
	print(type(poz))
	print(poz)
	if type(poz) == "userdata" then  -- hope this is Vector
		print("udata")
		return poz
	end
	if type(poz) == "table" then
		print("table")
		if poz["0"] then
			if tablelength(poz) == 2 then
				return Vector(poz["0"], poz["1"])
			elseif tablelength(poz) == 3 then
				return Vector(poz["0"], poz["1"], poz["2"])
			else
				print("ERROR invalid vector")
				return Vector(100,100)
			end
		else
			if tablelength(poz) == 2 then
				return Vector(poz[1], poz[2])
			elseif tablelength(poz) == 3 then
				return Vector(poz[1], poz[2], poz[3])
			else
				print("ERROR invalid vector")
				return Vector(100,100)
			end
		end
		
	end
end
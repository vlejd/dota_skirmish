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

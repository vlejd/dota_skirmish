local GameState

if GameReader == nil then
	GameReader = class({})
end

function GameReader:Init(fname)
	print("GameReader Init from fname", fname)
	GameState = require(fname)
end

function GameReader:InitObject(obj)
	print("GameReader Init from obj", obj.game)
	print(obj)
	GameState = obj
end


function GameReader:GetGameInfo()
	if GameState.game then
		return GameState.game
	else
		print("ERROR: Missing game info.")
	end
end

function GameReader:GetGameTime()
	if GameReader:GetGameInfo() then
		if GameReader:GetGameInfo().time then
			return GameReader:GetGameInfo().time
		else
			print("ERROR: Missing game time.")
		end
	else
		print("ERROR: Missing game info.")
	end
end

function GameReader:GetWinCondition()
	if GameState.wincon ~= nil and tablelength(GameState.wincon) > 0 then
		return GameState.wincon
	else
		print("ERROR: Missing win condition.")
		return nil
	end
end

function GameReader:GetWinTimeCondition()
	if GameReader:GetWinCondition() then
		if GameReader:GetWinCondition()["time"] then
			return GameReader:GetWinCondition()["time"]
		else
			print("ERROR: Missing win time condition.")
		end
	else
		print("ERROR: Missing win condition.")
	end
end

function GameReader:GetDefaultWinner()
	if GameReader:GetWinCondition() then
		if GameReader:GetWinCondition()["default_winner"] then
			return GameReader:GetWinCondition()["default_winner"]
		else
			print("ERROR: Missing default winner.")
		end
	else
		print("ERROR: Missing win condition.")
	end
end

function GameReader:GetNeutralItemsInfo()
	if GameState.neutrals then
		return GameState.neutrals
	else
		print("ERROR: Missing neutral items info.")
	end
end

function GameReader:GetRadiantNeutralItemsInfo()
	if GameReader:GetNeutralItemsInfo() then
		if GameReader:GetNeutralItemsInfo()["good"] then
			return GameReader:GetNeutralItemsInfo()["good"]
		else
			print("ERROR: Missing neutral items info for radiant team.")
		end
	else
		print("ERROR: Missing neutral items info.")
	end
end

function GameReader:GetDireNeutralItemsInfo()
	if GameReader:GetNeutralItemsInfo() then
		if GameReader:GetNeutralItemsInfo()["bad"] then
			return GameReader:GetNeutralItemsInfo()["bad"]
		else
			print("ERROR: Missing neutral items info for dire team.")
		end
	else
		print("ERROR: Missing neutral items info.")
	end
end

function GameReader:GetWardsInfo()
	if GameState.wards then
		return GameState.wards
	else
		print("ERROR: Missing wards info.")
	end
end

function GameReader:GetBuildingsInfo()
	if GameState.buildings then
		return GameState.buildings
	else
		print("ERROR: Missing buildings info.")
	end
end

function GameReader:GetOutpostsInfo()
	if GameState.outposts then
		return GameState.outposts
	else
		print("ERROR: Missing outposts info.")
	end
end

function GameReader:GetCreepsInfo()
	if GameState.creeps then
		return GameState.creeps
	else
		print("ERROR: Missing creeps info.")
	end
end

function GameReader:GetHeroesInfo()
	if GameState.heroes then
		return GameState.heroes
	else
		print("ERROR: Missing heroes info.")
	end
end

function GameReader:GetHeroInfo(sHeroName)
	if GameReader:GetHeroesInfo() and GameReader:GetHeroesInfo()[sHeroName] then
		return GameReader:GetHeroesInfo()[sHeroName]
	else
		print("ERROR: Missing info for hero:", sHeroName)
	end
end

function GameReader:GetHeroTeam(sHeroName)
	if GameReader:GetHeroesInfo() and GameReader:GetHeroesInfo()[sHeroName] and
		GameReader:GetHeroesInfo()[sHeroName]["team"] then
		return GameReader:GetHeroesInfo()[sHeroName]["team"]
	else
		print("ERROR: Missing team for hero:", sHeroName)
	end
end

function GameReader:GetRoshanInfo()
	if GameState.roshan then
		return GameState.roshan
	else
		print("ERROR: Missing Roshan info.")
	end
end

function GameReader:GetRoshanDeaths()
	if GameState.roshan ~= nil and GameState.roshan.deaths ~= nil then
		return GameState.roshan.deaths
	else
		print("ERROR: Missing Roshan info.")
	end
end

function GameReader:SetRoshanInfo(iAmount)
	if not GameState.roshan.deaths then
		print("WARNING: Roshan deaths nil! set to " .. iAmount)
	end

	GameState.roshan.deaths = iAmount
end

function GameReader:GetRoshanDeaths()
	if self:GetRoshanInfo() then
		if self:GetRoshanInfo().deaths then
			return self:GetRoshanInfo().deaths
		else
			print("ERROR: Missing Roshan deaths.")
		end
	else
		print("ERROR: Missing Roshan info.")
	end
end

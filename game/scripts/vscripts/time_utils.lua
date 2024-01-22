if TimeUtils == nil then
	TimeUtils = class({})
	masterTime = nil
end

function TimeUtils:InitialTimeComputations()
	local buffer = 5
	local skirmishStartTime = GameReader:GetGameTime()
	local skirmishLastMin = math.floor(skirmishStartTime / 60) * 60
	local skirmishNextMin = skirmishLastMin + 60

	local skirmishLastWave = math.floor(skirmishStartTime / 30) * 30
	local skirmishNextWave = skirmishLastWave + 30

	local pregameLength = skirmishNextMin - skirmishStartTime
	local realPregameLength = pregameLength + buffer

	local data = {
		buffer = buffer,
		skirmishNextMin = skirmishNextMin,
		pregameLength = pregameLength,
		realPregameLength = realPregameLength,
		skirmishStartTime = skirmishStartTime,
		skirmishNextWave = skirmishNextWave,
		skirmishLastMin = skirmishLastMin
	}
	TimeUtils.masterTime = data
end

function TimeUtils:GetMasterTime(masterTime)

	local gameTime = GameRules:GetDOTATime(false, false)
	local gameTimeWithPregame = GameRules:GetDOTATime(true, false)
	local gameTimeNegative = GameRules:GetDOTATime(false, true)
	local gameTimeAllTrue = GameRules:GetDOTATime(true, true)

	local reallyRealGameTime = masterTime.realPregameLength + gameTimeNegative
	local realGameTime = masterTime.pregameLength + gameTimeNegative

	local skirmishTime4 = gameTimeWithPregame + masterTime.skirmishStartTime - masterTime.buffer
	local skirmishTime2 = gameTime + masterTime.skirmishNextMin
	local skirmishTime3 = gameTime + masterTime.pregameLength + masterTime.skirmishStartTime

	local skirmishTime = realGameTime + masterTime.skirmishStartTime

	local debug = {
		gameTimeNegative = gameTimeNegative,
		gameTimeAllTrue = gameTimeAllTrue,
		gameTime = gameTime,
		reallyRealGameTime = reallyRealGameTime,
		skirmishTime = skirmishTime,
		skirmishTime2 = skirmishTime2,
		skirmishTime3 = skirmishTime3,
		skirmishTime4 = skirmishTime4
	}

	-- print(debug)
	local data = {
		gameTimeWithPregame = gameTimeWithPregame,
		skirmishTime = skirmishTime,		  -- what time it is according to the mod / game situation
		realGameTime = realGameTime,          -- how long was the game running
		gameTimeNegative = gameTimeNegative   -- what the game thinks is the time
	}

	return data
end

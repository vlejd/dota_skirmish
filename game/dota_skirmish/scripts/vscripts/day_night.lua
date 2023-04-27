require("internal/util")
require("internal/adv_log")
require("internal/globals")
require("time_utils")



if DayNight == nil then
	DayNight = class({})
	DayNight.master_time = nil
	DayNight.first_change = true
end

function DayNight:PreGameInit()
	GameRules:GetGameModeEntity():SetDaynightCycleDisabled(true)
end


function DayNight:Init(master_time)
	DayNight.master_time = master_time
	GameRules:GetGameModeEntity():SetThink("Thinker", self, "DayNightThink", 0.1)
end

function DayNight:Thinker()
	local time = TimeUtils:GetMasterTime(DayNight.master_time)
	local should_be_day = (math.mod(math.floor(time.skirmishTime / (5*60)), 2) == 0 ) 
	local is_day = GameRules:IsDaytime()
	if PRINT_DAY_NIGHT then
		print("DayNight cycle", is_day, should_be_day)
	end

	if is_day ~= should_be_day then
		SendToServerConsole("dota_daynightcycle_toggle")
		if DayNight.first_change then
			DayNight.first_change = false
			return 1
		else
			return 60*4+50
		end
	end
	return 1	
end
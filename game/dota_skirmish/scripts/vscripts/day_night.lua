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
	-- GameRules:GetGameModeEntity():SetThink("PrintDayNight", self, "PrintDayNightThink", 0.1)
end

function DayNight:Thinker()
	local time = TimeUtils:GetMasterTime(DayNight.master_time)

	-- 150 is there to add 2.5 min to the time. 
	-- Time of day works in a way where 0.25 is the start of a day, and 0.75 is the end of a day.
	-- I suspect this is to make it easier witht the pre game time. still, WTF valve... 
	local time_of_day = ((time.skirmishTime+150) / (10*60))  
	local time_fraction = time_of_day-math.floor(time_of_day)

	GameRules:SetTimeOfDay(time_fraction)
	if PRINT_DAY_NIGHT then
		print("Daynight state", time_fraction, GameRules:GetTimeOfDay(), GameRules:IsDaytime())
	end
	return 1
end
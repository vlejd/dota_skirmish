-- stuff from here: https://dota2.fandom.com/wiki/Neutral_Items


-- load file with timing
-- hook on every death of neutral creep
-- if time for neutral item, and conditions are met, 
-- GetPotentialNeutralItemDrop and drop it. 


if NeutralItems == nil then
	NeutralItems = class({})
end


function NeutralItems:Setup()
    ListenToGameEvent("entity_killed", Dynamic_Wrap(self, "OnEntityKilled"), self)
end


function NeutralItems:OnEntityKilled(event)
    local hVictim = nil
    local hAttacker = nil
    if event.entindex_killed ~= nil then
        hVictim = EntIndexToHScript(event.entindex_killed)
    end
    if event.entindex_attacker ~= nil then
        hAttacker = EntIndexToHScript(event.entindex_attacker)
    end

    print("something died")
    if hVictim:IsNeutralUnitType() and hVictim:GetTeam() == DOTA_TEAM_NEUTRALS then
        print("neutral died")
        local drop_probability = 0.1
        if hVictim:IsAncient() then
           print("ancient died")
           drop_probability = drop_probability*3
        end
     end

    -- check drop conditions
        -- attacker is near, and it is not an illusion 750radius 
        -- attacker not channeling TP or boots
        -- no enemy hero is near
        -- The team of the unit is neutral
    -- check drop probability (is ancient, triple the probability)
    -- drop the item

end


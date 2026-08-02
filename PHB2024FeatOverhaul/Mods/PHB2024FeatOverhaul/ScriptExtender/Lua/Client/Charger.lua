-- Add Passive check to Dash action to increase movement speed by 3m if you have Charger feat

local CHARGER_IMPROVED_DASH = "IF(HasPassive('APO_Charger_ImprovedDash',context.Source)):ActionResource(Movement,3,0)"

Ext.Events.StatsLoaded:Subscribe(function(StatsLoaded)
    local statusName = "DASH"
    local stat = Ext.Stats.Get(statusName)
    local boosts = stat.Boosts
    
    if boosts and boosts ~= "" then
        if not string.find(boosts, "APO_Charger_ImprovedDash") then
            stat.Boosts = boosts .. ";" .. CHARGER_IMPROVED_DASH
        end
    else
        stat.Boosts = CHARGER_IMPROVED_DASH
    end

    stat:Sync()
end)
function CT_RaidTracker_OptionsFrame_OnShow()
    CT_RaidTrackerOptionsFrameMinQualitySlider:SetValue(CT_RaidTracker_Options["MinQuality"]);
    CT_RaidTrackerOptionsFrameAskCostSlider:SetValue(CT_RaidTracker_Options["AskCost"]);
    CT_RaidTrackerOptionsFrameGetDKPValueSlider:SetValue(CT_RaidTracker_Options["GetDkpValue"]);
    CT_RaidTrackerOptionsFrameAutoCreateRaidCB:SetChecked(CT_RaidTracker_Options["AutoRaidCreation"]);
    CT_RaidTrackerOptionsFrameGroupItemsSlider:SetValue(CT_RaidTracker_Options["GroupItems"]);
    CT_RaidTrackerOptionsFrameAutoZoneCB:SetChecked(CT_RaidTracker_Options["AutoZone"]);
    CT_RaidTrackerOptionsFrameSaveExtendedPlayerInfoCB:SetChecked(CT_RaidTracker_Options["SaveExtendedPlayerInfo"]);
    CT_RaidTrackerOptionsFrameSaveTooltipsCB:SetChecked(CT_RaidTracker_Options["SaveTooltips"]);
    CT_RaidTrackerOptionsFrameAutoBossSlider:SetValue(CT_RaidTracker_Options["AutoBoss"]);
    CT_RaidTrackerOptionsFrameLogAttendeesSlider:SetValue(CT_RaidTracker_Options["LogAttendees"]);
    CT_RaidTrackerOptionsFrameTimeSyncCB:SetChecked(CT_RaidTracker_Options["TimeSync"]);
    CT_RaidTrackerOptionsFrameTimeZoneSlider:SetValue(CT_RaidTracker_Options["Timezone"]);
end

function CT_RaidTracker_OptionsFrame_Save()
    CT_RaidTracker_Options["MinQuality"] = CT_RaidTrackerOptionsFrameMinQualitySlider:GetValue();
    CT_RaidTracker_Options["AskCost"] = CT_RaidTrackerOptionsFrameAskCostSlider:GetValue();
    CT_RaidTracker_Options["GetDkpValue"] = CT_RaidTrackerOptionsFrameGetDKPValueSlider:GetValue();
    if(CT_RaidTrackerOptionsFrameAutoCreateRaidCB:GetChecked() == 1) then
        CT_RaidTracker_Options["AutoRaidCreation"] = 1;
    else
        CT_RaidTracker_Options["AutoRaidCreation"] = 0;
    end
    CT_RaidTracker_Options["GroupItems"] = CT_RaidTrackerOptionsFrameGroupItemsSlider:GetValue();
    if(CT_RaidTrackerOptionsFrameAutoZoneCB:GetChecked() == 1) then
        CT_RaidTracker_Options["AutoZone"] = 1;
    else
        CT_RaidTracker_Options["AutoZone"] = 0;
    end
    if(CT_RaidTrackerOptionsFrameSaveExtendedPlayerInfoCB:GetChecked() == 1) then
        CT_RaidTracker_Options["SaveExtendedPlayerInfo"] = 1;
    else
        CT_RaidTracker_Options["SaveExtendedPlayerInfo"] = 0;
    end
    if(CT_RaidTrackerOptionsFrameSaveTooltipsCB:GetChecked() == 1) then
        CT_RaidTracker_Options["SaveTooltips"] = 1;
    else
        CT_RaidTracker_Options["SaveTooltips"] = 0;
    end
    CT_RaidTracker_Options["AutoBoss"] = CT_RaidTrackerOptionsFrameAutoBossSlider:GetValue();
    CT_RaidTracker_Options["LogAttendees"] = CT_RaidTrackerOptionsFrameLogAttendeesSlider:GetValue();
    if(CT_RaidTrackerOptionsFrameTimeSyncCB:GetChecked() == 1) then
        CT_RaidTracker_Options["TimeSync"] = 1;
    else
        CT_RaidTracker_Options["TimeSync"] = 0;
    end
    CT_RaidTracker_Options["Timezone"] = CT_RaidTrackerOptionsFrameTimeZoneSlider:GetValue();
    CT_RaidTracker_GetGameTimeOffset();
end
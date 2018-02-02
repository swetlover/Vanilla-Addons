function TargetButton_Redraw()
    TradeButton:SetPoint("CENTER", "TargetFrame", "TOPLEFT", 92, -16);	
    InspectButton:SetPoint("CENTER", "TargetFrame", "TOPLEFT", 113, -16);
    if(UnitIsFriend("player","target") and UnitIsPlayer("target") and not UnitIsUnit("player","target")) then
        TradeButton:Show();
        InspectButton:Show();
    else
        TradeButton:Hide();
        InspectButton:Hide();
    end
end

function TargetButton_CheckRange()
    if CheckInteractDistance("target",1) then
        InspectButton:Enable();
    else
        InspectButton:Disable();
    end
    if CheckInteractDistance("target",2) then
        TradeButton:Enable();
            if ( UnitIsDeadOrGhost("player") or UnitIsDeadOrGhost("target") ) then
                TradeButton:Disable();
            end
    else
        TradeButton:Disable();
    end
end

function Trade_onClick()
	InitiateTrade("target");
end

function Inspect_onClick()
	InspectUnit("target");
end

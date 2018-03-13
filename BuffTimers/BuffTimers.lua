--------------------------------------------------------------------------------------------------
-- Local variables
--------------------------------------------------------------------------------------------------

-- Function hooks
local lOriginal_BuffFrame_UpdateDuration;
local lOriginal_BuffButtons_UpdatePositions;


--------------------------------------------------------------------------------------------------
-- Internal functions
--------------------------------------------------------------------------------------------------

local function lSetTimeText(button, time)
	local d, h, m, s;
	local text;
		
	if( time <= 0 ) then
		text = "";
    elseif( time < 60 ) then
		d, h, m, s = ChatFrame_TimeBreakDown(time);
		text = format("|c00FF0000%ds|r", s);
	elseif( time < 600 ) then
		d, h, m, s = ChatFrame_TimeBreakDown(time);
		text = format("|c00FF9B00%d:%02d|r", m, s);
	elseif( time < 3600 ) then
		d, h, m, s = ChatFrame_TimeBreakDown(time);
		text = format("|c0000FF00%dm|r", m);
	else
		text = "|c0000FF001 h+|r";
	end
	
	button:SetText(text);
end

function BuffButton_OnUpdate()
	local buffDuration = getglobal(this:GetName().."Duration");
	
	if ( this.untilCancelled == 1 ) then
		buffDuration:SetTextColor(0.0, 1.0, 0.0); 
	  	buffDuration:SetText("N/A");
		buffDuration:Show();
		return;
	end
	local buffIndex = this.buffIndex;
	local timeLeft = GetPlayerBuffTimeLeft(this.buffIndex);
	BuffFrame_UpdateDuration(this, timeLeft);
	if ( GameTooltip:IsOwned(this) ) then
		GameTooltip:SetPlayerBuff(this.buffIndex);
	end
end

--------------------------------------------------------------------------------------------------
-- OnFoo functions
--------------------------------------------------------------------------------------------------

function BuffTimers_OnLoad()
	-- Hook the functions we need to override
	lOriginal_BuffFrame_UpdateDuration = BuffFrame_UpdateDuration;
	BuffFrame_UpdateDuration = BuffTimers_BuffFrame_UpdateDuration;
	lOriginal_BuffButtons_UpdatePositions = BuffButtons_UpdatePositions;
	BuffButtons_UpdatePositions = BuffTimers_BuffButtons_UpdatePositions;
end

function BuffTimers_BuffFrame_UpdateDuration(buffButton, timeLeft)
	lOriginal_BuffFrame_UpdateDuration(buffButton, timeLeft);

	local duration = getglobal(buffButton:GetName().."Duration");
	if( timeLeft ) then
		lSetTimeText(duration, timeLeft);
		duration:Show();
	else
		duration:Hide();
	end
end

function BuffTimers_BuffButtons_UpdatePositions()
	local orig = SHOW_BUFF_DURATIONS;
	SHOW_BUFF_DURATIONS = "1";
	lOriginal_BuffButtons_UpdatePositions();
	SHOW_BUFF_DURATIONS = orig;
end

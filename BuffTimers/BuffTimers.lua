--[[

	BuffTimers: Mini timers for the top right buff icons
		copyright 2004 by Telo
	
	- Displays small timer text below each of the top right buff and debuff icons
	- Now simplified substantially by using the Blizzard interface elements to present the
	  timer information in the original BuffTimers format
	
]]

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

--[[
--
--  EkBomb 1.44
--
--  Author: Dargen of Eternal Keggers, Norgannon.
--          http://www.eternalkeggers.net
--
--  Refer to index.html for documentation and complete change history.
--
--
--  Calling EkBomb functions from another addon:
--
--	To show a custom bomb warning from another addon, you can
--	call this function:
--
--		EkBomb_Show("bigText", "smallText", seconds)
--
--	All three parameters are optional. Default values will be used for missing
--	or nil parameters.  Both of the default messages are blank, and the default
--	number of seconds is 30. To prevent the warning window from automatically
--	closing, use 0 seconds.</li>
--
--	If you want to hide the bomb warning, you can call this function:
--
--		EkBomb_Hide()
--
--]]

-- Saved variables
EkBomb_Status = 1;   -- 0==Warning window disabled, 1==Warning window enabled.
EkBomb_Opacity = 80;  -- Warning window text opacity
EkBomb_BombsConfig = {};  -- Bombs settings for the user
EkBomb_FlashWindow = 0;  -- 0=Window does not flash, 1==Window flashes.
EkBomb_Sound = 0;  -- 0==Don't play a sound, 1==Play a sound when warning appears.

-- New saved variables in v1.3
EkBomb_Background = 0;  -- 0==Don't show background, 1==Show background
EkBomb_Scale = 100;  -- Warning window scale %
EkBomb_Color = nil;  -- colors

-- New saved variables in v1.41
EkBomb_ShowTimer = 0;  -- 0==Don't show timer on close button, 1==Show timer


-- Variables that are not saved
EkBomb_cVersion = "1.44";

EkBomb_Slash = "/ekbomb";
EkBomb_Addon = "EkBomb";

EkBomb_NextWarning = 1;  -- Next warning number (used with test button).
EkBomb_WarningTimer = nil;
EkBomb_WarningTimer2 = 0.1;
EkBomb_FlashTimer = nil;
EkBomb_FlashState = 1;
EkBomb_MaxBombsPerPage = 6;  -- Maximum number of bombs we can display per page when using the ekbomb ui to configure options.
EkBomb_BombsSorted = {};   -- Sorted list of the bomb names from EkBomb_BombsTable.
EkBomb_Test = 0;
EkBomb_CloseButton_Format = EkBomb_TEXT_Warning_Close .. "  %2d";
EkBomb_TEXT_Config_Help = EkBomb_TEXT_Config_Help .. " " .. EkBomb_Slash .. " " .. EkBomb_TEXT_Command_Help;

EkBomb_DefaultColor = {
	["small"] = {
		["r"] = 0.0,
		["g"] = 0.22,
		["b"] = 1.0,
	},
	["large"] = {
		["r"] = 1.0,
		["g"] = 0.03137,
		["b"] = 0.08235,
	},
	["back"] = {
		["r"] = 0.6,
		["g"] = 0.6,
		["b"] = 0.6,
	},
};

EkBomb_BombsTable = {
	-- Anubisath Defender (Temple of Ahn'Qiraj):
	anubisath = {
		name = EkBomb_TEXT_Bomb_Plague_Name,
		mob = EkBomb_TEXT_Bomb_Plague_Mob,
		event = "CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE",
		text = EkBomb_TEXT_Bomb_Plague_Text,
		timer = 30,
		big = EkBomb_TEXT_Bomb_Plague_Big,
		small = EkBomb_TEXT_Bomb_Plague_Small,
		id = 1,
	},
	-- Baron Geddon (Molten Core):
	geddon = {
		name = EkBomb_TEXT_Bomb_Living_Name,
		mob = EkBomb_TEXT_Bomb_Living_Mob,
		event = "CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE",
		text = EkBomb_TEXT_Bomb_Living_Text,
		timer = 8,
		big = EkBomb_TEXT_Bomb_Living_Big,
		small = EkBomb_TEXT_Bomb_Living_Small,
		id = 2,
	},
	-- Nefarian (Blackwing Lair):
	nefarian = {
		name = EkBomb_TEXT_Bomb_Corrupt_Name,
		mob = EkBomb_TEXT_Bomb_Corrupt_Mob,
		event = "CHAT_MSG_MONSTER_YELL",
		text = EkBomb_TEXT_Bomb_Corrupt_Text,
		timer = 30,
		big = EkBomb_TEXT_Bomb_Corrupt_Big,
		small = EkBomb_TEXT_Bomb_Corrupt_Small,
		class = "PRIEST",
		id = 3,
	},
	-- Vaelastrasz (Blackwing Lair):
	vael = {
		name = EkBomb_TEXT_Bomb_Adrenaline_Name,
		mob = EkBomb_TEXT_Bomb_Adrenaline_Mob,
		event = "CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE",
		text = EkBomb_TEXT_Bomb_Adrenaline_Text,
		timer = 20,
		big = EkBomb_TEXT_Bomb_Adrenaline_Big,
		small = EkBomb_TEXT_Bomb_Adrenaline_Small,
		id = 4,
	},
	-- Bloodlord Mandokir (Zul'Gurub):
	mandokir = {
		name = EkBomb_TEXT_Bomb_Mandokir_Name,
		mob = EkBomb_TEXT_Bomb_Mandokir_Mob,
		event = "CHAT_MSG_MONSTER_YELL",
		player = EkBomb_TEXT_Bomb_Mandokir_Player,
		test = EkBomb_TEXT_Bomb_Mandokir_Test,
		timer = 10,
		big = EkBomb_TEXT_Bomb_Mandokir_Big,
		small = EkBomb_TEXT_Bomb_Mandokir_Small,
		id = 5,
	},
	-- Grobbulus (Naxxramas):
	grobbulus = {
		name = EkBomb_TEXT_Bomb_Mutating_Name,
		mob = EkBomb_TEXT_Bomb_Mutating_Mob,
		event = "CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE",
		text = EkBomb_TEXT_Bomb_Mutating_Text,
		timer = 10,
		big = EkBomb_TEXT_Bomb_Mutating_Big,
		small = EkBomb_TEXT_Bomb_Mutating_Small,
		id = 6,
	},

--[[
	-- Test:
	test = {
		name = "Mob kill",
		mob = "Test",
		event = "CHAT_MSG_COMBAT_HOSTILE_DEATH",
		text = "^.+ dies",
		timer = 5,
		big = "STOP!",
		small = "Something was killed!",
		id = 999,
	},
]]

};

EkBomb_EkCheck_Config = {
	addonName = "EkBomb",
	funcPrefix = "EkBomb_EkCheck_",
	defaultColumn = 11,
	columns = {
		{ heading=EkBomb_TEXT_EkCheck_Enabled,  width=52, show=16, sort=16, order="A", justify="CENTER", red=nil, green=nil, blue=nil },
		{ heading=EkBomb_TEXT_EkCheck_Warnings, width=60, show=17, sort=13, order="A", justify="CENTER", red=nil, green=nil, blue=nil },
		{ heading=EkBomb_TEXT_EkCheck_Version,  width=56, show=11, sort=11, order="A", justify="CENTER", red=nil, green=nil, blue=nil },
	},
};

function EkBomb_ShowVersion(msg)
	-- --------------
	-- Show addon version information.
	-- --------------
	EkBomb_Print2(EkBomb_Addon .. " " .. EkBomb_cVersion .. " by Dargen, Eternal Keggers, Norgannon.");
end

function EkBomb_Main(msg)
	-- --------------
	-- Main command routine.
	-- --------------
	local command = string.lower(msg);

	if (command == "?" or command == EkBomb_TEXT_Command_Help) then
		-- Display help.
	        EkBomb_Print2(" ");
		EkBomb_ShowVersion()
	        EkBomb_Print2(" ");
	        EkBomb_Print2(EkBomb_Slash .. " -- " .. EkBomb_TEXT_Help_Config);
	        EkBomb_Print2(EkBomb_Slash .. " " .. EkBomb_TEXT_Command_Help .. " -- " .. EkBomb_TEXT_Help_Help);
	        EkBomb_Print2(EkBomb_Slash .. " " .. EkBomb_TEXT_Command_Reset .. " -- " .. EkBomb_TEXT_Help_Reset);
	        EkBomb_Print2(EkBomb_Slash .. " " .. EkBomb_TEXT_Command_Test .. " -- " .. EkBomb_TEXT_Help_Test);

	elseif (command == nil or command == "") then
		if (not EkBomb_MainFrame:IsShown()) then
			EkBomb_MainFrame:Show();
		end

	elseif (command == EkBomb_TEXT_Command_Reset) then
		EkBomb_ResetWindows();
		return;

	elseif (command == EkBomb_TEXT_Command_Test) then
		EkBomb_TestWarning(true);
		return;

	elseif (command == "_test") then
		if (EkBomb_Test == 0) then
			EkBomb_Test = 1;
			EkBomb_Print("Test mode enabled.");
		else
			EkBomb_Test = 0;
			EkBomb_Print("Test mode disabled.");
		end
	end
end

function EkBomb_TestWarning(rand)
	-- ----------------
	-- Test the warning window.
	-- ----------------

	-- Count how many bombs we know about.
	local count = getn(EkBomb_BombsSorted);
	local bombIndex;

	if (rand) then
		-- Pick a random bomb.
		bombIndex = random(1, count);
	else
		-- Step through the warnings sequentially.
		bombIndex = EkBomb_NextWarning;
		if (bombIndex > count) then
			bombIndex = 1;
		end		
		EkBomb_NextWarning = bombIndex + 1;
	end

	-- Get that bomb's name.
	local bombName = EkBomb_BombsSorted[bombIndex];

	-- Show the warning window.
	if (bombName) then
		if (EkBomb_Test == 1) then
			local event, msg;
			local aBomb = EkBomb_BombsTable[bombName];
			if (not aBomb) then
				return;
			end
			event = aBomb.event;
			if (aBomb.player) then
				msg = string.format(aBomb.test, UnitName("player"));
			else
				msg = aBomb.text;
			end
			EkBomb_Print("Event=" .. event .. ", Msg=" .. msg);
			EkBomb_WarningFrame_Match(event, msg)
		else
			EkBomb_ShowBomb(bombName);
		end
	end

	return;
end

function EkBomb_Print(msg)
	-- ----------------
	-- Print a message.
	-- ----------------
	DEFAULT_CHAT_FRAME:AddMessage("<" .. EkBomb_Addon .. "> " .. msg);
	return;
end

function EkBomb_Print2(msg)
	-- ----------------
	-- Print a message.
	-- ----------------
	DEFAULT_CHAT_FRAME:AddMessage(msg);
	return;
end

function EkBomb_OnLoad()
	-- ----------------
	-- Addon loaded.
	-- ----------------
	SLASH_ekbomb1 = EkBomb_Slash;
	SlashCmdList["ekbomb"] = function( msg )
		EkBomb_Main(msg);
	end

	this:RegisterEvent("PLAYER_LOGIN");
end

function EkBomb_OnEvent(event)
	-- ----------------
	-- Event routine
	-- ----------------
	if (event == "PLAYER_LOGIN") then
		EkBomb_BombsSorted = {};
		for k, v in EkBomb_BombsTable do
			tinsert(EkBomb_BombsSorted, k);
		end

		sort(EkBomb_BombsSorted, function (a, b)
						return string.lower(EkBomb_BombsTable[a].name) < string.lower(EkBomb_BombsTable[b].name);
					end);

		EkBomb_MainFrame_Bombs_Config();

		if (EkBomb_Status == 1) then
			EkBomb_Enable();
		end

		if (not EkBomb_Color) then
			EkBomb_Color = {};
			EkBomb_SetDefaultColors();
		end

		EkBomb_MainFrame_SetScale();

		if (EkCheck_RegisterAddon) then
			EkCheck_RegisterAddon(EkBomb_EkCheck_Config);
		end

		return;
	end
end

function EkBomb_GetBossKey(id)
	-- ----------------
	-- Get boss key value given a boss id number.
	-- ----------------
	for b, v in EkBomb_BombsTable do
		if (v.id == id) then
			return b;
		end
	end

	return nil;
end

function EkBomb_GetBossId(key)
	-- ----------------
	-- Get boss id value given a boss key.
	-- ----------------
	local b;
	b = EkBomb_BombsTable[key];
	if (b) then
		return b.id;
	end
	return nil;
end

function EkBomb_Enable()
	-- ----------------
	-- Enable the warnings.
	-- ----------------
	EkBomb_Status = 1;

	EkBomb_WarningFrame:RegisterEvent("PLAYER_DEAD");
	for k, aBomb in EkBomb_BombsTable do
		EkBomb_WarningFrame:RegisterEvent(aBomb.event);
	end
end

function EkBomb_Disable()
	-- ----------------
	-- Disable the warnings.
	-- ----------------
	EkBomb_Status = 0;

	EkBomb_WarningFrame:UnregisterEvent("PLAYER_DEAD");
	for k, aBomb in EkBomb_BombsTable do
		EkBomb_WarningFrame:UnregisterEvent(aBomb.event);
	end
end

function EkBomb_Hide()
	-- ----------------
	-- Hide the warning window.
	-- ----------------
	EkBomb_WarningFrame:Hide();
end

function EkBomb_Show(bigText, smallText, seconds)
	-- ----------------
	-- Show the specified text in the warning window.
	-- ----------------
	if (EkBomb_WarningFrame:IsShown()) then
		return;
	end

	if (not bigText or type(bigText) ~= "string") then
		bigText = "";
	end

	if (not smallText or type(smallText) ~= "string") then
		smallText = "";
	end

	if (not seconds or type(seconds) ~= "number") then
		seconds = 30;
	end

	EkBomb_MainFrame_SetBackground();

	EkBomb_WarningFrame_Message1:SetText(smallText);
	EkBomb_WarningFrame_Message2:SetText(bigText);

	-- Determine the wider of the two message strings.
	local s1Width = EkBomb_WarningFrame_Message1:GetStringWidth();
	local s2Width = EkBomb_WarningFrame_Message2:GetStringWidth();
	local width;
	if (s1Width > s2Width) then
		width = s1Width;
	else
		width = s2Width;
	end
	EkBomb_WarningFrame:SetWidth(width + 40);  -- Allow some space on each side of the text.

	-- Establish button width using the text that includes the timer
	EkBomb_WarningFrame_CloseButton:SetText(string.format(EkBomb_CloseButton_Format, seconds));
	EkBomb_WarningFrame_CloseButton:SetWidth(EkBomb_WarningFrame_CloseButton:GetTextWidth() + 50);

	if (EkBomb_ShowTimer == 0 or seconds <= 0) then
		EkBomb_WarningFrame_CloseButton:SetText(EkBomb_TEXT_Warning_Close); 
	end

	EkBomb_FlashTimer = 0;
	EkBomb_FlashState = 1;

	if (EkBomb_Sound == 1) then
		PlaySoundFile("Sound\\Doodad\\BellTollAlliance.wav");
	end

	if (seconds == 0) then
		EkBomb_WarningTimer = nil;  -- No automatic close timer.
	else
		EkBomb_WarningTimer = seconds;
	end

	EkBomb_WarningFrame:Show();
end

function EkBomb_ShowBomb(bomb, seconds)
	-- ----------------
	-- Show a specific bomb warning window.
	-- ----------------
	local aBomb;

	aBomb = EkBomb_BombsTable[bomb];
	if (not aBomb) then
		return;
	end

	if (not seconds) then
		seconds = aBomb.timer;
	end

	EkBomb_Show(aBomb.big, aBomb.small, seconds);
end

function EkBomb_ResetWindows()
	-- ----------------
	-- Reset position of the windows.
	-- ----------------
	EkBomb_MainFrame:ClearAllPoints();
	EkBomb_MainFrame:SetPoint("CENTER", "UIParent", "CENTER");
end

function EkBomb_WarningFrame_OnLoad()
	-- ----------------
	-- Warning frame loaded.
	-- ----------------
	EkBomb_WarningFrame:Hide();

	EkBomb_WarningFrame_Message1:SetTextHeight(32);
	EkBomb_WarningFrame_Message2:SetTextHeight(200);
end

function EkBomb_WarningFrame_OnShow()
	-- ----------------
	-- Warning frame being shown.
	-- ----------------
	EkBomb_WarningFrame_CloseButton:Show();
end

function EkBomb_WarningFrame_OnHide()
	-- ----------------
	-- Warning frame being hidden.
	-- ----------------
	EkBomb_WarningFrame_CloseButton:Hide();

	EkBomb_WarningTimer = nil;
	EkBomb_FlashTimer = nil;
	EkBomb_WarningFrame:SetAlpha(0);
end

function EkBomb_WarningFrame_OnEvent(event)
	-- ----------------
	-- Warning frame event handler.
	-- ----------------
	if (EkBomb_Status == 0) then
		return;
	end

	if ( event == "PLAYER_DEAD" ) then
		if (EkBomb_FlashTimer or EkBomb_WarningTimer) then
			EkBomb_Hide();
		end
		return;
	end

	EkBomb_WarningFrame_Match(event, arg1);
end

function EkBomb_WarningFrame_Match(event, msg)
	-- ----------------
	-- Try to match the event name to one in the EkBomb_BombsTable.
	-- ----------------
	local found, show;
	local pos1, pos2, name;

	for k, v in EkBomb_BombsTable do
		if (event == v.event) then
			if (v.player) then
				pos1, pos2, name = string.find(msg, v.player);
			else
				pos1, pos2 = string.find(msg, v.text);
			end
			if (pos1) then
				found = k;
				break;
			end
		end
	end

	if (found) then
		local config = EkBomb_BombsConfig[found];
		local aBomb = EkBomb_BombsTable[found];

		if (aBomb) then
			if (aBomb.player) then
				-- Name must match the player's.
				if (name and name == UnitName("player")) then
					show = 1;
				end
			else
				show = 1;
			end
			if (aBomb.class) then
				-- There is a class restriction on this bomb.
				local class1, class2 = UnitClass("player");
				if (aBomb.class == class2) then
					show = 1;
				else
					show = nil;
				end
			end
		end

		if (show and config and config.enabled) then
			EkBomb_ShowBomb(found);
		end
	end
end

function EkBomb_WarningFrame_OnUpdate(elapsed)
	-- ----------------
	-- Update routine for Warning Frame.
	-- ----------------
	if (EkBomb_WarningTimer) then
		-- Count down the warning timer. When done, hide the warning window.
		EkBomb_WarningTimer = EkBomb_WarningTimer - elapsed;
		EkBomb_WarningTimer2 = EkBomb_WarningTimer2 - elapsed;

		-- Set appropriate text for close button (user may toggle while warning on screen).
		if (EkBomb_WarningTimer2 <= 0) then
			EkBomb_WarningTimer2 = 0.1;
			if (EkBomb_ShowTimer == 1) then
				EkBomb_WarningFrame_CloseButton:SetText(string.format(EkBomb_CloseButton_Format, ceil(EkBomb_WarningTimer)));
			else
				EkBomb_WarningFrame_CloseButton:SetText(EkBomb_TEXT_Warning_Close); 
			end
		end

		if (EkBomb_WarningTimer < 0.1) then
			EkBomb_Hide();
		end
	end

	if (EkBomb_FlashTimer) then
		-- Count down the flash timer. When done, "flash" the window and restart flash timer.
		EkBomb_FlashTimer = EkBomb_FlashTimer - elapsed;
		if (EkBomb_FlashTimer < 0.1) then
			EkBomb_MainFrame_SetOpacity();
			if (EkBomb_FlashState == 1) then
				EkBomb_FlashTimer = 2;
				EkBomb_FlashState = 2;

			elseif (EkBomb_FlashWindow == 1) then
				EkBomb_FlashTimer = 1;
				EkBomb_FlashState = 1;
			end
		end
	end
end

function EkBomb_MainFrame_SetOpacity()
	-- ----------------
	-- Set the window's opacity.
	-- ----------------
	local opacity;

	if (EkBomb_FlashState == 1 or EkBomb_FlashWindow == 0) then
		opacity = EkBomb_Opacity;
	else
		opacity = EkBomb_Opacity - 20;
		if (opacity <  1)
			then opacity = 1;
		end
	end

	EkBomb_WarningFrame:SetAlpha(opacity / 100);
end

function EkBomb_MainFrame_SetScale()
	-- ----------------
	-- Set the window's scale.
	-- ----------------
	EkBomb_WarningFrame:SetScale(EkBomb_Scale / 100);
end

function EkBomb_MainFrame_SetBackground()
	-- ----------------
	-- Show/hide the warning frame's background.
	-- ----------------
	if (EkBomb_Background == 1) then
		EkBomb_WarningFrame:EnableDrawLayer("BACKGROUND");
	else
		EkBomb_WarningFrame:DisableDrawLayer("BACKGROUND");
	end
end

function EkBomb_MainFrame_OnShow()
	-- ----------------
	-- Main frame is being shown.
	-- ----------------
	local oCB;
	local cFrame;

	EkBomb_MainFrame_Title:SetText(EkBomb_Addon .. " " .. EkBomb_cVersion);

	cFrame = "EkBomb_MainFrame_Warnings";

	EkBomb_SetColors();

	oCB = getglobal(cFrame .. "_FlashCB");
	oCB:SetChecked(EkBomb_FlashWindow);

	oCB = getglobal(cFrame .. "_BackgroundCB");
	oCB:SetChecked(EkBomb_Background);

	oCB = getglobal(cFrame .. "_SoundCB");
	oCB:SetChecked(EkBomb_Sound);

	oCB = getglobal(cFrame .. "_ShowTimerCB");
	oCB:SetChecked(EkBomb_ShowTimer);

	oCB = getglobal(cFrame .. "_EnableCB");
	oCB:SetChecked(EkBomb_Status);

	EkBomb_MainFrame_BombsUpdate();
end

function EkBomb_MainFrame_BombsUpdate()
	-- ----------------
	-- Update the bombs on the configuration screen.
	-- ----------------
	local oCB, cBut, oBut;
	local key, aBomb, oTxt;
	local cFrame;

	cFrame = "EkBomb_MainFrame_Warnings";

	for i=1, getn(EkBomb_BombsSorted) do
		cBut = cFrame .. "_BombButton" .. i;
		oBut = getglobal(cBut);
		oBut.bombIndex = i;

		key = EkBomb_BombsSorted[i];
		aBomb = EkBomb_BombsTable[key];

		oTxt = getglobal(cBut .. "_BombText");
		oTxt:SetText(aBomb.name .. " (" .. aBomb.mob .. ")");

		oCB = getglobal(cBut .. "_BombCB");
		oCB:SetChecked(EkBomb_BombsConfig[key]["enabled"]);

		if (EkBomb_Status == 0) then
			oCB:Disable();
		else
			oCB:Enable();
		end

		oBut:Show();

		if (i == EkBomb_MaxBombsPerPage) then
			break;
		end
	end
	for i=getn(EkBomb_BombsSorted)+1, EkBomb_MaxBombsPerPage do
		cBut = cFrame .. "_BombButton" .. i;
		oBut = getglobal(cBut);
		oBut:Hide();
	end
end

function EkBomb_MainFrame_OnHide()
	-- ----------------
	-- Main frame is being hidden.
	-- ----------------
end

function EkBomb_MainFrame_EnableCB_OnClick()
	-- ----------------
	-- User clicked on the addon's enable/disable warnings checkbox.
	-- ----------------
	if (this:GetChecked()) then
		EkBomb_Enable();
	else
		EkBomb_Disable();
	end

	EkBomb_MainFrame_BombsUpdate();
end

function EkBomb_MainFrame_EnableCB_OnEnter()
	-- ----------------
	-- Mouse is over the addon's enable/disable warnings checkbox.
	-- ----------------
	GameTooltip_AddNewbieTip(EkBomb_TEXT_Config_Enable_Tooltip1, 1.0, 1.0, 1.0, EkBomb_TEXT_Config_Enable_Tooltip2, 1);
end

function EkBomb_MainFrame_FlashCB_OnClick()
	-- ----------------
	-- User clicked on the 'periodically blink the window' checkbox.
	-- ----------------
	if (this:GetChecked()) then
		EkBomb_FlashWindow = 1;
	else
		EkBomb_FlashWindow = 0;
	end
end

function EkBomb_MainFrame_FlashCB_OnEnter()
	-- ----------------
	-- Mouse is over the 'periodically blink the window' checkbox.
	-- ----------------
	GameTooltip_AddNewbieTip(EkBomb_TEXT_Config_Flash_Tooltip1, 1.0, 1.0, 1.0, EkBomb_TEXT_Config_Flash_Tooltip2, 1);
end

function EkBomb_MainFrame_BackgroundCB_OnClick()
	-- ----------------
	-- User clicked on the 'show warning window background' checkbox.
	-- ----------------
	if (this:GetChecked()) then
		EkBomb_Background = 1;
	else
		EkBomb_Background = 0;
	end
	EkBomb_MainFrame_SetBackground();
end

function EkBomb_MainFrame_BackgroundCB_OnEnter()
	-- ----------------
	-- Mouse is over the 'show warning window background' checkbox.
	-- ----------------
	GameTooltip_AddNewbieTip(EkBomb_TEXT_Config_Background_Tooltip1, 1.0, 1.0, 1.0, EkBomb_TEXT_Config_Background_Tooltip2, 1);
end

function EkBomb_MainFrame_SoundCB_OnClick()
	-- ----------------
	-- User clicked on the 'play a sound' checkbox.
	-- ----------------
	if (this:GetChecked()) then
		EkBomb_Sound = 1;
	else
		EkBomb_Sound = 0;
	end
end

function EkBomb_MainFrame_SoundCB_OnEnter()
	-- ----------------
	-- Mouse is over the 'play a sound' checkbox.
	-- ----------------
	GameTooltip_AddNewbieTip(EkBomb_TEXT_Config_Sound_Tooltip1, 1.0, 1.0, 1.0, EkBomb_TEXT_Config_Sound_Tooltip2, 1);
end

function EkBomb_MainFrame_ShowTimerCB_OnClick()
	-- ----------------
	-- User clicked on the 'show timer' checkbox.
	-- ----------------
	if (this:GetChecked()) then
		EkBomb_ShowTimer = 1;
	else
		EkBomb_ShowTimer = 0;
	end
end

function EkBomb_MainFrame_ShowTimerCB_OnEnter()
	-- ----------------
	-- Mouse is over the 'show timer' checkbox.
	-- ----------------
	GameTooltip_AddNewbieTip(EkBomb_TEXT_Config_ShowTimer_Tooltip1, 1.0, 1.0, 1.0, EkBomb_TEXT_Config_ShowTimer_Tooltip2, 1);
end

function EkBomb_MainFrame_BombCB_OnClick()
	-- ----------------
	-- User clicked on the bomb's enable/disable checkbox.
	-- ----------------
	local config = EkBomb_BombsConfig;
	local but = this:GetParent();
	local name = EkBomb_BombsSorted[but.bombIndex];

	if (not config[name]) then
		config[name] = {};
	end
	if (this:GetChecked()) then
		config[name]["enabled"] = 1;
	else
		config[name]["enabled"] = 0;
	end
end

function EkBomb_MainFrame_BombCB_OnEnter()
	-- ----------------
	-- Mouse is over the bomb's enable/disable checkbox.
	-- ----------------
	local but = this:GetParent();
	local key = EkBomb_BombsSorted[but.bombIndex];
	local aBomb = EkBomb_BombsTable[key];

	GameTooltip_AddNewbieTip(EkBomb_TEXT_Config_Bomb_Tooltip1, 1.0, 1.0, 1.0, EkBomb_TEXT_Config_Bomb_Tooltip2 .. "\n\n" .. aBomb.name .. "\n" .. aBomb.mob, 1);
end

function EkBomb_MainFrame_Bombs_Config()
	-- ----------
	-- Verify saved user bomb settings.
	-- ----------
	local config = EkBomb_BombsConfig;

	-- Assign default values to missing entries in user config table.
	for b=1, getn(EkBomb_BombsSorted) do
		local key = EkBomb_BombsSorted[b];

		if (not config[key]) then
			config[key] = {};
		end

		if (not config[key]["enabled"]) then
			config[key]["enabled"] = 1;
		end
	end

	-- Remove old bombs and settings from user config table.
	for k, v in config do
		local found = nil;
		for b=1, getn(EkBomb_BombsSorted) do
			local key = EkBomb_BombsSorted[b];
			if (key == k) then
				found = 1;
				break;
			end
		end
		if (not found) then
			config[k] = nil;
		end
	end
end

function EkBomb_MainFrame_TestButton_OnClick()
	-- ----------------
	-- User clicked the test button.
	-- ----------------
	EkBomb_Hide();
	EkBomb_TestWarning();
end

function EkBomb_MainFrame_CloseButton_OnClick()
	-- ----------------
	-- User clicked the close button.
	-- ----------------
	EkBomb_MainFrame:Hide();
end

function EkBomb_MainFrame_Opacity_OnShow()
	-- ----------------
	-- Opacity slider is being shown.
	-- ----------------
	local slider = this;
	getglobal(slider:GetName().."High"):SetText("100%");
	getglobal(slider:GetName().."Low"):SetText("0%");
	getglobal(slider:GetName() .. "Text"):SetText(EkBomb_TEXT_Config_Opacity .. " = " .. floor(EkBomb_Opacity + 0.5) .. "%");

	slider:SetMinMaxValues(0, 1);
	slider:SetValueStep(0.01);
	slider:SetValue(EkBomb_Opacity / 100);
end

function EkBomb_MainFrame_Opacity_OnValueChanged()
	-- ----------------
	-- Value of opacity slider has changed.
	-- ----------------
	EkBomb_Opacity = floor(this:GetValue() * 100 + 0.5);
	getglobal(this:GetName() .. "Text"):SetText(EkBomb_TEXT_Config_Opacity .. " = " .. EkBomb_Opacity .. "%");
	EkBomb_MainFrame_SetOpacity();
end

function EkBomb_MainFrame_Scale_OnShow()
	-- ----------------
	-- Scale slider is being shown.
	-- ----------------
	local slider = this;
	getglobal(slider:GetName().."High"):SetText("200%");
	getglobal(slider:GetName().."Low"):SetText("25%");
	getglobal(slider:GetName() .. "Text"):SetText(EkBomb_TEXT_Config_Scale .. " = " .. floor(EkBomb_Scale + 0.5) .. "%");

	slider:SetMinMaxValues(.25, 2);
	slider:SetValueStep(0.01);
	slider:SetValue(EkBomb_Scale / 100);
end

function EkBomb_MainFrame_Scale_OnValueChanged()
	-- ----------------
	-- Value of scale slider has changed.
	-- ----------------
	EkBomb_Scale = floor(this:GetValue() * 100 + 0.5);
	getglobal(this:GetName() .. "Text"):SetText(EkBomb_TEXT_Config_Scale .. " = " .. EkBomb_Scale .. "%");
	EkBomb_MainFrame_SetScale();
end

function EkBomb_EkCheck_CreateTooltipText(index, total, data)
	-- ----------
	-- User moved pointer over a line in the list.
	--
	-- index -- position of the item in the list
	-- total -- number of items in the list
	-- data -- Array of data
	--
	-- 	data[]
	-- 	---------------
	-- 	[1] == EkCheck: Player name
	-- 	[2] == EkCheck: Uppercase english class string (ie. non-localized) (eg. "PRIEST")
	-- 	[3] == EkCheck: 0==Addon not loaded, 1==Addon loaded.
	-- 	[4] == EkCheck: 0==Player has not responded to the check, 1==Player has responded to the check.
	-- 	[5] == EkCheck: Player class (localized)
	-- 	[6] to [10] == EkCheck: Reserved
	--
	-- 	[11] == EkBomb: Version string
	-- 	[12] == EkBomb: Warnings are enabled (0==No, 1==Yes, -1=Unknown)
	-- 	[13] == EkBomb: Number of warnings enabled
	-- 	[14] == EkBomb: Maximum number of warnings
	-- 	[15] == EkBomb: Array of warning keys
	-- 	[16] == EkBomb: Warnings are enabled ("No", "Yes")
	-- 	[17] == EkBomb: Number of warnings and maximum (eg. "3/4")
	--
	-- Returns:
	--	a) nil -- if no tooltip should be generated.
	--	b) String containing text to appear in the tooltip.
	-- ----------
	local text;
	local white = "|c00FFFFFF";

	-- Show the warnings
	local k, b;
	local tbl = {};
	for i = 1, getn(data[15]) do
		k = data[15][i];

		b = EkBomb_BombsTable[k];
		if (b and b.name and b.mob) then
			tinsert(tbl, b.name .. " (" .. b.mob .. ")");
		else
			tinsert(tbl, EkBomb_TEXT_EkCheck_Unknown);
		end
	end
	table.sort(tbl);

	text = white .. "--- " .. EkBomb_TEXT_EkCheck_Enabled_Warnings .. " ---|r\n";
	for i = 1, getn(tbl) do
		text = text .. tbl[i] .. "\n";
	end

	text = text .. "\n" .. white .. "--- " .. EkBomb_TEXT_EkCheck_Disabled_Warnings .. " ---|r" .. "\n"
	for k, v in EkBomb_BombsSorted do
		local found = nil;
		for i=1,getn(data[15]) do
			if (data[15][i] == v) then
				found = i;
				break;
			end
		end
		if (not found) then
			local b = EkBomb_BombsTable[v];
			text = text .. b.name .. " (" .. b.mob .. ")\n"
		end
	end

	return text;
end

function EkBomb_EkCheck_CreateResponse(data)
	-- ----------------
	-- Create addon specific portion of response string.
	--
	-- data -- Array of data provided by EkCheck.
	--
	-- 	data[]
	-- 	--------
	-- 	[1] == Name of the player that initiated the check.
	-- 	[2] == Name of the addon being checked for.
	--
	-- Returns:
	-- 	a) nil or "" == No addon specific response string.
	--	b) Addon specific response string.
	-- ----------------
	local resp, warnMax;

	-- EkBomb version
	resp = "v" .. EkBomb_cVersion;

	-- Is EkBomb enabled
	if (EkBomb_Status == 1) then
		resp = resp .. " e1";
	else
		resp = resp .. " e0";
	end

	-- Which EkBomb warnings are enabled.
	for k, v in EkBomb_BombsConfig do
		local id;
		id = EkBomb_GetBossId(k);
		if (id) then
			if (v.enabled == 1) then
				resp = resp .. " b" .. id;
			end
		end
	end

	-- Total number of EkBomb warnings
	warnMax = 0;
	for k, v in EkBomb_BombsTable do
		warnMax = warnMax + 1;
	end
	resp = resp .. " m" .. warnMax;

	-- Return the response string.
	return resp;
end

function EkBomb_EkCheck_ParseResponse(text, data)
	-- ----------------
	-- Parse response text.
	--
	-- text -- The addon specific portion of the response.
	-- data -- Array of data provided by EkCheck.
	--
	-- 	data[]
	-- 	---------------
	-- 	[1] == Player name
	-- 	[2] == Uppercase english class string (ie. non-localized) (eg. "PRIEST")
	-- 	[3] == 0==Addon not loaded, 1==Addon loaded.
	-- 	[4] == 0==Player has not responded to the check, 1==Player has responded to the check.
	-- 	[5] == Player class (localized)
	--
	-- Returns:
	--	a) nil -- Invalid response
	--      b) Array containing addon specific data (to be used for the check window, tooltip, etc).
	-- ----------------
	local msg;
	local enabled, enText, warnCount, warnMax, warnText, warnings, version;

	enabled = -1;  -- Default to "unknown"
	warnCount = 0;
	warnMax = 0;
	warnings = {};
	version = "?";

	msg = strlower(text);

	for k, v in string.gfind(msg, "(%a)(%S+)") do
--		EkBomb_Print("key=[" .. k .. "], val=[" .. v .. "]");

		if (k == "b") then
			local bid, bkey;
			bid = tonumber(v);
			if (bid) then
				bkey = EkBomb_GetBossKey(bid);
				if (not bkey) then
					bkey = "???";
				end
				tinsert(warnings, bkey);
				warnCount = warnCount + 1;
			end

		elseif (k == "e") then
			if (v == "1") then
				enabled = 1;  -- Enabled
			elseif (v == "0") then
				enabled = 0;  -- Disabled
			else
				enabled = -1;  -- Unknown
			end

		elseif (k == "m") then
			warnMax = tonumber(v);
			if (not warnMax) then
				warnMax = 0;
			end

		elseif (k == "v") then
			version = v;

		end
	end

	warnText = warnCount .. "/" .. warnMax;

	if (enabled == 1) then
		enText = EkBomb_TEXT_EkCheck_Yes;
	elseif (enabled == 0) then
		enText = EkBomb_TEXT_EkCheck_No;
	else
		enText = "?";
	end

	return { version, enabled, warnCount, warnMax, warnings, enText, warnText };
end


function EkBomb_ColorPicker(key)
	-- ----------
	-- User wants to pick a color.
	-- ----------
	local frame = getglobal("EkBomb_ColorPickerFrame");
	local color = EkBomb_Color[key];
	local defcolor = EkBomb_DefaultColor[key];

	if (not color) then
		color = { r = defcolor.r, g = defcolor.g, b = defcolor.b };
		EkBomb_Color[key] = color;
	end

	frame.key = key;

	frame.r = color.r;
	frame.g = color.g;
	frame.b = color.b;

	frame.original = {r = color.r, g = color.g, b = color.b};

	frame.func = EkBomb_ChangeColor;
	frame.cancelFunc = EkBomb_CancelColor;

	EkBomb_ColorPickerFrameTitle:SetText(EkBomb_TEXT_Config_SelectColor);
	EkBomb_ColorPickerFrame:SetColorRGB(color.r, color.g, color.b);
	EkBomb_ColorPickerFrame:Show();
end

function EkBomb_ChangeColor()
	-- ----------
	-- User has selected a color.
	-- ----------
	local r, g, b = EkBomb_ColorPickerFrame:GetColorRGB();
	local key = EkBomb_ColorPickerFrame.key;
	local color = EkBomb_Color[key];

	color.r = r;
	color.g = g;
	color.b = b;

	EkBomb_SetColors();
end

function EkBomb_CancelColor()
	-- ----------
	-- User has cancelled the color selection.
	-- ----------
	local key = EkBomb_ColorPickerFrame.key;
	local original = EkBomb_ColorPickerFrame.original;
	local color = EkBomb_Color[key];

	color.r = original.r;
	color.g = original.g;
	color.b = original.b;

	EkBomb_SetColors();
end

function EkBomb_SetColors()
	-- ----------
	-- Set the colors.
	-- ----------
	local color;

	color = EkBomb_Color["small"];
	EkBomb_WarningFrame_Message1:SetTextColor(color.r, color.g, color.b);
	EkBomb_MainFrame_Opacity_SmallColorSwatchNormalTexture:SetVertexColor(color.r, color.g, color.b);

	color = EkBomb_Color["large"];
	EkBomb_WarningFrame_Message2:SetTextColor(color.r, color.g, color.b);
	EkBomb_MainFrame_Opacity_LargeColorSwatchNormalTexture:SetVertexColor(color.r, color.g, color.b);

	color = EkBomb_Color["back"];
	EkBomb_WarningFrame_Background:SetVertexColor(color.r, color.g, color.b);
	EkBomb_MainFrame_Opacity_BackgroundColorSwatchNormalTexture:SetVertexColor(color.r, color.g, color.b);
end

function EkBomb_SetDefaultColors()
	-- ----------------
	-- Reset to default colors.
	-- ----------------
	for k, v in EkBomb_DefaultColor do
		local color;
		color = {r = v.r, g = v.g, b = v.b};
		EkBomb_Color[k] = color;
	end
end

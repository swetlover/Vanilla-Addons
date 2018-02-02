function EUF_HpMpXp_OnLoad()
	this:RegisterEvent("VARIABLES_LOADED");
	this:RegisterEvent("UNIT_MANA");
	this:RegisterEvent("UNIT_HEALTH");
	this:RegisterEvent("UNIT_RAGE");
	this:RegisterEvent("UNIT_FOCUS");
	this:RegisterEvent("UNIT_ENERGY");
	this:RegisterEvent("UNIT_DISPLAYPOWER");
	this:RegisterEvent("PLAYER_ENTERING_WORLD");
	this:RegisterEvent("UPDATE_SHAPESHIFT_FORMS");
	this:RegisterEvent("PLAYER_TARGET_CHANGED");
	this:RegisterEvent("PARTY_MEMBERS_CHANGED");
	this:RegisterEvent("PLAYER_XP_UPDATE");

end;

function EUF_HpMpXp_OnEvent(event)
	if event == "UNIT_HEALTH" then
		EUF_HP_Update(arg1);
	elseif event == "UNIT_MANA" or event == "UNIT_FOCUS" or event == "UNIT_ENERGY" or event == "UNIT_RAGE" or event == "UPDATE_SHAPESHIFT_FORMS" then
		EUF_MP_Update(arg1);
	elseif event == "PARTY_MEMBERS_CHANGED" then
		EUF_PartyFrameHPMP_Update();
		EUF_PartyFrameDisplay_Update();
	elseif event == "PLAYER_TARGET_CHANGED" then
		EUF_TargetFrameHPMP_Update();
	elseif event == "PLAYER_ENTERING_WORLD" then
		EUF_Frame_Update();
	elseif event == "UNIT_LEVEL" or event == "UNIT_DISPLAYPOWER" then
		EUF_HP_Update(arg1);
		EUF_MP_Update(arg1);
	elseif event == "PLAYER_XP_UPDATE" then
		EUF_PlayerFrameXp_Update();
	elseif event == "VARIABLES_LOADED" then
		EUF_HpMpXp_Init();		
	end;
end;

function EUF_HpMpXp_Init()
	PetFrame:SetPoint("TOPLEFT","PlayerFrame","TOPLEFT",72,-72); 
	PetName:SetPoint("BOTTOMLEFT","PetFrame","BOTTOMLEFT",50,31); 
	PartyMemberFrame1:ClearAllPoints();
	PartyMemberFrame1:SetPoint("TOPLEFT","UIParent","TOPLEFT",20,-180);
	PartyMemberFrame2:SetPoint("TOPLEFT","PartyMemberFrame1PetFrame","BOTTOMLEFT",-23,-16);
	PartyMemberFrame3:SetPoint("TOPLEFT","PartyMemberFrame2PetFrame","BOTTOMLEFT",-23,-16);
	PartyMemberFrame4:SetPoint("TOPLEFT","PartyMemberFrame3PetFrame","BOTTOMLEFT",-23,-16);
	EUF_Frame_Update();
end;

-- PlayerFrame
function EUF_PlayerFramePosition_Update()
	-- Display HP percent or location
	if EUF_CurrentOptions["PLAYERPOSITION"] == 0 then
		return;
	end;
	local displayText = "";

	if EUF_CurrentOptions["PLAYERPOSITIONMANA"] == 1 then
		displayText = EUF_PlayerFrameHPPercent:GetText();
	else
		local x, y = GetPlayerMapPosition("player");
		if x and y then
			x = math.floor(x * 100);
			y = math.floor(y * 100);
		else
			x = 0;
			y = 0;
		end;
		if EUF_CurrentOptions["PLAYERPOSITIONAUTO"] == 1 and x == 0 and y == 0 then
			displayText = EUF_PlayerFrameHPPercent:GetText();
		else
			displayText = string.format("(%s, %s)", x, y);
		end;
	end;
	EUF_PlayerFramePosition:SetText(displayText);
end;

-- HP/MP/XP
function EUF_HP_Update(unit)
	if not unit or (unit ~= "player" and unit~="target" and not string.find(unit, "^party%d$")) then
		return;
	end;
	local currValue = UnitHealth(unit);
	local maxValue = UnitHealthMax(unit);
	local percent = math.floor(currValue * 100 / maxValue);
	local digit = currValue  .. "/" .. maxValue;
	
	if percent and maxValue ~= 0 then
		percent = percent .. "%";
	else
		percent = "";
		digit = "";
	end;
	
	if unit == "target" and (UnitIsDead("target") or (EUF_CurrentOptions["TARGETACCTUALHPMP"] == 1 and maxValue == 100) or (MobHealth_GetTargetCurHP and UnitCanAttack("player", "target") and not UnitIsDead("target") and not UnitIsFriend("player", "target"))) then
		digit = "";
	end;
	
	local unitObj, unitPercentObj, unitObjShow, unitPercentObjShow, unitId;
	if unit == "player" then
		unitObj = EUF_PlayerFrameHP;
		unitPercentObj = EUF_PlayerFrameHPPercent;
		if EUF_CurrentOptions["PLAYERAUTOHEALTHCOLOR"] == 1 then
			PlayerFrameHealthBar:SetStatusBarColor(EUF_GetPercentColor(currValue, maxValue));
		end;
	elseif unit == "target" then
		unitObj = EUF_TargetFrameHP;
		unitPercentObj = EUF_TargetFrameHPPercent;
		if EUF_CurrentOptions["TARGETAUTOHEALTHCOLOR"] == 1 then
			TargetFrameHealthBar:SetStatusBarColor(EUF_GetPercentColor(currValue, maxValue));
		end;
	else
		unitId = string.sub(unit, -1);
		unitObj = getglobal("EUF_PartyFrame" .. unitId .. "HP");
		unitPercentObj = getglobal("EUF_PartyFrame" .. unitId .. "HPPercent");
		if EUF_CurrentOptions["PARTYAUTOHEALTHCOLOR"] == 1 then
			getglobal("PartyMemberFrame" .. unitId .. "HealthBar"):SetStatusBarColor(EUF_GetPercentColor(currValue, maxValue));
		end;
	end;
	
	if unitObj then
		unitObj:SetText(digit);
	end;
	if unitPercentObj then
		unitPercentObj:SetText(percent);
	end;
end;

function EUF_MP_Update(unit)
	if not unit or (unit ~= "player" and unit~="target" and not string.find(unit, "^party%d$")) then
		return;
	end;
	local currValue = UnitMana(unit);
	local maxValue = UnitManaMax(unit);
	local percent = math.floor(currValue * 100 / maxValue);
	local digit = currValue  .. "/" .. maxValue;
	
	if percent and maxValue ~= 0 then
		percent = percent .. "%";
	else
		percent = "";
		digit = "";
	end;
	
	local unitObj, unitPercentObj, unitObjShow, unitPercentObjShow, unitId;
	if unit == "player" then
		unitObj = EUF_PlayerFrameMP;
		unitPercentObj = EUF_PlayerFrameMPPercent;
		if EUF_CurrentOptions["PLAYERMANAFILTER"] == 1 and UnitPowerType(unit) ~= 0 then
			percent="";
			digit="";
		end;
	elseif unit == "target" then
		unitObj = EUF_TargetFrameMP;
		unitPercentObj = EUF_TargetFrameMPPercent;
	else
		unitId = string.sub(unit, -1);
		unitObj = getglobal("EUF_PartyFrame" .. unitId .. "MP");
		unitPercentObj = getglobal("EUF_PartyFrame" .. unitId .. "MPPercent");
		if EUF_CurrentOptions["PARTYMANAFILTER"] == 1 and UnitPowerType(unit) ~= 0 then
			percent="";
			digit="";
		end;
	end;
	
	if unitObj then
		unitObj:SetText(digit);
	end;
	if unitPercentObj then
		unitPercentObj:SetText(percent);
	end;
end;

-- XP
function EUF_PlayerFrameXp_Update()
	local playerXP = UnitXP("player");
	local playerXPMax = UnitXPMax("player"); 
	local playerXPRest = GetXPExhaustion();
	if not playerXPRest or EUF_CurrentOptions["PLAYEREXTBAR"] ~= 1 then 
		EUF_PlayerFrameXP:SetText(string.format("%s / %s", playerXP, playerXPMax));
	else 
		EUF_PlayerFrameXP:SetText(string.format("%s/%s (+%s)", playerXP, playerXPMax, playerXPRest/2)); 
	end 
	EUF_PlayerFrameXPBar:SetMinMaxValues(min(0, playerXP), playerXPMax) 
	EUF_PlayerFrameXPBar:SetValue(playerXP); 
end;

function EUF_PlayerFrameHPMP_Update()
	EUF_HP_Update("player");
	EUF_MP_Update("player");
end;

function EUF_TargetFrameHPMP_Update()
	EUF_HP_Update("target");
	EUF_MP_Update("target");
end;

function EUF_PartyFrameHPMP_Update()
	local i;
	for i=1, GetNumPartyMembers() do
		EUF_HP_Update("party"..i);
		EUF_MP_Update("party"..i);
	end;
end;

function EUF_FrameHPMP_Update()
	EUF_PlayerFrameHPMP_Update();
	EUF_TargetFrameHPMP_Update();
	EUF_PartyFrameHPMP_Update();
end;


-- Frame position / display adjust

function EUF_PlayerFrameElite_Update()
-- Elite PlayerFrame
	local yOffset = -8;
	if TITAN_PANEL_PLACE_TOP then
		yOffset = -26;
	end
	if EUF_CurrentOptions["PLAYERELITE"] == 1 then
		PlayerFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Elite");
		PlayerFrame:SetPoint("TOPLEFT","UIParent","TOPLEFT", 4, yOffset);
		EUF_PlayerFrameTextureExt:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Elite");
		EUF_PlayerFrameXPBarBorder:SetDesaturated(nil);
		EUF_PlayerFrameXPBarBorderExt:SetDesaturated(nil);
	else
		PlayerFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame");
		PlayerFrame:SetPoint("TOPLEFT","UIParent","TOPLEFT", -25, yOffset);
		EUF_PlayerFrameTextureExt:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame");
		EUF_PlayerFrameXPBarBorder:SetDesaturated(1);
		EUF_PlayerFrameXPBarBorderExt:SetDesaturated(1);
	end;
end;

function EUF_PlayerFrameExtBar_Update()
	if EUF_CurrentOptions["PLAYEREXTBAR"] == 1 then
		EUF_PlayerFramePosition:ClearAllPoints();
		EUF_PlayerFramePosition:SetPoint("CENTER","PlayerFrame","TOPLEFT",262,-31);
		EUF_PlayerFrameHP:ClearAllPoints();
		EUF_PlayerFrameHP:SetPoint("CENTER","PlayerFrame","TOPLEFT",262,-47);
		EUF_PlayerFrameMP:ClearAllPoints();
		EUF_PlayerFrameMP:SetPoint("CENTER","PlayerFrame","TOPLEFT",262,-58);
		EUF_PlayerFrameHPPercent:ClearAllPoints();
		EUF_PlayerFrameHPPercent:SetPoint("CENTER","PlayerFrame","TOPLEFT",262,-47);
		EUF_PlayerFrameMPPercent:ClearAllPoints();
		EUF_PlayerFrameMPPercent:SetPoint("CENTER","PlayerFrame","TOPLEFT",262,-58);
		EUF_PlayerFrameBackground:Show();
		EUF_PlayerFrameTextureExt:Show();
		EUF_PlayerFrameXPBarBkgExt:SetWidth(192);
		EUF_PlayerFrameXPBarBorderExt:SetWidth(80);
		EUF_PlayerFrameXPBar:SetWidth(190);
		EUF_PlayerFrameXPBarBorderExt:SetTexCoord(0.5703125, 0.8828125, 0, 1);
		EUF_PlayerFrameXP:ClearAllPoints();
		EUF_PlayerFrameXP:SetPoint("CENTER", "PlayerFrame", 90, -19);
	else
		EUF_PlayerFramePosition:ClearAllPoints();
		EUF_PlayerFramePosition:SetPoint("LEFT","PlayerFrame","TOPLEFT",229,-31);
		EUF_PlayerFrameHP:ClearAllPoints();
		EUF_PlayerFrameHP:SetPoint("LEFT","PlayerFrame","TOPLEFT",229,-47);
		EUF_PlayerFrameMP:ClearAllPoints();
		EUF_PlayerFrameMP:SetPoint("LEFT","PlayerFrame","TOPLEFT",229,-58);
		EUF_PlayerFrameHPPercent:ClearAllPoints();
		EUF_PlayerFrameHPPercent:SetPoint("LEFT","PlayerFrame","TOPLEFT",229,-47);
		EUF_PlayerFrameMPPercent:ClearAllPoints();
		EUF_PlayerFrameMPPercent:SetPoint("LEFT","PlayerFrame","TOPLEFT",229,-58);
		EUF_PlayerFrameBackground:Hide();
		EUF_PlayerFrameTextureExt:Hide();
		EUF_PlayerFrameXPBarBkgExt:SetWidth(122);
		EUF_PlayerFrameXPBarBorderExt:SetWidth(9);
		EUF_PlayerFrameXPBarBorderExt:SetTexCoord(0.84765625, 0.8828125, 0, 1);
		EUF_PlayerFrameXPBar:SetWidth(119);
		EUF_PlayerFrameXP:ClearAllPoints();
		EUF_PlayerFrameXP:SetPoint("CENTER", "PlayerFrame", 50, -19);
	end;
end;

function EUF_PlayerFrameTargetFrameGap_Update()
	local gap;
	if EUF_CurrentOptions["PLAYEREXTBAR"] == 1 then
		gap = 72;
	else
		if EUF_CurrentOptions["PLAYERHPPERCENT"] == 0 or EUF_CurrentOptions["PLAYERMPPERCENT"] == 0 then
			gap = 65;
		else
			gap = 36;
		end;
	end;
	if EUF_CurrentOptions["TARGETMPPERCENT"] == 1 or EUF_CurrentOptions["TARGETHPPERCENT"] == 1 then
		gap = gap + 34;
	else
		gap = gap + 10;
	end;
	TargetFrame:SetPoint("TOPLEFT", "PlayerFrame", "TOPRIGHT", gap, 0);
end

function EUF_PlayerFrameDisplay_Update()
	if EUF_CurrentOptions["PLAYERHP"] == 0 then
		EUF_ObjectDisplay_Update(EUF_PlayerFrameHP, 0);
		EUF_ObjectDisplay_Update(EUF_PlayerFrameHPPercent, 0);
	else
		if EUF_CurrentOptions["PLAYERHPPERCENT"] == 0 then
			EUF_ObjectDisplay_Update(EUF_PlayerFrameHP, 1);
			EUF_ObjectDisplay_Update(EUF_PlayerFrameHPPercent, 0);
		else
			EUF_ObjectDisplay_Update(EUF_PlayerFrameHP, 0);
			EUF_ObjectDisplay_Update(EUF_PlayerFrameHPPercent, 1);
		end;
	end;
	if EUF_CurrentOptions["PLAYERMP"] == 0 then
		EUF_ObjectDisplay_Update(EUF_PlayerFrameMP, 0);
		EUF_ObjectDisplay_Update(EUF_PlayerFrameMPPercent, 0);
	else
		if EUF_CurrentOptions["PLAYERMPPERCENT"] == 0 then
			EUF_ObjectDisplay_Update(EUF_PlayerFrameMP, 1);
			EUF_ObjectDisplay_Update(EUF_PlayerFrameMPPercent, 0);
		else
			EUF_ObjectDisplay_Update(EUF_PlayerFrameMP, 0);
			EUF_ObjectDisplay_Update(EUF_PlayerFrameMPPercent, 1);
		end;
	end;
	EUF_ObjectDisplay_Update(EUF_PlayerFramePosition, EUF_CurrentOptions["PLAYERPOSITION"]);
	EUF_ObjectDisplay_Update(EUF_PlayerFrameXP, EUF_CanXPBarShow());
	EUF_ObjectDisplay_Update(EUF_PlayerFrameXPBar, EUF_CanXPBarShow());
end;

function EUF_PartyFrameDisplay_Update()
	local i;
	for i=1, GetNumPartyMembers() do
		if EUF_CurrentOptions["PARTYHP"] == 0 then
			EUF_ObjectDisplay_Update(getglobal("EUF_PartyFrame"..i.."HP"), 0);
			EUF_ObjectDisplay_Update(getglobal("EUF_PartyFrame"..i.."HPPercent"), 0);
		else
			if EUF_CurrentOptions["PARTYHPPERCENT"] == 0 then
				EUF_ObjectDisplay_Update(getglobal("EUF_PartyFrame"..i.."HP"), 1);
				EUF_ObjectDisplay_Update(getglobal("EUF_PartyFrame"..i.."HPPercent"), 0);
			else
				EUF_ObjectDisplay_Update(getglobal("EUF_PartyFrame"..i.."HP"), 0);
				EUF_ObjectDisplay_Update(getglobal("EUF_PartyFrame"..i.."HPPercent"), 1);
			end;
		end;
		if EUF_CurrentOptions["PARTYMP"] == 0 then
			EUF_ObjectDisplay_Update(getglobal("EUF_PartyFrame"..i.."MP"), 0);
			EUF_ObjectDisplay_Update(getglobal("EUF_PartyFrame"..i.."MPPercent"), 0);
		else
			if EUF_CurrentOptions["PARTYMPPERCENT"] == 0 then
				EUF_ObjectDisplay_Update(getglobal("EUF_PartyFrame"..i.."MP"), 1);
				EUF_ObjectDisplay_Update(getglobal("EUF_PartyFrame"..i.."MPPercent"), 0);
			else
				EUF_ObjectDisplay_Update(getglobal("EUF_PartyFrame"..i.."MP"), 0);
				EUF_ObjectDisplay_Update(getglobal("EUF_PartyFrame"..i.."MPPercent"), 1);
			end;
		end;
	end;
end;

function EUF_TargetFrameDisplay_Update()
	EUF_ObjectDisplay_Update(EUF_TargetFrameHP, EUF_CurrentOptions["TARGETHP"]);
	EUF_ObjectDisplay_Update(EUF_TargetFrameHPPercent, EUF_CurrentOptions["TARGETHPPERCENT"]);
	EUF_ObjectDisplay_Update(EUF_TargetFrameMP, EUF_CurrentOptions["TARGETMP"]);
	EUF_ObjectDisplay_Update(EUF_TargetFrameMPPercent, EUF_CurrentOptions["TARGETMPPERCENT"]);
end;

function EUF_FrameDisplay_Update()
	EUF_PlayerFrameDisplay_Update();
	EUF_TargetFrameDisplay_Update();
	EUF_PartyFrameDisplay_Update();
end;

function EUF_Frame_Update()
	EUF_FrameDisplay_Update();
	EUF_FrameHPMP_Update();
	EUF_PlayerFrameXp_Update();
	EUF_PlayerFrameElite_Update();		
	EUF_PlayerFrameExtBar_Update();
	EUF_PlayerFrameTargetFrameGap_Update();
end;

--Basic functions
function EUF_CanXPBarShow()
	local canShow = EUF_CurrentOptions["PLAYERXP"];
	if (canShow == 1 and EUF_CurrentOptions["PLAYERXPAUTO"] == 1 and UnitLevel("player") and UnitLevel("player") >= 60) then
		canShow = 0;
	end;
	return canShow;
end;

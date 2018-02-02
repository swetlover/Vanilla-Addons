local EUF_SHIELD_THRESHOLD_RED = 2250;
local EUF_SHIELD_THRESHOLD_YELLOW = 900;
local EUF_TARGET_INTERVAL = 0;
local EUF_TARGET_INTERVAL_MID = 10;
local EUF_TARGET_INTERVAL_MAX = 20;
local ShieldYOffset = 28;

function EUF_TargetInfo_OnLoad()
	this:RegisterEvent("VARIABLES_LOADED");
	this:RegisterEvent("PLAYER_TARGET_CHANGED");
end;

function EUF_TargetInfo_OnEvent(event)	
	if event == "PLAYER_TARGET_CHANGED" then
		EUF_TargetInfoClass_Update();
		EUF_TargetInfoGap_Update();
		EUF_TOTSELF_SOUND = 0;
	elseif event == "VARIABLES_LOADED" then
		UIErrorsFrame:SetPoint("TOP", "UIParent", "TOP", 0, -165);
		EUF_TargetTargetHpPercentDisplay_Update();
	end;
end;

function EUF_TargetInfo_Update()
	local tempOffset = 0;
	if EUF_CurrentOptions["TARGETINFOTARGET"] == 1 and UnitIsVisible("targettarget") then
		EUF_TargetInfoTarget:Show();
		tempOffset = -16;
	else
		EUF_TargetInfoTarget:Hide();
	end
	
	if EUF_CurrentOptions["TARGETTARGETHPMPBAR"] == 1 and UnitIsVisible("targettarget") then
		EUF_TargetInfoTargetHPMPBar:Show();
		tempOffset = -28;
	else
		EUF_TargetInfoTargetHPMPBar:Hide();
	end

	--Set TargetInfoShield YOffset
	EUF_TargetInfoShield:SetPoint("TOPLEFT", EUF_TargetInfoTarget ,"TOPLEFT", 0, tempOffset);
	
end;

function EUF_TargetTargetHpPercentDisplay_Update()
	if EUF_CurrentOptions["TARGETTARGETHPPERCENT"] == 1 then
		EUF_TargetInfoTargetHPPercent:Show();
	else
		EUF_TargetInfoTargetHPPercent:Hide();
	end;
end;

-- Class Info
function EUF_TargetInfoClass_Update()
	if (EUF_CurrentOptions["TARGETINFO"] == 1) then
		EUF_TargetInfo:SetText(EUF_GetUnitInfoString("target", EUF_CurrentOptions["TARGETINFOLEVEL"], 1, EUF_CurrentOptions["TARGETINFORACE"], EUF_CurrentOptions["TARGETINFOCLASS"], EUF_CurrentOptions["TARGETINFOELITE"]));
	end;
end

-- TargetTarget

function EUF_TargetInfoTarget_Update()
	local targetTarget = UnitName("targettarget");
	local targetIsFriend = UnitIsFriend("targettarget", "player");
	if not targetTarget then
		targetTarget = "";
	end;
	local targetString = "";
		
	if targetIsFriend then
		if ((targetTarget == EN_PlayerName) and UnitCanAttack("target", "player")) then
			if EUF_TOTSELF_SOUND ~= 1 then
				EUF_TargetFrameToTSound_Play();
			end;
			EUF_TARGET_INTERVAL = EUF_TARGET_INTERVAL + 1;
			if (EUF_TARGET_INTERVAL > EUF_TARGET_INTERVAL_MID) then
				targetString = "|cffff0000" .. targetTarget .."|r";					
			else
				targetString = "|cffffff00" .. targetTarget .."|r";					
			end;
			if (EUF_TARGET_INTERVAL > EUF_TARGET_INTERVAL_MAX) then
				EUF_TARGET_INTERVAL = 0;
			end;
		else
			EUF_TOTSELF_SOUND = 0;
			targetString = "|cffffffff" .. targetTarget .."|r";					
		end;
	else
		targetString = "|cffff0000" .. targetTarget .."|r";
	end;

	EUF_TargetInfoTargetName:SetText(EUF_TEXT_TARGET .. targetString);
end;

function EUF_TargetInfoTargetHPMP_Update()
	local color = ManaBarColor[UnitPowerType("targettarget")];
	EUF_TargetInfoTargetMPBar:SetStatusBarColor(color.r, color.g, color.b);
	EUF_TargetInfoTargetMPBkg:SetStatusBarColor(color.r, color.g, color.b, 0.25);
	EUF_TargetInfoTargetHPBar:SetMinMaxValues(0, UnitHealthMax("targettarget"));
	EUF_TargetInfoTargetHPBar:SetValue(UnitHealth("targettarget"));			
	EUF_TargetInfoTargetMPBar:SetMinMaxValues(0, UnitManaMax("targettarget"));
	EUF_TargetInfoTargetMPBar:SetValue(UnitMana("targettarget"));
	local curHp = UnitHealth("targettarget");
	local maxHp = UnitHealthMax("targettarget");
	if curHp and maxHp then
		EUF_TargetInfoTargetHPPercent:SetText(math.floor(curHp * 100 / maxHp) .. "%");
		if EUF_CurrentOptions["TARGETTARGETHPPERCENTCOLOR"] == 1 then
			EUF_TargetInfoTargetHPPercent:SetTextColor(EUF_GetPercentColor(curHp, maxHp));
		else
			EUF_TargetInfoTargetHPPercent:SetTextColor(1, 0.75, 0);
		end;
	else
		EUF_TargetInfoTargetHPPercent:SetText("");
	end;
	
end;

function EUF_TargetInfoShield_Update()
	local targetShield = EUF_GetTargetShield();
	if (targetShield ~= 0) then
		local targetShieldString;
		if (targetShield < EUF_SHIELD_THRESHOLD_YELLOW) then
			targetShieldString = "|cffffffff" .. targetShield .. "|r";
		elseif  (targetShield < EUF_SHIELD_THRESHOLD_RED) then
			targetShieldString = "|cffffff00" .. targetShield .. "|r";
		else
			targetShieldString = "|cffff0000" .. targetShield .. "|r";
		end;
		EUF_TargetInfoShieldValue:SetText(EUF_TEXT_BROKENSHIELD .. targetShieldString);
	else
		EUF_TargetInfoShieldValue:SetText("");
	end;
end;

function EUF_TargetInfoDisplay_Update()
	EUF_ObjectDisplay_Update(EUF_TargetInfoShield, EUF_CurrentOptions["TARGETINFOBROKENSHIELD"]);
	EUF_ObjectDisplay_Update(EUF_TargetInfo, EUF_CurrentOptions["TARGETINFO"]);
end;

function EUF_TargetFrameToTSound_Play()
	if GetNumPartyMembers() > 0 or GetNumRaidMembers() > 0 then
		PlaySoundFile("Sound\\Doodad\\BellTollNightElf.wav");
	end;
	EUF_TOTSELF_SOUND = 1;
end;

function EUF_TargetInfoGap_Update()
	local targetclf = UnitClassification("target");
	if (targetclf and targetclf ~= "normal") then
		EUF_TargetInfoTarget:SetPoint("TOPLEFT","TargetFrame","TOPLEFT",126,-98);
	else
		EUF_TargetInfoTarget:SetPoint("TOPLEFT","TargetFrame","TOPLEFT",126,-83);
	end;
end;

function EUF_GetTargetShield()
	local i, debuffTexture, debuffTimes;
	for i = 1, 16 do
		debuffTexture, debuffTimes = UnitDebuff("target", i);
		if debuffTexture and debuffTimes and debuffTexture == "Interface\\Icons\\Ability_Warrior_Sunder" then
			return debuffTimes * 450;
		end;
	end;
	return 0;
end;

function EUF_GetUnitInfoString(unit, withLevel, withLevelTag, withRace, withClass, withElite)
	local tempstring = "";
	local isElite = 0;
	if (withLevel == 1) then
		local level= UnitLevel(unit);	
		if ( not (level and level >= 1)) then
			level = "??";
		end
		if (withLevelTag == 1) then
			level = string.format(EUF_TEXT_LEVELTAG, level);
		end
		tempstring = tempstring .. level .. " ";
	end
	
	if (withElite == 1) then
		local unitclf = UnitClassification(unit);
		if (unitclf and unitclf ~= "normal" and UnitHealth(unit) > 0) then
			isElite = 1;
			if (unitclf == "elite") then
				tempstring = tempstring .. EUF_TEXT_ELITE .. " ";
			elseif (unitclf == "worldboss") then
				tempstring = tempstring .. "|cffffffff" .. EUF_TEXT_WORLDBOSS .. "|r ";
			elseif (unitclf == "rare") then
				tempstring = tempstring .. "|cffffffff" .. EUF_TEXT_RARE .. "|r ";
			elseif (unitclf == "rareelite") then
				tempstring = tempstring .. "|cffffffff" .. EUF_TEXT_RAREELITE .. "|r ";
			end
		end
	end

	if (withRace == 1 and isElite == 0) then
		if (UnitRace(unit) and UnitIsPlayer(unit)) then
			tempstring = tempstring .. UnitRace(unit) .. " ";
		elseif (UnitPlayerControlled(unit)) then
			if (UnitCreatureFamily(unit)) then
				tempstring = tempstring .. UnitCreatureFamily(unit) .. " ";
			end
		else
			if (UnitCreatureType(unit)) then
				tempstring = tempstring .. UnitCreatureType(unit) .. " ";
			end
		end
	end

	if (withClass == 1) then
		local class = UnitClass(unit);
		if class then
			tempstring = tempstring .. class;
		end
	end

	return tempstring;
end
local EUF_CLASS_TEXTURE = "Interface\\AddOns\\EN_UnitFrames\\EN_ClassIcon";
local EUF_CLASS_ICON = {
	["WARRIOR"] = {0, 0.25, 0, 0.25},
	["MAGE"] = {0.25, 0.49609375, 0, 0.25},
	["ROGUE"] = {0.49609375, 0.7421875, 0, 0.25},
	["DRUID"] = {0.7421875, 0.98828125, 0, 0.25},
	["HUNTER"] = {0, 0.25, 0.25, 0.5},
	["SHAMAN"] = {0.25, 0.49609375, 0.25, 0.5},
	["PRIEST"] = {0.49609375, 0.7421875, 0.25, 0.5},
	["WARLOCK"] = {0.7421875, 0.98828125, 0.25, 0.5},
	["PALADIN"] = {0, 0.25, 0.5, 0.75},
}

function EUF_SetClass(portrait, unit)
	-- Set 8 class icon
	local class, category, categoryId;
	if (unit ~= "player" and unit ~= "target" and not string.find(unit, "^party%d$")) then
		return;
	end;
	if unit == "player" then
		category = "Player";
		categoryId = "";
	end;
	if unit == "target" then
		category = "Target";
		categoryId = "";
	end;
	local partyexists, _, partyid = string.find(unit, "^party(%d)$");
	if partyexists then
		category = "Party";
		categoryId = partyid;
	end;

	portrait:SetTexCoord(0, 1, 0, 1);
	local classLoc, class = UnitClass(unit);
	
	if classLoc then
		if EUF_CurrentOptions[string.upper(category) .. "CLASSICONBIG"] == 1 then
			if class and UnitIsPlayer(unit) then
				EUF_SetPortraitTexture(portrait, class);
			end;
		end;
		
		if EUF_CurrentOptions[string.upper(category) .. "CLASSICONSMALL"] == 1 then
			if class and UnitIsPlayer(unit) then
				EUF_SetPortraitTexture(getglobal("EUF_" .. category .. "Frame" .. categoryId .. "PortraitIcon"), class);
				getglobal("EUF_" .. category .. "Frame" .. categoryId .. "Portrait"):Show();
			else
				getglobal("EUF_" .. category .. "Frame" .. categoryId .. "Portrait"):Hide();
			end;
		end;
	end;
end

function EUF_SetPortraitTexture(portrait, class)
	-- Set 8 class icon
	portrait:SetTexture(EUF_CLASS_TEXTURE);
	portrait:SetTexCoord(EUF_CLASS_ICON[class][1],EUF_CLASS_ICON[class][2],EUF_CLASS_ICON[class][3],EUF_CLASS_ICON[class][4]);
end;

function EUF_ClassIcon_Update(unit, iconType, value)
	if unit=="player" then
		if iconType=="Big" then
			if value == 0 then
				PlayerPortrait:SetTexCoord(0, 1, 0, 1);
				SetPortraitTexture(PlayerPortrait, "player");
			else
				EUF_SetClass(PlayerPortrait, "player");
			end;
		else
			if value == 0 then
				EUF_PlayerFramePortrait:Hide();
			else
				EUF_SetClass(PlayerPortrait, "player");
			end;
		end;
	elseif unit=="target" then
		if iconType=="Big" then
			if value == 0 then
				TargetPortrait:SetTexCoord(0, 1, 0, 1);
				SetPortraitTexture(TargetPortrait,"target");
			else
				EUF_SetClass(TargetPortrait,"target");
			end;
		else
			if value == 0 then
				EUF_TargetFramePortrait:Hide();
			else
				EUF_SetClass(TargetPortrait, "target")
			end;
		end;
	elseif unit=="party" then
		local i;
		if iconType=="Big" then
			for i = 1, 4, 1 do
				if (GetPartyMember(i)) then
					if value == 0 then
						getglobal("PartyMemberFrame" .. i .. "Portrait"):SetTexCoord(0, 1, 0, 1);
						SetPortraitTexture(getglobal("PartyMemberFrame" .. i .. "Portrait"), "party" .. i);
					else
						EUF_SetClass(getglobal("PartyMemberFrame" .. i .. "Portrait"), "party" .. i);
					end;
				end;
			end
		else
			for i = 1, 4, 1 do
				if (GetPartyMember(i)) then
					if value == 0 then
						getglobal("EUF_PartyFrame" .. i .. "Portrait"):Hide();
					else
						EUF_SetClass(getglobal("PartyMemberFrame" .. i .. "Portrait"), "party" .. i);
					end;
				end;
			end
		end;
	end;
end;

function EUF_FrameClassIcon_Update()
	EUF_ClassIcon_Update("player", "Big", EUF_CurrentOptions["PLAYERCLASSICONBIG"]);
	EUF_ClassIcon_Update("player", "Small", EUF_CurrentOptions["PLAYERCLASSICONSMALL"]);
	EUF_ClassIcon_Update("target", "Big", EUF_CurrentOptions["PLAYERCLASSICONBIG"]);
	EUF_ClassIcon_Update("target", "Small", EUF_CurrentOptions["PLAYERCLASSICONSMALL"]);
	EUF_ClassIcon_Update("party", "Big", EUF_CurrentOptions["PARTYCLASSICONBIG"]);
	EUF_ClassIcon_Update("party", "Small", EUF_CurrentOptions["PARTYCLASSICONSMALL"]);
end;

function EUF_UnitFrame_OnEvent(event)
	EOR_UnitFrame_OnEvent(event);
	if ((event == "UNIT_PORTRAIT_UPDATE") and (arg1 == this.unit)) then
		EUF_SetClass(this.portrait, this.unit)
	end	
end

function EUF_UnitFrame_Update()
	EOR_UnitFrame_Update();
	EUF_SetClass(this.portrait, this.unit)
	return;
end

EOR_UnitFrame_OnEvent = UnitFrame_OnEvent;
UnitFrame_OnEvent = EUF_UnitFrame_OnEvent;

EOR_UnitFrame_Update = UnitFrame_Update;
UnitFrame_Update = EUF_UnitFrame_Update;

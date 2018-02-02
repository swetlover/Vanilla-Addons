EUF_MAX_PARTY_DEBUFFS = 16;
EUF_MAX_PARTY_BUFFS = 16;

function PartyMemberFrame_RefreshBuffs()
	local id;
	local buffButtonName;
	local buffImage;
	local idx;

	id = this:GetID();

	idx = 1;
	for i=1, 16 do
		if ( idx <= EUF_MAX_PARTY_BUFFS ) then
			buffImage = UnitBuff("party"..id, i);
			if ( buffImage ) then
				buffButtonName = "EUF_PartyBuffFrame"..id.."Buff"..idx;
				getglobal(buffButtonName.."Icon"):SetTexture(buffImage);
				getglobal(buffButtonName):SetID(i);
				getglobal(buffButtonName):Show();
				idx = idx + 1;
			end
		end
	end
	for i=idx, EUF_MAX_PARTY_BUFFS do
		getglobal("EUF_PartyBuffFrame"..id.."Buff"..i):Hide();
	end

	idx = 1;
	for i=1, 16 do
		if ( idx <= EUF_MAX_PARTY_DEBUFFS ) then
			buffImage = UnitDebuff("party"..id, i);
			if ( buffImage ) then
				buffButtonName = "EUF_PartyBuffFrame"..id.."DeBuff"..idx;
				getglobal(buffButtonName.."Icon"):SetTexture(buffImage);
				getglobal(buffButtonName):SetID(i);
				getglobal(buffButtonName):Show();
				idx = idx + 1;
			end
		end
	end
	for i=idx, EUF_MAX_PARTY_DEBUFFS do
		getglobal("EUF_PartyBuffFrame"..id.."DeBuff"..i):Hide();
	end

end

function PetFrame_RefreshBuffs()
	local buffButtonName;
	local buffImage;
	local idx;

	idx = 1;
	for i=1, 16 do
		if ( idx <= EUF_MAX_PARTY_BUFFS ) then
			buffImage = UnitBuff("pet", i);
			if ( buffImage ) then
				buffButtonName = "EUF_PetBuffFrameBuff"..idx;
				getglobal(buffButtonName.."Icon"):SetTexture(buffImage);
				getglobal(buffButtonName):SetID(i);
				getglobal(buffButtonName):Show();
				idx = idx + 1;
			end
		end
	end
	for i=idx, EUF_MAX_PARTY_BUFFS do
		getglobal("EUF_PetBuffFrameBuff"..i):Hide();
	end

	idx = 1;
	for i=1, 16 do
		if ( idx <= EUF_MAX_PARTY_DEBUFFS ) then
			buffImage = UnitDebuff("pet", i);
			if ( buffImage ) then
				buffButtonName = "EUF_PetBuffFrameDeBuff"..idx;
				getglobal(buffButtonName.."Icon"):SetTexture(buffImage);
				getglobal(buffButtonName):SetID(i);
				getglobal(buffButtonName):Show();
				idx = idx + 1;
			end
		end
	end
	for i=idx, EUF_MAX_PARTY_DEBUFFS do
		getglobal("EUF_PetBuffFrameDeBuff"..i):Hide();
	end

end

function PartyMemberFrame_RefreshPetBuffs(id)
	local buffButtonName;
	local buffImage;
	local idx;

	if ( not id ) then
		id = this:GetID();
	end

	idx = 1;
	for i=1, 16 do
		if ( idx <= EUF_MAX_PARTY_BUFFS ) then
			buffImage = UnitBuff("partypet"..id, i);
			if ( buffImage ) then
				buffButtonName = "EUF_PartyPetBuffFrame"..id.."Buff"..idx;
				getglobal(buffButtonName.."Icon"):SetTexture(buffImage);
				getglobal(buffButtonName):SetID(i);
				getglobal(buffButtonName):Show();
				idx = idx + 1;
			end
		end
	end
	for i=idx, EUF_MAX_PARTY_BUFFS do
		getglobal("EUF_PartyPetBuffFrame"..id.."Buff"..i):Hide();
	end

	idx = 1;
	for i=1, 16 do
		if ( idx <= EUF_MAX_PARTY_DEBUFFS ) then
			buffImage = UnitDebuff("partypet"..id, i);
			if ( buffImage ) then
				buffButtonName = "EUF_PartyPetBuffFrame"..id.."DeBuff"..idx;
				getglobal(buffButtonName.."Icon"):SetTexture(buffImage);
				getglobal(buffButtonName):SetID(i);
				getglobal(buffButtonName):Show();
				idx = idx + 1;
			end
		end
	end
	for i=idx, EUF_MAX_PARTY_DEBUFFS do
		getglobal("EUF_PartyPetBuffFrame"..id.."DeBuff"..i):Hide();
	end

end

function PartyMemberBuffTooltip_Update(isPet)
end

-- TargetFrameBuff --
function EUF_TargetDebuffButton_Update()
	ORG_TargetDebuffButton_Update();
	if EUF_CurrentOptions["TARGET16BUFFS"] ~= 1 then
		return;
	end;
	local unitTarget = nil;
	if UnitIsUnit("player", "target") then
		unitTarget = "player";
	end;
	local i = 1;
	while (not unifFound) and i <= GetNumPartyMembers() do
		if UnitIsUnit("target", "party" .. i) then
			unitTarget = "party" .. i;
		end;
		i = i + 1;
	end; 
	i = 1;
	while (not unitFound) and i <= GetNumRaidMembers() do
		if UnitIsUnit("target", "raid" .. i) then
			unitTarget = "raid" .. i;
		end;
		i = i + 1;
	end;
	if unitTarget then
		EUF_CurrentTarget = unitTarget;  -- used for target 16 buffs
		for i=6, MAX_PARTY_TOOLTIP_BUFFS do
			buff = UnitBuff(unitTarget, i);
			button = getglobal("EUF_TargetFrameBuff"..i);
			if ( buff ) then
				getglobal("EUF_TargetFrameBuff"..i.."Icon"):SetTexture(buff);
				button:Show();
				button.id = i;
			else
				button:Hide();
			end
		end
	end;
end;

ORG_TargetDebuffButton_Update = TargetDebuffButton_Update;
TargetDebuffButton_Update = EUF_TargetDebuffButton_Update;

function EUF_TargetFrame_OnHide()
	ORG_TargetFrame_OnHide();
	for i=6, MAX_PARTY_TOOLTIP_BUFFS do
		getglobal("EUF_TargetFrameBuff"..i):Hide();
	end
end;

ORG_TargetFrame_OnHide = TargetFrame_OnHide;
TargetFrame_OnHide = EUF_TargetFrame_OnHide;


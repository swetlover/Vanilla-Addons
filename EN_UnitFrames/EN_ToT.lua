function ETT_OnUpdate()
	if EUF_CurrentOptions["TARGETTARGETFRAME"] == 1 and UnitIsVisible("targettarget") then
		ETT_TargetTargetFrame:Show();
	else
		ETT_TargetTargetFrame:Hide();
	end
	if EUF_CurrentOptions["TARGETTARGETFRAME"] == 1 and EUF_CurrentOptions["TARGETTARGETTARGETFRAME"] == 1 and UnitIsVisible("targettargettarget") then
		ETT_TargetTargetTargetFrame:Show();
	else
		ETT_TargetTargetTargetFrame:Hide();
	end;
end;

function ETT_TargetTargetFrame_OnUpdate()
	ETT_TargetTargetFrameName:SetText(UnitName("targettarget"));

	local color = ManaBarColor[UnitPowerType("targettarget")];
	ETT_TargetTargetFrameManaBar:SetStatusBarColor(color.r, color.g, color.b);

	SetPortraitTexture(ETT_TargetTargetFramePortrait, "targettarget");

	if UnitHealthMax("targettarget") == 0 then
		ETT_TargetTargetFrameHealthBar:SetValue(0);
	else
		ETT_TargetTargetFrameHealthBar:SetValue(UnitHealth("targettarget") / UnitHealthMax("targettarget") * 100);
	end;
	if UnitManaMax("targettarget") == 0 then
		ETT_TargetTargetFrameManaBar:SetValue(0);
	else
		ETT_TargetTargetFrameManaBar:SetValue(UnitMana("targettarget") / UnitManaMax("targettarget") * 100);
	end;
end;

function ETT_TargetTargetTargetFrame_OnUpdate()
	ETT_TargetTargetTargetFrameName:SetText(UnitName("targettargettarget"));

	local color = ManaBarColor[UnitPowerType("targettargettarget")];
	ETT_TargetTargetTargetFrameManaBar:SetStatusBarColor(color.r, color.g, color.b);

	SetPortraitTexture(ETT_TargetTargetTargetFramePortrait, "targettargettarget");

	if UnitHealthMax("targettargettarget") == 0 then
		ETT_TargetTargetTargetFrameHealthBar:SetValue(0);
	else
		ETT_TargetTargetTargetFrameHealthBar:SetValue(UnitHealth("targettargettarget") / UnitHealthMax("targettargettarget") * 100);
	end;
	if UnitManaMax("targettargettarget") == 0 then
		ETT_TargetTargetTargetFrameManaBar:SetValue(0);
	else
		ETT_TargetTargetTargetFrameManaBar:SetValue(UnitMana("targettargettarget") / UnitManaMax("targettargettarget") * 100);
	end;
end;


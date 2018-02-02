function EUF_OptionFrame_OnShow()
	for index,value in EUF_CurrentOptions do
		local unitOption = getglobal("EUF_OptionFrame" .. index);
		if (unitOption) then
			getglobal("EUF_OptionFrame" .. index .. "Text"):SetText(getglobal("EUF_TEXT_OPTION_" .. index));
			if unitOption.SetChecked then
				unitOption:SetChecked(value);
			end;
			if unitOption.SetValue then
				unitOption:SetValue(value);
			end;
		end
	end
end

function EUF_OptionCheckButton_OnClick(arg1)
	local optionId;
	_, _, optionId = string.find(arg1, "EUF_OptionFrame(.+)");
	
	local value = getglobal(arg1):GetChecked();
	if value then
		value = 1;
	else
		value = 0;
	end;
	EUF_Options_Update(optionId, value)
end

function EUF_OptionSlider_OnChange(arg1, value)
	local optionId;
	_, _, optionId = string.find(arg1, "EUF_OptionFrame(.+)");
	EUF_Options_Update(optionId, value)
end;


function EUF_OptionButton_OnClick(arg1)
	local optionId;
	_, _, optionId = string.find(arg1, "EUF_OptionFrame(.+)");

	if (optionId == "CONFIRM") then
		EUF_OptionFrame:Hide();
	elseif (optionId == "DEFAULT") then
		EUF_OptionsDefault_Load();
		if EUF_Frame_Update then
			EUF_Frame_Update();
		end;
	end;
end;

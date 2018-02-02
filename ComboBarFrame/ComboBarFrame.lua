COMBOBARFRAME_FADE_IN = 0.3;
COMBOBARFRAME_FADE_OUT = 0.5;
COMBOBARFRAME_HIGHLIGHT_FADE_IN = 0.4;
COMBOBARFRAME_SHINE_FADE_IN = 0.3;
COMBOBARFRAME_SHINE_FADE_OUT = 0.4;
COMBOBAR_FRAME_LAST_NUM_POINTS = 0;

function ComboBarPointsFrame_OnLoad()
	this:RegisterEvent("PLAYER_TARGET_CHANGED");
	this:RegisterEvent("PLAYER_COMBO_POINTS");
	ComboFrame:UnregisterEvent("PLAYER_TARGET_CHANGED");
	ComboFrame:UnregisterEvent("PLAYER_COMBO_POINTS");
	-- init alpha
	ComboBarPoint1Highlight:SetAlpha(0);
	ComboBarPoint1Shine:SetAlpha(0);
	this:RegisterForDrag("LeftButton");
--~ 	SLASH_ComboBarPointsFrame1= "/cb";
--~ 	SLASH_ComboBarPointsFrame2 = "/comboframe";
--~ 	SlashCmdList["ComboBarPointsFrame"] =	ComboBarPointsFrame_SlashCmd;
end

function ComboBarPointsFrame_OnEvent()
	local comboPoints = GetComboPoints();
	local comboPoint, comboPointHighlight, fadeInfo;
	if ( comboPoints > 0 ) then
		if ( not ComboBarFrame:IsVisible() ) then
			ComboBarFrame:Show();
			UIFrameFadeIn(ComboBarFrame, COMBOBARFRAME_FADE_IN);
		end
		
		for i=1, MAX_COMBO_POINTS do
			comboPointHighlight = getglobal("ComboBarPoint"..i.."Highlight");
			comboPointShine = getglobal("ComboBarPoint"..i.."Shine");
			if ( i <= comboPoints ) then
				if ( i > COMBOBAR_FRAME_LAST_NUM_POINTS ) then
					-- Fade in the highlight and set a function that triggers when it is done fading
					fadeInfo = {};
					fadeInfo.mode = "IN";
					fadeInfo.timeToFade = COMBOBARFRAME_HIGHLIGHT_FADE_IN;
					fadeInfo.finishedFunc = ComboBarPointShineFadeIn;
					fadeInfo.finishedArg1 = comboPointShine;
					UIFrameFade(comboPointHighlight, fadeInfo);
				end
			else
				comboPointHighlight:SetAlpha(0);
				comboPointShine:SetAlpha(0);
			end
		end
	else
		ComboBarPoint1Highlight:SetAlpha(0);
		ComboBarPoint1Shine:SetAlpha(0);
		ComboBarFrame:Hide();
	end
	COMBOBAR_FRAME_LAST_NUM_POINTS = comboPoints;
end

function ComboBarPointShineFadeIn(frame)
	-- Fade in the shine and then fade it out with the ComboBarPointShineFadeOut function
	local fadeInfo = {};
	fadeInfo.mode = "IN";
	fadeInfo.timeToFade = COMBOBARFRAME_SHINE_FADE_IN;
	fadeInfo.finishedFunc = ComboBarPointShineFadeOut;
	fadeInfo.finishedArg1 = frame:GetName();
	UIFrameFade(frame, fadeInfo);
end

--hack since a frame can't have a reference to itself in it
function ComboBarPointShineFadeOut(frameName)
	UIFrameFadeOut(getglobal(frameName), COMBOBARFRAME_SHINE_FADE_OUT);
end

function ComboBarPointsFrame_SlashCmd(msg)
	if (msg == "help") then 
		DEFAULT_CHAT_FRAME:AddMessage("Usage: /cb < dock || lock || unlock >")
	elseif (msg == "dock") then
		ComboBarFrame:ClearAllPoints();
		ComboBarFrame:SetPoint("TOPLEFT", "UIParent", "TargetFrame", -60, 3);	
	elseif (msg == "unlock") then
--~ 		ComboBarFrame:SetMoveable(1)
		this:SetMovable(true);
--~ 		this:RegisterForDrag("LeftButton");
	elseif (msg == "lock") then
		this:SetMovable(false);
--~ 		ComboBarFrame:SetMoveable(0)
	end
end

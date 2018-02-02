--------------------------
---------Nightfall--------
----------Warner----------
--------By Xerogen--------
-------On Gorefiend-------
--------------------------

function Nightfall_OnLoad()
	this:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS");
	this:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF");
	if( DEFAULT_CHAT_FRAME ) then
	NightfallMainFrame:Hide();
	SLASH_NIGHTFALLSHOW1 = "/nfshow";
	SlashCmdList["NIGHTFALLSHOW"] = Nightfall_ShowFrame;
	SLASH_NIGHTFALLHIDE1 = "/nfhide";
	SlashCmdList["NIGHTFALLHIDE"] = Nightfall_HideFrame;
	end
end

function Nightfall_OnEvent(event)
	if string.find(arg1, "你获得了暗影冥思的效果。") then
		NightfallMainFrame:Show();
	else
		if string.find(arg1, "暗影冥思效果从你身上消失了。") then
		Nightfall_HideFrame(cmd);
		end
	end
end

function Nightfall_ShowFrame(cmd)
	NightfallMainFrame:Show();
end

function Nightfall_HideFrame(cmd)
	NightfallMainFrame:Hide();
end

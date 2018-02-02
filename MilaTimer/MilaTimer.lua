spelltimer_debug=false;
spelltimer_playersmp=0;
spelltimer_count=-1;
spelltimer_span = 5;
function SpellTimer_OnLoad()
      	this:RegisterEvent("UNIT_MANA");
	SlashCmdList["SpellTimerCOMMAND"] = SpellTimerHandler;
	SLASH_SpellTimerCOMMAND1 = "/milatimer";
	SLASH_SpellTimerCOMMAND2 = "/ml";
        DEFAULT_CHAT_FRAME:AddMessage("MilaTimer，需要移动请输入/st unlock",0,1,0);
        DEFAULT_CHAT_FRAME:AddMessage("MilaTimer，需要锁定请输入/st lock",0,0,1);
end

function SpellTimer_OnEvent(event)
	if(event=="UNIT_MANA" and arg1=="player") then
		strarg = spelltimer_playersmp .. "-->" .. UnitMana("player");
		if(spelltimer_playersmp > UnitMana("player")) then
			strarg = strarg .. " 施放了一个魔法";
			SpellTimer_DebugPrint(event .. " : " .. strarg);
			SpellTimer_BeginCount();
                        SpellTimerFrame:Show();
		end
		spelltimer_playersmp = UnitMana("player") ;
	end
end

function SpellTimer_OnUpdate()
	local diff_time = spelltimer_count - GetTime();
	if (diff_time < 0.0) then
		diff_time = 0.0;
		spelltimer_count=0;
                SpellTimerFrame:Hide();	         
        end
	SpellTimerCountText:SetText(string.format(" (%.1fs)", diff_time));
	local SVALUE=( diff_time / 5 )*100;
	SpellTimerBar:SetValue(SVALUE);
end
function SpellTimer_BeginCount()
	spelltimer_count=GetTime()+5;
end
function SpellTimerHandler(msg)
        if( msg == "lock" ) then
		SpellTimerFrame:EnableMouse(false);
		DEFAULT_CHAT_FRAME:AddMessage("MilaTimer锁定，需要移动请输入/ml unlock");
	elseif( msg == "unlock" ) then
		SpellTimerFrame:EnableMouse(true);
		DEFAULT_CHAT_FRAME:AddMessage("MilaTimer解锁，需要锁定请输入/ml lock");
	elseif(msg == "debug") then
		spelltimer_debug=true;
       	end
	spelltimer_playersmp=UnitMana("player");
	DEFAULT_CHAT_FRAME:AddMessage("MilaTimer.——原作者米拉，独孤傲雪修改-->圣灵制造<，希望喜欢！");
        DEFAULT_CHAT_FRAME:AddMessage("MilaTimer，需要移动请输入/ml unlock",0,1,0);
        DEFAULT_CHAT_FRAME:AddMessage("MilaTimer，需要锁定请输入/ml lock",0,0,1);	
end

function SpellTimer_DebugPrint(msg)
	if(spelltimer_debug) then
		DEFAULT_CHAT_FRAME:AddMessage("|cff00caca[SpellTimer]|r " .. msg);
	end
end
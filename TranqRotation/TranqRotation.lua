-- Globals
TranqRotationVersion = "2.11";
TranqRotationTitle = "宁神循环助手 "..TranqRotationVersion;
TranqRotationNextHunter = 1;
TranqRotationInFrenzy = nil;
TranqRotationTranqShotID = nil;

-- Locals
local TQ_Debuffs = {
	["Interface\\Icons\\Spell_Shadow_DeathScream"] = {TQ_MSG_PANIC};
	["Interface\\Icons\\Spell_Arcane_PortalOrgrimmar"] = {TQ_MSG_TIMELAPSE};
	["Interface\\Icons\\INV_Misc_Head_Dragon_Bronze"] = {TQ_MSG_TIMESTOP};
	["Interface\\Icons\\INV_Spear_02"] = {TQ_MSG_WSTING};
	["Interface\\Icons\\Spell_Shadow_SiphonMana"] = {TQ_MSG_MINDFLAY,TQ_MSG_FEAR};
	["Interface\\Icons\\Spell_Shadow_ShadowWordDominate"] = {TQ_MSG_CAUSEINS};
	};

function TranqRotation_OnLoad(event)

  this:RegisterEvent("CHAT_MSG_ADDON");

  this:RegisterEvent("CHAT_MSG_SPELL_SELF_DAMAGE");

  this:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE");
  this:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF");

  this:RegisterEvent("CHAT_MSG_MONSTER_EMOTE");
  this:RegisterEvent("CHAT_MSG_SPELL_SELF_BUFF");
-- DEBUG
--  this:RegisterEvent("CHAT_MSG_EMOTE");

  tinsert(UISpecialFrames,"TranqRotationOptions");

  DEFAULT_CHAT_FRAME:AddMessage("|cffff0000-- 猎人宁神循环模块 -- |r"..TranqRotationVersion.."|cff00ff00 已加载|r. 输入 /tq 打开控制面板.")

  SlashCmdList["TQ"] = TranqRotation_OpenOptions;
  SLASH_TQ1 = "/tq";

  SlashCmdList["TQHELP"] = TranqRotation_Help;
  SLASH_TQHELP1 = "/tqhelp";

  SlashCmdList["TQSHOW"] = TranqRotation_Show;
  SLASH_TQSHOW1 = "/tqshow";

  SlashCmdList["TQHIDE"] = TranqRotation_Hide;
  SLASH_TQHIDE1 = "/tqhide";

  this:RegisterEvent("VARIABLES_LOADED");
end

function GetTranqSpellID()
  local i = 1
  while true do
		local spellName, spellRank = GetSpellName(i, BOOKTYPE_SPELL);
		if not spellName then
			do break end
		end

   		-- use spellName and spellRank here
   		if (spellName == TQ_MSG_SHOTNAME) then
			TranqRotationTranqShotID = i;
		end

  		i = i + 1;
  end
end

function TranqRotation_OpenOptions(msg)
	TranqRotationOptions_Open();
end

function TranqRotation_Help(msg)
	DEFAULT_CHAT_FRAME:AddMessage("|cffff0000猎人宁神循环模块插件|r"..TranqRotationVersion..".");
	DEFAULT_CHAT_FRAME:AddMessage("输入 /tq 显示插件设置框架.");
	DEFAULT_CHAT_FRAME:AddMessage("输入 /tqshow 显示插件状态窗口.");
	DEFAULT_CHAT_FRAME:AddMessage("输入 /tqhide 隐藏插件状态窗口.");
end

function TranqRotation_Reset()
	TranqRotationNextHunter = 1;
	TranqRotationConfig["Hunter1"] = nil;
	TranqRotationConfig["Hunter2"] = nil;
	TranqRotationConfig["Hunter3"] = nil;
	TranqRotationConfig["Hunter4"] = nil;
	TranqRotationConfig["Hunter5"] = nil;
	TranqRotationConfig["Hunter6"] = nil;
	TranqRotationConfig["Captain"] = nil;
	TranqRotationConfig["Status"] = nil;
	TranqRotationConfig["Max"] = 0;
end

function TranqRotation_ScanRaid()
	local raidnum = GetNumRaidMembers();
	local i = 1;
	local currHunter = 1;
	local memname, memclass;

	TranqRotationOptionsHunter1:SetText("");
	TranqRotationOptionsHunter2:SetText("");
	TranqRotationOptionsHunter3:SetText("");
	TranqRotationOptionsHunter4:SetText("");
	TranqRotationOptionsHunter5:SetText("");
	TranqRotationOptionsHunter6:SetText("");
	
	if (raidnum) then
		while i < raidnum+1 do
			memname, _, _, _, _, memclass, _, _, _ = GetRaidRosterInfo(i);
			if ((memclass == "HUNTER") and (currHunter < 7)) then
				if (currHunter == 1) then
					TranqRotationOptionsHunter1:SetText(memname);
				elseif (currHunter == 2) then
					TranqRotationOptionsHunter2:SetText(memname);
				elseif (currHunter == 3) then
					TranqRotationOptionsHunter3:SetText(memname);
				elseif (currHunter == 4) then
					TranqRotationOptionsHunter4:SetText(memname);
				elseif (currHunter == 5) then
					TranqRotationOptionsHunter5:SetText(memname);
				elseif (currHunter == 6) then
					TranqRotationOptionsHunter6:SetText(memname);
				end
				
				currHunter = currHunter + 1;
			end
			i = i + 1;
		end
	end
end

function TranqRotation_Order(msg)
	TranqRotationOptions_Save();

	if (TranqRotationConfig["Captain"] ~= nil) then
		local bmsg, skip;
		skip = false;
		if (TranqRotationConfig["Hunter1"] ~= nil) then
			bmsg = TQ_MSG_ORDER..TranqRotationConfig["Hunter1"];
		else -- assertion
			skip = true;
		end
		if (skip ~= true) and (TranqRotationConfig["Hunter2"] ~= nil) then
			bmsg = bmsg..TQ_MSG_DELIMITER..TranqRotationConfig["Hunter2"];
		else -- assertion
			skip = true;
		end
		if (skip ~= true) and (TranqRotationConfig["Hunter3"] ~= nil) then
			bmsg = bmsg..TQ_MSG_DELIMITER..TranqRotationConfig["Hunter3"];
		else -- assertion
			skip = true;
		end
		if (skip ~= true) and (TranqRotationConfig["Hunter4"] ~= nil) then
			bmsg = bmsg..TQ_MSG_DELIMITER..TranqRotationConfig["Hunter4"];
		else -- assertion
			skip = true;
		end
		if (skip ~= true) and (TranqRotationConfig["Hunter5"] ~= nil) then
			bmsg = bmsg..TQ_MSG_DELIMITER..TranqRotationConfig["Hunter5"];
		else -- assertion
			skip = true;
		end
		if (skip ~= true) and (TranqRotationConfig["Hunter6"] ~= nil) then
			bmsg = bmsg..TQ_MSG_DELIMITER..TranqRotationConfig["Hunter6"];
		else -- assertion
			skip = true;
		end

		if (bmsg ~= nil) then
			SendChatMessage(bmsg, "RAID", nil, nil);
			SendAddonMessage(TQ_MSG_CHANNEL, bmsg, "RAID");
		else
			DEFAULT_CHAT_FRAME:AddMessage("[|cffff0000宁神循环|r] 没有猎人被分配.")
		end
	else
		DEFAULT_CHAT_FRAME:AddMessage("[|cffff0000宁神循环|r] 只有猎人职业队长能通告顺序.")
	end
end

function TranqRotation_Restart(msg)
	local bmsg;
	bmsg = UnitName("player")..TQ_MSG_RESTART;
	if (bmsg ~= nil) then
		SendAddonMessage(TQ_MSG_CHANNEL, bmsg, "RAID");
	end
end

function TranqRotation_Sync(msg)
	local bmsg;
	bmsg = UnitName("player")..TQ_MSG_SYNCREQ;
	if (bmsg ~= nil) then
		SendAddonMessage(TQ_MSG_CHANNEL, bmsg, "RAID");
	end
end

function TranqRotation_FireTranq(msg)
	CastSpellByName(TQ_MSG_SHOTNAME);
-- DEBUG
--	local msg;
--	msg = UnitName("player")..TQ_MSG_TRANQED.."something";
--	SendAddonMessage(TQ_MSG_CHANNEL, msg, RAID);
end

function TranqRotation_NextHunter(msg)
	if (TranqRotationConfig["Captain"] ~= nil) then
		local nextHunter = GetHunterNameByNumber(TranqRotationNextHunter)
		if (nextHunter) then
			local msg1 = nextHunter..TQ_MSG_SKIP.." : 跳过.";

			SendAddonMessage(TQ_MSG_CHANNEL, msg1, "RAID");
		end
	end
end

function TranqRotation_Skip(msg)
	local msg1;
	if (msg ~= nil) then
		msg1 = UnitName("player")..TQ_MSG_SKIP.." : "..msg..".";
	else
		msg1 = UnitName("player")..TQ_MSG_SKIP;
	end
	SendAddonMessage(TQ_MSG_CHANNEL, msg1, "RAID");
end

function TranqRotation_Show(msg)
	TranqRotationConfig["Status"] = 1;
	ShowUIPanel(TranqRotationStatusWindow);
	TranqRotation_ResetStatusBar();
end

function TranqRotation_Hide(msg)
	TranqRotationConfig["Status"] = nil;
	HideUIPanel(TranqRotationStatusWindow);
end

function GetMaxHunter()
	if TranqRotationConfig["Hunter6"] ~= nil then
		return 6;
	elseif TranqRotationConfig["Hunter5"] ~= nil then
		return 5;
	elseif TranqRotationConfig["Hunter4"] ~= nil then
		return 4;
	elseif TranqRotationConfig["Hunter3"] ~= nil then
		return 3;
	elseif TranqRotationConfig["Hunter2"] ~= nil then
		return 2;
	elseif TranqRotationConfig["Hunter1"] ~= nil then
		return 1;
	else
		return 0;
	end
end

function TranqRotation_OnEvent()
  if (event == "VARIABLES_LOADED") then
		if (not TranqRotationConfig) then
			TranqRotationConfig = {};
			TranqRotationConfig["Hunter1"] = nil;
			TranqRotationConfig["Hunter2"] = nil;
			TranqRotationConfig["Hunter3"] = nil;
			TranqRotationConfig["Hunter4"] = nil;
			TranqRotationConfig["Hunter5"] = nil;
			TranqRotationConfig["Hunter6"] = nil;
			TranqRotationConfig["Captain"] = nil;
			TranqRotationConfig["Status"] = nil;
			TranqRotationConfig["Max"] = 0;
		end

		TranqRotationOptions_Load();
		return;
  end

  -- keep track of which hunter to go next
-- DEBUG
--    if (event == "CHAT_MSG_MONSTER_EMOTE" or event == "CHAT_MSG_EMOTE") then
	if (event == "CHAT_MSG_MONSTER_EMOTE") then
		-- only mod captain responsible for setting up rotation
		if (TranqRotationConfig["Captain"] ~= nil) then

			if ((string.find(string.lower(arg1), string.lower(TQ_MSG_FRENZY1))) or
				(string.find(string.lower(arg1), string.lower(TQ_MSG_FRENZY2)))) then
				local msg1, msg2, hunter1, hunter2;

				TranqRotationInFrenzy = 1;
				hunter1 = GetHunterNameByNumber(TranqRotationNextHunter);

				if (TranqRotationNextHunter == TranqRotationConfig["Max"]) then
					hunter2 = GetHunterNameByNumber(1);
				else
					hunter2 = GetHunterNameByNumber(TranqRotationNextHunter+1);
				end
				if (hunter1 and hunter2) then
					msg1 = hunter1..TQ_MSG_TRANQ_NOW;
					msg2 = hunter2..TQ_MSG_TRANQ_NEXT;
					SendAddonMessage(TQ_MSG_CHANNEL, msg1, "RAID");
					SendAddonMessage(TQ_MSG_CHANNEL, msg2, "RAID");
				end
			end
		end
  end

  -- send tranq shot info to channel
  if (event == "CHAT_MSG_SPELL_SELF_DAMAGE") then
		if (string.find(string.lower(arg1), string.lower(TQ_MSG_SHOTNAME))) then
			local msg;
			if (string.find(arg1, TQ_MSG_SELFCAST)) then
			-- tranqed
				msg = UnitName("player")..TQ_MSG_TRANQED..UnitName("target");
				SendAddonMessage(TQ_MSG_CHANNEL, msg, "RAID");
			else
			-- missed
				msg = UnitName("player")..TQ_MSG_TRANQMISS..UnitName("target");
				SendAddonMessage(TQ_MSG_CHANNEL, msg, "RAID");
			end
		end
		return;
  end

  -- send tranq shot failed info to channel
  if (event == "CHAT_MSG_SPELL_SELF_BUFF" ) then
		local _,_, mob = string.find(arg1, TQ_MSG_SHOTFAIL);
		if (mob) then
			local msg;
			-- failed
			msg = UnitName("player")..TQ_MSG_TRANQFAIL..UnitName("target");
			SendAddonMessage(TQ_MSG_CHANNEL, msg, "RAID");
		end
		return;
  end

  -- receive info from addon channel
  if (event == "CHAT_MSG_ADDON" and arg1 == TQ_MSG_CHANNEL and arg3 == "RAID") then

		if (string.find(arg2, TQ_MSG_ORDER)) then
			local pattern, h1, h2, h3, h4, h5, h6;
			pattern = TQ_MSG_ORDER.."(.+)"..TQ_MSG_DELIMITER.."(.+)"..TQ_MSG_DELIMITER.."(.+)"..TQ_MSG_DELIMITER.."(.+)"..TQ_MSG_DELIMITER.."(.+)"..TQ_MSG_DELIMITER.."(.+)";
			_, _, h1, h2, h3, h4, h5, h6 = string.find(arg2, pattern);
			if (h6 == nil) then
				pattern = TQ_MSG_ORDER.."(.+)"..TQ_MSG_DELIMITER.."(.+)"..TQ_MSG_DELIMITER.."(.+)"..TQ_MSG_DELIMITER.."(.+)"..TQ_MSG_DELIMITER.."(.+)";
				_, _, h1, h2, h3, h4, h5 = string.find(arg2, pattern);
			end
			if (h5 == nil) then
				pattern = TQ_MSG_ORDER.."(.+)"..TQ_MSG_DELIMITER.."(.+)"..TQ_MSG_DELIMITER.."(.+)"..TQ_MSG_DELIMITER.."(.+)";
				_, _, h1, h2, h3, h4 = string.find(arg2, pattern);
			end
			if (h4 == nil) then
				pattern = TQ_MSG_ORDER.."(.+)"..TQ_MSG_DELIMITER.."(.+)"..TQ_MSG_DELIMITER.."(.+)";
				_, _, h1, h2, h3 = string.find(arg2, pattern);
			end
			if (h3 == nil) then
				pattern = TQ_MSG_ORDER.."(.+)"..TQ_MSG_DELIMITER.."(.+)";
				_, _, h1, h2 = string.find(arg2, pattern);
			end
			if (h2 == nil) then
				pattern = TQ_MSG_ORDER.."(.+)";
				_, _, h1 = string.find(arg2, pattern);
			end

			if (h1 ~= nil) then
				TranqRotationOptionsHunter1:SetText(h1);
			else
				TranqRotationOptionsHunter1:SetText("");
			end
			if (h2 ~= nil) then
				TranqRotationOptionsHunter2:SetText(h2);
			else
				TranqRotationOptionsHunter2:SetText("");
			end
			if (h3 ~= nil) then
				TranqRotationOptionsHunter3:SetText(h3);
			else
				TranqRotationOptionsHunter3:SetText("");
			end
			if (h4 ~= nil) then
				TranqRotationOptionsHunter4:SetText(h4);
			else
				TranqRotationOptionsHunter4:SetText("");
			end
			if (h5 ~= nil) then
				TranqRotationOptionsHunter5:SetText(h5);
			else
				TranqRotationOptionsHunter5:SetText("");
			end
			if (h6 ~= nil) then
				TranqRotationOptionsHunter6:SetText(h6);
			else
				TranqRotationOptionsHunter6:SetText("");
			end
			TranqRotationOptions_Save();
			TranqRotationConfig["Max"] = GetMaxHunter();
			TranqRotation_ResetStatusBar();
		end

		local hunter = IdentifyHunter(arg2);

		if (string.find(arg2, TQ_MSG_RESTART)) then

			TranqRotationNextHunter = 1;
			TranqRotation_ResetStatusBar();
			TranqRotationInFrenzy = nil;

			if (TranqRotationConfig["Captain"]) then
				local h1 = GetHunterNameByNumber(TranqRotationNextHunter);
				if (h1) then
					local msg1 = h1..TQ_MSG_TRANQ_NEXT;
					SendAddonMessage(TQ_MSG_CHANNEL, msg1, "RAID");
				end
			end

			DEFAULT_CHAT_FRAME:AddMessage("[|cffff0000宁神循环|r] 重新开始循环!")
		end

		if (string.find(arg2, TQ_MSG_TRANQED)) then
			-- only mod captain responsible for setting up rotation
			if (TranqRotationConfig["Captain"] and (hunter) and (hunter == TranqRotationNextHunter)) then
	    		TranqRotationNextHunter = TranqRotationNextHunter + 1;
				if (TranqRotationNextHunter > TranqRotationConfig["Max"]) then
		    		TranqRotationNextHunter = 1;
		  		end
			end
			TranqRotationInFrenzy = nil;

			TranqRotation_UpdateHunterStatus(hunter, "Tranqed", 0, 1, 0);
		end

		if (string.find(arg2, TQ_MSG_TRANQMISS) or
			string.find(arg2, TQ_MSG_TRANQFAIL) or
			string.find(arg2, TQ_MSG_SKIP)) then
			-- only mod captain responsible for setting up rotation
			if (TranqRotationConfig["Captain"] and (hunter) and (hunter == TranqRotationNextHunter)) then

				local msg1, msg2, hunter1, hunter2;
	    		TranqRotationNextHunter = TranqRotationNextHunter + 1;
				if (TranqRotationNextHunter > TranqRotationConfig["Max"]) then
		    		TranqRotationNextHunter = 1;
	  			end

				hunter1 = GetHunterNameByNumber(TranqRotationNextHunter);
				if (TranqRotationNextHunter == TranqRotationConfig["Max"]) then
					hunter2 = GetHunterNameByNumber(1);
				else
					hunter2 = GetHunterNameByNumber(TranqRotationNextHunter+1);
				end

				if (TranqRotationInFrenzy) then
					if (hunter1 and hunter2) then
						msg1 = hunter1..TQ_MSG_TRANQ_NOW;
						msg2 = hunter2..TQ_MSG_TRANQ_NEXT;
						SendAddonMessage(TQ_MSG_CHANNEL, msg1, "RAID");
						SendAddonMessage(TQ_MSG_CHANNEL, msg2, "RAID");
					end
				else
					if (hunter1) then
						msg1 = hunter1..TQ_MSG_TRANQ_NEXT;
						SendAddonMessage(TQ_MSG_CHANNEL, msg1, "RAID");
					end
				end
			end

			if (string.find(arg2, TQ_MSG_TRANQMISS)) then
				TranqRotation_UpdateHunterStatus(hunter, "未击中", 0, 0, 1);
			end
			if (string.find(arg2, TQ_MSG_TRANQFAIL)) then
				TranqRotation_UpdateHunterStatus(hunter, "失败", 0, 0, 1);
			end
			if (string.find(arg2, TQ_MSG_SKIP)) then
				local _, _, reason = string.find(arg2, TQ_MSG_SKIPPATT);
				if (reason ~= nil) then
					TranqRotation_UpdateHunterStatus(hunter, reason, 0, 0, 1);
				else
					TranqRotation_UpdateHunterStatus(hunter, "跳过了", 0, 0, 1);
				end
			end
		end

		if (string.find(arg2, TQ_MSG_SYNCREQ) and
				-- only mod captain responsible for setting up rotation
			TranqRotationConfig["Captain"]) then

			local bmsg, hunter1, hunter2;
			hunter1 = GetHunterNameByNumber(TranqRotationNextHunter);
			if (TranqRotationNextHunter == TranqRotationConfig["Max"]) then
				hunter2 = GetHunterNameByNumber(1);
			else
				hunter2 = GetHunterNameByNumber(TranqRotationNextHunter+1);
			end
			if (hunter1 and hunter2) then
				bmsg = hunter1..TQ_MSG_SYNCMSG..hunter2..".";
			end

			if (bmsg ~= nil) then
				SendAddonMessage(TQ_MSG_CHANNEL, bmsg, "RAID");
			end
		end

		if (string.find(arg2, TQ_MSG_TRANQ_NOW)) then
			local cantranq = true;
-- DEBUG
--				DEFAULT_CHAT_FRAME:AddMessage("Hunter #"..hunter);
--				DEFAULT_CHAT_FRAME:AddMessage(GetHunterNameByNumber(hunter));

	  		if ((hunter) and (string.find(string.lower(GetHunterNameByNumber(hunter)), string.lower(UnitName("player"))))) then
				GetTranqSpellID();
				local start, duration;
				if (TranqRotationTranqShotID ~= nil and TranqRotationTranqShotID ~= 0) then
					start, duration = GetSpellCooldown(TranqRotationTranqShotID, BOOKTYPE_SPELL);
				else
					start = 0;
					duration = 0;
				end

				local i, texture = 1, {};
				local skipreason = "";
				local notincontrol = false;
				repeat
					texture = UnitDebuff("player", i);
					if (TQ_Debuffs[texture]) then
						local debuffname, pattern = unpack(TQ_Debuffs[texture]);
						TQHiddenToolTip:SetUnitDebuff("player", i);
						if (TQHiddenToolTipTextLeft1:GetText() == debuffname and (not pattern or string.find(TQHiddenToolTipTextLeft2:GetText() or "", pattern))) then
							notincontrol = true;
							if ((debuffname == TQ_MSG_PANIC) or (debuffname == TQ_MSG_MINDFLAY) or
								(debuffname == TQ_MSG_CAUSEINS)) then
								skipreason = "Fear";
							else
								skipreason = debuffname;
							end
						end
					end
					i = i + 1;
				until not texture;

-- DEBUG
--				DEFAULT_CHAT_FRAME:AddMessage("ID "..TranqRotationTranqShotID);

				if (UnitIsDeadOrGhost("player")) then
					TranqRotation_Skip("Dead");
					cantranq = false;
				elseif (TranqRotationTranqShotID and start > 0 and duration > 0) then
					TranqRotation_Skip("Cooldown");
					cantranq = false;
				elseif (notincontrol) then
					TranqRotation_Skip(skipreason);
					cantranq = false;
				else
					UIErrorsFrame:AddMessage(arg2, 1, 0, 0, 1.0, UIERRORS_HOLD_TIME);
					PlaySoundFile("Sound\\Spells\\PVPFlagTaken.wav");
				end
			end

			if (cantranq) then
				TranqRotation_UpdateHunterStatus(hunter, "Tranq NOW", 1, 0, 0);
			end
		end

		if (string.find(arg2, TQ_MSG_TRANQ_NEXT)) then
			if ((hunter) and (GetHunterNameByNumber(hunter) == UnitName("player")) and (UnitIsDeadOrGhost("player"))) then
				TranqRotation_Skip("Dead");
			else
				if ((hunter) and (GetHunterNameByNumber(hunter) == UnitName("player"))) then
					UIErrorsFrame:AddMessage(arg2, 1, 0.5, 0, 1.0, UIERRORS_HOLD_TIME);
					PlaySoundFile("Sound\\Doodad\\BellTollHorde.wav");
				end

				TranqRotation_UpdateHunterStatus(hunter, "下一个", 1, 0.5, 0);
			end
		end

		if (string.find(arg2, TQ_MSG_SYNCMSG)) then
			local _, _, name1, name2 = string.find(arg2, TQ_MSG_SYNCPATT);
			local h1 = IdentifyHunter(name1);
			local h2 = IdentifyHunter(name2);
			TranqRotation_UpdateHunterStatus(h1, "下一个", 1, 0.5, 0);
			TranqRotation_UpdateHunterStatus(h2, "预备", 1, 1, 0);

			local smsg;
			if (TranqRotationConfig["Captain"]) then
				smsg = UnitName("player")..TQ_MSG_SYNCRECV..TranqRotationVersion.."队长";
			else
				smsg = UnitName("player")..TQ_MSG_SYNCRECV..TranqRotationVersion;
			end
			if (smsg ~= nil) then
				SendAddonMessage(TQ_MSG_CHANNEL, smsg, "RAID");
			end
		end

		if (string.find(arg2, TQ_MSG_SYNCRECV)) then
			local _, _, name3, tqver = string.find(arg2, TQ_MSG_SYNCRCVPT);
			local h3 = IdentifyHunter(name3);
			TranqRotation_UpdateHunterSyncStatus(h3, "v"..tqver, 1, 1, 1);
		end
	end
	return;
end

function IdentifyHunter(name)
	if ((TranqRotationConfig["Hunter1"] ~= nil) and (string.find(string.lower(name), string.lower(TranqRotationConfig["Hunter1"])))) then
	  return 1;
	elseif ((TranqRotationConfig["Hunter2"] ~= nil) and (string.find(string.lower(name), string.lower(TranqRotationConfig["Hunter2"])))) then
	  return 2;
	elseif ((TranqRotationConfig["Hunter3"] ~= nil) and (string.find(string.lower(name), string.lower(TranqRotationConfig["Hunter3"])))) then
	  return 3;
	elseif ((TranqRotationConfig["Hunter4"] ~= nil) and (string.find(string.lower(name), string.lower(TranqRotationConfig["Hunter4"])))) then
	  return 4;
	elseif ((TranqRotationConfig["Hunter5"] ~= nil) and (string.find(string.lower(name), string.lower(TranqRotationConfig["Hunter5"])))) then
	  return 5;
	elseif ((TranqRotationConfig["Hunter6"] ~= nil) and (string.find(string.lower(name), string.lower(TranqRotationConfig["Hunter6"])))) then
	  return 6;
	else
	  return 0;
	end
end

function GetHunterNameByNumber(num)
 	if ((num == 0) or (num > TranqRotationConfig["Max"])) then
-- DEBUG
--		if (num > TranqRotationConfig["Max"]) then
--			DEFAULT_CHAT_FRAME:AddMessage(num.." Over Max "..TranqRotationConfig["Max"]);
--		end
    	return nil;
	elseif (num == 1) then
		return TranqRotationConfig["Hunter1"];
	elseif (num == 2) then
		return TranqRotationConfig["Hunter2"];
	elseif (num == 3) then
		return TranqRotationConfig["Hunter3"];
	elseif (num == 4) then
		return TranqRotationConfig["Hunter4"];
	elseif (num == 5) then
		return TranqRotationConfig["Hunter5"];
	elseif (num == 6) then
		return TranqRotationConfig["Hunter6"];
  	end
end

function TranqRotationOptions_Load()
	TranqRotationOptions_ClearEditBox();

	if (TranqRotationConfig["Hunter1"] ~= nil) then
		TranqRotationOptionsHunter1:SetText(TranqRotationConfig["Hunter1"]);
	end
	if (TranqRotationConfig["Hunter2"] ~= nil) then
		TranqRotationOptionsHunter2:SetText(TranqRotationConfig["Hunter2"]);
	end
	if (TranqRotationConfig["Hunter3"] ~= nil) then
		TranqRotationOptionsHunter3:SetText(TranqRotationConfig["Hunter3"]);
	end
	if (TranqRotationConfig["Hunter4"] ~= nil) then
		TranqRotationOptionsHunter4:SetText(TranqRotationConfig["Hunter4"]);
	end
	if (TranqRotationConfig["Hunter5"] ~= nil) then
		TranqRotationOptionsHunter5:SetText(TranqRotationConfig["Hunter5"]);
	end
	if (TranqRotationConfig["Hunter6"] ~= nil) then
		TranqRotationOptionsHunter6:SetText(TranqRotationConfig["Hunter6"]);
	end
	TranqRotationOptionsCaptain:SetChecked(TranqRotationConfig["Captain"]);
	TranqRotationOptionsStatus:SetChecked(TranqRotationConfig["Status"]);

	TranqRotationOptions_CheckCaptain();
	TranqRotationOptions_CheckStatus();
end

function TranqRotationOptions_Save()
	TranqRotation_Reset();

	if (TranqRotationOptionsStatus:GetChecked()) then
		TranqRotationConfig["Status"] = TranqRotationOptionsStatus:GetChecked();
	end

	if (TranqRotationOptionsCaptain:GetChecked()) then
		TranqRotationConfig["Captain"] = TranqRotationOptionsCaptain:GetChecked();
	end

	if (TranqRotationOptionsHunter1:GetText() == "") then
	  DEFAULT_CHAT_FRAME:AddMessage("[|cffff0000宁神循环|r] 因为没有设置第一猎人,所以跳过所有其他条目.")
	  return;
	else
	  TranqRotationConfig["Hunter1"] = TranqRotationOptionsHunter1:GetText();
	end
	if (TranqRotationOptionsHunter2:GetText() == "") then
	  DEFAULT_CHAT_FRAME:AddMessage("[|cffff0000宁神循环|r] 因为没有设置第二猎人,所以跳过剩余条目.")
	  return;
	else
	  TranqRotationConfig["Hunter2"] = TranqRotationOptionsHunter2:GetText();
	end
	if (TranqRotationOptionsHunter3:GetText() == "") then
	  DEFAULT_CHAT_FRAME:AddMessage("[|cffff0000宁神循环|r] 因为没有设置第三猎人,所以跳过剩余条目.")
	  return;
	else
	  TranqRotationConfig["Hunter3"] = TranqRotationOptionsHunter3:GetText();
	end
	if (TranqRotationOptionsHunter4:GetText() == "") then
	  DEFAULT_CHAT_FRAME:AddMessage("[|cffff0000宁神循环|r] 因为没有设置第四猎人,所以跳过剩余条目.")
	  return;
	else
	  TranqRotationConfig["Hunter4"] = TranqRotationOptionsHunter4:GetText();
	end
	if (TranqRotationOptionsHunter5:GetText() == "") then
	  DEFAULT_CHAT_FRAME:AddMessage("[|cffff0000宁神循环|r] 因为没有设置第五猎人,所以跳过剩余条目.")
	  return;
	else
	  TranqRotationConfig["Hunter5"] = TranqRotationOptionsHunter5:GetText();
	end
	if (TranqRotationOptionsHunter6:GetText() == "") then
	  DEFAULT_CHAT_FRAME:AddMessage("[|cffff0000宁神循环|r] 因为猎人没有设置第六猎人.")
	  return;
	else
	  TranqRotationConfig["Hunter6"] = TranqRotationOptionsHunter6:GetText();
	end
end

function TranqRotationOptions_ClearEditBox()
	TranqRotationOptionsHunter1:SetText("");
	TranqRotationOptionsHunter2:SetText("");
	TranqRotationOptionsHunter3:SetText("");
	TranqRotationOptionsHunter4:SetText("");
	TranqRotationOptionsHunter5:SetText("");
	TranqRotationOptionsHunter6:SetText("");
end

function TranqRotationOptions_Open()
	ShowUIPanel(TranqRotationOptions);
	TranqRotationOptions_Load();
end

function TranqRotationOptions_Reset()
	DEFAULT_CHAT_FRAME:AddMessage("[|cffff0000宁神循环|r] 重置猎人列表.")
	TranqRotation_Reset();
	TranqRotationOptions_Load();
end

function TranqRotationOptions_Okay()
	DEFAULT_CHAT_FRAME:AddMessage("[|cffff0000宁神循环|r] 保存中...")
	TranqRotationOptions_Save();
	TranqRotationConfig["Max"] = GetMaxHunter();
	TranqRotationOptions_Close();
	DEFAULT_CHAT_FRAME:AddMessage("[|cffff0000宁神循环|r] 保存完毕.")
	TranqRotation_ResetStatusBar();
end

function TranqRotationOptions_Close()
	HideUIPanel(TranqRotationOptions);
	TranqRotationOptions_Load();
end

function TranqRotationOptions_CheckCaptain()
	if (TranqRotationOptionsCaptain:GetChecked()) then
		TranqRotationOptionsHunter1:Show();
		TranqRotationOptionsHunter2:Show();
		TranqRotationOptionsHunter3:Show();
		TranqRotationOptionsHunter4:Show();
		TranqRotationOptionsHunter5:Show();
		TranqRotationOptionsHunter6:Show();
		TranqRotationOptionsHunter1Text:Show();
		TranqRotationOptionsHunter2Text:Show();
		TranqRotationOptionsHunter3Text:Show();
		TranqRotationOptionsHunter4Text:Show();
		TranqRotationOptionsHunter5Text:Show();
		TranqRotationOptionsHunter6Text:Show();
		TranqRotationOptionsOrder:Show();
		TranqRotationOptionsScan:Show();
		TranqRotationStatusWindowNext:Show();
	else
		TranqRotationOptionsHunter1:Hide();
		TranqRotationOptionsHunter2:Hide();
		TranqRotationOptionsHunter3:Hide();
		TranqRotationOptionsHunter4:Hide();
		TranqRotationOptionsHunter5:Hide();
		TranqRotationOptionsHunter6:Hide();
		TranqRotationOptionsHunter1Text:Hide();
		TranqRotationOptionsHunter2Text:Hide();
		TranqRotationOptionsHunter3Text:Hide();
		TranqRotationOptionsHunter4Text:Hide();
		TranqRotationOptionsHunter5Text:Hide();
		TranqRotationOptionsHunter6Text:Hide();
		TranqRotationOptionsOrder:Hide();
		TranqRotationOptionsScan:Hide();
		TranqRotationStatusWindowNext:Hide();
	end
end

function TranqRotationOptions_CheckStatus()
	if (TranqRotationOptionsStatus:GetChecked()) then
		ShowUIPanel(TranqRotationStatusWindow);
		TranqRotation_ResetStatusBar();
	else
		HideUIPanel(TranqRotationStatusWindow);
	end
end

function TranqRotation_ResetStatusBar()
	if (TranqRotationOptionsHunter1:GetText() ~= "") then
		TranqRotationStatusWindowHunter1:SetText(TranqRotationOptionsHunter1:GetText());
		TranqRotationStatusWindowHunter1Status:SetText("准备好了");
		TranqRotationStatusWindowHunter1Status:SetTextColor(0,1,0,1);
		TranqRotationStatusWindowHunter1Sync:SetText("--");
		TranqRotationStatusWindowHunter1Sync:SetTextColor(1,1,1,1);
	else
		TranqRotationStatusWindowHunter1:SetText("--");
		TranqRotationStatusWindowHunter1Status:SetText("--");
		TranqRotationStatusWindowHunter1Status:SetTextColor(1,1,1,1);
		TranqRotationStatusWindowHunter1Sync:SetText("--");
		TranqRotationStatusWindowHunter1Sync:SetTextColor(1,1,1,1);
	end
	if (TranqRotationOptionsHunter2:GetText() ~= "") then
		TranqRotationStatusWindowHunter2:SetText(TranqRotationOptionsHunter2:GetText());
		TranqRotationStatusWindowHunter2Status:SetText("准备好了");
		TranqRotationStatusWindowHunter2Status:SetTextColor(0,1,0,1);
		TranqRotationStatusWindowHunter2Sync:SetText("--");
		TranqRotationStatusWindowHunter2Sync:SetTextColor(1,1,1,1);
	else
		TranqRotationStatusWindowHunter2:SetText("--");
		TranqRotationStatusWindowHunter2Status:SetText("--");
		TranqRotationStatusWindowHunter2Status:SetTextColor(1,1,1,1);
		TranqRotationStatusWindowHunter2Sync:SetText("--");
		TranqRotationStatusWindowHunter2Sync:SetTextColor(1,1,1,1);
	end
	if (TranqRotationOptionsHunter3:GetText() ~= "") then
		TranqRotationStatusWindowHunter3:SetText(TranqRotationOptionsHunter3:GetText());
		TranqRotationStatusWindowHunter3Status:SetText("准备好了");
		TranqRotationStatusWindowHunter3Status:SetTextColor(0,1,0,1);
		TranqRotationStatusWindowHunter3Sync:SetText("--");
		TranqRotationStatusWindowHunter3Sync:SetTextColor(1,1,1,1);
	else
		TranqRotationStatusWindowHunter3:SetText("--");
		TranqRotationStatusWindowHunter3Status:SetText("--");
		TranqRotationStatusWindowHunter3Status:SetTextColor(1,1,1,1);
		TranqRotationStatusWindowHunter3Sync:SetText("--");
		TranqRotationStatusWindowHunter3Sync:SetTextColor(1,1,1,1);
	end
	if (TranqRotationOptionsHunter4:GetText() ~= "") then
		TranqRotationStatusWindowHunter4:SetText(TranqRotationOptionsHunter4:GetText());
		TranqRotationStatusWindowHunter4Status:SetText("准备好了");
		TranqRotationStatusWindowHunter4Status:SetTextColor(0,1,0,1);
		TranqRotationStatusWindowHunter4Sync:SetText("--");
		TranqRotationStatusWindowHunter4Sync:SetTextColor(1,1,1,1);
	else
		TranqRotationStatusWindowHunter4:SetText("--");
		TranqRotationStatusWindowHunter4Status:SetText("--");
		TranqRotationStatusWindowHunter4Status:SetTextColor(1,1,1,1);
		TranqRotationStatusWindowHunter4Sync:SetText("--");
		TranqRotationStatusWindowHunter4Sync:SetTextColor(1,1,1,1);
	end
	if (TranqRotationOptionsHunter5:GetText() ~= "") then
		TranqRotationStatusWindowHunter5:SetText(TranqRotationOptionsHunter5:GetText());
		TranqRotationStatusWindowHunter5Status:SetText("准备好了");
		TranqRotationStatusWindowHunter5Status:SetTextColor(0,1,0,1);
		TranqRotationStatusWindowHunter5Sync:SetText("--");
		TranqRotationStatusWindowHunter5Sync:SetTextColor(1,1,1,1);
	else
		TranqRotationStatusWindowHunter5:SetText("--");
		TranqRotationStatusWindowHunter5Status:SetText("--");
		TranqRotationStatusWindowHunter5Status:SetTextColor(1,1,1,1);
		TranqRotationStatusWindowHunter5Sync:SetText("--");
		TranqRotationStatusWindowHunter5Sync:SetTextColor(1,1,1,1);
	end
	if (TranqRotationOptionsHunter6:GetText() ~= "") then
		TranqRotationStatusWindowHunter6:SetText(TranqRotationOptionsHunter6:GetText());
		TranqRotationStatusWindowHunter6Status:SetText("准备好了");
		TranqRotationStatusWindowHunter6Status:SetTextColor(0,1,0,1);
		TranqRotationStatusWindowHunter6Sync:SetText("--");
		TranqRotationStatusWindowHunter6Sync:SetTextColor(1,1,1,1);
	else
		TranqRotationStatusWindowHunter6:SetText("--");
		TranqRotationStatusWindowHunter6Status:SetText("--");
		TranqRotationStatusWindowHunter6Status:SetTextColor(1,1,1,1);
		TranqRotationStatusWindowHunter6Sync:SetText("--");
		TranqRotationStatusWindowHunter6Sync:SetTextColor(1,1,1,1);
	end
end

function TranqRotation_UpdateHunterStatus(num, status, r, g, b)
	if (num == 1) then
		TranqRotationStatusWindowHunter1Status:SetText(status);
		TranqRotationStatusWindowHunter1Status:SetTextColor(r,g,b,1);
	elseif (num == 2) then
		TranqRotationStatusWindowHunter2Status:SetText(status);
		TranqRotationStatusWindowHunter2Status:SetTextColor(r,g,b,1);
	elseif (num == 3) then
		TranqRotationStatusWindowHunter3Status:SetText(status);
		TranqRotationStatusWindowHunter3Status:SetTextColor(r,g,b,1);
	elseif (num == 4) then
		TranqRotationStatusWindowHunter4Status:SetText(status);
		TranqRotationStatusWindowHunter4Status:SetTextColor(r,g,b,1);
	elseif (num == 5) then
		TranqRotationStatusWindowHunter5Status:SetText(status);
		TranqRotationStatusWindowHunter5Status:SetTextColor(r,g,b,1);
	elseif (num == 6) then
		TranqRotationStatusWindowHunter6Status:SetText(status);
		TranqRotationStatusWindowHunter6Status:SetTextColor(r,g,b,1);
	else
		return;
	end
end

function TranqRotation_UpdateHunterSyncStatus(num, status, r, g, b)
	if (num == 1) then
		TranqRotationStatusWindowHunter1Sync:SetText(status);
		TranqRotationStatusWindowHunter1Sync:SetTextColor(r,g,b,1);
	elseif (num == 2) then
		TranqRotationStatusWindowHunter2Sync:SetText(status);
		TranqRotationStatusWindowHunter2Sync:SetTextColor(r,g,b,1);
	elseif (num == 3) then
		TranqRotationStatusWindowHunter3Sync:SetText(status);
		TranqRotationStatusWindowHunter3Sync:SetTextColor(r,g,b,1);
	elseif (num == 4) then
		TranqRotationStatusWindowHunter4Sync:SetText(status);
		TranqRotationStatusWindowHunter4Sync:SetTextColor(r,g,b,1);
	elseif (num == 5) then
		TranqRotationStatusWindowHunter5Sync:SetText(status);
		TranqRotationStatusWindowHunter5Sync:SetTextColor(r,g,b,1);
	elseif (num == 6) then
		TranqRotationStatusWindowHunter6Sync:SetText(status);
		TranqRotationStatusWindowHunter6Sync:SetTextColor(r,g,b,1);
	else
		return;
	end
end
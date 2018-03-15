--[[
Author:			Mimma
Create Date:	2015-05-10 17:50:57

The latest version of Thaliz can always be found at:
https://armory.digam.dk/thaliz

The source code can be found at Github:
https://github.com/Sentilix/thaliz

Please see the ReadMe.txt for addon details.
]]


local PARTY_CHANNEL			= "PARTY"
local RAID_CHANNEL			= "RAID"
local YELL_CHANNEL			= "YELL"
local SAY_CHANNEL			= "SAY"
local WARN_CHANNEL			= "RAID_WARNING"
local GUILD_CHANNEL			= "GUILD"
local CHAT_END				= "|r"
local COLOUR_CHAT			= "|c8040A0F8"
local COLOUR_INTRO			= "|c80B040F0"
local THALIZ_PREFIX			= "Thalizv1"
local CTRA_PREFIX			= "CTRA"
local THALIZ_MAX_MESSAGES	= 200
local THALIZ_MAX_VISIBLE_MESSAGES = 20
local THALIZ_EMPTY_MESSAGE	= "(空)"

local THALIZ_CURRENT_VERSION = 0
local THALIZ_UPDATE_MESSAGE_SHOWN = false

local EMOTE_GROUP_DEFAULT	= "Default";
local EMOTE_GROUP_GUILD		= "Guild";
local EMOTE_GROUP_CHARACTER = "Name";
local EMOTE_GROUP_CLASS		= "Class";
local EMOTE_GROUP_RACE		= "Race";

--	List of valid class names with priority and resurrection spell name (if any)
local classInfo = {
	{ "德鲁伊",   40, "复生" },
	{ "猎人",  30, nil },
	{ "法师",    40, nil },
	{ "圣骑士", 50, "救赎" },
	{ "牧师",  50, "复活术" },
	{ "盗贼",   10, nil },
	{ "萨满祭司",  50, "先祖之魂" },
	{ "术士", 30, nil },
	{ "战士", 20, nil }
}

local PriorityToFirstWarlock  = 45;     -- Prio below ressers if no warlocks are alive
local PriorityToGroupLeader   = 45;     -- Prio below ressers if raid leader or assistant
local PriorityToCurrentTarget = 100;	-- Prio over all if target is selected

-- List of blacklisted (already ressed) people
local blacklistedTable = {}
-- Corpses are blacklisted for 25 seconds (10 seconds cast time + 15 seconds waiting) as default
local Thaliz_Blacklist_Timeout = 25;

local Thaliz_Enabled = true;

-- Configuration constants:
local Thaliz_Configuration_Default_Level = "Character";	-- Can be "Character" or "Realm"
local Thaliz_Target_Channel_Default = "RAID";
local Thaliz_Target_Whisper_Default = "0";
local Thaliz_Resurrection_Whisper_Message_Default = "10秒后会受到复活!";

local Thaliz_ConfigurationLevel = Thaliz_Configuration_Default_Level;

local Thaliz_ROOT_OPTION_CharacterBasedSettings = "CharacterBasedSettings";
local Thaliz_OPTION_ResurrectionMessageTargetChannel = "ResurrectionMessageTargetChannel";
local Thaliz_OPTION_ResurrectionMessageTargetWhisper = "ResurrectionMessageTargetWhisper";
local Thaliz_OPTION_AlwaysIncludeDefaultGroup = "AlwaysIncludeDefaultGroup";
local Thaliz_OPTION_ResurrectionWhisperMessage = "ResurrectionWhisperMessage";
local Thaliz_OPTION_ResurrectionMessages = "ResurrectionMessages";


-- Persisted information:
Thaliz_Options = {}


-- List of resurrection messages
--	{ "Message", "Group", "Group parameter value" }
local Thaliz_DefaultResurrectionMessages = {
	{ "(复活中) 别偷懒了快起来, %s!",						EMOTE_GROUP_DEFAULT, "" },
	{ "(复活中) 正在对%s进行人工呼吸，请其他队友远离此人。",				EMOTE_GROUP_DEFAULT, "" },
	{ "(复活中) 复活一次100G，如果%s你同意请点确定",				EMOTE_GROUP_DEFAULT, "" },
	{ "(复活中) %s! 你不能死啊！我与你相依为命、同甘共苦，一直当你是佣人般使唤你辗压你，想不到今日活人送死人……",						EMOTE_GROUP_DEFAULT, "" },
	{ "(复活中) 眉开眼笑的对%s说：哎呀大爷。您怎么才来呀。转头向后面喊到：姑娘们。都出来接客拉~！别让这位大爷睡着拉！",				EMOTE_GROUP_DEFAULT, "" },
	{ "(复活中) %s! 你看你都压着花花草草了了。还不爬起来？？",			EMOTE_GROUP_DEFAULT, "" },
	{ "(复活中) %s同学.你的女王来拯救你了.喜欢鞭子点确定.喜欢蜡烛点拒绝.",								EMOTE_GROUP_DEFAULT, "" },
	{ "(复活中) %s!喝了这滴猫尿你就能复活了 ,喝吧........... ",									EMOTE_GROUP_DEFAULT, "" },
	{ "(复活中) %s!复活在我，生命也在我，信我的人虽死了，必将复活，凡活着信我的人必永远不死",	EMOTE_GROUP_DEFAULT, "" },
	{ "(复活中) %s!告诉过你过马路要走人行道，偏不听，现在被车压了吧！",					EMOTE_GROUP_DEFAULT, "" },
	{ "(复活中) %s!都几岁的人了，还撒娇了躺地上，出去别说我认识你！",							EMOTE_GROUP_DEFAULT, "" },
	{ "(复活中) 来2个人用力撑开我的肛门~~~~~我正在把%s拉出来!",			EMOTE_GROUP_DEFAULT, "" },
	{ "(复活中) 亲爱的%s,复活你的灵魂需要用你的肉体做为交换!!如果愿意请点确定!",						EMOTE_GROUP_DEFAULT, "" },
	{ "(复活中) %s,快起来,你躺的那地方我刚潵过尿...脏! ",					EMOTE_GROUP_DEFAULT, "" },
	{ "(复活中) 对不起%s,你是一个好人，但是……",					EMOTE_GROUP_DEFAULT, "" },
	{ "(复活中) 人工呼吸%s ing,如果不介意偶的口臭,请以身相许吧,同意的话点确定,拒绝的概不负责!",			EMOTE_GROUP_DEFAULT, "" },
	{ "(复活中) 沉睡在垃圾桶中的%s,快醒过来吧",				EMOTE_GROUP_DEFAULT, "" },
	{ "(复活中) %s!快起来，走光啦!",				EMOTE_GROUP_DEFAULT, "" },
	{ "(复活中) 正在对%s释放5级扒皮术，请不要抢钱，打钱辛苦",						EMOTE_GROUP_DEFAULT, "" },
	{ "(复活中) 正在对%s施放脑袋复苏术，由于长时间超负荷运做导致了%s的非正常死亡",					EMOTE_GROUP_DEFAULT, "" }
}



--[[
	Echo a message for the local user only.
]]
local function echo(msg)
	if not msg then
		msg = ""
	end
	DEFAULT_CHAT_FRAME:AddMessage(COLOUR_CHAT .. msg .. CHAT_END)
end

--[[
	Echo in raid chat (if in raid) or party chat (if not)
]]
local function partyEcho(msg)
	if Thaliz_IsInRaid() then
		SendChatMessage(msg, RAID_CHANNEL)
	elseif Thaliz_IsInParty() then
		SendChatMessage(msg, PARTY_CHANNEL)
	end
end

--[[
	Echo a message for the local user only, including Thaliz "logo"
]]
function Thaliz_Echo(msg)
	echo("<"..COLOUR_INTRO.."智能复活"..COLOUR_CHAT.."> "..msg);
end





--  *******************************************************
--
--	Slash commands
--
--  *******************************************************

--[[
	Main entry for Thaliz.
	This will send the request to one of the sub slash commands.
	Syntax: /thaliz [option, defaulting to "res"]
	Added in: 0.0.1
]]
SLASH_THALIZ_THALIZ1 = "/thaliz"
SlashCmdList["THALIZ_THALIZ"] = function(msg)
	local _, _, option = string.find(msg, "(%S*)")

	if not option or option == "" then
		option = "RES"
	end
	option = string.upper(option);
		
	if (option == "RES" or option == "RESURRECT") then
		SlashCmdList["THALIZ_RES"]();
	elseif (option == "CFG" or option == "CONFIG") then
		SlashCmdList["THALIZ_CONFIG"]();
	elseif option == "DISABLE" then
		SlashCmdList["THALIZ_DISABLE"]();
	elseif option == "ENABLE" then
		SlashCmdList["THALIZ_ENABLE"]();
	elseif option == "HELP" then
		SlashCmdList["THALIZ_HELP"]();
	elseif option == "VERSION" then
		SlashCmdList["THALIZ_VERSION"]();
	else
		Thaliz_Echo(string.format("未知命令: %s", option));
	end
end

--[[
	Resurrect highest priority target.
	Syntax: /thalizres
	Alternative: /thaliz res
	Added in: 0.3.0
]]
SLASH_THALIZ_RES1 = "/thalizres"
SlashCmdList["THALIZ_RES"] = function(msg)
	Thaliz_StartResurrectionOnPriorityTarget();
end

--[[
	Request client version information
	Syntax: /thalizversion
	Alternative: /thaliz version
	Added in: 0.2.1
]]
SLASH_THALIZ_VERSION1 = "/thalizversion"
SlashCmdList["THALIZ_VERSION"] = function(msg)
	if Thaliz_IsInRaid() or Thaliz_IsInParty() then
		Thaliz_SendAddonMessage("TX_VERSION##");
	else
		Thaliz_Echo(string.format("%s 在使用Thaliz版本 %s", UnitName("player"), GetAddOnMetadata("Thaliz", "Version")));
	end
end

--[[
	Show configuration options
	Syntax: /thalizconfig
	Alternative: /thaliz config
	Added in: 0.3.0
]]
SLASH_THALIZ_CONFIG1 = "/thalizconfig"
SLASH_THALIZ_CONFIG2 = "/thalizcfg"
SlashCmdList["THALIZ_CONFIG"] = function(msg)
	Thaliz_OpenConfigurationDialogue();
end

--[[
	Disable Thaliz' messages
	Syntax: /thaliz disable
	Added in: 0.3.2
]]
SLASH_THALIZ_DISABLE1 = "/thalizdisable"
SlashCmdList["THALIZ_DISABLE"] = function(msg)
	Thaliz_Enabled = false;
	Thaliz_Echo("复活通告现在禁用.");
end

--[[
	Enable Thaliz' messages
	Syntax: /thaliz enable
	Added in: 0.3.2
]]
SLASH_THALIZ_ENABLE1 = "/thalizenable"
SlashCmdList["THALIZ_ENABLE"] = function(msg)
	Thaliz_Enabled = true;
	Thaliz_Echo("复活通告现在启用.");
end

--[[
	Show HELP options
	Syntax: /thalizhelp
	Alternative: /thaliz help
	Added in: 0.2.0
]]
SLASH_THALIZ_HELP1 = "/thalizhelp"
SlashCmdList["THALIZ_HELP"] = function(msg)
	Thaliz_Echo(string.format("Thaliz 版本 %s 选项:", GetAddOnMetadata("Thaliz", "Version")));
	Thaliz_Echo("语法:");
	Thaliz_Echo("    /thaliz [option]");
	Thaliz_Echo("可供选项的命令:");
	Thaliz_Echo("    Res          (默认) 复活下一个目标.");
	Thaliz_Echo("    Config       打开配置对话框,");
	Thaliz_Echo("    Disable      禁用 Thaliz 复活消息.");
	Thaliz_Echo("    Enable       启用 Thaliz 复活消息.");
	Thaliz_Echo("    Help         帮助.");
	Thaliz_Echo("    Version      从所有客户端请求的版本信息.");
end




--  *******************************************************
--
--	Configuration functions
--
--  *******************************************************
function Thaliz_OpenConfigurationDialogue()
	local whisperMsg = Thaliz_GetOption(Thaliz_OPTION_ResurrectionWhisperMessage);
	getglobal("ThalizFrameWhisper"):SetText(whisperMsg);

	ThalizFrame:Show();
end

function Thaliz_RefreshVisibleMessageList(offset)
	--echo(string.format("Offset=%d", offset));
	local macros = Thaliz_GetResurrectionMessages();
	
	-- Set a priority on each spell, and then sort them accordingly:
	local macro, grp, prm, prio
	for n=1, table.getn(macros), 1 do
		grp = macros[n][2];
		prm = macros[n][3];
		if grp == EMOTE_GROUP_GUILD then
			prio = 20
		elseif grp == EMOTE_GROUP_CHARACTER then
			prio = 30
		elseif grp == EMOTE_GROUP_CLASS then
			-- Class names are listed alphabetically:
			prio = 50		
			if prm == "德鲁伊" then
				prio = 59
			elseif prm == "猎人" then
				prio = 58
			elseif prm == "法师" then
				prio = 57
			elseif prm == "圣骑士" then
				prio = 56
			elseif prm == "牧师" then
				prio = 55
			elseif prm == "盗贼" then
				prio = 54
			elseif prm == "萨满祭司" then
				prio = 53
			elseif prm == "术士" then
				prio = 52
			elseif prm == "战士" then
				prio = 51
			end;			
		elseif grp == EMOTE_GROUP_RACE then
			prio = 40
			-- Racess are listed by faction, race name:
			if prm == "矮人" then
				prio = 49
			elseif prm == "侏儒" then
				prio = 48
			elseif prm == "人类" then
				prio = 47
			elseif prm == "暗夜精灵" then
				prio = 46
			elseif prm == "兽人" then
				prio = 45
			elseif prm == "牛头人" then
				prio = 44
			elseif prm == "巨魔" then
				prio = 43
			elseif prm == "亡灵" then
				prio = 42
			end;			
		elseif grp == EMOTE_GROUP_DEFAULT then
			prio = 0
		end
		macros[n][4] = prio;		
	end
	
	Thaliz_SortTableDescending(macros, 4);
	
	for n=1, THALIZ_MAX_VISIBLE_MESSAGES, 1 do
		macro = macros[n + offset]
		if not macro then
			macro = { "", EMOTE_GROUP_DEFAULT, "" }
		end
		
		local msg = Thaliz_CheckMessage(macro[1]);
		local grp = Thaliz_CheckGroup(macro[2]);
		local prm = Thaliz_CheckGroupValue(macro[3]);
		
		--echo(string.format("-> Msg=%s, Grp=%s, Value=%s", msg, grp, prm));
		
		local frame = getglobal("ThalizFrameTableListEntry"..n);
		getglobal(frame:GetName().."Message"):SetText(msg);
		getglobal(frame:GetName().."Group"):SetText(grp);
		getglobal(frame:GetName().."Param"):SetText(prm);
		
		local grpColor = { 0.5, 0.5, 0.5 }
		local prmColor = { 0.5, 0.5, 0.5 }
		
		prm = string.upper(prm);
		
		if grp == EMOTE_GROUP_GUILD then
			grpColor = { 0.0, 1.0, 0.0 }
			prmColor = { 0.8, 0.8, 0.0 }
		elseif grp == EMOTE_GROUP_CHARACTER then
			grpColor = { 0.8, 0.8, 0.8 }
			prmColor = { 0.8, 0.8, 0.0 }
		elseif grp == EMOTE_GROUP_CLASS then
			grpColor = { 0.8, 0.0, 1.0 }
			
			if prm == "德鲁伊" then
				prmColor = { 1.00, 0.49, 0.04 }
			elseif prm == "猎人" then
				prmColor = { 0.67, 0.83, 0.45 }
			elseif prm == "法师" then
				prmColor = { 0.41, 0.80, 0.94 }
			elseif prm == "圣骑士" then
				prmColor = { 0.96, 0.55, 0.73 }
			elseif prm == "牧师" then
				prmColor = { 1.00, 1.00, 1.00 }
			elseif prm == "盗贼" then
				prmColor = { 1.00, 0.96, 0.41 }
			elseif prm == "萨满祭司" then
				prmColor = { 0.96, 0.55, 0.73 }
			elseif prm == "术士" then
				prmColor = { 0.58, 0.51, 0.79 }
			elseif prm == "战士" then
				prmColor = { 0.78, 0.61, 0.43 }
			end;			
		elseif grp == EMOTE_GROUP_RACE then
			grpColor = { 0.80, 0.80, 0.00 }			
			if prm == "矮人" or prm == "侏儒" or prm == "人类"  or prm == "暗夜精灵" then
				grpColor = { 0.00, 0.50, 1.00 }
			elseif prm == "兽人" or prm == "牛头人" or prm == "巨魔"  or prm == "亡灵" then
				grpColor = { 1.00, 0.00, 0.00 }
			end
			prmColor = grpColor;
		end;
		
		getglobal(frame:GetName().."Group"):SetTextColor(grpColor[1], grpColor[2], grpColor[3]);
		getglobal(frame:GetName().."Param"):SetTextColor(prmColor[1], prmColor[2], prmColor[3]);
		
		frame:Show();
	end
end

function Thaliz_UpdateMessageList(frame)
	FauxScrollFrame_Update(ThalizFrameTableList, THALIZ_MAX_MESSAGES, 10, 20);
	local offset = FauxScrollFrame_GetOffset(ThalizFrameTableList);
	
	Thaliz_RefreshVisibleMessageList(offset);
end

function Thaliz_InitializeListElements()
	local entry = CreateFrame("Button", "$parentEntry1", ThalizFrameTableList, "Thaliz_CellTemplate");
	entry:SetID(1);
	entry:SetPoint("TOPLEFT", 4, -4);
	for n=2, THALIZ_MAX_MESSAGES, 1 do
		local entry = CreateFrame("Button", "$parentEntry"..n, ThalizFrameTableList, "Thaliz_CellTemplate");
		entry:SetID(n);
		entry:SetPoint("TOP", "$parentEntry"..(n-1), "BOTTOM");
	end
end

local currentObjectId;	-- A small hack: the object ID is lost when using own frame
local msgEditorIsOpen;
function Thaliz_OnMessageClick(object)
	Thaliz_CloseMsgEditorButton_OnClick();

	currentObjectId = object:GetID();
	local offset = FauxScrollFrame_GetOffset(ThalizFrameTableList);
		
	local msg = getglobal(object:GetName().."Message"):GetText();
	local grp = getglobal(object:GetName().."Group"):GetText();
	local prm = getglobal(object:GetName().."Param"):GetText();
	if not msg or msg == THALIZ_EMPTY_MESSAGE then
		msg = "";
	end
	
	grp = Thaliz_CheckGroup(grp);
	prm = Thaliz_CheckGroupValue(prm);

	local frame = getglobal("ThalizMsgEditorFrame");
	getglobal(frame:GetName().."Message"):SetText(msg);
	getglobal(frame:GetName().."GroupValue"):SetText(prm);

	getglobal(frame:GetName().."CheckbuttonAlways"):SetChecked(0);		
	getglobal(frame:GetName().."CheckbuttonGuild"):SetChecked(0);		
	getglobal(frame:GetName().."CheckbuttonCharacter"):SetChecked(0);		
	getglobal(frame:GetName().."CheckbuttonClass"):SetChecked(0);		
	getglobal(frame:GetName().."CheckbuttonRace"):SetChecked(0);		

	if grp == EMOTE_GROUP_GUILD then
		getglobal(frame:GetName().."CheckbuttonGuild"):SetChecked(1);		
	elseif grp == EMOTE_GROUP_CHARACTER then
		getglobal(frame:GetName().."CheckbuttonCharacter"):SetChecked(1);		
	elseif grp == EMOTE_GROUP_CLASS then
		getglobal(frame:GetName().."CheckbuttonClass"):SetChecked(1);		
	elseif grp == EMOTE_GROUP_RACE then
		getglobal(frame:GetName().."CheckbuttonRace"):SetChecked(1);		
	else
		getglobal(frame:GetName().."CheckbuttonAlways"):SetChecked(1);
	end
	
	msgEditorIsOpen = true;
	ThalizMsgEditorFrame:Show();
	ThalizMsgEditorFrameMessage:SetFocus();
end


function Thaliz_SaveMessageButton_OnClick()
	local msg = ThalizMsgEditorFrameMessage:GetText();
	local prm = ThalizMsgEditorFrameGroupValue:GetText();
	local grp;
	local offset = FauxScrollFrame_GetOffset(ThalizFrameTableList);

	if ThalizMsgEditorFrameCheckbuttonGuild:GetChecked() then
		grp = EMOTE_GROUP_GUILD;
	elseif ThalizMsgEditorFrameCheckbuttonCharacter:GetChecked() then
		grp = EMOTE_GROUP_CHARACTER;
	elseif ThalizMsgEditorFrameCheckbuttonClass:GetChecked() then
		grp = EMOTE_GROUP_CLASS;
	elseif ThalizMsgEditorFrameCheckbuttonRace:GetChecked() then
		grp = EMOTE_GROUP_RACE;
	else
		grp = EMOTE_GROUP_DEFAULT;
	end;

	if	grp == EMOTE_GROUP_CHARACTER or 
		grp == EMOTE_GROUP_CLASS then
		prm = Thaliz_UCFirst(prm)
	elseif grp == EMOTE_GROUP_RACE then
		-- Allow both "nightelf" and "night elf".
		-- This weird construction ensures all are shown with capital first letter.
		if string.upper(prm) == "NIGHTELF" or string.upper(prm) == "NIGHT ELF" then
			prm = "暗夜精灵"
		else
			prm = Thaliz_UCFirst(prm)
		end;
	end

	--echo(string.format("Saving, ID=%d, Offset=%d, Msg=%s, Grp=%s, Val=%s", currentObjectId, offset, msg, grp, prm));
	Thaliz_CloseMsgEditorButton_OnClick();	
	Thaliz_UpdateResurrectionMessage(currentObjectId, offset, msg, grp, prm);
	Thaliz_UpdateMessageList();
end


function Thaliz_HandleCheckbox(checkbox)
	local checkboxname = checkbox:GetName();
	
	--	If checked, then we need to uncheck others in same group:
	if checkboxname == "ThalizFrameCheckbuttonRaid" or checkboxname == "ThalizFrameCheckbuttonYell" or checkboxname == "ThalizFrameCheckbuttonSay" then	
		if checkbox:GetChecked() then
			if checkboxname == "ThalizFrameCheckbuttonRaid" then
				Thaliz_SetOption(Thaliz_OPTION_ResurrectionMessageTargetChannel, "RAID");
				ThalizFrameCheckbuttonSay:SetChecked(0);
				ThalizFrameCheckbuttonYell:SetChecked(0);
			elseif checkboxname == "ThalizFrameCheckbuttonYell" then
				Thaliz_SetOption(Thaliz_OPTION_ResurrectionMessageTargetChannel, "YELL");
				ThalizFrameCheckbuttonSay:SetChecked(0);
				ThalizFrameCheckbuttonRaid:SetChecked(0);
			elseif checkboxname == "ThalizFrameCheckbuttonSay" then
				Thaliz_SetOption(Thaliz_OPTION_ResurrectionMessageTargetChannel, "SAY");
				ThalizFrameCheckbuttonRaid:SetChecked(0);
				ThalizFrameCheckbuttonYell:SetChecked(0);
			end
		else
			Thaliz_SetOption(Thaliz_OPTION_ResurrectionMessageTargetChannel, "NONE");
			ThalizFrameCheckbuttonRaid:SetChecked(0);
			ThalizFrameCheckbuttonSay:SetChecked(0);
			ThalizFrameCheckbuttonYell:SetChecked(0);
		end
	end

	-- "single" checkboxes (checkboxes with no impact on other checkboxes):
	if ThalizFrameCheckbuttonWhisper:GetChecked() then
		Thaliz_SetOption(Thaliz_OPTION_ResurrectionMessageTargetWhisper, 1);
	else
		Thaliz_SetOption(Thaliz_OPTION_ResurrectionMessageTargetWhisper, 0);
	end	
	
	if ThalizFrameCheckbuttonIncludeDefault:GetChecked() then
		Thaliz_SetOption(Thaliz_OPTION_AlwaysIncludeDefaultGroup, 1);
	else
		Thaliz_SetOption(Thaliz_OPTION_AlwaysIncludeDefaultGroup, 0);
	end	
		
	if ThalizFrameCheckbuttonPerCharacter:GetChecked() then
		Thaliz_SetRootOption(Thaliz_ROOT_OPTION_CharacterBasedSettings, "Character");
	else
		Thaliz_SetRootOption(Thaliz_ROOT_OPTION_CharacterBasedSettings, "Realm");
	end	

	
	-- Emote Groups: Only one can be active:
	if checkboxname == "ThalizMsgEditorFrameCheckbuttonAlways" then	
		if checkbox:GetChecked() then
			ThalizMsgEditorFrameCheckbuttonGuild:SetChecked(0);
			ThalizMsgEditorFrameCheckbuttonCharacter:SetChecked(0);
			ThalizMsgEditorFrameCheckbuttonClass:SetChecked(0);
			ThalizMsgEditorFrameCheckbuttonRace:SetChecked(0);
		end;
	elseif checkboxname == "ThalizMsgEditorFrameCheckbuttonGuild" then	
		if checkbox:GetChecked() then
			ThalizMsgEditorFrameCheckbuttonAlways:SetChecked(0);
			ThalizMsgEditorFrameCheckbuttonCharacter:SetChecked(0);
			ThalizMsgEditorFrameCheckbuttonClass:SetChecked(0);
			ThalizMsgEditorFrameCheckbuttonRace:SetChecked(0);
		end;
	elseif checkboxname == "ThalizMsgEditorFrameCheckbuttonCharacter" then	
		if checkbox:GetChecked() then
			ThalizMsgEditorFrameCheckbuttonAlways:SetChecked(0);
			ThalizMsgEditorFrameCheckbuttonGuild:SetChecked(0);
			ThalizMsgEditorFrameCheckbuttonClass:SetChecked(0);
			ThalizMsgEditorFrameCheckbuttonRace:SetChecked(0);
		end;
	elseif checkboxname == "ThalizMsgEditorFrameCheckbuttonClass" then	
		if checkbox:GetChecked() then
			ThalizMsgEditorFrameCheckbuttonAlways:SetChecked(0);
			ThalizMsgEditorFrameCheckbuttonGuild:SetChecked(0);
			ThalizMsgEditorFrameCheckbuttonCharacter:SetChecked(0);
			ThalizMsgEditorFrameCheckbuttonRace:SetChecked(0);
		end;
	elseif checkboxname == "ThalizMsgEditorFrameCheckbuttonRace" then	
		if checkbox:GetChecked() then
			ThalizMsgEditorFrameCheckbuttonAlways:SetChecked(0);
			ThalizMsgEditorFrameCheckbuttonGuild:SetChecked(0);
			ThalizMsgEditorFrameCheckbuttonCharacter:SetChecked(0);
			ThalizMsgEditorFrameCheckbuttonClass:SetChecked(0);
		end;
	end;
end

function Thaliz_GetRootOption(parameter, defaultValue)
	if Thaliz_Options then
		if Thaliz_Options[parameter] then
			local value = Thaliz_Options[parameter];
			if (type(value) == "table") or not(value == "") then
				return value;
			end
		end		
	end
	
	return defaultValue;
end

function Thaliz_SetRootOption(parameter, value)
	if not Thaliz_Options then
		Thaliz_Options = {};
	end
	
	Thaliz_Options[parameter] = value;
end

function Thaliz_GetOption(parameter, defaultValue)
	local realmname = GetRealmName();
	local playername = UnitName("player");

	if Thaliz_ConfigurationLevel == "Character" then
		-- Character level
		if Thaliz_Options[realmname] then
			if Thaliz_Options[realmname][playername] then
				if Thaliz_Options[realmname][playername][parameter] then
					local value = Thaliz_Options[realmname][playername][parameter];
					if (type(value) == "table") or not(value == "") then
						return value;
					end
				end		
			end
		end
	else
		-- Realm level:
		if Thaliz_Options[realmname] then
			if Thaliz_Options[realmname][parameter] then
				local value = Thaliz_Options[realmname][parameter];
				if (type(value) == "table") or not(value == "") then
					return value;
				end
			end		
		end
	end
	
	return defaultValue;
end

function Thaliz_SetOption(parameter, value)
	local realmname = GetRealmName();
	local playername = UnitName("player");

	if Thaliz_ConfigurationLevel == "Character" then
		-- Character level:
		if not Thaliz_Options[realmname] then
			Thaliz_Options[realmname] = {};
		end
		
		if not Thaliz_Options[realmname][playername] then
			Thaliz_Options[realmname][playername] = {};
		end
		
		Thaliz_Options[realmname][playername][parameter] = value;
		
	else
		-- Realm level:
		if not Thaliz_Options[realmname] then
			Thaliz_Options[realmname] = {};
		end	
		
		Thaliz_Options[realmname][parameter] = value;
	end
end

function Thaliz_InitializeConfigSettings()
	if not Thaliz_Options then
		Thaliz_options = { };
	end

	Thaliz_SetRootOption(Thaliz_ROOT_OPTION_CharacterBasedSettings, Thaliz_GetRootOption(Thaliz_ROOT_OPTION_CharacterBasedSettings, Thaliz_Configuration_Default_Level))
	Thaliz_ConfigurationLevel = Thaliz_GetRootOption(Thaliz_ROOT_OPTION_CharacterBasedSettings, Thaliz_Configuration_Default_Level);
	
	Thaliz_SetOption(Thaliz_OPTION_ResurrectionMessageTargetChannel, Thaliz_GetOption(Thaliz_OPTION_ResurrectionMessageTargetChannel, Thaliz_Target_Channel_Default))
	Thaliz_SetOption(Thaliz_OPTION_ResurrectionMessageTargetWhisper, Thaliz_GetOption(Thaliz_OPTION_ResurrectionMessageTargetWhisper, Thaliz_Target_Whisper_Default))
	Thaliz_SetOption(Thaliz_OPTION_ResurrectionWhisperMessage, Thaliz_GetOption(Thaliz_OPTION_ResurrectionWhisperMessage, Thaliz_Resurrection_Whisper_Message_Default))


	if Thaliz_GetOption(Thaliz_OPTION_ResurrectionMessageTargetChannel) == "RAID" then
		ThalizFrameCheckbuttonRaid:SetChecked(1)
	end
	if Thaliz_GetOption(Thaliz_OPTION_ResurrectionMessageTargetChannel) == "SAY" then
		ThalizFrameCheckbuttonSay:SetChecked(1)
	end
	if Thaliz_GetOption(Thaliz_OPTION_ResurrectionMessageTargetChannel) == "YELL" then
		ThalizFrameCheckbuttonYell:SetChecked(1)
	end
	if Thaliz_GetOption(Thaliz_OPTION_ResurrectionMessageTargetWhisper) == 1 then
		ThalizFrameCheckbuttonWhisper:SetChecked(1)
	end
	if Thaliz_GetRootOption(Thaliz_ROOT_OPTION_CharacterBasedSettings) == "Character" then
		ThalizFrameCheckbuttonPerCharacter:SetChecked(1)
	end    
	
	Thaliz_ValidateResurrectionMessages();
end

function Thaliz_ValidateResurrectionMessages()
	local macros = Thaliz_GetResurrectionMessages();
	local changed = False;
	
	for n=1, table.getn( macros ), 1 do
		local macro = macros[n];
		
		if type(macro) == "table" then
			-- Macro is fine; do nothing
		elseif type(macro) == "string" then
			-- <v1.4 macro: convert to 1.4:
			macros[n] = { macro, EMOTE_GROUP_DEFAULT, "" }
			changed = True;
		else
			-- Macro is ... hmmm beyond repair?; reset it:
			macros[n] = { "", EMOTE_GROUP_DEFAULT, "" }
			changed = True;
		end
	end;

	if changed then	
		Thaliz_SetResurrectionMessages(macros);	
	end;
end;

function Thaliz_GetUnitID(playername)
	local groupsize, grouptype;
		
	if Thaliz_IsInRaid() then
		groupsize = GetNumRaidMembers();
		grouptype = "raid";	
	elseif Thaliz_IsInParty() then
		groupsize = GetNumPartyMembers();
		grouptype = "party";
	else
		return nil;
	end

	for n=1, groupsize, 1 do
		unitid = grouptype..n
		if UnitName(unitid) == playername then
			return unitid;
		end
	end

	return nil;
end

--[[
	Convert a msg so first letter is uppercase, and rest as lower case.
]]
function Thaliz_UCFirst(msg)
	if not msg then
		return ""
	end	

	local f = string.sub(msg, 1, 1)
	local r = string.sub(msg, 2)
	return string.upper(f) .. string.lower(r)
end


--  *******************************************************
--
--	Resurrect message functions
--
--  *******************************************************
function Thaliz_AnnounceResurrection(playername, unitid)
	if not Thaliz_Enabled then
		return;
	end

	--echo("Announcing resurrection on "..playername);
	if not unitid then
		unitid = Thaliz_GetUnitID(playername);			
		
		if not unitid then
			return;
		end
	end
	
	
	local guildname = GetGuildInfo(unitid);
	local race = string.upper(UnitRace(unitid));
	local class = string.upper(UnitClass(unitid));
	local charname = string.upper(playername);

	if guildname then
		guildname = string.upper(guildname);
	else
		-- Note: guildname is unfortunately not detected for released corpses.
		guildname = "";
	end;	

	--echo(string.format("Ressing: player=%s, unitid=%s", playername, unitid));
	--echo(string.format("Guild=%s, class=%s, race=%s", guildname, class, race));

	-- This is a list of ALL messages.
	-- Now identify the macros suitable for this player only:
	local dmacro = { }		-- Default macros
	local gmacro = { }		-- Guild macros
	local nmacro = { }		-- character Name macros
	local cmacro = { }		-- Class macros
	local rmacro = { }		-- Race macros
	
	local didx = 0;
	local gidx = 0;
	local nidx = 0;
	local cidx = 0;
	local ridx = 0;
	
	local macros = Thaliz_GetResurrectionMessages();
	for n=1, table.getn( macros ), 1 do
		local macro = macros[n];
		local param = "";
		if macro[3] then
			param = string.upper(macro[3]);
		end
		
		if macro[2] == EMOTE_GROUP_DEFAULT then
			didx = didx + 1;
			dmacro[ didx ] = macro;
		elseif macro[2] == EMOTE_GROUP_GUILD then
			if param == guildname then
				gidx = gidx + 1;
				gmacro[ gidx ] = macro;
			end
		elseif macro[2] == EMOTE_GROUP_CHARACTER then
			if param == charname then
				nidx = nidx + 1;
				nmacro[ nidx ] = macro;
			end
		elseif macro[2] == EMOTE_GROUP_CLASS then
			if param == class then
				cidx = cidx + 1;
				cmacro[ cidx ] = macro;
			end
		elseif macro[2] == EMOTE_GROUP_RACE then
			if param == race then
				ridx = ridx + 1;
				rmacro[ ridx ] = macro;
			end
		end;		
	end
	
	-- Now generate list, using the found criterias above:
	local macros = { }
	local index = 0;
	for n=1, table.getn( gmacro ), 1 do
		index = index + 1;
		macros[index] = gmacro[n];
	end
	for n=1, table.getn( nmacro ), 1 do
		index = index + 1;
		macros[index] = nmacro[n];
	end
	for n=1, table.getn( cmacro ), 1 do
		index = index + 1;
		macros[index] = cmacro[n];
	end
	for n=1, table.getn( rmacro ), 1 do
		index = index + 1;
		macros[index] = rmacro[n];
	end;
	

	-- Include the default macro list if
	-- * No macros matching group rules, or
	-- * The "Include Default" option is selected.
	if table.getn(macros) == 0 or 
		Thaliz_GetOption(Thaliz_OPTION_AlwaysIncludeDefaultGroup) == 1 then
		for n=1, table.getn( dmacro ), 1 do
			index = index + 1;
			macros[index] = dmacro[n];
		end;
	end;

	
	local validMessages = {}
	local validCount = 0;
	for n=1, table.getn( macros ), 1 do
		local msg = macros[n][1];
		if msg and not (msg == "") then
			validCount = validCount + 1;
			validMessages[ validCount ] = msg;
		end
	end
	
	-- Fallback message if none are configured
	if validCount == 0 then
		validMessages[1] = "复活 %s";
		validCount = 1;
	end
	
	local message = string.format( validMessages[ random(validCount) ], playername );
	
	if Thaliz_GetOption(Thaliz_OPTION_ResurrectionMessageTargetChannel) == "RAID" then
		partyEcho(message);
	elseif Thaliz_GetOption(Thaliz_OPTION_ResurrectionMessageTargetChannel) == "SAY" then
		SendChatMessage(message, SAY_CHANNEL)
	elseif Thaliz_GetOption(Thaliz_OPTION_ResurrectionMessageTargetChannel) == "YELL" then
		SendChatMessage(message, YELL_CHANNEL)
	end
	
	if Thaliz_GetOption(Thaliz_OPTION_ResurrectionMessageTargetWhisper) == 1 then
		local whisperMsg = Thaliz_GetOption(Thaliz_OPTION_ResurrectionWhisperMessage);
		if whisperMsg and not(whisperMsg == "") then
			SendChatMessage(whisperMsg, "WHISPER", nil, playername);
		end;
	end
end

function Thaliz_GetResurrectionMessages()
	local messages = Thaliz_GetOption(Thaliz_OPTION_ResurrectionMessages, nil);

	if (not messages) or not(type(messages) == "table") or (table.getn(messages) == 0) then
		messages = Thaliz_ResetResurrectionMessages(); 
	end

	-- Check if messages contains tables; this is to keep backwards compatibility with 1.3:
	if not type(messages[1]) == "table" then
		echo('转换表将从 v1.3 转换到 v1.4 ...');
		for key, value in messages do
			messages[key] = { messages[key], EMOTE_GROUP_DEFAULT, "" }
		end
		Thaliz_SetResurrectionMessages(messages);
	end;
	
	return messages;
end

function Thaliz_RenumberTable(sourcetable)
	local index = 1;
	local temptable = { };
	
	for key, value in next, sourcetable do
		temptable[index] = value;
		index = index + 1
	end
	return temptable;
end

function Thaliz_SetResurrectionMessages(resurrectionMessages)
	Thaliz_SetOption(Thaliz_OPTION_ResurrectionMessages, Thaliz_RenumberTable(resurrectionMessages));
end

function Thaliz_ResetResurrectionMessages()
	Thaliz_SetResurrectionMessages( Thaliz_DefaultResurrectionMessages );
	
	return Thaliz_DefaultResurrectionMessages;
end

function Thaliz_AddResurrectionMessage(message, group, param)
	if message and not (message == "") then
		group = Thaliz_CheckGroup(group);
		param = Thaliz_CheckGroupValue(param);

		--echo(string.format("Adding Res.Msg: msg=%s, grp=%s, val=%s", message, group, param));

		local resMsgs = Thaliz_GetResurrectionMessages();		
		resMsgs[ table.getn(resMsgs) + 1] = { message, group, param }
		
		Thaliz_SetResurrectionMessages(resMsgs);
	end
end

function Thaliz_CheckMessage(msg)
	if not msg or msg == "" then
		msg = THALIZ_EMPTY_MESSAGE;
	end
	return msg;
end

function Thaliz_CheckGroup(group)
	if not group or group == "" then
		group = EMOTE_GROUP_DEFAULT;
	end
	return group;
end

function Thaliz_CheckGroupValue(param)
	if not param then
		param = "";
	end
	return param;
end

function Thaliz_UpdateResurrectionMessage(index, offset, message, group, param)
	group = Thaliz_CheckGroup(group);
	param = Thaliz_CheckGroupValue(param);
	--echo(string.format("Updating message, Index=%d, offset=%d, msg=%s, grp=%s, val=%s", index, offset, message, group, param));

	local messages = Thaliz_GetResurrectionMessages();
	messages[index + offset] = { message, group, param }
	
	Thaliz_SetResurrectionMessages( messages );

	--	Update the frame UI:
	local frame = getglobal("ThalizFrameTableListEntry"..index);
	if not message or message == "" then
		message = THALIZ_EMPTY_MESSAGE;
	end
	getglobal(frame:GetName().."Message"):SetText(message);
	getglobal(frame:GetName().."Param"):SetText(param);
end



--  *******************************************************
--
--	Ressing functions
--
--  *******************************************************

--[[
	Scan the party / raid for dead people, and prioritize those.
	Ignore blacklisted people.
	Only do this if the current player is a resser!
]]
function Thaliz_StartResurrectionOnPriorityTarget()
	-- Check by spell: no need to update death list if player cannot resurrect!
	local classinfo = Thaliz_GetClassinfo(UnitClass("player"));
	local targetname;
	local spellname = classinfo[3];
	if not spellname then
		return;
	end
		
	local groupsize, grouptype;
	if Thaliz_IsInRaid() then
		groupsize = GetNumRaidMembers();
		grouptype = "raid";	
	elseif Thaliz_IsInParty() then
		groupsize = GetNumPartyMembers();
		grouptype = "party";
	else
		-- SOLO mode: Just cast a "normal" ress
		targetname = UnitName("playertarget");
		if targetname then	
			CastSpellByName(spellname);	
			if SpellIsTargeting() then
				-- Out of range
				SpellStopTargeting();
			end
		end
		return;
	end
	
	local warlocksAlive = false;
	for n=1, groupsize, 1 do
		unitid = grouptype..n
		if not UnitIsDead(unitid) and UnitIsConnected(unitid) and UnitIsVisible(unitid) and UnitClass(unitid) == "术士" then
			warlocksAlive = true;
			break;
		end
	end
	
	Thaliz_CleanupBlacklistedPlayers();

	local targetprio;
		
	local corpseTable = {};
	local playername, unitid, classinfo;
	for n=1, groupsize, 1 do
		unitid = grouptype..n
		playername = UnitName(unitid)
		
		local isBlacklisted = false;
		for b=1, table.getn(blacklistedTable), 1 do
			blacklistInfo = blacklistedTable[b];
			blacklistTick = blacklistInfo[2];					
			if blacklistInfo[1] == playername then
				isBlacklisted = true;
				break;
			end
		end
		
		targetname = UnitName("playertarget");
		if not isBlacklisted and UnitIsDead(unitid) and UnitIsConnected(unitid) and UnitIsVisible(unitid) then
			classinfo = Thaliz_GetClassinfo(UnitClass(unitid));
			targetprio = classinfo[2];
			if targetname and targetname == playername then
				targetprio = PriorityToCurrentTarget;
			end
			if IsRaidLeader(playername) and targetprio < PriorityToGroupLeader then
				targetprio = PriorityToGroupLeader;
			end
			if not warlocksAlive and classinfo[1] == "术士" then
				targetprio = PriorityToFirstWarlock;				
			end
			
			-- Add a random decimal factor to priority to spread ressings out.
			-- Random is a float between 0 and 1:
			targetprio = targetprio + random();		
			--echo(string.format("%s added, priority=%f", playername, targetprio));			
			corpseTable[ table.getn(corpseTable) + 1 ] = { unitid, targetprio } ;
		end
	end	

	if (table.getn(corpseTable) == 0) then
		if (table.getn(blacklistedTable) == 0) then
			Thaliz_Echo("没有人可以复活.");
		else
			Thaliz_Echo("所有目标都收到了一个复活法术.");
		end
		return;
	end

	-- Sort the corpses with highest priority in top:
	Thaliz_SortTableDescending(corpseTable, 2);

	-- Start casting the spell:	
	CastSpellByName(spellname);
	local unitid = Thaliz_ChooseCorpse(corpseTable);	
	if unitid then
		playername = UnitName(unitid)
		
		SpellTargetUnit(unitid);
		if not SpellIsTargeting() then
			Thaliz_BlacklistPlayer(playername);
			Thaliz_AnnounceResurrection(playername, unitid);
			Thaliz_SendAddonMessage("TX_RESBEGIN#"..playername.."#");
		else
			SpellStopTargeting();
		end
	else
		SpellStopTargeting();
		--Not in range. UI already write that, we dont need to also!
	end
end

function Thaliz_ChooseCorpse(corpseTable)
	local currentTarget = UnitName("playertarget");

	for key, val in corpseTable do	
		if SpellCanTargetUnit(val[1]) then
			return val[1];
		end
		-- spellCanTarget does not work if we already target the unit:		
		if UnitName(val[1]) == currentTarget then
			return val[1];
		end;		
	end
	return nil;
end

function Thaliz_GetClassinfo(classname)
	for key, val in classInfo do
		if val[1] == classname then
			return val;
		end
	end
	return nil;
end



--  *******************************************************
--
--	Blacklisting functions
--
--  *******************************************************
function Thaliz_BlacklistPlayer(playername)
	if not Thaliz_IsPlayerBlacklisted(playername) then
		--echo("Blacklisting "..playername);
		blacklistedTable[ table.getn(blacklistedTable) + 1 ] = { playername, Thaliz_GetTimerTick() + Thaliz_Blacklist_Timeout };
	end
end

--[[
	Remove player from Blacklist (if any)
]]
function Thaliz_WhitelistPlayer(playername)
	local WhitelistTable = {}
	--echo("Whitelisting "..playername);

	for n=1, table.getn(blacklistedTable), 1 do
		blacklistInfo = blacklistedTable[n];
		if not (playername == blacklistInfo[1]) then
			WhitelistTable[ table.getn(WhitelistTable) + 1 ] = blacklistInfo;
		end
	end
	blacklistedTable = WhitelistTable;
end


function Thaliz_IsPlayerBlacklisted(playername)
	Thaliz_CleanupBlacklistedPlayers();

	for n=1, table.getn(blacklistedTable), 1 do		 
		if blacklistedTable[n][1] == playername then
			return true;
		end
	end
	return false;
end


function Thaliz_CleanupBlacklistedPlayers()
	local BlacklistedTableNew = {}
	local blacklistInfo;	
	local timerTick = Thaliz_GetTimerTick();
	
	for n=1, table.getn(blacklistedTable), 1 do
		blacklistInfo = blacklistedTable[n];
		if timerTick < blacklistInfo[2] then
			BlacklistedTableNew[ table.getn(BlacklistedTableNew) + 1 ] = blacklistInfo;
		end
	end
	blacklistedTable = BlacklistedTableNew;
end



--  *******************************************************
--
--	Helper functions
--
--  *******************************************************
function Thaliz_IsInParty()
	if not Thaliz_IsInRaid() then
		return ( GetNumPartyMembers() > 0 );
	end
	return false
end


function Thaliz_IsInRaid()
	return ( GetNumRaidMembers() > 0 );
end


function Thaliz_SortTableDescending(sourcetable, index)
	local doSort = true
	while doSort do
		doSort = false
		for n=1,table.getn(sourcetable) - 1,1 do
			local a = sourcetable[n]
			local b = sourcetable[n + 1]
			if tonumber(a[index]) and tonumber(b[index]) and tonumber(a[index]) < tonumber(b[index]) then
				sourcetable[n] = b
				sourcetable[n + 1] = a
				doSort = true
			end
		end
	end
end



--  *******************************************************
--
--	Version functions
--
--  *******************************************************

--[[
	Broadcast my version if this is not a beta (CurrentVersion > 0) and
	my version has not been identified as being too low (MessageShown = false)
]]
function Thaliz_OnRaidRosterUpdate(event, arg1, arg2, arg3, arg4, arg5)
	if THALIZ_CURRENT_VERSION > 0 and not THALIZ_UPDATE_MESSAGE_SHOWN then
		if Thaliz_IsInRaid() or Thaliz_IsInParty() then
			local versionstring = GetAddOnMetadata("Thaliz", "Version");
			Thaliz_SendAddonMessage(string.format("TX_VERCHECK#%s#", versionstring));
		end
	end
end

function Thaliz_CalculateVersion(versionString)
	local _, _, major, minor, patch = string.find(versionString, "([^\.]*)\.([^\.]*)\.([^\.]*)");
	local version = 0;

	if (tonumber(major) and tonumber(minor) and tonumber(patch)) then
		version = major * 100 + minor;
		--echo(string.format("major=%s, minor=%s, patch=%s, version=%d", major, minor, patch, version));
	end
	
	return version;
end

function Thalix_CheckIsNewVersion(versionstring)
	local incomingVersion = Thaliz_CalculateVersion( versionstring );

	if (THALIZ_CURRENT_VERSION > 0 and incomingVersion > 0) then
		if incomingVersion > THALIZ_CURRENT_VERSION then
			if not THALIZ_UPDATE_MESSAGE_SHOWN then
				THALIZ_UPDATE_MESSAGE_SHOWN = true;
				Thaliz_Echo(string.format("备注: 较新版本 ".. COLOUR_INTRO .."THALIZ"..COLOUR_CHAT.."可用! (版本 %s)!", versionstring));
				Thaliz_Echo("备注: 请到 https://60addons.com/下载最新版本.");
			end
		end	
	end
end


--  *******************************************************
--
--	Timer functions
--
--  *******************************************************
local Timers = {}
local TimerTick = 0

function Thaliz_OnTimer(elapsed)
	TimerTick = TimerTick + elapsed

	for n=1,table.getn(Timers),1 do
		local timer = Timers[n]
		if TimerTick > timer[2] then
			Timers[n] = nil
			timer[1]()
		end
	end
end

function Thaliz_GetTimerTick()
	return TimerTick;
end





--  *******************************************************
--
--	Internal Communication Functions
--
--  *******************************************************

function Thaliz_SendAddonMessage(message)
	local channel = nil
	
	if Thaliz_IsInRaid() then
		channel = "RAID";
	elseif Thaliz_IsInParty() then
		channel = "PARTY";
	else
		return;
	end

	SendAddonMessage(THALIZ_PREFIX, message, channel);
end



--[[
	Respond to a TX_VERSION command.
	Input:
		msg is the raw message
		sender is the name of the message sender.
	We should whisper this guy back with our current version number.
	We therefore generate a response back (RX) in raid with the syntax:
	Thaliz:<sender (which is actually the receiver!)>:<version number>
]]
local function HandleTXVersion(message, sender)
	local response = GetAddOnMetadata("Thaliz", "Version")	
	Thaliz_SendAddonMessage("RX_VERSION#"..response.."#"..sender)
end

local function HandleTXResBegin(message, sender)
	-- Blacklist target unless ress was initated by me
	if not (sender == UnitName("player")) then
		Thaliz_BlacklistPlayer(message);
	end
end

--[[
	A version response (RX) was received. The version information is displayed locally.
]]
local function HandleRXVersion(message, sender)
	Thaliz_Echo(string.format("%s 正在使用 Thaliz 版本 %s", sender, message))
end

local function HandleTXVerCheck(message, sender)
--	echo(string.format("HandleTXVerCheck: msg=%s, sender=%s", message, sender));
	Thalix_CheckIsNewVersion(message);
end

function Thaliz_OnChatMsgAddon(event, prefix, msg, channel, sender)
	if prefix == THALIZ_PREFIX then
		Thaliz_HandleThalizMessage(msg, sender);	
	end
	if prefix == CTRA_PREFIX then
		Thaliz_HandleCTRAMessage(msg, sender);
	end
end

function Thaliz_HandleThalizMessage(msg, sender)
--	echo(sender.." --> "..msg);
	local _, _, cmd, message, recipient = string.find(msg, "([^#]*)#([^#]*)#([^#]*)");	
	
	--	Ignore message if it is not for me. 
	--	Receipient can be blank, which means it is for everyone.
	if not (recipient == "") then
		if not (recipient == UnitName("player")) then
			return
		end
	end

	if cmd == "TX_VERSION" then
		HandleTXVersion(message, sender)
	elseif cmd == "RX_VERSION" then
		HandleRXVersion(message, sender)
	elseif cmd == "TX_RESBEGIN" then
		HandleTXResBegin(message, sender)
	elseif cmd == "TX_VERCHECK" then
		HandleTXVerCheck(message, sender)
	end
end

function Thaliz_HandleCTRAMessage(msg, sender)	
	-- "RESSED" is received when a res LANDS on the target.
	-- Add the target to the blacklist, so we don't ress him again
	if msg == "RESSED" then
		Thaliz_BlacklistPlayer(sender);
		return;
	end
	
	-- "RES <name>" is received when a manual res is CASTED
	-- Add to blacklist.
	local _, _, ctra_command, ctra_player = string.find(msg, "(%S*) (%S*)");
	if ctra_command and ctra_player then
		if ctra_command == "RES" then
			-- If sender is from ME, it is ME doing a manual (ressing a released 
			-- corpse) ress. Announce the ressurection!
			if sender == UnitName("player") then
				-- Check if player is online; for this we need the unit id!
				local unitid = Thaliz_GetUnitID(ctra_player);
				if unitid then
					if UnitIsConnected(unitid) then
						-- If unit is blacklisted we should NOT display the ress. message.
						-- Unfortunately we cannot cancel the spell cast.
						if Thaliz_IsPlayerBlacklisted(ctra_player) then
							Thaliz_Echo(string.format("备注: 有人已经得到 %s!", ctra_player));
							return;
						else
							Thaliz_AnnounceResurrection(ctra_player);
						end
					else
						Thaliz_Echo(string.format("备注: %s 他离线了!", ctra_player));
					end
				end				
			end
			
			Thaliz_BlacklistPlayer(ctra_player);
			return;
		end
	end

	-- Other ress events received:
	-- "RESNO" is received when a res is cancelled/interrupted.
	-- Do nothing.
	-- Question: should we remove from blacklist in that case?
	-- The cancellation could happen for two reasons (possibly more)
	--	- Target is out of LOS for one resser (but maybe not for me!)
	--	- Res was cancelled by movement or combat.
	--		In this case we SHOULD remove from blacklist, but if in combat we cant ress anyway.
	--	The problem here is we do not know WHO we were attempting to ress!!
	--	We only have the SENDER name which is the name of the RESSER!
	
	-- "NORESSED" is received when res timeout OR res is accepted!
	-- Do nothing (the blacklist expires soon anyway)
end



--  *******************************************************
--
--	Event handlers
--
--  *******************************************************

function Thaliz_OnEvent(event)
	if (event == "ADDON_LOADED") then
		if arg1 == "Thaliz" then
		    Thaliz_InitializeConfigSettings();
		end		
	elseif (event == "CHAT_MSG_ADDON") then
		Thaliz_OnChatMsgAddon(event, arg1, arg2, arg3, arg4, arg5)
	elseif (event == "RAID_ROSTER_UPDATE") then
		Thaliz_OnRaidRosterUpdate()
	end
end

function Thaliz_OnLoad()
	msgEditorIsOpen = false;
	THALIZ_CURRENT_VERSION = Thaliz_CalculateVersion( GetAddOnMetadata("Thaliz", "Version") );

	Thaliz_Echo(string.format("版本 %s ,汉化由 %s", GetAddOnMetadata("Thaliz", "Version"), GetAddOnMetadata("Thaliz", "Author")));
    this:RegisterEvent("ADDON_LOADED");
    this:RegisterEvent("CHAT_MSG_ADDON");   
    this:RegisterEvent("RAID_ROSTER_UPDATE")
        
    Thaliz_InitializeListElements();
end

function Thaliz_OKButton_OnClick()
	ThalizMsgEditorFrame:Hide();
	ThalizFrame:Hide();
	msgEditorIsOpen = false;
	
	local whisperMsg = getglobal("ThalizFrameWhisper"):GetText(whisperMsg);
	Thaliz_SetOption(Thaliz_OPTION_ResurrectionWhisperMessage, whisperMsg);
	
	Thaliz_ConfigurationLevel = Thaliz_GetRootOption(Thaliz_ROOT_OPTION_CharacterBasedSettings, Thaliz_Configuration_Default_Level);
end

function Thaliz_CloseButton_OnClick()
	if msgEditorIsOpen then
		Thaliz_CloseMsgEditorButton_OnClick();
	else
		ThalizMsgEditorFrame:Hide();
		ThalizFrame:Hide();
	end;
end

function Thaliz_CloseMsgEditorButton_OnClick()
	ThalizMsgEditorFrame:Hide();
	msgEditorIsOpen = false;
end

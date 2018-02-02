--------------------------------------------------------------------------
--
--	帕奇维克陪你玩Advanced
--	SHPatchwerk Version v0.04
--
--	by Fionee(Yuee) | <白银之手> @ 轻风之语
--
--	简介：
--
--	本插件修改自帕奇维克陪你玩（ZPatchwerk）
--	增加了图形设置界面。可以更简单的设置插件。
--	
--	命令行：
--	/shpw 				打开设置窗口
--	/shpw cast		相当于点击按钮的效果
--	
--	更新：
--	v0.04	-	2006年9月3日 测试完成
--	v0.04 - 2006年9月1日 公会内部测试版
--	
--------------------------------------------------------------------------


--保存变量
SHPatchwerk_Options = { };

--局部变量
local default = {
			Tankname = {
				[1] = "Alukard",
				[2] = "Fionee",
				[3] = "Orpheus",
				[4] = "战妇",
				[5] = "明镜止水",
				[6] = "熾骑士",
				[7] = "羽飞",
			},
			CheckSetting = {
				{name = "Show",value = 1},
				{name = "Qian",value = 1},
				{name = "Sound",value = 1},
			},
			Class = nil,
			Userank = nil,
			Maxrank = nil,
			Target = 1,
			Enable = 1,
			Debug = 0,
};

local Server,Player
local CanCastSpell = false
local SpellInfo = {
	PRIEST = {
		spellname = SHPATCHWERK_PRIESTSKILLNAME,
		maxrank = 5,
	},
	
	PALADIN = {
		spellname = SHPATCHWERK_PALADINSKILLNAME,
		maxrank = 9,
	},
	
	SHAMAN = {
		spellname = SHPATCHWERK_SHAMANSKILLNAME,
		maxrank = 10,
	},

	DRUID = {
		spellname = SHPATCHWERK_DRUIDSKILLNAME,
		maxrank = 10,
	},

}

local PWEvents = {
	"CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE",
	"CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE",
	"CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE",
}


--施法目标下拉菜单
function SHPWTankName_onShow()
	UIDropDownMenu_Initialize(SHPatchwerkTankNameDropDown, SHPWTankName_Initialize);
	UIDropDownMenu_SetSelectedID(SHPatchwerkTankNameDropDown, SHPatchwerk_Options[Server][Player].Target);
end

function SHPWTankName_Initialize()
	local info;
	for i = 1, getn(SHPatchwerk_Options[Server][Player].Tankname), 1 do
		info = { };
		info.text = SHPatchwerk_Options[Server][Player].Tankname[i];
		info.func = SHPWTankName_onClick;
		UIDropDownMenu_AddButton(info);
	end
end

function SHPWTankName_onClick()
	UIDropDownMenu_SetSelectedID(SHPatchwerkTankNameDropDown, this:GetID());
	SHPatchwerk_Options[Server][Player].Target = this:GetID()
end


--添加当前目标按钮
function SHPWSetTarget()
	if (UnitName("target") == nil) then
		SHPWMsg(SHPATCHWERK_NOTARGET);
	elseif (UnitName("target") == UnitName("player")) then
		SHPWMsg(SHPATCHWERK_TARGETSELF);
	elseif (UnitIsPlayer("target") and UnitIsFriend("target","player")) then
		local UnitNameTemp = UnitName("target")
		for i = 1, getn(SHPatchwerk_Options[Server][Player].Tankname), 1 do
			if (UnitNameTemp == SHPatchwerk_Options[Server][Player].Tankname[i]) then
				UIDropDownMenu_SetSelectedID(SHPatchwerkTankNameDropDown, i);
				SHPWMsg(SHPATCHWERK_EXISTTARGET);
				return;
			end
		end
		
    tinsert(SHPatchwerk_Options[Server][Player].Tankname,UnitNameTemp)
		sort(SHPatchwerk_Options[Server][Player].Tankname)
		for i = 1, getn(SHPatchwerk_Options[Server][Player].Tankname), 1 do
			if (UnitNameTemp == SHPatchwerk_Options[Server][Player].Tankname[i]) then
				UIDropDownMenu_Initialize(SHPatchwerkTankNameDropDown, SHPWTankName_Initialize);
				UIDropDownMenu_SetSelectedID(SHPatchwerkTankNameDropDown, i);
				SHPWMsg(UnitNameTemp..SHPATCHWERK_SETTARGETOK);
				return;
			end
		end
	else
		SHPWMsg(SHPATCHWERK_ERRORTARGET);	
	end
end

--删除目标按钮
function SHPWDelTarget()
	local totalID = getn(SHPatchwerk_Options[Server][Player].Tankname);
	if (not (totalID == 1)) then
		local currentID = UIDropDownMenu_GetSelectedID(SHPatchwerkTankNameDropDown);
		local UnitNameTemp = SHPatchwerk_Options[Server][Player].Tankname[currentID]

		tremove(SHPatchwerk_Options[Server][Player].Tankname,currentID);
		sort(SHPatchwerk_Options[Server][Player].Tankname);

		UIDropDownMenu_Initialize(SHPatchwerkTankNameDropDown, SHPWTankName_Initialize);

		if (currentID == totalID) then
			UIDropDownMenu_SetSelectedID(SHPatchwerkTankNameDropDown, totalID-1);
		else
			UIDropDownMenu_SetSelectedID(SHPatchwerkTankNameDropDown, currentID);
		end

		SHPWMsg(UnitNameTemp..SHPATCHWERK_DELTARGETOK);
	else
		SHPWMsg(SHPATCHWERK_LASTTANKNAME);
	end
end


--法术等级滚动条
function SHPWSpellRankSet_OnShow()
	local PlayerClass = SHPatchwerk_Options[Server][Player].Class
	
	if (PlayerClass) then
		local SpellName = SpellInfo[SHPatchwerk_Options[Server][Player].Class].spellname
		local Maxrank = SpellInfo[SHPatchwerk_Options[Server][Player].Class].maxrank
		local realMaxrank = SHPatchwerk_Options[Server][Player].Maxrank
		local realUserank = SHPatchwerk_Options[Server][Player].Userank

		if ( realMaxrank == 0 ) then
			SHPatchwerkOptionsFrameSlider1Text:SetText(SHPATCHWERK_PLAYERNOSPELL);
			return;
		elseif (not (Maxrank == realMaxrank)) then
			SHPatchwerk_SpellRankTest();
			realMaxrank = SHPatchwerk_Options[Server][Player].Maxrank;
		end
	
		SHPatchwerkOptionsFrameSlider1:SetMinMaxValues(1,realMaxrank);
	
		if (not (realUserank and (realUserank >= 1) and (realUserank <= realMaxrank))) then
			realUserank = realMaxrank;
		end
	
		SHPatchwerkOptionsFrameSlider1:SetValue(realUserank);
		SHPatchwerk_Options[Server][Player].Userank = realUserank;
		SHPatchwerkOptionsFrameSlider1Text:SetText(SpellName.."("..SHPATCHWERK_RANK.." "..realUserank..")");

	else
		SHPatchwerkOptionsFrameSlider1Text:SetText(SHPATCHWERK_PLAYERCLASSERROR);
	end
end

--法术等级滚动条（值变化）
function SHPWSpellRankSet_OnValueChanged()
	local PlayerClass = SHPatchwerk_Options[Server][Player].Class
	
	if (PlayerClass) then
		local SpellName = SpellInfo[SHPatchwerk_Options[Server][Player].Class].spellname
		local Maxrank = SpellInfo[SHPatchwerk_Options[Server][Player].Class].maxrank
		local realMaxrank = SHPatchwerk_Options[Server][Player].Maxrank
		local realUserank = SHPatchwerkOptionsFrameSlider1:GetValue()
		
		if ( realMaxrank == 0) then
			SHPatchwerkOptionsFrameSlider1Text:SetText(SHPATCHWERK_PLAYERNOSPELL);
			return;
		elseif (not (Maxrank == realMaxrank)) then
			SHPatchwerk_SpellRankTest();
			realMaxrank = SHPatchwerk_Options[Server][Player].Maxrank;
		end
	
		SHPatchwerkOptionsFrameSlider1:SetMinMaxValues(1,realMaxrank);
	
		if (not (realUserank and (realUserank >= 1) and (realUserank <= realMaxrank))) then
			realUserank = realMaxrank;
		end
	
		SHPatchwerk_Options[Server][Player].Userank = realUserank;
		SHPatchwerkOptionsFrameSlider1Text:SetText(SpellName.."("..SHPATCHWERK_RANK.." "..realUserank..")");

	else
		SHPatchwerkOptionsFrameSlider1Text:SetText(SHPATCHWERK_PLAYERCLASSERROR);
	end
end


--点击单选框
function SHPWCheckButton_Click()
	local checkid = this:GetID();
	if (SHPatchwerk_Options[Server][Player].CheckSetting[checkid].value == 1) then
		SHPatchwerk_Options[Server][Player].CheckSetting[checkid].value = 0
	else
		SHPatchwerk_Options[Server][Player].CheckSetting[checkid].value = 1
	end
	SHPatchwerk_ButtonShow();
end


--根据设置施法
function SHPWCastSpell()
	local PlayerClass = SHPatchwerk_Options[Server][Player].Class
	
	if (PlayerClass) then
		local SpellName = SpellInfo[SHPatchwerk_Options[Server][Player].Class].spellname
		local Maxrank = SpellInfo[SHPatchwerk_Options[Server][Player].Class].maxrank
		local realMaxrank = SHPatchwerk_Options[Server][Player].Maxrank
		local realUserank = SHPatchwerk_Options[Server][Player].Userank
		local TankName = SHPatchwerk_Options[Server][Player].Tankname[UIDropDownMenu_GetSelectedID(SHPatchwerkTankNameDropDown)]
		
		if (not SpellName) then
			SHPWMsg(SHPATCHWERK_TESTCASTFAIL1);
			return;
		end

		if (not realMaxrank) then
			SHPWMsg(SHPATCHWERK_TESTCASTFAIL2);
			return;
		end
		
		if (not realUserank) then
			SHPWMsg(SHPATCHWERK_TESTCASTFAIL3);
			return;
		end
		
		if (not TankName) then
			SHPWMsg(SHPATCHWERK_TESTCASTFAIL4);
			return;
		end
		
		TargetByName(TankName);
		if (UnitName("target") == TankName) then
			CastSpellByName(SpellName.."("..SHPATCHWERK_RANK.." "..realUserank..")");
			return;
		else
			SHPWMsg(SHPATCHWERK_TESTCASTFAIL6);
			return;	
		end

	else
		SHPWMsg(SHPATCHWERK_TESTCASTFAIL1);
	end
end





--按钮事件触发
function SHPatchwerk_OnEvent(event)
	if (SHPatchwerk_Options[Server][Player].Class) then
		local SpellName = SpellInfo[SHPatchwerk_Options[Server][Player].Class].spellname.."("..SHPATCHWERK_RANK.." "..SHPatchwerk_Options[Server][Player].Userank..")"
		local TankName = SHPatchwerk_Options[Server][Player].Tankname[UIDropDownMenu_GetSelectedID(SHPatchwerkTankNameDropDown)]
	
		for a1,a2,a3,a4,a5 in string.gfind(arg1, SHPATCHWERK_STRING) do
			if (string.find (SHPATCHWERK_BOSSNAME, a1)) and (string.find (SHPATCHWERK_BOSSSKILL, a2)) and (string.find (TankName, a3)) then
				SHPatchwerkActButton:SetText(SpellName .. ' >> ' .. TankName);
				if (SHPatchwerk_Options[Server][Player].CheckSetting[3].value == 1) then
					PlaySoundFile("Sound\\Doodad\\BellTollAlliance.wav");
				end
				SHPatchwerkActButtonLeft:SetTexture('Interface\\AddOns\\SHPatchwerk\\UI-Panel-Button-Up-Green');
				SHPatchwerkActButtonRight:SetTexture('Interface\\AddOns\\SHPatchwerk\\UI-Panel-Button-Up-Green');
				SHPatchwerkActButtonMiddle:SetTexture('Interface\\AddOns\\SHPatchwerk\\UI-Panel-Button-Up-Green');
				CanCastSpell = true;
			end
		end
	end
end

--点击“帕奇维克陪你玩”按钮时
function SHPatchwerk_Click(btn)
	if (btn == "LeftButton") then
		if (CanCastSpell) then
			SHPatchwerkActButtonLeft:SetTexture('Interface\\Buttons\\UI-Panel-Button-Up');
			SHPatchwerkActButtonRight:SetTexture('Interface\\Buttons\\UI-Panel-Button-Up');
			SHPatchwerkActButtonMiddle:SetTexture('Interface\\Buttons\\UI-Panel-Button-Up');
			CanCastSpell = false;
			SHPatchwerkActButton:SetText(SHPATCHWERK_TITLE);
			SHPWCastSpell();
		else
			if (SHPatchwerk_Options[Server][Player].CheckSetting[2].value == 1) then
				SHPWMsg(SHPATCHWERK_CANNOTDOIT);
			end
		end
	end
end

--“帕奇维克陪你玩”按钮显示
function SHPatchwerk_ButtonShow()
		local ButtonShow = SHPatchwerk_Options[Server][Player].CheckSetting[1].value
		if (ButtonShow == 1) then
			SHPatchwerkActButton:Show();
		else
			SHPatchwerkActButton:Hide();
		end
end

--读取时载入
function SHPatchwerk_OnLoad()
    SLASH_SHPatchwerk1 = "/shpw";
    SlashCmdList["SHPatchwerk"] = SHPatchwerk_SlashCmd;

    Player = UnitName("player");
    Server = GetCVar("realmName");
    
    if(not SHPatchwerk_Options[Server]) then SHPatchwerk_Options[Server]={} end
    
    if(not SHPatchwerk_Options[Server][Player]) then
			SHPatchwerk_Options[Server][Player] = {};
			SHPatchwerk_Reset();
		end
		
		SHPatchwerk_FrameSet();

		SHPatchwerk_ButtonShow();
		
		SHPWMsg(SHPATCHWERK_TITLE.." "..SHPATCHWERK_VERSION)
		SHPWMsg(SHPATCHWERK_HELP)		
end

--命令行设置
function SHPatchwerk_SlashCmd(arg1)
	if(arg1) then
		arg1 = strlower(arg1);
	end
	
	if (arg1 == "") then
		if (SHPatchwerkOptionsFrame:IsVisible()) then
			SHPatchwerkOptionsFrame:Hide();
		else
			SHPatchwerk_FrameSet();
			SHPatchwerkOptionsFrame:Show();
		end
	elseif (arg1 == "reset") then
		SHPWMsg(SHPATCHWERK_RESETSETTING)
		SHPatchwerk_Reset();
	elseif (arg1 == "cast") then
		SHPatchwerk_Click('LeftButton');
	else
		SHPWMsg(SHPATCHWERK_TITLE.." "..SHPATCHWERK_VERSION)
		SHPWMsg(SHPATCHWERK_HELP)
	end
end



--设置界面初始化
function SHPatchwerk_FrameSet()
	--if ((SHPatchwerk_Options[Server][Player].Class == nil ) or (SHPatchwerk_Options[Server][Player].Maxrank == nil )) then
	--	SHPatchwerk_SetClass();
	--end

	SHPWTankName_onShow();
	SHPWSpellRankSet_OnShow();
	
	for i = 1 , 3 , 1 do
		(getglobal("SHPatchwerkOptionsFrameCheckButton"..i)):SetChecked(SHPatchwerk_Options[Server][Player].CheckSetting[i].value);
	end
end

--重置设置
function SHPatchwerk_Reset(arg1)
	SHPatchwerk_Options[Server][Player] = default;
	SHPatchwerk_SetClass();
	SHPatchwerk_FrameSet();
end


--设定职业
function SHPatchwerk_SetClass(arg1)
	local _, PlayerClass = UnitClass("player");
	if (PlayerClass == "PRIEST") then
		SHPatchwerk_Options[Server][Player].Class = "PRIEST";
	elseif (PlayerClass == "DRUID") then
		SHPatchwerk_Options[Server][Player].Class = "DRUID";
	elseif (PlayerClass == "PALADIN") then
		SHPatchwerk_Options[Server][Player].Class = "PALADIN";
	elseif (PlayerClass == "SHAMAN") then
		SHPatchwerk_Options[Server][Player].Class = "SHAMAN";
	else
		SHPatchwerk_Options[Server][Player].Class = nil;
	end
	SHPatchwerk_SpellRankTest();
end

--确认最高级技能
function SHPatchwerk_SpellRankTest()
	if (SHPatchwerk_Options[Server][Player].Class) then
		local i = 1
		local PlayerSpellName = SpellInfo[SHPatchwerk_Options[Server][Player].Class].spellname
		local ranktemp = 0
		
		while true do
		   local spellName, spellRank = GetSpellName(i, BOOKTYPE_SPELL)
		   if not spellName then
		      do break end
		   end
		   
		   if (spellName == PlayerSpellName) then
		   		for a1 in string.gfind(spellRank, SHPATCHWERK_RANK.." (%d+)") do
		   			a1 = tonumber(a1)
			   		if ( a1 > ranktemp ) then
			   			ranktemp = a1
			   		end
			   	end
		   end
	
		   i = i + 1
		end
		SHPatchwerk_Options[Server][Player].Maxrank = ranktemp;
	end
end

--消息发送
function SHPWMsg(msg)
    if (DEFAULT_CHAT_FRAME and msg) then
        DEFAULT_CHAT_FRAME:AddMessage(SHPATCHWERK_MESSAGET..msg, 1, 0.82, 0.34, 0.0);
    end 
end

--注册事件
function SHPatchwerk_Register()
    for index, value in PWEvents do
        SHPatchwerkActButton:RegisterEvent(value);
    end 
end

function SHPatchwerk_Unregister()
    for index, value in PWEvents do
        SHPatchwerkActButton:UnregisterEvent(value);
    end
end
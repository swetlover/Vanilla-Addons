--[[
	MoveAnything! vJ.11000.2
	Based on MA! 1.12 by Skrag
	汉化 BY FablesNever (Fables Never Die 公会会长)
	Read the ReadMe
]]
local function Error( msg )
	Print( msg, 1.0, 0.2, 0.2 );
end

function Print(msg, r, g, b, frame)
	if (not r) then r = 1.0; end
	if (not g) then g = 1.0; end
	if (not b) then b = 1.0; end
	if ( frame ) then
		frame:AddMessage(msg,r,g,b);
	else
		if ( DEFAULT_CHAT_FRAME ) then
			DEFAULT_CHAT_FRAME:AddMessage(msg, r, g, b);
		end
	end
end

function table.find( table, value )
	for i, v in table do
		if( v == value ) then
			return i;
		end
	end
	return nil;
end

------------------------------------------------

BINDING_HEADER_MOVEANYTHING = "MoveAnything!";
MA_LEFTARROW = "<";
MA_RIGHTARROW = ">";
CurrentMover = 1;

StaticPopupDialogs["MOVEANYTHING_RESET_CONFIRM"] = {
	text = "重置所有的界面？",
	button1 = TEXT(YES),
	button2 = TEXT(NO),
	OnAccept = function()
		MoveAnythingOptions_ResetAll();
	end,
	timeout = 0,
	exclusive = 1,
	showAlert = 1
};

MOVEANYTHING_MOVEATONETIME = 20;
MOVEANYTHING_SCROLL_HEIGHT = 25;

function MoveAnything_ToggleVisibilityOnFrame(frame)
	if ( not frame ) then return; end

	local opt = MoveAnything_FindFrameOptions(frame:GetName(),"ShowFrame");
	
	if( opt and opt.hidden == true ) then
	
		MoveAnything_ShowFrame(frame)
	else
		MoveAnything_HideFrame(frame)
	
	end

end

function TestPos( frame, x, y )
	frame:ClearAllPoints();
	if( frame.HiddenSetPoint ) then
		frame:HiddenSetPoint( "BOTTOMLEFT", frame:GetParent():GetName(), "BOTTOMLEFT", x, y );
	else
		frame:SetPoint( "BOTTOMLEFT", frame:GetParent():GetName(), "BOTTOMLEFT", x, y );
	end
end

function TestInfo()
	Print( "PlayerFrame "..PlayerFrame:GetLeft()..", "..PlayerFrame:GetBottom().." ("..PlayerFrame:GetScale()..")" );
	Print( "PetFrame "..PetFrame:GetLeft()..", "..PetFrame:GetBottom().." ("..PetFrame:GetScale()..")" );
end

function ListFrameOptions()
	local count = 0;
	for i, v in MoveAnything_FrameOptions do
		count = count + 1;
	end
	Print( count.." frame options" );
	for i, v in MoveAnything_FrameOptions do
		Print( "FrameOptions: "..v.name );
	end
end

function ListCustomFrames()
	Print( table.getn( MoveAnything_CustomFrames ).." custom frames" );
	for i, v in MoveAnything_CustomFrames do
		Print( v.name );
	end
end

function MADebOpt( frameName )
	for i, v in MoveAnything_FrameOptions[ frameName ] do
		Print( frameName.."."..i.." = "..tostring(v) );
	end
end

function MADeb()
	ListCustomFrames();
	ListFrameOptions();
end

function MALocate()
	if( not MALocator:IsVisible() ) then
		MALocator:Show();
	end
end

function MoveAnythingUpdater_OnUpdate(arg1)
	if MoveAnythingUpdater:GetScale() == UIParent:GetScale() then
		MoveAnythingUpdater:SetScale(0.2)
		MoveAnything_RefreshPositions()
	end
end

MoveAnything_Frames = {};
MoveAnything_CustomFrames = {};
MoveAnything_CharacterSettings = {};
MoveAnything_UseCharacterSettings = false;
MoveAnything_InitRun = false;
MoveAnything_FrameOptions = nil;

MoveAnything_NoScale = { TooltipMover = true, FramerateMover = true };
MoveAnything_ScaleWH = { MainMenuExpBar = true };
MoveAnything_DetachFromParent = { MainMenuBarPerformanceBarFrame = true };
MoveAnything_NoHide = { MAOptions = true };
MoveAnything_HideList = {};
MoveAnything_HideList["MainMenuBar"] = {
	{ "MainMenuBarArtFrame", "BACKGROUND","ARTWORK"},
	{ "PetActionBarFrame", "OVERLAY"},
	{ "ShapeshiftBarFrame", "OVERLAY"},
	{ "MainMenuBar", "DISABLEMOUSE"},
	{ "BonusActionBarFrame", "OVERLAY", "DISABLEMOUSE"},
};
MoveAnything_HideList["MainMenuExpBar"] = {
	{ "MainMenuExpBar", "WH", "BORDER", "OVERLAY"},
	{ "ExhaustionTick", "FRAME"},
	{ "MainMenuExpBar", function( show )
							if( show ) then
								MoveAnything_AllowExternalVisibility( MainMenuExpBar.TextString );
							else
								MoveAnything_PreventExternalVisibility( MainMenuExpBar.TextString );
							end
						end},
};

MoveAnything_HideUsingWH = { MainMenuExpBar = true };

MoveAnything_MoveOnlyWhenVisible = {};
MoveAnything_MoveOnlyWhenVisible["GroupLootFrame1"] = true;
MoveAnything_MoveOnlyWhenVisible["GroupLootFrame2"] = true;
MoveAnything_MoveOnlyWhenVisible["GroupLootFrame3"] = true;
MoveAnything_MoveOnlyWhenVisible["GroupLootFrame4"] = true;

MoveAnything_DefaultFrameList = {

	{ "MAOptions", "选项窗口(由Fablesnever完全汉化)" },

	{ "Separator", "**** 标准方形框架 ****" },
	{ "PlayerFrame", "人物头像" },
	{ "TargetFrame", "目标" },
	{ "PartyMemberFrame1", "队友 1" },
	{ "PartyMemberFrame2", "队友 2" },
	{ "PartyMemberFrame3", "队友 3" },
	{ "PartyMemberFrame4", "队友 4" },

	{ "Separator", "**** 宠物窗口 ****" },
	{ "PetFrame", "自己的宠物" },
	{ "PartyMemberFrame1PetFrame", "队友1宠物" },
	{ "PartyMemberFrame2PetFrame", "队友2宠物" },
	{ "PartyMemberFrame3PetFrame", "队友3宠物" },
	{ "PartyMemberFrame4PetFrame", "队友4宠物" },

	{ "Separator", "**** 背包 ****" },
	{ "BagFrame1", "默认背包" },
	{ "BagFrame2", "背包1" },
	{ "BagFrame3", "背包2" },
	{ "BagFrame4", "背包3" },
	{ "BagFrame5", "背包4" },

	{ "Separator", "**** 银行 ****" },
	{ "BankFrame", "默认银行窗口" },
	{ "BankBagFrame1", "银行背包1" },
	{ "BankBagFrame2", "银行背包2" },
	{ "BankBagFrame3", "银行背包3" },
	{ "BankBagFrame4", "银行背包4" },
	{ "BankBagFrame5", "银行背包5" },
	{ "BankBagFrame6", "银行背包6" },

	{ "Separator", "**** 动作条 ****" },
	{ "MainMenuBar", "底部所有栏目" },
	{ "MainMenuBarArtFrame", "不要移动我,会报错" },
	{ "MainMenuBarMaxLevelBar", "声望条" },
	{ "MainMenuExpBar", "经验条" },
	{ "MainMenuBarPerformanceBarFrame", "延迟条" },

	{ "Separator", "**** 动作按钮 ****" },
	{ "BasicActionButtonsMover", "底部所有动作按钮" },
	{ "BasicActionButtonsVerticalMover", "底部动作按钮（垂直）" },
	{ "PetActionButtonsMover", "宠物动作按钮" },
	{ "PetActionButtonsVerticalMover", "宠物动作按钮（垂直）" },
	{ "ShapeshiftButtonsMover", "站姿/光环/变身按钮" },
	{ "ShapeshiftButtonsVerticalMover", "站姿/光环/变身按钮（垂直）" },

	{ "Separator", "**** 背包按钮以及人物角色按钮 ****" },
	{ "BagButtonsMover", "背包按钮" },
	{ "BagButtonsVerticalMover", "背包按钮 (垂直)" },
	{ "MicroButtonsMover", "人物/任务等按钮" },
	{ "MicroButtonsVerticalMover", "人物/任务等按钮(垂直)" },

	{ "Separator", "**** 额外动作条 ****" },
	{ "MultiBarBottomLeft", "底部左边动作条" },
	{ "MultiBarBottomRight", "底部右边动作条" },
	{ "MultiBarRight", "右边动作条1" },
	{ "MultiBarLeft", "右边动作条2" },

	{ "Separator", "**** 小地图框架 ****" },
	{ "MinimapCluster", "小地图" },
	{ "MinimapZoneTextButton", "小地图名字" },
	{ "MinimapZoomIn", "小地图放大" },
	{ "MinimapZoomOut", "小地图缩小" },
	{ "MiniMapMailFrame", "邮件图标" },
	{ "MiniMapTrackingFrame", "小地图寻找目标(草/矿)" },
	{ "MiniMapMeetingStoneFrame", "小地图集合石" },
	{ "MiniMapBattlefieldFrame", "小地图上的战场" },
	{ "GameTimeFrame", "小地图迷你时钟" },

	{ "Separator", "**** 战场相关 ****" },
	{ "WorldStateAlwaysUpFrame", "旗帜框架"},
	{ "AlwaysUpFrame1", "联盟旗帜"},
	{ "AlwaysUpFrame2", "部落旗帜"},

	{ "Separator", "**** roll点框架(点击无效) ****" },
	{ "GroupLootFrame1", "roll点窗口1(亲测无效)" },
	{ "GroupLootFrame2", "roll点窗口2(亲测无效)" },
	{ "GroupLootFrame3", "roll点窗口3(亲测无效)" },
	{ "GroupLootFrame4", "roll点窗口4(亲测无效)" },

	{ "Separator", "**** 杂项图层选项 ****" },
	{ "StaticPopup1", "弹出窗口(复活/退出游戏)" },
	{ "UIErrorsFrame", "插件错误窗口" },
	{ "CastingBarFrame", "施法条" },
	{ "BuffFrame", "Buff窗口" },
	{ "TemporaryEnchantFrame", "增益buff/debuff框架" },
	{ "TooltipMover", "鼠标提示窗" },
	{ "FramerateMover", "帧数" },
	{ "DurabilityFrame", "耐久警告窗口" },
	{ "QuestWatchFrame", "任务追踪" },
	{ "QuestTimerFrame", "任务计时器" },
	{ "ComboFrame", "盗贼的连击点计数器" },
	{ "MirrorTimer1", "呼吸/疲劳状态条" },

	{ "Separator", "**** 通用信息面板 ****" },
	{ "UIPanelMover1", "信息面板 1" },
	{ "UIPanelMover2", "信息面板 2" },

	{ "Separator", "**** 特别信息面板 ****" },
	{ "CharacterFrame", "角色/宠物/声望/击杀" },
	{ "TradeSkillFrame", "交易" },
	{ "InspectFrame", "检查框架" },
	{ "SpellBookFrame", "法术书" },
	{ "LootFrame", "掠夺窗口" },
	{ "TaxiFrame", "飞行路径" },
	{ "QuestLogFrame", "任务记录" },
	{ "MerchantFrame", "商人" },
	{ "TradeFrame", "交易窗口" },
	{ "FriendsFrame", "好友窗口" },
	{ "MacroFrame", "宏" },
	{ "MailFrame", "邮箱" },
	{ "TalentFrame", "天赋树" },
	{ "PetStableFrame", "宠物忠诚度" },
	{ "AuctionFrame", "拍卖行" },
}

function MoveAnything_AddPredefinedFrames( frameList )
	for i, val in frameList do
		if( val[1] ) then
			if( val[1] == "Separator" ) then
				MoveAnything_AddSeparator( val[2], true );
			else
				MoveAnything_AddFrameToMovableList( val[1], val[2], true );
			end
		end
	end
end

function MoveAnything_AddDefaultFrames()
	MoveAnything_AddPredefinedFrames( MoveAnything_DefaultFrameList );
	MoveAnything_AddPredefinedFrames( MoveAnything_PredefinedCustomFrameList );
end

function MoveAnything_ScaleAllowed( frameName )
	if( MoveAnything_NoScale[ frameName ] or MoveAnything_ScaleWH[ frameName ] ) then
		return false;
	end
	return true;
end

function MAGetParent( frame )
	if ( not frame or not frame.GetParent ) then return; end
	if( frame:GetParent() == nil ) then
		return UIParent;
	end

	return frame:GetParent();
end

function MAGetScale( frame, effective )
	if( frame:GetScale() == nil ) then
		return 1;
	end

	if ( effective ) then
		return frame:GetEffectiveScale();
	else
		return frame:GetScale();
	end
end

function MoveAnything_RefreshPositions()
	if( not MoveAnything_InitRun ) then
		return;
	end

	local frame, parent;
	for i, opt in MoveAnything_FrameOptions do
		frame = getglobal( opt.name );
		if( frame ) then
			if( opt.movable or opt.hidden ) then
				MoveAnything_HookFrame( opt.name );
			end
			if( opt.movable ) then
				if( MoveAnything_DetachFromParent[ opt.name ] ) then
					parent = UIParent;
				else
					parent = MAGetParent( frame );
				end
				frame:HiddenClearAllPoints();
				frame:HiddenSetPoint( "BOTTOMLEFT", parent:GetName(), "BOTTOMLEFT", opt.x, opt.y );
				if( opt.scale ) then
					frame:HiddenSetScale( opt.scale );
					if( frame.attachedChildren ) then
						for i, v in frame.attachedChildren do
							v:HiddenSetScale( opt.scale );
						end
					end
				end
			end
			if( opt.hidden ) then
				MoveAnything_HideFrame( frame );
			end
		end
	end
end

function MoveAnything_CurrentSettingsName()
	local settingname = "default";

	if( MoveAnything_UseCharacterSettings ) then
		settingname = GetCVar( "realmName" ).." "..UnitName( "player" );
	end

	return settingname;
end

function MoveAnything_CopySettings( fromName, toName )
	if( MoveAnything_CharacterSettings[toName] == nil ) then
		MoveAnything_CharacterSettings[toName] = {};
	end
	for i, val in MoveAnything_CharacterSettings[fromName] do
		MoveAnything_CharacterSettings[toName][i] = val;
	end
	MoveAnything_FrameOptions = MoveAnything_CharacterSettings[MoveAnything_CurrentSettingsName()];
	MoveAnything_RefreshPositions();
end

function MoveAnything_Init()
	if( MoveAnything_InitRun ) then
		return;
	end

	MoveAnything_AddDefaultFrames();

	-- update settings from old versions
	if( MoveAnything_FrameOptions ~= nil ) then
		MoveAnything_CharacterSettings["default"] = MoveAnything_FrameOptions;
		MoveAnything_FrameOptions = nil;
	end

	local settingname = MoveAnything_CurrentSettingsName();

	if( MoveAnything_CharacterSettings[settingname] == nil ) then
		MoveAnything_CharacterSettings[settingname] = {};
	end
	MoveAnything_FrameOptions = MoveAnything_CharacterSettings[settingname];

	-- now add all the custom frames
	for i, v in MoveAnything_CustomFrames do
		if( not MoveAnything_FindFrame( v.name ) ) then
			-- pass true for isDefault, so it doesn't get re-added to the custom list
			MoveAnything_AddFrameToMovableList( v.name, v.helpfulname, true );
		end
	end

	MoveAnything_InitRun = true;

	MoveAnything_RefreshPositions();
end

function MoveAnything_GetFrameCount()
	return table.getn( MoveAnything_Frames );
end

function MoveAnything_ClearFrameOptions( frameName )
	MoveAnything_FrameOptions[frameName] = nil;
	MoveAnything_RemoveIfCustom( frameName );
end

function MoveAnything_FindFrameOptions( frameName, why )
	if( MoveAnything_FrameOptions == nil ) then
		return;
	end
	return MoveAnything_FrameOptions[frameName];
end

function MoveAnything_FindFrame( frameName )
	for i in MoveAnything_Frames do
		if( MoveAnything_Frames[i].name == frameName ) then
			return MoveAnything_Frames[i];
		end
	end
	return nil;
end

function MoveAnything_RemoveIfCustom( frameName )
	local removed = false;
	for i,v in MoveAnything_CustomFrames do
		if( v.name == frameName ) then
			table.remove( MoveAnything_CustomFrames, i );
			removed = true;
			break;
		end
	end
	if( removed ) then
		for i,v in MoveAnything_Frames do
			if( v.name == frameName ) then
				table.remove( MoveAnything_Frames, i );
				break;
			end
		end
	end
end

function MoveAnything_PreventExternalVisibility( frame )
	frame.MAWantsToBeVisible = frame:IsVisible();
	frame:Hide();
	frame.HiddenShow = frame.Show;
	frame.HiddenHide = frame.Hide;
	frame.HiddenIsVisible = frame.IsVisible;
	frame.Show = MoveAnything_HiddenShow;
	frame.Hide = MoveAnything_HiddenHide;
	frame.IsVisible = MoveAnything_HiddenIsVisible;
	if( frame.attachedChildren ) then
		for i, val in frame.attachedChildren do
			MoveAnything_PreventExternalVisibility( val );
		end
	end
end

function MoveAnything_AllowExternalVisibility( frame )
	frame.Show = frame.HiddenShow;
	frame.Hide = frame.HiddenHide;
	frame.IsVisible = frame.HiddenIsVisible;
	frame.HiddenShow = nil;
	frame.HiddenHide = nil;
	frame.HiddenIsVisible = nil;
	if( frame.MAWantsToBeVisible ) then
		frame.MAWantsToBeVisible = nil
		frame:Show();
	end
	if( frame.attachedChildren ) then
		for i, val in frame.attachedChildren do
			MoveAnything_AllowExternalVisibility( val );
		end
	end
end

function MoveAnything_PreventExternalMovement( frame )
	if( frame.HiddenSetPoint == nil ) then
		frame.HiddenSetPoint = frame.SetPoint;
		frame.SetPoint = function() end;
	end
	if( frame.HiddenSetAllPoints == nil ) then
		frame.HiddenSetAllPoints = frame.SetAllPoints;
		frame.SetAllPoints = function() end;
	end
	if( frame.HiddenClearAllPoints == nil ) then
		frame.HiddenClearAllPoints = frame.ClearAllPoints;
		frame.ClearAllPoints = function() end;
	end
	if( frame.HiddenSetScale == nil ) then
		frame.HiddenSetScale = frame.SetScale;
		frame.SetScale = function() end;
	end
	if( frame.attachedChildren ) then
		for i, val in frame.attachedChildren do
			MoveAnything_PreventExternalMovement( val );
		end
	end
end

function MoveAnything_AllowExternalMovement( frame )
	if( frame.HiddenSetPoint ) then
		frame.SetPoint = frame.HiddenSetPoint;
		frame.HiddenSetPoint = nil;
	end
	if( frame.HiddenSetAllPoints ) then
		frame.SetAllPoints = frame.HiddenSetAllPoints;
		frame.HiddenSetAllPoints = nil;
	end
	if( frame.HiddenClearAllPoints ) then
		frame.ClearAllPoints = frame.HiddenClearAllPoints;
		frame.HiddenClearAllPoints = nil;
	end
	if( frame.HiddenSetScale ) then
		frame.SetScale = frame.HiddenSetScale;
		frame.HiddenSetScale = nil;
	end
	if( frame.attachedChildren ) then
		for i, val in frame.attachedChildren do
			MoveAnything_AllowExternalMovement( val );
		end
	end
end

function MoveAnything_HookFrame( frameName )
	local frame = getglobal( frameName );

	if( not MoveAnything_IsFrameHooked( frameName ) ) then
		local opt = MoveAnything_FindFrameOptions( frameName, "HookFrame" );
		if( opt == nil ) then
			MoveAnything_FrameOptions[frameName] = {};
			opt = MoveAnything_FrameOptions[frameName];
			opt.movable = false;
			opt.hidden = false;
		end
		opt.name = frameName;
		opt.originalLeft, opt.originalBottom = MoveAnything_GetRelativeBottomLeft( frame );
		if( MoveAnything_ScaleWH[ frameName ] ) then
			opt.originalWidth = frame:GetWidth();
			opt.originalHeight = frame:GetHeight();
			opt.originalScale = nil;
		else
			opt.originalWidth = nil;
			opt.originalHeight = nil;
			opt.originalScale = MAGetScale( frame );
		end

	end
	if( UIPanelWindows[frame:GetName()] ) then
		local left = GetLeftFrame();
		local center = GetCenterFrame();

		if( frame == left ) then
			UIParent.left = nil;
			if( center ) then
				MovePanelToLeft();
			end
		elseif( frame == center and left ) then
			UIParent.center = nil;
		end
		local opt = MoveAnything_FindFrameOptions( frameName, "Hook UIPanel" );
		if( opt ) then
			opt.UIPanelWindows = UIPanelWindows[frame:GetName()];
		end
		UIPanelWindows[frame:GetName()] = nil;
	end
	if( frame.OnMoveAnythingHook ) then
		frame.OnMoveAnythingHook( frame );
	end
	MoveAnything_PreventExternalMovement( frame );
end

function MoveAnything_IsFrameHooked( frameName )
	if( frameName == nil ) then return; end
	local opt = MoveAnything_FindFrameOptions( frameName, "IsFrameHooked "..frameName );
	if( opt ) then
		if( opt.movable or opt.hidden ) then
			return true;
		end
	end
	return false;
end

function MoveAnything_IsFrameHidden( frameName )
	if( frameName == nil ) then return; end
	local opt = MoveAnything_FindFrameOptions( frameName, "IsFrameHooked "..frameName );
	if( opt ) then
		if( opt.hidden ) then
			return true;
		end
	end
	return false;
end

function MoveAnything_AddFrameToMovableList( frameName, helpfulName, isDefault )
	if( not MoveAnything_FindFrame( frameName ) ) then
		local frame = getglobal( frameName );
		local listOptions = {};
		listOptions.name = frameName;
		listOptions.helpfulName = helpfulName;
		if( listOptions.helpfulName == nil ) then
			listOptions.helpfulName = listOptions.name;
		end
		table.insert( MoveAnything_Frames, listOptions );
		-- if this is not a built-in default frame, we also need to add it to CustomFrames
		if( not isDefault ) then
			table.insert( MoveAnything_CustomFrames, listOptions );
		end
		if( MAOptions:IsVisible() ) then
			MoveAnythingOptions_Update();
		end
	end
end

function MoveAnything_AddSeparator( separatorText, isDefault )
	local listOptions = {};
	listOptions.name = nil;
	listOptions.helpfulName = separatorText;
	table.insert( MoveAnything_Frames, listOptions );
	-- if this is not a built-in default frame, we also need to add it to CustomFrames
	if( not isDefault ) then
		table.insert( MoveAnything_CustomFrames, listOptions );
	end
	if( MAOptions:IsVisible() ) then
		MoveAnythingOptions_Update();
	end
end

function MoveAnything_SizingAnchor( button )
	local s, e = string.find( button:GetName(), "Resize_" )
	local anchorto = string.sub( this:GetName(), e + 1 );
	local anchor;

	if( anchorto == "LEFT" ) then anchor = "RIGHT";
	elseif( anchorto == "RIGHT" ) then anchor = "LEFT";
	elseif( anchorto == "TOP" ) then anchor = "BOTTOM";
	elseif( anchorto == "BOTTOM" ) then anchor = "TOP";
	end

	return anchorto, anchor;
end

function MoveAnything_Move( moveFrameName, helpfulName )
	if( MoveAnything_MoveOnlyWhenVisible[ moveFrameName ] ) then
		local frame = getglobal( moveFrameName );
		if( frame == nil or not frame:IsVisible() ) then
			Error( "That window may only be moved when it is visible" );
			return;
		end
	end

	if( not MoveAnything_FindMAFrame( moveFrameName ) ) then
		local frame = MoveAnything_FindAvailableFrame();
		if( frame == nil ) then
			Error( "You can only move "..MOVEANYTHING_MOVEATONETIME.." frames at once." );
		elseif( getglobal( moveFrameName ) == nil ) then
			Error( "\""..moveFrameName.."\" is not a valid frame name." );
		else
			local moveFrame = getglobal( moveFrameName );
			MoveAnything_AddFrameToMovableList( moveFrameName, helpfulName );
			MoveAnything_HookFrame( moveFrameName );
			MoveAnything_Attach( frame, getglobal( moveFrameName ) );
			if( moveFrame.OnMoveAnythingPostAttach ) then
				moveFrame.OnMoveAnythingPostAttach( moveFrame );
			end
			if( MAOptions:IsVisible() ) then
				MoveAnythingOptions_Update();
			end
		end
	end
end

function MA_Mover(dir)
	if ( dir > 0 ) then
		if ( CurrentMover < 20 ) then
			CurrentMover = CurrentMover + 1;
		else
			return;
		end
	else
		if ( CurrentMover > 1 ) then
			CurrentMover = CurrentMover - 1;
		else
			return;
		end
	end
	MA_NudgerFrameRefresh();
end

function MA_GetFirstMover()
	for i = 1, 20 do
		if ( getglobal("MoveAnything"..i):IsVisible() ) then
			return i;
		end
	end
end

function MoveAnythingOptions_OnHide()
	MA_MoverOnHide();
end

function MA_MoverOnShow()
	ResizingNudger:Show();
	CurrentMover = tonumber(this:GetID());
	MA_NudgerFrameRefresh();
end

function MA_MoverOnHide()
	if ( MA_GetFirstMover() ) then
		CurrentMover = MA_GetFirstMover();
		MA_NudgerFrameRefresh();
	elseif ( MAOptions:IsVisible() ) then
		CurrentMover = 1;
		MA_NudgerFrameRefresh(1);
	else
		ResizingNudger:Hide();
	end
end

function MA_NudgerOnShow()
	MA_NudgerFrameRefresh();
end

function MA_NudgerFrameRefresh(reset)
	if ( CurrentMover < 20 ) then
		ResizingNudger_MoverPlus:Enable();
	else
		ResizingNudger_MoverPlus:Disable();
	end
	if ( CurrentMover > 1 ) then
		ResizingNudger_MoverMinus:Enable();
	else
		ResizingNudger_MoverMinus:Disable();
	end

	local labelText = "MA "..CurrentMover.."/20";
	if ( not reset and getglobal("MoveAnything"..CurrentMover).tagged ) then
		labelText = labelText.."\n"..getglobal("MoveAnything"..CurrentMover).tagged:GetName();
	end
	ResizingNudgerTitle:SetText(labelText);
end

function MA_NudgerOnUpdate()
	-- This code is ripped from DiscordART :)
	local obj = GetMouseFocus();
	local text = "MouseOver: ";
	local label = ResizingNudgerMouseOver;

	if (obj and obj ~= WorldFrame and obj:GetName()) then
		text = text..obj:GetName();
		if (obj:GetParent()  and obj:GetParent() ~= WorldFrame and obj:GetParent():GetName() ) then
			text = text.."\nParent: "..obj:GetParent():GetName();
			if (obj:GetParent():GetParent() and obj:GetParent():GetParent() ~= WorldFrame and obj:GetParent():GetParent():GetName()) then
				text = text.."\nParent's Parent: "..obj:GetParent():GetParent():GetName();
			end
		end
	end

	if ( not string.find(text, "ResizingNudger") ) then
		label:SetText(text);
	else
		label:SetText("MouseOver: ");
	end
end

function MoveAnything_MoveFrameUnderCursor()
	local obj = GetMouseFocus();
	if (obj and obj ~= WorldFrame and obj ~= UIParent and obj:GetName()) then
		MoveAnything_ToggleMove( obj:GetName() );
	end
end

function MA_Center(lock)
	local mover = getglobal("MoveAnything"..CurrentMover);
	if ( lock == 0 ) then
		-- Both
		mover:ClearAllPoints();
		mover:SetPoint("CENTER",0,0);
	else
		local x, y;
		x = mover:GetLeft();
		y = mover:GetBottom();

		mover:ClearAllPoints();
		if ( lock == 1 ) then
			--Horizontal
			mover:SetPoint("CENTER",0,0);
			x = mover:GetLeft();
			mover:ClearAllPoints();
			mover:SetPoint("BOTTOMLEFT",x,y);
		elseif ( lock == 2 ) then
			-- Vertical
			mover:SetPoint("CENTER",0,0);
			y = mover:GetBottom();
			mover:ClearAllPoints();
			mover:SetPoint("BOTTOMLEFT",x,y);
		end
	end

	MoveAnything_UpdatePosition(mover);
end

function MA_Nudge(dir, button)
	local x, y, offsetX, offsetY, parent, mover, offsetAmount;
	mover = getglobal("MoveAnything"..CurrentMover);

	if ( not mover:IsVisible() ) then
		return;
	end

	x = mover:GetLeft();
	y = mover:GetBottom();

	if ( button == "RightButton" ) then
		if ( IsShiftKeyDown() ) then
			offsetAmount = 250;
		else
			offsetAmount = 50;
		end
	else
		if ( IsShiftKeyDown() ) then
			offsetAmount = 10;
		else
			offsetAmount = 1;
		end
	end

	if ( dir == 1 ) then
		offsetX = 0;
		offsetY = offsetAmount;
	elseif ( dir == 2 ) then
		offsetX = 0;
		offsetY = -offsetAmount;
	elseif ( dir == 3 ) then
		offsetX = -offsetAmount;
		offsetY = 0;
	elseif ( dir == 4 ) then
		offsetX = offsetAmount;
		offsetY = 0;
	end

	mover:ClearAllPoints();
	mover:SetPoint("BOTTOMLEFT","UIParent","BOTTOMLEFT",x + offsetX, y + offsetY);
	MoveAnything_UpdatePosition(mover);
end

function MoveAnything_UpdatePosition( moveFrame )
	local x, y, parent;
	x = nil;
	y = nil;
	parent = nil;
	if( moveFrame.tagged ) then
		if( MoveAnything_DetachFromParent[ moveFrame.tagged:GetName() ] ) then
			x = moveFrame.tagged:GetLeft();
			y = moveFrame.tagged:GetBottom();
			parent = UIParent;
		else
			x, y = MoveAnything_GetRelativeBottomLeft( moveFrame.tagged );
			parent = MAGetParent( moveFrame.tagged );
		end
		local opt = MoveAnything_FindFrameOptions( moveFrame.tagged:GetName(), "UpdatePosition" );
		opt.x = x;
		opt.y = y;
	end
	return x, y, parent;
end

function MoveAnything_StopMoving( moveFrameName )
	local frame = MoveAnything_FindMAFrame( moveFrameName );
	if( frame ) then
		MoveAnything_Detach( frame );
		if( MAOptions:IsVisible() ) then
			MoveAnythingOptions_Update();
		end
	end
end

function MoveAnything_ToggleMove( moveFrameName )
	if( MoveAnything_FindMAFrame( moveFrameName ) ) then
		MoveAnything_StopMoving( moveFrameName );
	else
		MoveAnything_Move( moveFrameName );
	end
end

function MoveAnything_FindMAFrame( moveFrameName )
	local frame;
	for i = 1, MOVEANYTHING_MOVEATONETIME, 1 do
		frame = getglobal( "MoveAnything"..i );
		if( type(frame) ~= "nil" and frame:IsVisible() and frame.tagged == getglobal( moveFrameName ) ) then
			return frame;
		end
	end
	return nil;
end

function MoveAnything_FindAvailableFrame()
	local frame;
	for i = 1, MOVEANYTHING_MOVEATONETIME, 1 do
		frame = getglobal( "MoveAnything"..i );
		if( not( frame:IsVisible() ) ) then
			return frame;
		end
	end
	return nil;
end

function MoveAnything_OnSizeChanged( this )
	if( this.tagged ) then
		local s, w, h, opt;

		opt = MoveAnything_FindFrameOptions( this.tagged:GetName(), "OnSizeChanged" );

		if( MoveAnything_ScaleWH[ this.tagged:GetName() ] ) then
			this.tagged:SetHeight( this:GetHeight() );
			this.tagged:SetWidth( this:GetWidth() );
			-- if this ever needs to apply to a frame with attached children,
			-- we're going to have to figure out what to do, since setting
			-- the W and H directly is definitely incorrect

			if( opt ) then
				opt.width = this:GetHeight();
				opt.height = this:GetHeight();
			end
		else
			if( this.MASizingAnchor == "LEFT" or this.MASizingAnchor == "RIGHT" ) then
				w = this:GetWidth();
				h = w * (this.tagged:GetHeight() / this.tagged:GetWidth());
				if( h < 16 ) then
					h = 16;
					w = h * (this.tagged:GetWidth() / this.tagged:GetHeight());
				end
			else
				h = this:GetHeight();
				w = h * (this.tagged:GetWidth() / this.tagged:GetHeight());
				if( w < 16 ) then
					w = 16;
					h = w * (this.tagged:GetHeight() / this.tagged:GetWidth());
				end
			end
			s = this:GetWidth() / this.tagged:GetWidth();
			s = s / MAGetScale( this.tagged:GetParent(), 1  ) * UIParent:GetScale();

			if( MoveAnything_ScaleAllowed( this.tagged:GetName() ) ) then
				if( opt ) then
					opt.scale = s;
				end

				this.tagged:HiddenSetScale( s );
				if( this.tagged.attachedChildren ) then
					for i, v in this.tagged.attachedChildren do
						v:HiddenSetScale( s );
					end
				end
			end
			this:SetWidth( w );
			this:SetHeight( h );
		end
	end
end

function MoveAnything_GetParentScaleRatio( frame )
	return MAGetScale( frame, 1 );
end

--[[
function MoveAnything_GetRelativeBottomLeft( tagFrame )
	x = tagFrame:GetLeft();
	if( x ) then
		x = x - MAGetParent( tagFrame ):GetLeft() * MAGetScale( tagFrame );
	end
	y = tagFrame:GetBottom();
	if( y ) then
		y = y - MAGetParent( tagFrame ):GetBottom() * MAGetScale( tagFrame );
	end
	return x,y;
end
]]

function MoveAnything_GetRelativeBottomLeft( tagFrame )
	x = tagFrame:GetLeft();
	if( x ) then
		x = x - MAGetParent( tagFrame ):GetLeft() * MAGetScale( MAGetParent( tagFrame ) ) / MAGetScale( tagFrame );
	end
	y = tagFrame:GetBottom();
	if( y ) then
		y = y - MAGetParent( tagFrame ):GetBottom() * MAGetScale( MAGetParent( tagFrame ) ) / MAGetScale( tagFrame );
	end
	return x,y;
end

function MoveAnything_Attach( moveFrame, tagFrame )
	if( moveFrame.tagged ) then
		MoveAnything_Detach( moveFrame );
	end

	local listOptions = MoveAnything_FindFrame( tagFrame:GetName() );
	local frameOptions = MoveAnything_FindFrameOptions( tagFrame:GetName(), "Attach" );
	frameOptions.movable = true;
	moveFrame.helpfulName = listOptions.helpfulName;

	if( tagFrame.OnBeginMove ) then
		if( not tagFrame:OnBeginMove() ) then
			MoveAnything_Detach( moveFrame );
			return;
		end
	end

	local x, y;
	if( tagFrame:GetLeft() == nil ) then tagFrame:Show(); tagFrame:Hide(); end
	x = tagFrame:GetLeft() * MAGetScale( tagFrame, 1 ) / UIParent:GetScale();
	x = x - MAGetParent( tagFrame ):GetLeft() * MAGetScale( MAGetParent( tagFrame ), 1 ) / UIParent:GetScale();
	
	y = tagFrame:GetBottom() * MAGetScale( tagFrame, 1 ) / UIParent:GetScale();
	y = y - MAGetParent( tagFrame ):GetBottom() * MAGetScale( MAGetParent( tagFrame ), 1 ) / UIParent:GetScale();

	moveFrame:ClearAllPoints();
	moveFrame:SetPoint( "BOTTOMLEFT", MAGetParent( tagFrame ):GetName(), "BOTTOMLEFT", x, y );
	moveFrame:SetWidth( tagFrame:GetWidth() * MAGetScale( tagFrame , 1 ) / UIParent:GetScale() );
	moveFrame:SetHeight( tagFrame:GetHeight() * MAGetScale( tagFrame, 1 ) / UIParent:GetScale() );	moveFrame:SetFrameLevel( tagFrame:GetFrameLevel() + 1 );
	tagFrame:HiddenClearAllPoints();
	tagFrame:HiddenSetPoint( "BOTTOMLEFT", moveFrame:GetName(), "BOTTOMLEFT", 0, 0 );

	moveFrame.tagged = tagFrame;

	moveFrame:Show();
end

function MoveAnything_Detach( moveFrame )
	if( moveFrame.tagged ) then
		local x, y, parent = MoveAnything_UpdatePosition( moveFrame );
		moveFrame.tagged:HiddenClearAllPoints();
		moveFrame.tagged:HiddenSetPoint( "BOTTOMLEFT", parent:GetName(), "BOTTOMLEFT", x, y );
	end
	moveFrame:Hide();
	moveFrame.tagged = nil;
end

function MoveAnything_ResetFrameOptions( frameName )
	MoveAnything_StopMoving( frameName );
	local frame = getglobal( frameName );
	if ( not frame ) then return; end

	if( frame.OnMoveAnythingPreReset ) then
		frame.OnMoveAnythingPreReset( frame );
	end

	MoveAnything_AllowExternalMovement( frame );
	local opt = MoveAnything_FindFrameOptions( frameName, "Reset Frame Options" );
	local left = nil;
	local bottom = nil;
	local hidden = false;
	local width = nil;
	local height = nil;
	if( opt ) then
		left = opt.originalLeft;
		bottom = opt.originalBottom;
		width = opt.originalWidth;
		height = opt.originalHeight;
		if( opt.hidden ) then
			opt.hidden = false;
			MoveAnything_ShowFrame( frame );
		end
	end
	frame:ClearAllPoints();
	frame:SetPoint( "BOTTOMLEFT", MAGetParent( frame ):GetName(), "BOTTOMLEFT", left, bottom );
	if( MoveAnything_ScaleAllowed( frame:GetName() ) ) then
		frame:SetScale( opt.originalScale );
	end
	if( width ) then frame:SetWidth( width ); end
	if( height ) then frame:SetHeight( height ); end
	if( frame.attachedChildren ) then
		for i, v in frame.attachedChildren do
			if( MoveAnything_ScaleAllowed( frame:GetName() ) ) then
				v:SetScale( opt.originalScale );
			end
		end
	end

	if( frame.OnMoveAnythingPostReset ) then
		frame.OnMoveAnythingPostReset( frame );
	end

	frame.attachedChildren = nil;
	if( opt and opt.UIPanelWindows ) then
		UIPanelWindows[frameName] = opt.UIPanelWindows;
		if( frame:IsVisible() ) then
			frame:Hide();
			ShowUIPanel( frame );
		end
	end
	MoveAnything_ClearFrameOptions( frameName );
	if( MAOptions:IsVisible() ) then
		MoveAnythingOptions_Update();
	end
end

function MoveAnything_ToggleOptionsMenu()
	if( MAOptions:IsVisible() ) then
		MAOptions:Hide();
	else
		MAOptions:Show();
	end
end

function MoveAnythingOptions_OnShow()
	ResizingNudger:Show();
	MoveAnythingOptions_Update();
end

function MoveAnything_GetIndex( frame )
	local index = tonumber( string.sub( frame:GetName(), string.len( "MAMove" ) + 1, -1 ) );
	return index + FauxScrollFrame_GetOffset( MAScrollFrame );
end

function MoveAnything_GetMovableFrame( optionsListFrame )
	local index = MoveAnything_GetIndex( optionsListFrame );
	return getglobal( MoveAnything_Frames[index].name );
end

function MoveAnything_OnMoveCheck( button )
	local frame = MoveAnything_GetMovableFrame( MAGetParent( button ) );
	if ( not frame ) then return; end
	if( button:GetChecked() ) then
		MoveAnything_Move( frame:GetName() );
	else
		MoveAnything_StopMoving( frame:GetName() );
	end
	if( MAOptions:IsVisible() ) then
		MoveAnythingOptions_Update();
	end
end

function MoveAnything_HiddenShow( this )
	this.MAWantsToBeVisible = true;
end

function MoveAnything_HiddenHide( this )
	this.MAWantsToBeVisible = false;
end

function MoveAnything_HiddenIsVisible( this )
	return this.MAWantsToBeVisible;
end

function MoveAnything_HideFrame( frame )
	if ( not frame ) then return; end
	if ( not MoveAnything_IsFrameHooked( frame:GetName() ) ) then
		MoveAnything_HookFrame( frame:GetName() );
	end
	local opt = MoveAnything_FindFrameOptions( frame:GetName(), "HideFrame" );
	opt.hidden = true;
	frame.MAWantsToBeVisible = frame:IsVisible();
	if( MoveAnything_HideList[ frame:GetName() ] ) then
		for hIndex, hideEntry in MoveAnything_HideList[ frame:GetName() ] do
			local val = getglobal( hideEntry[1] );
			local hideType;
			for i = 2, table.getn( hideEntry ) do
				hideType = hideEntry[i];
				if( type( hideType ) == "function" ) then
					hideType( false );
				elseif( hideType == "DISABLEMOUSE" ) then
					val:EnableMouse( false );
				elseif( hideType == "FRAME" ) then
					MoveAnything_PreventExternalVisibility( val );
				elseif( hideType == "WH" ) then
					MoveAnything_StopMoving( frame:GetName() );
					val:SetWidth( 1 );
					val:SetHeight( 1 );
				else
					val:DisableDrawLayer( hideType );
				end
			end
		end
	elseif( MoveAnything_HideUsingWH[ frame:GetName() ] ) then
		MoveAnything_StopMoving( frame:GetName() );
		frame:SetWidth( 1 );
		frame:SetHeight( 1 );
	else
		MoveAnything_PreventExternalVisibility( frame );
	end
end

function MoveAnything_ShowFrame( frame )
	-- if being hidden is the only thing we're controlling with this frame
	-- do a full reset instead of a simple show
	if ( not frame ) then return; end
	local opt = MoveAnything_FindFrameOptions( frame:GetName(), "ShowFrame" );
	if( opt and opt.hidden ) then
		if( not opt.movable ) then
			MoveAnything_ResetFrameOptions( frame:GetName() );
			return;
		end
	end

	if( opt ) then
		opt.hidden = false;
	end
	if( MoveAnything_HideList[ frame:GetName() ] ) then
		for hIndex, hideEntry in MoveAnything_HideList[ frame:GetName() ] do
			local val = getglobal( hideEntry[1] );
			local hideType;
			for i = 2, table.getn( hideEntry ) do
				hideType = hideEntry[i];
				if( type( hideType ) == "function" ) then
					hideType( true );
				elseif( hideType == "DISABLEMOUSE" ) then
					val:EnableMouse( true );
				elseif( hideType == "FRAME" ) then
					MoveAnything_AllowExternalVisibility( val );
				elseif( hideType == "WH" ) then
					val:SetWidth( opt.originalWidth );
					val:SetHeight( opt.originalHeight );
				else
					val:EnableDrawLayer( hideType );
				end
			end
		end
	elseif( MoveAnything_HideUsingWH[ frame:GetName() ] ) then
		frame:SetWidth( opt.originalWidth );
		frame:SetHeight( opt.originalHeight );
	else
		MoveAnything_AllowExternalVisibility( frame );
	end
end

function MoveAnything_OnHideCheck( button )
	local frame = MoveAnything_GetMovableFrame( MAGetParent( button ) );
	if ( not frame ) then return; end
	if( button:GetChecked() ) then
		MoveAnything_HideFrame( frame );
	else
		MoveAnything_ShowFrame( frame );
	end
	MoveAnythingOptions_Update();
end

function MoveAnything_OnResetCheck( button )
	local frame = MoveAnything_GetMovableFrame( MAGetParent( button ) );
	if ( not frame ) then return; end
	MoveAnything_ResetFrameOptions( frame:GetName() );
end

function MoveAnything_OnCheckCharacterSpecific( button )
	local oldName = MoveAnything_CurrentSettingsName();
	if( button:GetChecked() ) then
		MoveAnything_UseCharacterSettings = true;
		MoveAnything_CopySettings( oldName, MoveAnything_CurrentSettingsName() );
	else
		MoveAnything_UseCharacterSettings = false;
		MoveAnything_CopySettings( oldName, MoveAnything_CurrentSettingsName() );
	end
	MoveAnythingOptions_Update();
end

function MoveAnythingOptions_Update()
	FauxScrollFrame_Update(MAScrollFrame, MoveAnything_GetFrameCount(), 10, MOVEANYTHING_SCROLL_HEIGHT );

	for i=1, 10, 1 do
		local index = FauxScrollFrame_GetOffset(MAScrollFrame) + i;
		if( index <= MoveAnything_GetFrameCount() ) then
			local f = getglobal( "MAMove"..i.."FrameNameText" );
			f:SetText( MoveAnything_Frames[index].helpfulName );
			if( MoveAnything_Frames[index] ) then
				getglobal( "MAMove"..i ):Show();
			end

			local opt = MoveAnything_FindFrameOptions( MoveAnything_Frames[index].name, "MAOptions Update" );
			if( MoveAnything_Frames[index].name ) then
				getglobal( "MAMove"..i.."Backdrop" ):Show();
				getglobal( "MAMove"..i.."Move" ):Show();
			else
				getglobal( "MAMove"..i.."Backdrop" ):Hide();
				getglobal( "MAMove"..i.."Move" ):Hide();
			end

			if( MoveAnything_FindMAFrame( MoveAnything_Frames[index].name ) ) then
				getglobal( "MAMove"..i.."Move" ):SetChecked( 1 );
			else
				getglobal( "MAMove"..i.."Move" ):SetChecked( nil );
			end
			if( opt and opt.hidden ) then
				getglobal( "MAMove"..i.."Hide" ):SetChecked( 1 );
			else
				getglobal( "MAMove"..i.."Hide" ):SetChecked( nil );
			end

			-- disallow hiding?
			if( not MoveAnything_Frames[index].name or
					MoveAnything_NoHide[ MoveAnything_Frames[index].name ] ) then
				getglobal( "MAMove"..i.."Hide" ):Hide();
			else
				getglobal( "MAMove"..i.."Hide" ):Show();
			end

			-- add a reset button if it's movable
			if( MoveAnything_IsFrameHooked( MoveAnything_Frames[index].name ) ) then
				getglobal( "MAMove"..i.."Reset" ):Show();
			else
				getglobal( "MAMove"..i.."Reset" ):Hide();
			end
		else
			getglobal( "MAMove"..i ):Hide();
		end

	end

	if( MoveAnything_UseCharacterSettings ) then
		MAOptionsCharacterSpecific:SetChecked( 1 );
	else
		MAOptionsCharacterSpecific:SetChecked( nil );
	end
end

function FuckMe()
	MoveAnything_FrameOptions = {};
end

function MoveAnythingOptions_ResetAll()
	for i,v in MoveAnything_FrameOptions do
		MoveAnything_ResetFrameOptions( v.name );
	end
	MoveAnything_FrameOptions = {};
end

function MoveAnything_FindContainerFrame( id )
	local i = 1;
	local container;
	while( 1 ) do
		container = getglobal( "ContainerFrame"..i );
		if( not container ) then break; end
		if( container:IsVisible() and container:GetID() == id ) then
			return container;
		end
		i = i + 1;
	end
	return nil;
end

function MoveAnything_GrabContainerFrame( container, movableBag )
	if( movableBag and MoveAnything_IsFrameHooked( movableBag:GetName() ) ) then
		MoveAnything_PreventExternalMovement( container );
		container.MAContainerOriginalScale = MAGetScale( container );
		movableBag:Show();
		container:HiddenClearAllPoints();
		container:HiddenSetScale( MAGetScale( movableBag ) );
		--container:HiddenSetPoint( "BOTTOMLEFT", "UIParent", "BOTTOMLEFT", movableBag:GetLeft(), movableBag:GetBottom() );
		container:HiddenSetPoint( "BOTTOMLEFT", movableBag:GetName(), "BOTTOMLEFT", 0, 0 );
		movableBag.attachedChildren = {};
		table.insert( movableBag.attachedChildren, container );
	end
end

function MoveAnything_RemoveContainerFromList( container )
	-- Remove this bag from the list and collapse the rest of the entries
	local index = 1;
	local tempIndex;
	while ContainerFrame1.bags[index] do
		if ( ContainerFrame1.bags[index] == container:GetName() ) then
			ContainerFrame1.bagsShown = ContainerFrame1.bagsShown - 1;
			local tempIndex = index;
			while ContainerFrame1.bags[tempIndex] do
				if ( ContainerFrame1.bags[tempIndex + 1] ) then
					ContainerFrame1.bags[tempIndex] = ContainerFrame1.bags[tempIndex + 1];
				else
					ContainerFrame1.bags[tempIndex] = nil;
				end
				tempIndex = tempIndex + 1;
			end
		end
		index = index + 1;
	end
	updateContainerFrameAnchors();
end

-- TOOLTIP HOOKS
MoveAnything_OriginalSetDefaultAnchor = GameTooltip_SetDefaultAnchor;
function GameTooltip_SetDefaultAnchor(tooltip, parent)
	if( MoveAnything_IsFrameHooked( "TooltipMover" ) and tooltip == GameTooltip ) then
		-- anchor the tooltip to the side of the mover that is closest to the edge
		local l, r, t, b, a, anchor;
		l = TooltipMover:GetLeft() - UIParent:GetLeft();
		r = UIParent:GetRight() - TooltipMover:GetRight();
		t = UIParent:GetTop() - TooltipMover:GetTop();
		b = TooltipMover:GetBottom() - UIParent:GetBottom();
		a = t;
		anchor = "TOP";
		if( l < a ) then a = l; anchor = "LEFT"; end
		if( r < a ) then a = r; anchor = "RIGHT"; end
		if( b < a ) then a = b; anchor = "BOTTOM"; end

		tooltip:ClearAllPoints();
		tooltip:SetOwner(parent, "ANCHOR_NONE");
		tooltip:SetPoint( anchor, "TooltipMover", anchor, 0, 0 );
		tooltip.default = 1;
	else
		tooltip:ClearAllPoints();
		MoveAnything_OriginalSetDefaultAnchor( tooltip, parent );
	end
end
MoveAnything_OriginalGameTooltip_OnHide = GameTooltip_OnHide;
function GameTooltip_OnHide()
	MoveAnything_AllowExternalMovement( this );
	MoveAnything_OriginalGameTooltip_OnHide();
end

-- BAG FRAME HOOKS
MoveAnything_BagFrames = {};
MoveAnything_OriginalGenerateFrame = ContainerFrame_GenerateFrame;
function ContainerFrame_GenerateFrame(frame, size, id)
	local bag = MoveAnything_BagFrames[id]
	MoveAnything_OriginalGenerateFrame( frame, size, id );
	MoveAnything_GrabContainerFrame( frame, bag );
end
MoveAnything_OriginalOnHide = ContainerFrame_OnHide;
function ContainerFrame_OnHide()
	local bag = MoveAnything_BagFrames[this:GetID()];
	if( bag and MoveAnything_IsFrameHooked( bag:GetName() ) ) then
		MoveAnything_AllowExternalMovement( this );
		if( this.MAContainerOriginalScale ) then
			this:SetScale( this.MAContainerOriginalScale );
			this.MAContainerOriginalScale = nil;
		end
		this:ClearAllPoints();
		-- we removed the container from the list before, but now we have to add
		-- it back, since the container code is going to try to remove it, and doesn't
		-- particularly care if it's already gone
		ContainerFrame1.bagsShown = ContainerFrame1.bagsShown + 1;
		ContainerFrame1.bags[ContainerFrame1.bagsShown] = this:GetName();
	end
	MoveAnything_OriginalOnHide();
end
MoveAnything_OriginalOnShow = ContainerFrame_OnShow;
function ContainerFrame_OnShow()
	MoveAnything_OriginalOnShow();
	local bag = MoveAnything_BagFrames[this:GetID()];
	if( bag and MoveAnything_IsFrameHooked( bag:GetName() ) ) then
		MoveAnything_RemoveContainerFromList( this );
	end
end

-- TALENT BUTTON HOOK
MoveAnything_OriginalUpdateTalentButton = UpdateTalentButton;
function UpdateTalentButton()
	if( MoveAnything_IsFrameHooked( "MicroButtonsVerticalMover" ) ) then
		if ( UnitLevel("player") < 10 ) then
			TalentMicroButton:Hide();
			QuestLogMicroButton:SetPoint("TOPLEFT", "TalentMicroButton", "TOPLEFT", 0, 0);
		else
			TalentMicroButton:Show();
			QuestLogMicroButton:SetPoint("TOPLEFT", "TalentMicroButton", "BOTTOMLEFT", 0, 24);
		end
	else
		MoveAnything_OriginalUpdateTalentButton();
	end
end

--- UI PANEL HOOKS
function MoveAnything_SetLeftFrameLocation()
	local left = GetLeftFrame();
	if( left ) then
		if( MoveAnything_IsFrameHooked( "UIPanelMover1" ) ) then
			left:ClearAllPoints();
			left:SetPoint( "TOPLEFT", "UIPanelMover1", "TOPLEFT" );
			left:SetScale( MAGetScale( UIPanelMover1 ), 1 );
		else
			left:SetScale( 1 );
		end
	end
end

function MoveAnything_SetCenterFrameLocation()
	-- don't mess with the normal center panels, just the ones
	-- that are pushed over from the left
	if( GetLeftFrame() ) then
		local center = GetCenterFrame();
		if( center ) then
			if( MoveAnything_IsFrameHooked( "UIPanelMover2" ) ) then
				center:ClearAllPoints();
				center:SetPoint( "TOPLEFT", "UIPanelMover2", "TOPLEFT" );
				center:SetScale( MAGetScale( UIPanelMover2 ), 1 );
			else
				center:SetScale( 1 );
			end
		end
	end
end

MoveAnything_OriginalShowUIPanel = ShowUIPanel;
function ShowUIPanel(frame)
	MoveAnything_OriginalShowUIPanel(frame);
	MoveAnything_SetLeftFrameLocation();
	MoveAnything_SetCenterFrameLocation();
end
MoveAnything_OriginalMovePanelToLeft = MovePanelToLeft;
function MovePanelToLeft()
	MoveAnything_OriginalMovePanelToLeft();
	MoveAnything_SetLeftFrameLocation();
end
MoveAnything_OriginalMovePanelToCenter = MovePanelToCenter;
function MovePanelToCenter()
	MoveAnything_OriginalMovePanelToCenter();
	MoveAnything_SetCenterFrameLocation();
end
MoveAnything_OriginalCloseAllWindows = CloseAllWindows;
function CloseAllWindows(ignoreCenter)
	local closed = nil, oclosed;
	for i, v in MoveAnything_Frames do
		if( MoveAnything_IsFrameHooked( v.name ) ) then
			local opt = MoveAnything_FindFrameOptions( v.name, "CloseAllWindows" );
			if( opt and opt.UIPanelWindows ) then
				if ( type(getglobal(v.name)) ~= "nil" ) then
					if( getglobal( v.name ):IsVisible() ) then
						getglobal( v.name ):Hide();
						closed = true;
					end
				end
			end
		end
	end
	oclosed = MoveAnything_OriginalCloseAllWindows( ignoreCenter );
	if( oclosed or closed ) then
		return true;
	end
	return nil;
end

--- ACTION BUTTON HOOKS
MoveAnything_OriginalShowBonusActionBar = ShowBonusActionBar;
function ShowBonusActionBar()
	if( MoveAnything_IsFrameHooked( "BasicActionButtonsMover" ) or
		MoveAnything_IsFrameHooked( "BasicActionButtonsVerticalMover" ) or
		MoveAnything_IsFrameHidden( "MainMenuBar" ) ) then
		for i = 1, 12, 1 do
			getglobal( "ActionButton"..i ):Hide();
			MoveAnything_PreventExternalVisibility( getglobal( "ActionButton"..i ) );
		end
	end
	MoveAnything_OriginalShowBonusActionBar();
end

MoveAnything_OriginalHideBonusActionBar = HideBonusActionBar;
function HideBonusActionBar()
	local hooked = nil;
	local opt = nil;
	if( MoveAnything_IsFrameHooked( "BasicActionButtonsMover" ) ) then
		hooked = "BasicActionButtonsMover";
	elseif( MoveAnything_IsFrameHooked( "BasicActionButtonsVerticalMover" ) ) then
		hooked = "BasicActionButtonsVerticalMover";
	end
	if( hooked ) then
		opt = MoveAnything_FindFrameOptions( hooked, "HideBonusActionBar" );
	end
	if( hooked or MoveAnything_IsFrameHidden( "MainMenuBar" ) ) then
		for i = 1, 12, 1 do
			getglobal( "ActionButton"..i ):Show();
			if( (not opt) or (not opt.hidden) ) then
				MoveAnything_AllowExternalVisibility( getglobal( "ActionButton"..i ) );
			end
		end
	end
	MoveAnything_OriginalHideBonusActionBar();
end

SLASH_MOVEANYTHING1 = "/move"
SlashCmdList["MOVEANYTHING"] = function( msg )
	if( msg == nil or string.len( msg ) == 0 ) then
		MoveAnything_ToggleOptionsMenu();
	else
		MoveAnything_ToggleMove( msg );
	end
end

SLASH_UNMOVEANYTHING1 = "/unmove"
SlashCmdList["UNMOVEANYTHING"] = function( msg )
	if( msg ) then
		MoveAnything_StopMoving( msg );
		local frame = getglobal( msg );
		MoveAnything_AllowExternalMovement( frame );
		frame:ClearAllPoints();
		frame:SetPoint( "CENTER", MAGetParent( frame ):GetName(), "CENTER", 0, 0 );
	end
end

SLASH_MOVEANYTHINGCOPYSETTINGS1 = "/movecopy"
SlashCmdList["MOVEANYTHINGCOPYSETTINGS"] = function( msg )
	if( msg == nil or string.len( msg ) == 0 ) then
		Error( "Syntax: /movecopy ServerName PlayerName" );
		Error( "Use /movelist to see a current list of valid settings" );
		return;
	end

	if( MoveAnything_CharacterSettings[msg] == nil ) then
		Error( "No settings for server/character "..msg );
		Error( "Use /movelist to see a current list of valid settings" );
		return;
	end

	MoveAnything_CopySettings( msg, MoveAnything_CurrentSettingsName() );
end

SLASH_MOVEANYTHINGLISTSETTINGS1 = "/movelist"
SlashCmdList["MOVEANYTHINGLISTSETTINGS"] = function( msg )
	Print( "Server/Character Settings List:", 1.0, 1.0, 0.2 );
	Print( "-------------------------------", 1.0, 1.0, 0.2 );
	for i, val in MoveAnything_CharacterSettings do
		local str = i;
		if( val == MoveAnything_FrameOptions ) then
			str = str.." (Current)";
		end
		Print( str, 1.0, 1.0, 0.2 );
	end
end

SLASH_MOVEANYTHINGDELETESETTINGS1 = "/movedelete"
SLASH_MOVEANYTHINGDELETESETTINGS2 = "/movedel"
SlashCmdList["MOVEANYTHINGDELETESETTINGS"] = function( msg )
	if( msg == nil or string.len( msg ) == 0 ) then
		Error( "Syntax: /movedelete ServerName PlayerName" );
		Error( "Use /movelist to see a current list of valid settings" );
		return;
	end

	if( MoveAnything_CharacterSettings[msg] == nil ) then
		Error( "No settings for server/character "..msg );
		Error( "Use /movelist to see a current list of valid settings" );
		return;
	end

	if( msg == MoveAnything_CurrentSettingsName() ) then
		MoveAnythingOptions_ResetAll();
	else
		MoveAnything_CharacterSettings[msg] = nil;
	end
	MoveAnything_FrameOptions = MoveAnything_CharacterSettings[MoveAnything_CurrentSettingsName()];
	MoveAnything_RefreshPositions();
end

function GameMenu_AddButton( button )
	if( GameMenu_InsertAfter == nil ) then
		GameMenu_InsertAfter = GameMenuButtonMacros;
	end
	if( GameMenu_InsertBefore == nil ) then
		GameMenu_InsertBefore = GameMenuButtonLogout;
	end

	button:ClearAllPoints();
	button:SetPoint( "TOP", GameMenu_InsertAfter:GetName(), "BOTTOM", 0, -1 );
	GameMenu_InsertBefore:SetPoint( "TOP", button:GetName(), "BOTTOM", 0, -1 );
	GameMenu_InsertAfter = button;
	GameMenuFrame:SetHeight( GameMenuFrame:GetHeight() + button:GetHeight() + 2 );
end

if ( GameMenuButtonAddOns ) then
	GameMenu_AddButton(GameMenuButtonAddOns);
end

--TODO:
--ChatFrameEditBox move

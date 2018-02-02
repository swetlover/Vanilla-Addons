local L = AceLibrary("AceLocale-2.1"):GetInstance("RaidOrganizer", true)
local dewdrop = AceLibrary("Dewdrop-2.0")
--local tablet = AceLibrary("Tablet-2.0")

-- name2unitid
local unitids = {
}
local position = {
}
local lastAction = {
    name = {},
    position = {},
    group = {},
}

local einteilung = {{}, {}, {}, {}, {}, {}, {}, {}, {}, {},}
local stats = {DRUID = 0, PRIEST = 0, PALADIN = 0, SHAMAN = 0, WARRIOR = 0, ROGUE = 0, MAGE = 0, WARLOCK = 0, HUNTER = 0,}

local groupByName = {}

local grouplabels = {Rest = "GROUP_LOCALE_REMAINS", [1] = "GROUP_LOCALE_1", [2] = "GROUP_LOCALE_2", [3] = "GROUP_LOCALE_3", [4] = "GROUP_LOCALE_4", [5] = "GROUP_LOCALE_5", [6] = "GROUP_LOCALE_6", [7] = "GROUP_LOCALE_7", [8] = "GROUP_LOCALE_8", [9] = "GROUP_LOCALE_9",}

local MAX_GROUP_NB = 9

local groupclasses = { {}, {}, {}, {}, {}, {}, {}, {}, {} }
local newAttrib = {true, true, true, true, true, true,true, true, true}
local classTab = {}

local faction = UnitFactionGroup("player")
if faction == "Alliance" then
	classTab = {{"PRIEST","DRUID","PALADIN"},
	{"WARRIOR","DRUID"},
	{"WARRIOR","ROGUE","MAGE"},
	{"MAGE","PRIEST","WARLOCK","ROGUE","HUNTER", "DRUID"},
	{"WARLOCK"},
	{"MAGE"},
	{"PRIEST"},
	{"DRUID"},
	{"MAGE","PRIEST","WARLOCK","ROGUE","HUNTER", "DRUID", "PALADIN", "WARRIOR"},
	{"MAGE","PRIEST","WARLOCK","ROGUE","HUNTER", "DRUID", "PALADIN", "WARRIOR"},
	{"MAGE","PRIEST","WARLOCK","ROGUE","HUNTER", "DRUID", "PALADIN", "WARRIOR"}}
else
	classTab = {{"PRIEST","DRUID","SHAMAN"},
	{"WARRIOR","DRUID"},
	{"WARRIOR","ROGUE","MAGE"},
	{"MAGE","PRIEST","WARLOCK","ROGUE","HUNTER", "DRUID"},
	{"WARLOCK"},
	{"MAGE"},
	{"PRIEST"},
	{"DRUID"},
	{"MAGE","PRIEST","WARLOCK","ROGUE","HUNTER", "DRUID", "SHAMAN", "WARRIOR"},
	{"MAGE","PRIEST","WARLOCK","ROGUE","HUNTER", "DRUID", "SHAMAN", "WARRIOR"},
	{"MAGE","PRIEST","WARLOCK","ROGUE","HUNTER", "DRUID", "SHAMAN", "WARRIOR"}}
end

local TOTAL_TAB_NB = 11
local SYNC_TAB_NB = 9
local HEAL_TAB_INDEX = 1
local TANK_TAB_INDEX = 2
local BUFF_MAGE_TAB_INDEX = 6
local BUFF_PRIEST_TAB_INDEX = 7
local BUFF_DRUID_TAB_INDEX = 8
local RAID_PLACEMENT_TAB_INDEX = 9
local RAID_FILL_TAB_INDEX = 10
local ROLE_TAB_INDEX = 11

local IsPlayerInRaid = false

local change_id = 0

local level_of_button = -1;
local tempsetup = {}

local barBackgroundTextures = {	["Interface/Tooltips/UI-Tooltip-Background"] = "Tooltip", 
								["Interface/DialogFrame/UI-DialogBox-Background"] = "Dialog",
								["Interface\\AddOns\\RaidOrganizer\\Textures\\Background\\UI-Tooltip-Background.tga"] = "Tooltip_square",
								["Interface/Buttons/WHITE8x8"] = "WHITE8X8", [""] = "None"}
								
local barBackgroundEdges = {["Interface/Tooltips/UI-Tooltip-Border"] = "Tooltip",
							["Interface/DialogFrame/UI-DialogBox-Border"] = "Dialog",
							["Interface\\AddOns\\RaidOrganizer\\Textures\\Border\\roth.tga"] = "roth",
							["Interface\\AddOns\\RaidOrganizer\\Textures\\Border\\tot.tga"] = "tot",
							["Interface\\AddOns\\RaidOrganizer\\Textures\\Border\\tut.tga"] = "tut",
							["Interface\\AddOns\\RaidOrganizer\\Textures\\Border\\ada.tga"] = "ada",
							["Interface\\AddOns\\RaidOrganizer\\Textures\\Border\\UI-Tooltip-Border.tga"] = "Tooltip_square",
							[""] = "None"}

local ROBar_backdrop = {
  bgFile = "Interface\Tooltips\UI-Tooltip-Background",  
  edgeFile = "Interface\Tooltips\UI-Tooltip-Border",
  tile = true,
  tileSize = 12,
  edgeSize = 16,
  insets = {left = 4, right = 4, top = 4, bottom = 4}
}

-- key bindings
BINDING_HEADER_RaidOrganizer = "Raid Organizer"
BINDING_NAME_SHOW_RaidOrganizer = L["SHOW_DIALOG"]

RaidOrganizer = AceLibrary("AceAddon-2.0"):new("AceConsole-2.0", "AceDebug-2.0", "AceDB-2.0", "AceEvent-2.0", "AceModuleCore-2.0")
RaidOrganizer:RegisterDB("RaidOrganizerDB", "RaidOrganizerDBPerChar")
RaidOrganizer.options = {
    type = 'group',
    args = {
		barDisplay = {
			type = 'group',
			name = '快捷栏设置',
			desc = '快捷按钮栏显示选项',
			args = {
				scale = {
					type = 'range',
					name = "大小",
					desc = "快捷按钮栏大小",
					get = function() return RaidOrganizer.db.char.scale end,
					set = function(v)
						RaidOrganizer.db.char.scale = v
						RaidOrganizerButtonsBar:SetScale(RaidOrganizer.db.char.scale)
					end,
					min = 0.5,
					max = 2,
					step = 0.01,
					order = 2
				},
				rows = {
					type = 'range',
					name = "排/列改变",
					desc = "排/列改变",
					get = function() return RaidOrganizer.db.char.rows end,
					set = function(v)
						RaidOrganizer.db.char.rows = v
						RaidOrganizer:ResizeBar(v, RaidOrganizer.db.char.spacing)
					end,
					min = 1,
					max = 9,
					step = 1,
					order = 2
				},
				spacing = {
					type = 'range',
					name = "间距",
					desc = "按钮栏间距",
					get = function() return RaidOrganizer.db.char.spacing end,
					set = function(v)
						RaidOrganizer.db.char.spacing = v
						RaidOrganizer:ResizeBar(RaidOrganizer.db.char.rows, v)
					end,
					min = -5,
					max = 10,
					step = 0.5,
					order = 2
				},
				texture = {
					type= 'group',
					name = '栏纹理',
					desc = '栏的背景和边缘纹理',
					args = {
						backgroundTexture = {
							type = "text",
							name = "背景",
							desc = "Bar background texture",
							get = function() return barBackgroundTextures[RaidOrganizer.db.char.barBackground] and RaidOrganizer.db.char.barBackground or barBackgroundTextures["Default"] end,
							set = function(bgfile) RaidOrganizer:SetBarTexture(bgfile) end,
							validate = barBackgroundTextures
						},
						backgroundEdge = {
							type = "text",
							name = "边缘",
							desc = "Bar background edges",
							get = function() return barBackgroundEdges[RaidOrganizer.db.char.barEdges] and RaidOrganizer.db.char.barEdges or barBackgroundEdges["Default"] end,
							set = function(edgefile) RaidOrganizer:SetBarEdge(edgefile) end,
							validate = barBackgroundEdges
						},
						color = {
							type= 'color',
							name = '背景颜色',
							desc = 'Bar background color',
							hasAlpha = true,
							get = function() return RaidOrganizerButtonsBar:GetBackdropColor() end,
							set = function(r,g,b,a) RaidOrganizer.db.char.color.r = r; RaidOrganizer.db.char.color.g = g; RaidOrganizer.db.char.color.b = b; RaidOrganizer.db.char.color.a = a; return RaidOrganizerButtonsBar:SetBackdropColor(r,g,b,a); end,
						},	
					}
				},
				alpha = {
					type= 'group',
					name = '图标透明度',
					desc = '图标透明度',
					args = {
						icon1 = {
							type= 'group',
							name = '标签 1',
							desc = '标签1图标透明度',
							args = {
								icon1alphanormal = {
									type = "range",
									name = "图标透明 (正常)",
									desc = "图标透明 (正常)",
									get = function() return RaidOrganizer.db.char.icon1alphanormal end,
									set = function(v)
										RaidOrganizer.db.char.icon1alphanormal = v; RaidOrganizer:UpdateAlpha();
									end,
									min = 0,
									max = 1,
									step = 0.05,
									order = 2
								},
								icon1alphahighlight = {
									type = "range",
									name = "图标透明 (高亮)",
									desc = "图标透明 (高亮)",
									get = function() return RaidOrganizer.db.char.icon1alphahighlight end,
									set = function(v)
										RaidOrganizer.db.char.icon1alphahighlight = v; RaidOrganizer:UpdateAlpha();
									end,
									min = 0,
									max = 1,
									step = 0.05,
									order = 2
								},
							},
						},
						icon2 = {
							type= 'group',
							name = '标签 2',
							desc = '标签 2 Icon transparancy',
							args = {
								icon2alphanormal = {
									type = "range",
									name = "图标透明 (正常)",
									desc = "图标透明 (正常)",
									get = function() return RaidOrganizer.db.char.icon2alphanormal end,
									set = function(v)
										RaidOrganizer.db.char.icon2alphanormal = v; RaidOrganizer:UpdateAlpha();
									end,
									min = 0,
									max = 1,
									step = 0.05,
									order = 2
								},
								icon2alphahighlight = {
									type = "range",
									name = "图标透明 (高亮)",
									desc = "图标透明 (高亮)",
									get = function() return RaidOrganizer.db.char.icon2alphahighlight end,
									set = function(v)
										RaidOrganizer.db.char.icon2alphahighlight = v; RaidOrganizer:UpdateAlpha();
									end,
									min = 0,
									max = 1,
									step = 0.05,
									order = 2
								},
							},
						},
						icon3 = {
							type= 'group',
							name = '标签 3',
							desc = '标签 3 Icon transparancy',
							args = {
								icon3alphanormal = {
									type = "range",
									name = "图标透明 (正常)",
									desc = "图标透明 (正常)",
									get = function() return RaidOrganizer.db.char.icon3alphanormal end,
									set = function(v)
										RaidOrganizer.db.char.icon3alphanormal = v; RaidOrganizer:UpdateAlpha();
									end,
									min = 0,
									max = 1,
									step = 0.05,
									order = 2
								},
								icon3alphahighlight = {
									type = "range",
									name = "图标透明 (高亮)",
									desc = "图标透明 (高亮)",
									get = function() return RaidOrganizer.db.char.icon3alphahighlight end,
									set = function(v)
										RaidOrganizer.db.char.icon3alphahighlight = v; RaidOrganizer:UpdateAlpha();
									end,
									min = 0,
									max = 1,
									step = 0.05,
									order = 2
								},
							},
						},
						icon4 = {
							type= 'group',
							name = '标签 4',
							desc = '标签 4 Icon transparancy',
							args = {
								icon4alphanormal = {
									type = "range",
									name = "图标透明 (正常)",
									desc = "图标透明 (正常)",
									get = function() return RaidOrganizer.db.char.icon4alphanormal end,
									set = function(v)
										RaidOrganizer.db.char.icon4alphanormal = v; RaidOrganizer:UpdateAlpha();
									end,
									min = 0,
									max = 1,
									step = 0.05,
									order = 2
								},
								icon4alphahighlight = {
									type = "range",
									name = "图标透明 (高亮)",
									desc = "图标透明 (高亮)",
									get = function() return RaidOrganizer.db.char.icon4alphahighlight end,
									set = function(v)
										RaidOrganizer.db.char.icon4alphahighlight = v; RaidOrganizer:UpdateAlpha();
									end,
									min = 0,
									max = 1,
									step = 0.05,
									order = 2
								},
							},
						},
						icon5 = {
							type= 'group',
							name = '标签 5',
							desc = '标签 5 Icon transparancy',
							args = {
								icon5alphanormal = {
									type = "range",
									name = "图标透明 (正常)",
									desc = "图标透明 (正常)",
									get = function() return RaidOrganizer.db.char.icon5alphanormal end,
									set = function(v)
										RaidOrganizer.db.char.icon5alphanormal = v; RaidOrganizer:UpdateAlpha();
									end,
									min = 0,
									max = 1,
									step = 0.05,
									order = 2
								},
								icon5alphahighlight = {
									type = "range",
									name = "图标透明 (高亮)",
									desc = "图标透明 (高亮)",
									get = function() return RaidOrganizer.db.char.icon5alphahighlight end,
									set = function(v)
										RaidOrganizer.db.char.icon5alphahighlight = v; RaidOrganizer:UpdateAlpha();
									end,
									min = 0,
									max = 1,
									step = 0.05,
									order = 2
								},
							},
						},
						icon6 = {
							type= 'group',
							name = '标签 6',
							desc = '标签 6 Icon transparancy',
							args = {
								icon6alphanormal = {
									type = "range",
									name = "图标透明 (正常)",
									desc = "图标透明 (正常)",
									get = function() return RaidOrganizer.db.char.icon6alphanormal end,
									set = function(v)
										RaidOrganizer.db.char.icon6alphanormal = v; RaidOrganizer:UpdateAlpha();
									end,
									min = 0,
									max = 1,
									step = 0.05,
									order = 2
								},
								icon6alphahighlight = {
									type = "range",
									name = "图标透明 (高亮)",
									desc = "图标透明 (高亮)",
									get = function() return RaidOrganizer.db.char.icon6alphahighlight end,
									set = function(v)
										RaidOrganizer.db.char.icon6alphahighlight = v; RaidOrganizer:UpdateAlpha();
									end,
									min = 0,
									max = 1,
									step = 0.05,
									order = 2
								},
							},
						},
						icon7 = {
							type= 'group',
							name = '标签 7',
							desc = '标签 7 Icon transparancy',
							args = {
								icon7alphanormal = {
									type = "range",
									name = "图标透明 (正常)",
									desc = "图标透明 (正常)",
									get = function() return RaidOrganizer.db.char.icon7alphanormal end,
									set = function(v)
										RaidOrganizer.db.char.icon7alphanormal = v; RaidOrganizer:UpdateAlpha();
									end,
									min = 0,
									max = 1,
									step = 0.05,
									order = 2
								},
								icon7alphahighlight = {
									type = "range",
									name = "图标透明 (高亮)",
									desc = "图标透明 (高亮)",
									get = function() return RaidOrganizer.db.char.icon7alphahighlight end,
									set = function(v)
										RaidOrganizer.db.char.icon7alphahighlight = v; RaidOrganizer:UpdateAlpha();
									end,
									min = 0,
									max = 1,
									step = 0.05,
									order = 2
								},
							},
						},
						icon8 = {
							type= 'group',
							name = '标签 8',
							desc = '标签 8 Icon transparancy',
							args = {
								icon8alphanormal = {
									type = "range",
									name = "图标透明 (正常)",
									desc = "图标透明 (正常)",
									get = function() return RaidOrganizer.db.char.icon8alphanormal end,
									set = function(v)
										RaidOrganizer.db.char.icon8alphanormal = v; RaidOrganizer:UpdateAlpha();
									end,
									min = 0,
									max = 1,
									step = 0.05,
									order = 2
								},
								icon8alphahighlight = {
									type = "range",
									name = "图标透明 (高亮)",
									desc = "图标透明 (高亮)",
									get = function() return RaidOrganizer.db.char.icon8alphahighlight end,
									set = function(v)
										RaidOrganizer.db.char.icon8alphahighlight = v; RaidOrganizer:UpdateAlpha();
									end,
									min = 0,
									max = 1,
									step = 0.05,
									order = 2
								},
							},
						},
						icon9 = {
							type= 'group',
							name = '标签 9',
							desc = '标签 9 Icon transparancy',
							args = {
								icon9alphanormal = {
									type = "range",
									name = "图标透明 (正常)",
									desc = "图标透明 (正常)",
									get = function() return RaidOrganizer.db.char.icon9alphanormal end,
									set = function(v)
										RaidOrganizer.db.char.icon9alphanormal = v; RaidOrganizer:UpdateAlpha();
									end,
									min = 0,
									max = 1,
									step = 0.05,
									order = 2
								},
								icon9alphahighlight = {
									type = "range",
									name = "图标透明 (高亮)",
									desc = "图标透明 (高亮)",
									get = function() return RaidOrganizer.db.char.icon9alphahighlight end,
									set = function(v)
										RaidOrganizer.db.char.icon9alphahighlight = v; RaidOrganizer:UpdateAlpha();
									end,
									min = 0,
									max = 1,
									step = 0.05,
									order = 2
								},
							},
						},
					},
				},
			}
		},
        showBar = {
			type = 'execute',
			name = '显示快捷按钮栏',
			desc = '显示/隐藏快捷按钮栏',
			func = function() RaidOrganizer.db.char.showBar = not RaidOrganizer.db.char.showBar; RaidOrganizer:ShowBar() end,
				
        },
		showDialog = {
            type = 'execute',
            name = '显示对话框',
            desc = L["SHOW_DIALOG"],
            func = function() RaidOrganizer:Dialog() end,
        },
		versionQuery = {
			type = "toggle",
			name = '检查版本',
			desc = '团队成员RaidOrganizer版本查询',
			get = function() return RaidOrganizer.b_versionQuery end,
			set = function() RaidOrganizer:VersionQuery() end,
			disabled = function() return not RaidOrganizer:IsActive() end,
		},
		whosSyncing = {
			type = "toggle",
			name = '谁是同步的 ?',
			desc = '显示RAID官员/领导同步”选项便签',
			get = function() return RaidOrganizer.b_whosSyncingDisplay end,
			set = function() RaidOrganizer.b_whosSyncingDisplay = not RaidOrganizer.b_whosSyncingDisplay; RaidOrganizer:TriggerEvent("RaidOrganizer_OnTooltipUpdate"); end,
			disabled = function() return not RaidOrganizer:IsActive() end,
		},
    }
}
RaidOrganizer:RegisterChatCommand({"/RaidOrganizer", "/raidorg", "/ro"}, RaidOrganizer.options)
RaidOrganizer:RegisterDefaults('char', {
	chan = "",
	showBar = true,
	scale = 1.0,
	rows = 3,
	spacing = 1,
	icon1alphanormal = 0.3,
	icon1alphahighlight = 1,
	icon2alphanormal = 0.3,
	icon2alphahighlight = 1,
	icon3alphanormal = 0.3,
	icon3alphahighlight = 1,
	icon4alphanormal = 0.3,
	icon4alphahighlight = 1,
	icon5alphanormal = 0.3,
	icon5alphahighlight = 1,
	icon6alphanormal = 0.3,
	icon6alphahighlight = 1,
	icon7alphanormal = 0.3,
	icon7alphahighlight = 1,
	icon8alphanormal = 0.3,
	icon8alphahighlight = 1,
	icon9alphanormal = 0.3,
	icon9alphahighlight = 1,
	color = { ["r"] = 0, ["g"] = 0, ["b"] = 0, ["a"] = 0.5 },
	barBackground = "Interface\Tooltips\UI-Tooltip-Background",
	barEdges = "Interface\Tooltips\UI-Tooltip-Border",
})

RaidOrganizer:RegisterDefaults('account', {
    sets = { {
        [L["SET_DEFAULT"]] = {
            Name = L["SET_DEFAULT"],
            GroupNames = {"坦克1", "坦克2","坦克3","坦克4","坦克5",L["DISPEL"],"", "", "", },
            Remaining = "刷团,注意力集中,不许划水!",
            GroupClasses = { {}, {}, {}, {}, {}, {}, {}, {}, {} }
        },
    },
	{
        [L["SET_DEFAULT"]] = {
            Name = L["SET_DEFAULT"],
            GroupNames = {"骷髅","叉叉","方块","月亮","三角","菱形","大饼","星星","",},
            Remaining = "人群T,随时补位嘲讽,或者打夜幕",
            GroupClasses = {{},{},{},{},{},{},{},{},{},}
        },
    },
	{
        [L["SET_DEFAULT"]] = {
            Name = L["SET_DEFAULT"],
            GroupNames = {"骷髅","叉叉","方块","月亮","三角","菱形","大饼","星星","",},
            Remaining = "全力DPS,注意力集中,不许划水!",
            GroupClasses = {{},{},{},{},{},{},{},{},{},}
        },
    },
	{
        [L["SET_DEFAULT"]] = {
            Name = L["SET_DEFAULT"],
            GroupNames = {"骷髅","叉叉","方块","月亮","三角","菱形","大饼","星星","",},
            Remaining = "",
            GroupClasses = {{},{},{},{},{},{},{},{},{},}
        },
    },
	{
        [L["SET_DEFAULT"]] = {
            Name = L["SET_DEFAULT"],
            GroupNames = {"元素诅咒","暗影诅咒","鲁莽诅咒","虚弱诅咒","厄运诅咒","痛苦诅咒","","","",},
            Remaining = "",
            GroupClasses = {{"WARLOCK"},{"WARLOCK"},{"WARLOCK"},{},{},{},{},{},{},}
        },
    },
	{
        [L["SET_DEFAULT"]] = {
            Name = L["SET_DEFAULT"],
            GroupNames = {"队伍 1","队伍 2","队伍 3","队伍 4","队伍 5","队伍 6","队伍 7","队伍 8","",},
            Remaining = "",
            GroupClasses = {{"MAGE"},{"MAGE"},{"MAGE"},{"MAGE"},{"MAGE"},{"MAGE"},{"MAGE"},{"MAGE"},{"MAGE"},}
        },
    },
	{
        [L["SET_DEFAULT"]] = {
            Name = L["SET_DEFAULT"],
            GroupNames = {"队伍 1","队伍 2","队伍 3","队伍 4","队伍 5","队伍 6","队伍 7","队伍 8","",},
            Remaining = "",
            GroupClasses = {{"PRIEST"},{"PRIEST"},{"PRIEST"},{"PRIEST"},{"PRIEST"},{"PRIEST"},{"PRIEST"},{"PRIEST"},{"PRIEST"},}
        },
    },
	{
        [L["SET_DEFAULT"]] = {
            Name = L["SET_DEFAULT"],
            GroupNames = {"队伍 1","队伍 2","队伍 3","队伍 4","队伍 5","队伍 6","队伍 7","队伍 8","",},
            Remaining = "",
            GroupClasses = {{"DRUID"},{"DRUID"},{"DRUID"},{"DRUID"},{"DRUID"},{"DRUID"},{"DRUID"},{"DRUID"},{"DRUID"},}
        },
    },
	{
        [L["SET_DEFAULT"]] = {
            Name = L["SET_DEFAULT"],
            GroupNames = {"左","右","","","","","","","",},
            Remaining = "",
            GroupClasses = {{},{},{},{},{},{},{},{},{},}
        },
    },
	{
		[L["SET_DEFAULT"]] = {
            Name = L["SET_DEFAULT"],
            GroupNames = {"队伍 1","队伍 2","队伍 3","队伍 4","队伍 5","队伍 6","队伍 7","队伍 8","",},
            Remaining = "",
            GroupClasses = {{},{},{},{},{},{},{},{},{},}
        },
	},
	{
		[L["SET_DEFAULT"]] = {
            Name = L["SET_DEFAULT"],
            GroupNames = {"坦克","治疗","物理","法系","","","","","",},
            Remaining = "",
            GroupClasses = {{},{},{},{},{},{},{},{},{},}
        },
	}
	}
})

RaidOrganizer.SLOT_PER_GROUP_PER_TAB = {{8, 8, 8, 8, 8, 8, 0, 0, 0}, 
										{3, 3, 3, 3, 3, 3, 3, 3, 0},
										{5, 5, 5, 5, 5, 5, 5, 5, 0},
										{2, 2, 2, 2, 2, 2, 2, 2, 0},
										{1, 1, 1, 1, 1, 1, 0, 0, 0},
										{1, 1, 1, 1, 1, 1, 1, 1, 0},
										{1, 1, 1, 1, 1, 1, 1, 1, 0},
										{1, 1, 1, 1, 1, 1, 1, 1, 0},
										{30, 30, 0, 0, 0, 0, 0, 0, 0},
										{5, 5, 5, 5, 5, 5, 5, 5, 0},
										{8, 18, 18, 18, 0, 0, 0, 0, 0}
										}

RaidOrganizer.b_versionQuery = false
RaidOrganizer.b_whosSyncingDisplay = false
RaidOrganizer.RO_version_table = {}
RaidOrganizer.senderTable = {{}, {}, {}, {}, {}, {}, {}, {}, {}}
local RO_CLASS_COLOR = RAID_CLASS_COLORS;

function RaidOrganizer:OnInitialize() -- {{{
    StaticPopupDialogs["RaidOrganizer_EDITLABEL"] = { --{{{
        text = L["EDIT_LABEL"],
        button1 = TEXT(SAVE),
        button2 = TEXT(CANCEL),
        OnAccept = function(a,b,c)
            self:SaveNewLabel(change_id, getglobal(this:GetParent():GetName().."EditBox"):GetText())
        end,
        OnHide = function()
            getglobal(this:GetName().."EditBox"):SetText("")
        end,
        OnShow = function()
            if grouplabels[change_id] ~= nil then
                getglobal(this:GetName().."EditBox"):SetText(grouplabels[change_id])
            end
        end,
	EditBoxOnEnterPressed = function()
            self:SaveNewLabel(change_id, this:GetText())
            this:GetParent():Hide()
        end,
        EditBoxOnEscapePressed = function()
            this:GetParent():Hide();
        end,
        timeout = 0,
        whileDead = 1,
        hideOnEscape = 1,
        hasEditBox = 1,
    }; --}}}
    StaticPopupDialogs["RaidOrganizer_SETSAVEAS"] = { --{{{
        text = L["SET_SAVEAS"],
        button1 = TEXT(SAVE),
        button2 = TEXT(CANCEL),
        OnAccept = function()
            -- button gedrueckt, auf GetName/GetParent achten
            self:SetSaveAs(getglobal(this:GetParent():GetName().."EditBox"):GetText())
        end,
        OnHide = function()
            getglobal(this:GetName().."EditBox"):SetText("")
        end,
        OnShow = function()
        end,
	EditBoxOnEnterPressed = function()
            self:SetSaveAs(getglobal(this:GetParent():GetName().."EditBox"):GetText())
            this:GetParent():Hide()
        end,
        EditBoxOnEscapePressed = function()
            this:GetParent():Hide();
        end,
        timeout = 0,
        whileDead = 1,
        hideOnEscape = 1,
        hasEditBox = 1,
    }; --}}}
	if not RO_HybrideSpec then
		RO_HybrideSpec = {}
	end
	
	if not RO_CurrentSet then
		RO_CurrentSet = {L["SET_DEFAULT"], L["SET_DEFAULT"], L["SET_DEFAULT"], L["SET_DEFAULT"], L["SET_DEFAULT"], L["SET_DEFAULT"], L["SET_DEFAULT"], L["SET_DEFAULT"], L["SET_DEFAULT"]}
	end
	if not RO_RaiderTable then
		RO_RaiderTable = {}
	else
		self:RefreshRaiderTable()
	end
	for i = 1, TOTAL_TAB_NB do
		if RO_RaiderTable[i] == nil then
			RO_RaiderTable[i] = {}
		end
		if self.db.account.sets[i] == nil then
			self.db.account.sets[i] = {}
		end
		if RO_CurrentSet[i] == nil then
			RO_CurrentSet[i] = L["SET_DEFAULT"]
		end
	end
    
	if not RO_syncTab then
		RO_syncTab = {false, false, false, false, false, false, false, false, false}
	end
	
	RO_CLASS_COLOR["SHAMAN"].r = 0.0
	RO_CLASS_COLOR["SHAMAN"].g = 0.44
	RO_CLASS_COLOR["SHAMAN"].b = 0.87
	
    RaidOrganizerDialogEinteilungTitle:SetText(L["ARRANGEMENT"])
	
    for i=1, 40 do
        getglobal("RaidOrganizerDialogEinteilungRaiderpoolSlot"..i.."Label"):SetText(L["FREE"])
    end
    RaidOrganizerDialogEinteilungOptionenTitle:SetText(L["OPTIONS"])
    RaidOrganizerDialogEinteilungOptionenAutofill:SetText(L["AUTOFILL"])
	RaidOrganizerDialogEinteilungOptionenMultipleArrangementCheckBoxText:SetText(L["MULTIPLE_ARRANGEMENT"])
	RaidOrganizerDialogEinteilungOptionenDisplayGroupNbText:SetText("显示成员队伍数")
    RaidOrganizerDialogEinteilungStatsTitle:SetText(L["STATS"])
    RaidOrganizerDialogEinteilungRest:SetText(L["REMAINS"])
    RaidOrganizerDialogEinteilungSetsTitle:SetText(L["LABELS"])
    RaidOrganizerDialogEinteilungSetsSave:SetText(TEXT(SAVE))
    RaidOrganizerDialogEinteilungSetsSaveAs:SetText(L["SAVEAS"])
    RaidOrganizerDialogEinteilungSetsDelete:SetText(TEXT(DELETE))
    RaidOrganizerDialogBroadcastTitle:SetText(L["BROADCAST"])
    RaidOrganizerDialogBroadcastChannel:SetText(L["CHANNEL"])
    RaidOrganizerDialogBroadcastRaid:SetText(L["RAID"])
    RaidOrganizerDialogBroadcastWhisperText:SetText(L["WHISPER"]) -- api changed?
	RaidOrganizerDialogBroadcastAutoSyncText:SetText("同步发送")
	RaidOrganizerDialogBroadcastAutoSync:SetChecked(false)
	RaidOrganizerDialogBroadcastSync:SetText("询问同步")
    RaidOrganizerDialogClose:SetText(L["CLOSE"])
    RaidOrganizerDialogReset:SetText(L["RESET"])
	RaidOrganizerDialogResetTab:SetText(L["RESETTAB"])
	RaidOrganizerDialogAllRemain:SetText(L["ALLREMAIN"])
	
	RaidOrganizer_Tabs = {
			{ "治疗分配", "Interface\\Icons\\Spell_Holy_Heal"},
			{ "坦克分配", "Interface\\Icons\\INV_Shield_17" },
			{ "打断分配", "Interface\\Icons\\Ability_Kick" },
			{ "控制技能分配", "Interface\\Icons\\spell_nature_polymorph" },
			{ "术士诅咒分配", "Interface\\Icons\\Spell_Shadow_ChillTouch" },
			{ "智力Buff分配", "Interface\\Icons\\spell_holy_magicalsentry" },
			{ "耐力Buff分配", "Interface\\Icons\\spell_holy_wordfortitude" },
			{ "爪子Buff分配", "Interface\\Icons\\spell_nature_regeneration" },
			{ "定位分配", "Interface\\Icons\\Ability_hunter_pathfinding"},
			{ "Raid 自动填充", "Interface\\Icons\\Spell_holy_prayerofhealing"},
			{ "角色", "Interface\\Icons\\Ability_Rogue_Disguise"}
	};
		
	for i = 1, TOTAL_TAB_NB, 1 do
		getglobal("RaidOrganizer_Tab" .. i).tooltiptext = RaidOrganizer_Tabs[i][1];
		getglobal("RaidOrganizer_Tab" .. i):SetNormalTexture(RaidOrganizer_Tabs[i][2]);
		getglobal("RaidOrganizer_Tab" .. i):Show();
		if i <= SYNC_TAB_NB then
			getglobal("RaidOrganizerButtonsBarTab" .. i).tooltiptext = RaidOrganizer_Tabs[i][1];
			getglobal("RaidOrganizerButtonsBarTab" .. i):SetNormalTexture(RaidOrganizer_Tabs[i][2]);
		end
	end

	RaidOrganizer_SetTab(1);
	for grp = 1,  MAX_GROUP_NB do
		if RaidOrganizer.SLOT_PER_GROUP_PER_TAB[1][grp] == 0 then
			getglobal("RaidOrganizerDialogEinteilungHealGroup" .. grp):Hide();
		else
			for slot = RaidOrganizer.SLOT_PER_GROUP_PER_TAB[1][grp], 30 do
				getglobal("RaidOrganizerDialogEinteilungHealGroup" .. grp .. "Slot" .. slot):Hide();
			end
		end
	end
    -- standard fuer dropdown setzen
    UIDropDownMenu_SetSelectedValue(RaidOrganizerDialogEinteilungSetsDropDown, RO_CurrentSet[RaidOrganizerDialog.selectedTab], RO_CurrentSet[RaidOrganizerDialog.selectedTab]);
	
	RaidOrganizer:SetBarTexture(self.db.char.barBackground)
	RaidOrganizer:SetBarEdge(self.db.char.barEdges)
	RaidOrganizerButtonsBar:SetScale(tonumber(self.db.char.scale))
	self:ResizeBar(self.db.char.rows, self.db.char.spacing)
	self:ShowBar()
	
	dewdrop:Register(RaidOrganizerButtonsBar, 'children', self.options.args.barDisplay)
	
    self:LoadCurrentLabels()
	
	if not self.version then self.version = GetAddOnMetadata("RaidOrganizer", "Version") end
	RaidOrganizer.RO_version_table = {}

	-- RaidOrganizerMinimapButton_OnInitialize()
	
	if not UnitInRaid('player') then
		IsPlayerInRaid = false
		if self:IsActive() then
			self:ToggleActive()
		end
	else
		IsPlayerInRaid = true
		if not self:IsActive() then
			self:ToggleActive()
		end
	end
	if self:IsActive() then
		self:OnEnable()
	else
		self:OnDisable()
	end

	if RaidOrganizerDialog:IsShown() then
		self:UpdateDialogValues()
	end
end -- }}}

function RaidOrganizer:OnEnable() -- {{{
    -- Called when the addon is enabled
	self:RegisterEvent("CHAT_MSG_WHISPER")
	self:RegisterEvent("CHAT_MSG_ADDON")
	self:RegisterEvent("RAID_ROSTER_UPDATE")
	RaidOrganizerDialogEinteilungOptionenAutofill:Enable()
	RaidOrganizerDialogBroadcastSync:Enable()
	RaidOrganizerDialogBroadcastChannel:Enable()
	RaidOrganizerDialogBroadcastRaid:Enable()
	SendAddonMessage("ROVersion", tostring(self.version), 'RAID', sender)
	if RaidOrganizerDialog:IsShown() then
		self:UpdateDialogValues()
	end
	self:TriggerEvent("RaidOrganizer_Enabled")
end -- }}}

function RaidOrganizer:OnDisable() -- {{{
    -- Called when the addon is disabled
	self:UnregisterAllEvents();
	self:RegisterEvent("RAID_ROSTER_UPDATE")
	self:ResetData();
	RaidOrganizerDialogEinteilungOptionenAutofill:Disable()
	RaidOrganizerDialogBroadcastSync:Disable()
	RaidOrganizerDialogBroadcastChannel:Disable()
	RaidOrganizerDialogBroadcastRaid:Disable()
	self:TriggerEvent("RaidOrganizer_Disabled")
end -- }}}

function RaidOrganizer:RefreshRaiderTable()
	if UnitInRaid('player') then
		for i = 1, TOTAL_TAB_NB do
			if RO_RaiderTable[i] then
				for name in RO_RaiderTable[i] do
					if not UnitExists(self:GetUnitByName(name)) then
						RO_RaiderTable[i][name] = nil
					end
				end
			end
		end
	else
		if self:IsActive() then
			self:ToggleActive()
		end
		self:ResetData()
	end
end

function RaidOrganizer:RefreshTables() --{{{
    stats = {
        DRUID = 0,
        PRIEST = 0,
        PALADIN = 0,
        SHAMAN = 0,
		WARRIOR = 0,
		ROGUE = 0,
		MAGE = 0,
		WARLOCK = 0,
		HUNTER = 0,
    }
    local gruppen = {0,0,0,0,0,0,0,0,0,0,}
	
	groupByName = {}
	
	if self:IsActive() then
		for i=1, MAX_RAID_MEMBERS do
			if UnitExists("raid"..i) then
				local class,engClass = UnitClass("raid"..i)
				local unitname, _, subgroup = GetRaidRosterInfo(i)
				if subgroup ~= nil and unitname ~= nil then
					groupByName[unitname] = subgroup
				end
				local isClassInTab = nil
				local InGroup = nil
				for j=1, table.getn(classTab[RaidOrganizerDialog.selectedTab]) do
					if engClass == classTab[RaidOrganizerDialog.selectedTab][j] then
						if RO_RaiderTable[RaidOrganizerDialog.selectedTab][unitname] then
							if RO_RaiderTable[RaidOrganizerDialog.selectedTab][unitname][1] == nil then
								for k=1, MAX_GROUP_NB do
									if RO_RaiderTable[RaidOrganizerDialog.selectedTab][unitname][k+1] then
										if gruppen[k+1] >= self.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][k] then
											RO_RaiderTable[RaidOrganizerDialog.selectedTab][unitname][k+1] = nil
										else
											InGroup = 1
										end
									end
								end
								if InGroup == nil or RaidOrganizerDialogEinteilungOptionenMultipleArrangementCheckBox:GetChecked() == 1 then
									RO_RaiderTable[RaidOrganizerDialog.selectedTab][unitname][1] = 1
								end
							elseif RaidOrganizerDialogEinteilungOptionenMultipleArrangementCheckBox:GetChecked() == 1 then
								for k=1, MAX_GROUP_NB do
									if RO_RaiderTable[RaidOrganizerDialog.selectedTab][unitname][k+1] then
										if gruppen[k+1] >= self.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][k] then
											RO_RaiderTable[RaidOrganizerDialog.selectedTab][unitname][k+1] = nil
										end
									end
								end
							end
						else
							RO_RaiderTable[RaidOrganizerDialog.selectedTab][unitname]={}
							RO_RaiderTable[RaidOrganizerDialog.selectedTab][unitname][1] = 1
						end
						for k=1, MAX_GROUP_NB + 1 do
							if RO_RaiderTable[RaidOrganizerDialog.selectedTab][unitname][k] then
								gruppen[k] = gruppen[k] + 1
							end
						end
						stats[engClass] = stats[engClass] + 1 
						isClassInTab = 1
					end
				end
				if not isClassInTab then
					RO_RaiderTable[RaidOrganizerDialog.selectedTab][unitname] = nil
				end
				position[unitname] = {}
				for k=1, MAX_GROUP_NB + 1 do
					table.insert(position[unitname], 0)
				end
			end
		end
	end

    einteilung = {}
	for i=1, MAX_GROUP_NB + 1 do
		table.insert(einteilung, {})
	end

    for name, groupTable in pairs(RO_RaiderTable[RaidOrganizerDialog.selectedTab]) do
		for i=1, MAX_GROUP_NB + 1 do
			if groupTable[i] then
				table.insert(einteilung[i], name)
			end
		end
    end
	
	groupIndex = 0
	
    local function SortEinteilung(a, b) --{{{
		if b == nil then return end
		if a == nil then return end
		local unitIDa = self:GetUnitByName(a)
		local unitIDb = self:GetUnitByName(b)
		local classA, engClassA = UnitClass(unitIDa)
		local classB, engClassB = UnitClass(unitIDb)
		if engClassA ~= engClassB then
				if engClassA == "WARRIOR" then return true end
				if engClassB == "WARRIOR" then return false end
				if engClassA == "ROGUE" then return true end
				if engClassB == "ROGUE" then return false end
				if engClassA == "MAGE" then return true end
				if engClassB == "MAGE" then return false end
				if engClassA == "WARLOCK" then return true end
				if engClassB == "WARLOCK" then return false end
				if engClassA == "HUNTER" then return true end
				if engClassB == "HUNTER" then return false end
				if engClassA == "PRIEST" then return true end
				if engClassB == "PRIEST" then return false end
				if engClassA == "SHAMAN" then return true end
				if engClassB == "SHAMAN" then return false end
				if engClassA == "DRUID" then return true end
				if engClassB == "DRUID" then return false end
				if engClassA == "PALADIN" then return true end
				if engClassB == "PALADIN" then return false end
		else
				return a<b
		end
		return true
    end --}}}
    for key, _ in pairs(einteilung) do
		local hasGroupClass = false
		local emptyGroupClassIdx = 0
		groupIndex = key
        table.sort(einteilung[key], SortEinteilung)
        for index, name in pairs(einteilung[key]) do
			if not position[name] then
				for i=1, MAX_GROUP_NB + 1 do
					table.insert(position[name], 0)
				end
			end
            position[name][key] = index
			hasGroupClass = false
			emptyGroupClassIdx = 0
			if key ~= 1 then 
				local subgroupStr = "Group" .. groupByName[name]
				local _, engClass = UnitClass(self:GetUnitByName(name))
				for i=1, self.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][key - 1] do
					if emptyGroupClassIdx == 0 and groupclasses[key - 1][i] == nil and einteilung[key][i] == nil then
						emptyGroupClassIdx = i
					elseif engClass == groupclasses[key - 1][i] or subgroupStr == groupclasses[key - 1][i] then
						if einteilung[key][i] == nil or UnitClass(self:GetUnitByName(einteilung[key][i])) ~= groupclasses[key - 1][i] or ("Group" .. groupByName[einteilung[key][i]]) ~= groupclasses[key - 1][i] then
							local tmpClass = groupclasses[key - 1][index]
							if engClass == groupclasses[key - 1][i] then
								groupclasses[key - 1][index] = engClass
							else
								groupclasses[key - 1][index] = subgroupStr
							end
							groupclasses[key - 1][i] = tmpClass
							hasGroupClass = true
							break
						end
					end
				end
				if (not hasGroupClass) and (emptyGroupClassIdx > 0) then
					local tmpClass = groupclasses[key - 1][index]
					groupclasses[key - 1][emptyGroupClassIdx] = tmpClass
					groupclasses[key - 1][index] = nil
				end
			end
        end
    end
end -- }}}

function RaidOrganizer_Tab_OnClick(idx)
	RaidOrganizer_SetTab(idx);
end

function RaidOrganizer_SetTab(idx)
	getglobal("RaidOrganizer_Tab" .. idx):SetChecked(1);
	for i=1,TOTAL_TAB_NB do
		if i ~= idx then
			getglobal("RaidOrganizer_Tab" .. i):SetChecked(nil);
		end
	end

	RaidOrganizerDialog.selectedTab = idx;
	RaidOrganizerDialogEinteilungTitle:SetText(RaidOrganizer_Tabs[idx][1]);
	UIDropDownMenu_SetSelectedValue(RaidOrganizerDialogEinteilungSetsDropDown, RO_CurrentSet[idx], RO_CurrentSet[idx]);
	RaidOrganizer:LoadCurrentLabels()
	RaidOrganizerDialogBroadcastSync:Enable()
	RaidOrganizerDialogBroadcastAutoSync:Enable()
	RaidOrganizerDialogBroadcastChannel:Enable()
	RaidOrganizerDialogBroadcastRaid:Enable()
	RaidOrganizerDialogEinteilungSetsSave:Enable()
	RaidOrganizerDialogEinteilungSetsSaveAs:Enable()
	RaidOrganizerDialogEinteilungSetsDelete:Enable()
	RaidOrganizerDialogEinteilungOptionenMultipleArrangementCheckBox:Enable()
	if RaidOrganizerDialog.selectedTab == RAID_FILL_TAB_INDEX then
		RaidOrganizerDialogBroadcastAutoSync:SetChecked(false)
		RaidOrganizerDialogBroadcastAutoSyncText:SetText("设置/获得布局")
		RaidOrganizerDialogBroadcastSync:SetText("获得团队布局")
		RaidOrganizerDialogEinteilungOptionenMultipleArrangementCheckBox:Disable()
		RaidOrganizerDialogEinteilungOptionenMultipleArrangementCheckBox:SetChecked(false)
		RaidOrganizerDialogEinteilungOptionenDisplayGroupNb:SetChecked(true)
		RaidOrganizerDialogBroadcastChannel:Disable()
		RaidOrganizerDialogBroadcastRaid:Disable()
	elseif RaidOrganizerDialog.selectedTab == ROLE_TAB_INDEX then
		RaidOrganizerDialogBroadcastSync:Disable()
		RaidOrganizerDialogBroadcastAutoSync:Disable()
		RaidOrganizerDialogEinteilungOptionenMultipleArrangementCheckBox:Disable()
		RaidOrganizerDialogBroadcastChannel:Disable()
		RaidOrganizerDialogBroadcastRaid:Disable()
		RaidOrganizerDialogEinteilungSetsSave:Disable()
		RaidOrganizerDialogEinteilungSetsSaveAs:Disable()
		RaidOrganizerDialogEinteilungSetsDelete:Disable()
		RaidOrganizerDialogEinteilungOptionenMultipleArrangementCheckBox:SetChecked(false)
		RaidOrganizerDialogEinteilungOptionenDisplayGroupNb:SetChecked(true)
	elseif RO_syncTab[idx] == true then
		RaidOrganizerDialogBroadcastSync:SetText("发送同步")
		RaidOrganizerDialogBroadcastAutoSyncText:SetText("同步发送")
		RaidOrganizerDialogBroadcastAutoSync:SetChecked(true)
	else
		RaidOrganizerDialogBroadcastSync:SetText("询问同步")
		RaidOrganizerDialogBroadcastAutoSyncText:SetText("同步发送")
		RaidOrganizerDialogBroadcastAutoSync:SetChecked(false)
	end
	
	RaidOrganizer:UpdateDialogValues();
end

function RaidOrganizer:Dialog() -- {{{
    if GetNumRaidMembers() == 0 then
        self:ResetData()
    end
    
    if RaidOrganizerDialog:IsShown() then
        RaidOrganizerDialog:Hide()
    else
		self:UpdateDialogValues()
        RaidOrganizerDialog:Show()
    end
end -- }}}

function RaidOrganizer:UpdateLayoutSize()
	local function updateAnchor()
		RaidOrganizerDialogEinteilungHealGroup2:SetPoint("TOPLEFT", getglobal("RaidOrganizerDialogEinteilungHealGroup1"), "TOPRIGHT", 10, 0 )
		RaidOrganizerDialogEinteilungHealGroup3:SetPoint("TOPLEFT", getglobal("RaidOrganizerDialogEinteilungHealGroup2"), "TOPRIGHT", 10, 0 )
		RaidOrganizerDialogEinteilungHealGroup4:SetPoint("TOPLEFT", getglobal("RaidOrganizerDialogEinteilungHealGroup1"), "BOTTOMLEFT", 0, -16 )
		RaidOrganizerDialogEinteilungHealGroup5:SetPoint("TOPLEFT", getglobal("RaidOrganizerDialogEinteilungHealGroup4"), "TOPRIGHT", 10, 0 )
		RaidOrganizerDialogEinteilungHealGroup6:SetPoint("TOPLEFT", getglobal("RaidOrganizerDialogEinteilungHealGroup5"), "TOPRIGHT", 10, 0 )
		RaidOrganizerDialogEinteilungHealGroup7:SetPoint("TOPLEFT", getglobal("RaidOrganizerDialogEinteilungHealGroup4"), "BOTTOMLEFT", 0, -16 )
		RaidOrganizerDialogEinteilungHealGroup8:SetPoint("TOPLEFT", getglobal("RaidOrganizerDialogEinteilungHealGroup7"), "TOPRIGHT", 10, 0 )
	end
	local function resizeLayout(size, moreRemain)

		for group = 1,  MAX_GROUP_NB do
			for slot = 1, 30 do
				getglobal("RaidOrganizerDialogEinteilungHealGroup" .. group .. "Slot" .. slot):SetWidth(size)
			end
			getglobal("RaidOrganizerDialogEinteilungHealGroup".. group):SetWidth(size)
		end
		if moreRemain then
			RaidOrganizerDialogEinteilungRaiderpool:SetWidth(2*size)
		else
			RaidOrganizerDialogEinteilungRaiderpool:SetWidth(size)
		end
		for i=1, 80 do	
			if i < 41 then
				getglobal("RaidOrganizerDialogEinteilungRaiderpoolSlot"..i):SetWidth(size)
				if i > 24 then
					if moreRemain then
						getglobal("RaidOrganizerDialogEinteilungRaiderpoolSlot"..i):Show()
					else
						getglobal("RaidOrganizerDialogEinteilungRaiderpoolSlot"..i):Hide()
					end
				end
			end
			getglobal("RaidOrganizerDialogButton"..i):SetWidth(size)
		end
	end
	
	--if too many people in raid
	local total_remain = 0
	if einteilung[1] then 
		total_remain = table.getn(einteilung[1])
	end
	updateAnchor()
	if RaidOrganizerDialog.selectedTab == RAID_PLACEMENT_TAB_INDEX then
		if RaidOrganizerDialogEinteilungHealGroup1:GetWidth() ~= 140 then
			resizeLayout(70, true)
			RaidOrganizerDialogEinteilungHealGroup2:SetPoint("TOPLEFT", RaidOrganizerDialogEinteilungHealGroup1, "TOPRIGHT", 10, 0 )
			for i=1, MAX_GROUP_NB do
				getglobal("RaidOrganizerDialogEinteilungHealGroup".. i):SetWidth(140)
			end
		end
	elseif RaidOrganizerDialog.selectedTab == ROLE_TAB_INDEX then
		if total_remain > 24 and RaidOrganizerDialogEinteilungHealGroup1:GetWidth() ~= 65 then
			resizeLayout(65, true)
		elseif total_remain <= 24 and RaidOrganizerDialogEinteilungHealGroup1:GetWidth() ~= 80 then
			resizeLayout(80, false)
		end
		RaidOrganizerDialogEinteilungHealGroup2:SetPoint("TOPLEFT", getglobal("RaidOrganizerDialogEinteilungHealGroup1"), "TOPRIGHT", 10, 0 )
		RaidOrganizerDialogEinteilungHealGroup3:SetPoint("TOPLEFT", getglobal("RaidOrganizerDialogEinteilungHealGroup2"), "TOPRIGHT", 10, 0 )
		RaidOrganizerDialogEinteilungHealGroup4:SetPoint("TOPLEFT", getglobal("RaidOrganizerDialogEinteilungHealGroup3"), "TOPRIGHT", 10, 0 )
	elseif total_remain > 24 and RaidOrganizerDialogEinteilungHealGroup1:GetWidth() ~= 80 then
		resizeLayout(80, true)
	elseif total_remain <= 24 and RaidOrganizerDialogEinteilungHealGroup1:GetWidth() ~= 98 then
		resizeLayout(98, false)
	end
	
	local classes = classTab[RaidOrganizerDialog.selectedTab]
	for group = 1,  MAX_GROUP_NB do
		if RaidOrganizer.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][group] == 0 then
			getglobal("RaidOrganizerDialogEinteilungHealGroup" .. group):Hide();
		else
			getglobal("RaidOrganizerDialogEinteilungHealGroup" .. group):Show();
			getglobal("RaidOrganizerDialogEinteilungHealGroup" .. group):SetHeight(131-(10-RaidOrganizer.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][group])*13)
			for slot = 1, 30 do
				if slot > RaidOrganizer.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][group] then
					getglobal("RaidOrganizerDialogEinteilungHealGroup" .. group .. "Slot" .. slot):Hide();
				else
					getglobal("RaidOrganizerDialogEinteilungHealGroup" .. group .. "Slot" .. slot):Show();
				end
			end
		end
	end
	if(GetNumRaidMembers() == 0) then
		getglobal("RaidOrganizerDialogEinteilungStatsClass" .. 1):SetText("不在团队中")
		getglobal("RaidOrganizerDialogEinteilungStatsClass" .. 1):SetTextColor(1,0,0)
		RaidOrganizerDialogEinteilungStats:SetHeight(37)
		for i=2, 8 do
			getglobal("RaidOrganizerDialogEinteilungStatsClass" .. i):SetText("")
		end
	else
		for i=1, 8 do
			if i <= table.getn(classes) then
				getglobal("RaidOrganizerDialogEinteilungStatsClass" .. i):SetText(L[classes[i]]..": "..stats[classes[i]])
				getglobal("RaidOrganizerDialogEinteilungStatsClass" .. i):SetTextColor(RO_CLASS_COLOR[classes[i]].r,
															   RO_CLASS_COLOR[classes[i]].g,
															   RO_CLASS_COLOR[classes[i]].b)
			else
				getglobal("RaidOrganizerDialogEinteilungStatsClass" .. i):SetText("")
			end
		end
		local autoSizeStatsLUT = {37, 37, 57, 57, 75, 75, 94, 94}
		RaidOrganizerDialogEinteilungStats:SetHeight(autoSizeStatsLUT[table.getn(classTab[RaidOrganizerDialog.selectedTab])])
	end
end

function RaidOrganizer:UpdateGroupClassTextures()
	for j=1, MAX_GROUP_NB do
		if self.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][j] > 0 then
			for i=1, self.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][j] do
				local slotlabel = getglobal("RaidOrganizerDialogEinteilungHealGroup"..j.."Slot"..i.."Label")
				local slotbutton = getglobal("RaidOrganizerDialogEinteilungHealGroup"..j.."Slot"..i.."Color")
				slotlabel:SetText(self:GetLabelByClass(groupclasses[j][i]))
				local color = RO_CLASS_COLOR[groupclasses[j][i]];
				if color then
					slotbutton:SetTexture(color.r/1.5, color.g/1.5, color.b/1.5, 0.5)
				else
					local group = 1
					if groupclasses[j][i] == nil then
						slotbutton:SetTexture(0.1, 0.1, 0.1)
					else
						local _,_,group = string.find(groupclasses[j][i], "Group(%d)")
						if group then 
							slotbutton:SetTexture(1/group, 0, 0, 0.5)
						else
							slotbutton:SetTexture(0.1, 0.1, 0.1)
						end
					end
				end
			end
		end
    end
end

function RaidOrganizer:UpdateRaiderLayout()
	for i=1, 80 do
        getglobal("RaidOrganizerDialogButton"..i):ClearAllPoints()
        getglobal("RaidOrganizerDialogButton"..i):Hide()
    end
    local zaehler = 1
    -- Rest {{{
    for i=1, table.getn(einteilung[1]) do
        if zaehler > 80 then
            break
        end
        local button = getglobal("RaidOrganizerDialogButton"..zaehler)
        local buttonlabel = getglobal(button:GetName().."Label")
        local buttoncolor = getglobal(button:GetName().."Color")

		if RaidOrganizerDialogEinteilungOptionenDisplayGroupNb:GetChecked() == 1 then
			buttonlabel:SetText(einteilung[1][i] .. "(" .. groupByName[einteilung[1][i]] .. ")")
		else
			buttonlabel:SetText(einteilung[1][i])
		end
        local class, engClass = UnitClass(self:GetUnitByName(einteilung[1][i]))
        local color = RO_CLASS_COLOR[engClass];
        if color then
			if RO_RaiderTable[RaidOrganizerDialog.selectedTab][einteilung[1][i]][1] == 0 then
				buttoncolor:SetTexture(color.r/3, color.g/3, color.b/3)
				buttonlabel:SetTextColor(0.5, 0.5, 0.5)
			else
				buttoncolor:SetTexture(color.r, color.g, color.b)
				buttonlabel:SetTextColor(1.0, 0.84, 0)
			end
        end

        button:SetPoint("TOP", "RaidOrganizerDialogEinteilungRaiderpoolSlot"..i)
        button:Show()

        button.username = einteilung[1][i]
        zaehler = zaehler + 1
    end

    for j=1, MAX_GROUP_NB do
		if self.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][j] > 0 then
			for i=1, table.getn(einteilung[j+1]) do
				if zaehler > 80 then
					break
				end
				local button = getglobal("RaidOrganizerDialogButton"..zaehler)
				local buttonlabel = getglobal(button:GetName().."Label")
				local buttoncolor = getglobal(button:GetName().."Color")
				if RaidOrganizerDialogEinteilungOptionenDisplayGroupNb:GetChecked() == 1 then
					buttonlabel:SetText(einteilung[j+1][i] .. "(" .. groupByName[einteilung[j+1][i]] .. ")")
				else
					buttonlabel:SetText(einteilung[j+1][i])
				end
				buttonlabel:SetTextColor(1.0, 0.84, 0)
				local class, engClass = UnitClass(self:GetUnitByName(einteilung[j+1][i]))
				local color = RO_CLASS_COLOR[engClass];
				if color then
					buttoncolor:SetTexture(color.r, color.g, color.b)
				end
				button:SetPoint("TOP", "RaidOrganizerDialogEinteilungHealGroup"..j.."Slot"..i)
				button:Show()
				
				button.username = einteilung[j+1][i]
				zaehler = zaehler + 1
			end
		end
    end
end

function RaidOrganizer:UpdateLabelsAndSetsLayout()
	RaidOrganizerDialogEinteilungRaiderpoolLabel:SetText(grouplabels["Rest"])
    for i=1, MAX_GROUP_NB do
		if self.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][i] > 0 then
			getglobal("RaidOrganizerDialogEinteilungHealGroup"..i.."Label"):SetText(self:ReplaceTokens(grouplabels[i]))
		end
    end

    RaidOrganizerDialogBroadcastChannelEditbox:SetText(self.db.char.chan)

	
    local function RaidOrganizer_changeSet(set)
        UIDropDownMenu_SetSelectedValue(RaidOrganizerDialogEinteilungSetsDropDown, set, set)
        -- RO_RaiderTable temp save
        tempsetup[RO_CurrentSet[RaidOrganizerDialog.selectedTab]] = {} -- komplett neu bzw. ueberschreiben
        for name, einteilung in pairs(RO_RaiderTable[RaidOrganizerDialog.selectedTab]) do
			tempsetup[RO_CurrentSet[RaidOrganizerDialog.selectedTab]][name]={}
            for i = 1, MAX_GROUP_NB + 1 do
				tempsetup[RO_CurrentSet[RaidOrganizerDialog.selectedTab]][name][i] = einteilung[i]
			end
        end
        RO_CurrentSet[RaidOrganizerDialog.selectedTab] = set
        self:LoadCurrentLabels()
		self:RefreshTables()
		self:UpdateGroupClassTextures()
		self:UpdateLabelsAndSetsLayout()
    end
    local function RaidOrganizerDropDown_Initialize()
        local selectedValue = UIDropDownMenu_GetSelectedValue(RaidOrganizerDialogEinteilungSetsDropDown)  
        local info

        for key, value in pairs(self.db.account.sets[RaidOrganizerDialog.selectedTab]) do
            info = {}
            info.text = key
            info.value = key
            info.func = RaidOrganizer_changeSet
            info.arg1 = key
            if ( info.value == selectedValue ) then 
                info.checked = 1; 
            end
            UIDropDownMenu_AddButton(info);
        end
    end
    -- }}} 
    UIDropDownMenu_Initialize(RaidOrganizerDialogEinteilungSetsDropDown, RaidOrganizerDropDown_Initialize); 
    UIDropDownMenu_Refresh(RaidOrganizerDialogEinteilungSetsDropDown)
    UIDropDownMenu_SetWidth(150, RaidOrganizerDialogEinteilungSetsDropDown);
end
function RaidOrganizer:UpdateDialogValues() -- {{{
	self:UpdateLayoutSize()
	self:RefreshTables()
	self:UpdateGroupClassTextures()
	self:UpdateRaiderLayout()
	self:UpdateLabelsAndSetsLayout()
end -- }}}

function RaidOrganizer:ResetTab() -- {{{
    RO_RaiderTable[RaidOrganizerDialog.selectedTab] = {}
	einteilung = {}
    groupclasses = {}
    for i=1, MAX_GROUP_NB do
        groupclasses[i] = {}
    end
    self:UpdateDialogValues()
	self:TriggerEvent("RaidOrganizer_OnTooltipUpdate")
end -- }}}

function RaidOrganizer:ResetData() -- {{{
	RO_RaiderTable = {}
	for i=1, TOTAL_TAB_NB do
		table.insert(RO_RaiderTable, {})
	end
	einteilung = {}
	if RaidOrganizerDialog:IsShown() then
		self:UpdateDialogValues()
	end
	self:TriggerEvent("RaidOrganizer_OnTooltipUpdate")
end -- }}}

function RaidOrganizer:BroadcastChan() --{{{
    if GetNumRaidMembers() == 0 then
        self:ErrorMessage(L["NOT_IN_RAID"])
        return;
    end
    local id, name = GetChannelName(self.db.char.chan)
    local messages = self:BuildMessages()
    for _, message in pairs(messages) do
		ChatThrottleLib:SendChatMessage("NORMAL", nil, message, "CHANNEL", nil, id)
    end
    self:SendToRaiders()
end -- }}}

function RaidOrganizer:BroadcastRaid() -- {{{
    if GetNumRaidMembers() == 0 then
        self:CustomPrint(1, 0.2, 0.2, self.printFrame, nil, " ", L["NOT_IN_RAID"])
        return;
    end
    local messages = self:BuildMessages()
    for _, message in pairs(messages) do
        ChatThrottleLib:SendChatMessage("NORMAL", nil, message, "RAID")
    end
    self:SendToRaiders()
end -- }}}

function RaidOrganizer:BuildMessages() -- {{{
    local messages = {}
    table.insert(messages, L["HEALARRANGEMENT" .. tostring(RaidOrganizerDialog.selectedTab)]..":")
    for i=1, MAX_GROUP_NB do 
		if self.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][i] > 0 then
			local header = getglobal("RaidOrganizerDialogEinteilungHealGroup"..i.."Label"):GetText()
			if getn(einteilung[i+1]) ~= 0 then
				local names={}
				for _, name in pairs(einteilung[i+1]) do
					if UnitExists(self:GetUnitByName(name)) then
						table.insert(names, name)
					end
				end
				table.insert(messages, getglobal("RaidOrganizerDialogEinteilungHealGroup".. tostring(i) .."Label"):GetText()..": "..table.concat(names, ", "))
			end
		end
    end
    local action = RaidOrganizerDialogEinteilungRestAction:GetText()
    if "" == action then
        action = L["FFA"]
    end
   -- table.insert(messages, L["REMAINS"]..": "..action)
    -- }}}
   -- table.insert(messages, L["MSG_HEAL_FOR_ARRANGEMENT"])
    return messages
end -- }}}

function RaidOrganizer:SendToRaiders() -- {{{
    local whisper = RaidOrganizerDialogBroadcastWhisper:GetChecked()
    if whisper then
        for i=1, MAX_GROUP_NB do
			if self.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][i] then
				local header = getglobal("RaidOrganizerDialogEinteilungHealGroup"..i.."Label"):GetText()
				if getn(einteilung[i+1]) ~= 0 then
					for _, name in pairs(einteilung[i+1]) do
						if UnitExists(self:GetUnitByName(name)) then
							ChatThrottleLib:SendChatMessage("NORMAL", nil, string.format(L["ARRANGEMENT_FOR"], header), "WHISPER", nil, name)
						end
					end
				end
			end
        end
    end
end -- }}}

function RaidOrganizer:ChangeChan() -- {{{
    self.db.char.chan = RaidOrganizerDialogBroadcastChannelEditbox:GetText()
end -- }}}

function RaidOrganizer:RaiderOnClick(arg1)
	if arg1 == "RightButton" then
		local _,_,name = string.find(getglobal(this:GetName() .. "Label"):GetText(), "(%a+)")
		if RO_RaiderTable[RaidOrganizerDialog.selectedTab][name][1] ~= 0 then
			RO_RaiderTable[RaidOrganizerDialog.selectedTab][name][1] = 0
			for grp = 1, MAX_GROUP_NB do 
				if self.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][grp] > 0 then
					RO_RaiderTable[RaidOrganizerDialog.selectedTab][name][grp + 1] = nil
				end
			end
		else 
			RO_RaiderTable[RaidOrganizerDialog.selectedTab][name][1] = 1
		end
		self:UpdateDialogValues()
	end
end

function RaidOrganizer:RaiderOnDragStart() -- {{{
	local _,_,name = string.find(getglobal(this:GetName() .. "Label"):GetText(), "(%a+)")
	if RO_RaiderTable[RaidOrganizerDialog.selectedTab][name][1] == 0 then return end
    local cursorX, cursorY = GetCursorPosition()
    this:ClearAllPoints();
    this:SetPoint("CENTER", nil, "BOTTOMLEFT", cursorX*GetScreenHeightScale(), cursorY*GetScreenHeightScale());
    this:StartMoving()
    level_of_button = this:GetFrameLevel();
    this:SetFrameLevel(this:GetFrameLevel()+30)
end -- }}}

function RaidOrganizer:RaiderOnDragStop() -- {{{
	local _,_,name = string.find(getglobal(this:GetName() .. "Label"):GetText(), "(%a+)")
	if RO_RaiderTable[RaidOrganizerDialog.selectedTab][name][1] == 0 then return end
	
    this:SetFrameLevel(level_of_button)
    this:StopMovingOrSizing()
	
	local pools = {"RaidOrganizerDialogEinteilungRaiderpool"}
	for group = 1, MAX_GROUP_NB do
		for slot = 1, 30 do
			table.insert(pools, "RaidOrganizerDialogEinteilungHealGroup" .. group .. "Slot" .. slot)
		end
	end

    for _, pool in pairs(pools) do
		local _,_,group,slot = string.find(pool, "RaidOrganizerDialogEinteilungHealGroup(%d+)Slot(%d+)");
		group,slot = tonumber(group),tonumber(slot)
		if ( (group == nil) or (self.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][group] > 0 and (slot <= self.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][group]))) then
			poolframe = getglobal(pool)
			if MouseIsOver(poolframe) then
				if "RaidOrganizerDialogEinteilungRaiderpool" == pool then
					RO_RaiderTable[RaidOrganizerDialog.selectedTab][this.username][1] = 1
					for k=2, MAX_GROUP_NB + 1 do
						RO_RaiderTable[RaidOrganizerDialog.selectedTab][this.username][k]=nil
						position[this.username][k] = 0
					end
					position[this.username][1] = 0
				else
					if self.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][group] > 0 then
						lastAction["group"] = RO_RaiderTable[RaidOrganizerDialog.selectedTab][this.username]
						if RaidOrganizerDialogEinteilungOptionenMultipleArrangementCheckBox:GetChecked() == nil then
							for k=1, MAX_GROUP_NB + 1 do
								RO_RaiderTable[RaidOrganizerDialog.selectedTab][this.username][k] = nil
							end
						end
						RO_RaiderTable[RaidOrganizerDialog.selectedTab][this.username][group+1] = 1
						if slot >= 1 and slot <= self.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][group] then
							lastAction["name"] = this.username
							for k=1, MAX_GROUP_NB + 1 do
								if lastAction["group"][k] then
									lastAction["position"][k] = position[this.username][k]
								else
									lastAction["position"][k] = 0
								end
							end
							position[this.username][group+1] = slot
						end
					end
				end
				if RaidOrganizerDialog.selectedTab == ROLE_TAB_INDEX then
					local classLUT ={["WARRIOR"] = "TANK", ["DRUID"] = "HEALER",	["PRIEST"] = "HEALER", ["SHAMAN"] = "HEALER", ["PRIEST"] = "HEALER", ["PALADIN"] = "HEALER", ["ROGUE"] = "MELEE", ["MAGE"] = "CASTER", ["WARLOCK"] = "CASTER", ["HUNTER"] = "MELEE"}
					local rolePerGroup = {[1] = "TANK", [2] = "HEALER", [3] = "MELEE", [4] = "CASTER"}
					local _,engClass = UnitClass(self:GetUnitByName(name))
					if (group == nil) or classLUT[engClass] == rolePerGroup[group] then RO_HybrideSpec[name] = nil
					elseif classLUT[engClass] ~= rolePerGroup[group] then
						RO_HybrideSpec[name] = rolePerGroup[group]
					end
					self:UpdateTableFromRole(name, rolePerGroup[group], engClass)
				end
				break
			end
		end
    end
	self:TriggerEvent("RaidOrganizer_OnTooltipUpdate")
    self:UpdateDialogValues()
end -- }}}

function RaidOrganizer:RaiderOnLoad() -- {{{
    this:SetFrameLevel(this:GetFrameLevel() + 2)
	this:RegisterForClicks("RightButtonUp")
    this:RegisterForDrag("LeftButton")
end -- }}}

function RaidOrganizer:EditGroupLabel(group) -- {{{
    if group:GetID() == 0 then
        return
    end
    change_id = group:GetID()
    StaticPopup_Show("RaidOrganizer_EDITLABEL", group:GetID())    
end -- }}}

function RaidOrganizer:SaveNewLabel(id, text) -- {{{
    if id == 0 then
        return
    end
    if text == "" then
        return
    end
    if grouplabels[id] ~= nil then
        grouplabels[id] = text
		self:UpdateLabelsAndSetsLayout()
    end
end -- }}}

function RaidOrganizer:LoadLabelsFromSet(set) -- {{{
    if not set then
        return nil
    end
    if self.db.account.sets[RaidOrganizerDialog.selectedTab][set] then
        grouplabels.Rest = L["REMAINS"]
        groupclasses = {}
        for i=1, MAX_GROUP_NB do
			if self.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][i] > 0 then
				grouplabels[i] = self.db.account.sets[RaidOrganizerDialog.selectedTab][set].GroupNames[i]
				groupclasses[i] = {}
				for j=1, self.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][i] do
					groupclasses[i][j] = self.db.account.sets[RaidOrganizerDialog.selectedTab][set].GroupClasses[i][j]
				end
			end
        end
        RaidOrganizerDialogEinteilungRestAction:SetText(self.db.account.sets[RaidOrganizerDialog.selectedTab][set].Remaining)
        if tempsetup[set] then
            RO_RaiderTable[RaidOrganizerDialog.selectedTab] = {}
            for name, einteilung in pairs(tempsetup[set]) do
                RO_RaiderTable[RaidOrganizerDialog.selectedTab][name] = einteilung
            end
        end
        return true
    end
    return nil
end -- }}}

function RaidOrganizer:LoadCurrentLabels() -- {{{
    if not self:LoadLabelsFromSet(RO_CurrentSet[RaidOrganizerDialog.selectedTab]) then
        self:LoadLabelsFromSet(L["SET_DEFAULT"])
    end
end -- }}}

function RaidOrganizer:SetSave() -- {{{
    if RO_CurrentSet[RaidOrganizerDialog.selectedTab] == L["SET_DEFAULT"] then
        self:ErrorMessage(L["SET_CANNOT_SAVE_DEFAULT"])
        return
    end
    self.db.account.sets[RaidOrganizerDialog.selectedTab][RO_CurrentSet[RaidOrganizerDialog.selectedTab]].GroupNames = {}
    self.db.account.sets[RaidOrganizerDialog.selectedTab][RO_CurrentSet[RaidOrganizerDialog.selectedTab]].GroupClasses = {}
    for i=1, MAX_GROUP_NB do 
		if self.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][i] > 0 then
			self.db.account.sets[RaidOrganizerDialog.selectedTab][RO_CurrentSet[RaidOrganizerDialog.selectedTab]].GroupNames[i] = grouplabels[i]
			self.db.account.sets[RaidOrganizerDialog.selectedTab][RO_CurrentSet[RaidOrganizerDialog.selectedTab]].GroupClasses[i] = {}
			for j=1, self.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][i] do
				self.db.account.sets[RaidOrganizerDialog.selectedTab][RO_CurrentSet[RaidOrganizerDialog.selectedTab]].GroupClasses[i][j] = groupclasses[i][j]
			end
		end
    end
    self.db.account.sets[RaidOrganizerDialog.selectedTab][RO_CurrentSet[RaidOrganizerDialog.selectedTab]].Remaining = RaidOrganizerDialogEinteilungRestAction:GetText()
end -- }}}

function RaidOrganizer:SetSaveAs(name) -- {{{
    if not name then
        return
    end
    if name == "" then
        return
    end
    if name == L["SET_DEFAULT"] then
        self:ErrorMessage(L["SET_CANNOT_SAVE_DEFAULT"])
        return
    end
    local count = 0
    for a,b in pairs(self.db.account.sets[RaidOrganizerDialog.selectedTab]) do
        count = count+1
    end
    if count >= 32 then
        self:ErrorMessage(L["SET_TO_MANY_SETS"])
        return
    end
    if self.db.account.sets[RaidOrganizerDialog.selectedTab][name] then
        self:ErrorMessage(string.format(L["SET_ALREADY_EXISTS"], name))
        return
    end
    self.db.account.sets[RaidOrganizerDialog.selectedTab][name] = {}
    self.db.account.sets[RaidOrganizerDialog.selectedTab][name].Name = name
    self.db.account.sets[RaidOrganizerDialog.selectedTab][name].GroupNames = {}
    self.db.account.sets[RaidOrganizerDialog.selectedTab][name].GroupClasses = {}
    for i=1, MAX_GROUP_NB do
		if self.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][i] > 0 then
			self.db.account.sets[RaidOrganizerDialog.selectedTab][name].GroupNames[i] = grouplabels[i]
			self.db.account.sets[RaidOrganizerDialog.selectedTab][name].GroupClasses[i] = {}
			for j=1, self.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][i] do
				self.db.account.sets[RaidOrganizerDialog.selectedTab][name].GroupClasses[i][j] = groupclasses[i][j]
			end
		end
    end
    self.db.account.sets[RaidOrganizerDialog.selectedTab][name].Remaining = RaidOrganizerDialogEinteilungRestAction:GetText()
    RO_CurrentSet[RaidOrganizerDialog.selectedTab] = name
    self:LoadCurrentLabels()
    UIDropDownMenu_SetSelectedValue(RaidOrganizerDialogEinteilungSetsDropDown, RO_CurrentSet[RaidOrganizerDialog.selectedTab])
    UIDropDownMenu_Refresh(RaidOrganizerDialogEinteilungSetsDropDown)
	self:UpdateLabelsAndSetsLayout()
end -- }}}

function RaidOrganizer:SetDelete() -- {{{
    if RO_CurrentSet[RaidOrganizerDialog.selectedTab] == L["SET_DEFAULT"] then
        self:ErrorMessage(L["SET_CANNOT_DELETE_DEFAULT"])
        return
    end
    if not self.db.account.sets[RaidOrganizerDialog.selectedTab][RO_CurrentSet[RaidOrganizerDialog.selectedTab]] then
        return
    end
    self.db.account.sets[RaidOrganizerDialog.selectedTab][RO_CurrentSet[RaidOrganizerDialog.selectedTab]] = nil
    RO_CurrentSet[RaidOrganizerDialog.selectedTab] = L["SET_DEFAULT"]
    UIDropDownMenu_SetSelectedValue(RaidOrganizerDialogEinteilungSetsDropDown, RO_CurrentSet[RaidOrganizerDialog.selectedTab])
    self:LoadCurrentLabels()
    self:UpdateDialogValues()
end -- }}}

function RaidOrganizer:ErrorMessage(str) -- {{{
    if not str then
        return
    end
    if str == "" then
        return
    end
    self:CustomPrint(1, 0.2, 0.2, self.printFrame, nil, " ", str)
end -- }}}

function RaidOrganizer:BuildUnitIDs() -- {{{
    unitids = {}
    for i=1, MAX_RAID_MEMBERS do
        if UnitExists("raid"..i) then
            unitids[UnitName("raid"..i)] = "raid"..i
        end
    end
end -- }}}

function RaidOrganizer:GetUnitByName(str) -- {{{
    if not str then
        return nil
    end
    if not unitids[str] then
        self:BuildUnitIDs()
    end
    if not unitids[str] then
        return "raid41"
    end
    if str ~= UnitName(unitids[str]) then
        self:BuildUnitIDs()
    end
    return unitids[str]
end -- }}}

function RaidOrganizer:ReplaceTokens(str) -- {{{
    local function GetMainTankLabel(i) -- {{{
        if not i then
            return ""
        end
        if type(i) ~= "number" then
            return ""
        end
        if i < 1 or self.SLOT_PER_GROUP_PER_TAB[HEAL_TAB_INDEX][i] == 0 or i > MAX_GROUP_NB then
            return ""
        end
        local s = L["MT"]..i
        if CT_RATarget then
            if CT_RATarget.MainTanks[i] and
                UnitExists("raid"..CT_RATarget.MainTanks[i][1]) and
                UnitName("raid"..CT_RATarget.MainTanks[i][1]) == CT_RATarget.MainTanks[i][2]
                then
                s = s.."("..CT_RATarget.MainTanks[i][2]..")"      
            end
        elseif oRAOMainTank then
            if oRAOMainTank.core.maintanktable[i] and
                UnitExists(self:GetUnitByName(oRAOMainTank.core.maintanktable[i])) and
                UnitName(self:GetUnitByName(oRAOMainTank.core.maintanktable[i])) == oRAOMainTank.core.maintanktable[i]
                then
                s = oRAOMainTank.core.maintanktable[i]
            end
        end
        return s
    end -- }}}
    for i=1, MAX_GROUP_NB do
		if self.SLOT_PER_GROUP_PER_TAB[HEAL_TAB_INDEX][i] > 0 then
			str = string.gsub(str, "MT"..i, GetMainTankLabel(i))
		end
    end
    -- }}}
    return str
end -- }}}

function RaidOrganizer:CHAT_MSG_WHISPER(msg, user) -- {{{
    if GetNumRaidMembers() == 0 then
        return
    end
    if msg == "assign" then
        local reply = ""
		local noassign = true
		local first = true
		for i=1, SYNC_TAB_NB do
			first = true
        	if RO_RaiderTable[i][user] then
				for j=1, MAX_GROUP_NB do
					if self.SLOT_PER_GROUP_PER_TAB[i][j] > 0 then
						if RO_RaiderTable[i][user][j + 1] == 1 then
							if first then
								reply = reply .. " -*- " .. RaidOrganizer_Tabs[i][1] .. " " .. self.db.account.sets[i][RO_CurrentSet[i]].GroupNames[j]
								first = false
							else
								reply = reply .. " " .. self.db.account.sets[i][RO_CurrentSet[i]].GroupNames[j]
							end
							noassign = false
						end
					end
				end
			end
		end
		if noassign then
			reply = L["REPLY_NO_ARRANGEMENT"] .. " " .. reply
		else
			reply = L["REPLY_ARRANGEMENT_FOR"] .. " " .. reply
		end
        ChatThrottleLib:SendChatMessage("NORMAL", nil, reply, "WHISPER", nil, user)
    end
end -- }}}

function RaidOrganizer:CreateClassMenu(group, slot)
	local classArray = classTab[RaidOrganizerDialog.selectedTab];
	for i = 1, table.getn(classArray) do
		local class = classArray[i]
		dewdrop:AddLine( 'text', class,
						 'checked', groupclasses[group][slot] == class,
						 'func', function() if groupclasses[group][slot] == class then groupclasses[group][slot] = nil else groupclasses[group][slot] = class end self:RefreshTables(); self:UpdateGroupClassTextures(); dewdrop:Close() end)
	end
	if RaidOrganizerDialog.selectedTab == RAID_PLACEMENT_TAB_INDEX then 
		for i = 1, 8 do
		local class = "Group" .. tostring(i)
		dewdrop:AddLine( 'text', class,
						 'checked', groupclasses[group][slot] == class,
						 'func', function() if groupclasses[group][slot] == class then groupclasses[group][slot] = nil else groupclasses[group][slot] = class end self:RefreshTables(); self:UpdateGroupClassTextures(); dewdrop:Close() end)
		end
	end
end
function RaidOrganizer:GroupSlot_OnLoad()
	this:RegisterForClicks("RightButtonUp")
end

function RaidOrganizer:GroupSlot_OnClick(arg1)
	if arg1 == "RightButton" then
		local _,_, group, slot = string.find(this:GetName(), "RaidOrganizerDialogEinteilungHealGroup(%d+)Slot(%d+)")
		if group == nil or slot == nil then return end
		dewdrop:Open(this, 'children', function() self:CreateClassMenu(tonumber(group), tonumber(slot)) end)
	end
end

-- so mousewheel won't reach the frame underneath (RaidOrganizerDialogEinteilungHealGroupXSlotX)
function RaidOrganizer:RaiderOnMouseWheel(arg1)
	return
end

function RaidOrganizer:OnMouseWheel(richtung) -- {{{
    if not this then
        return
    end
	if RaidOrganizerDialog.selectedTab == ROLE_TAB_INDEX then return end
    local _,_,group,slot = string.find(this:GetName(), "RaidOrganizerDialogEinteilungHealGroup(%d+)Slot(%d+)")
    group,slot = tonumber(group),tonumber(slot)
    if not group or not slot then
        return
    end
    if group < 1 or group > MAX_GROUP_NB or self.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][group] == 0 or
        slot < 1 or slot > self.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][group] then
        return
    end
	local classdirection = {}
	for k,v in pairs(classTab[RaidOrganizerDialog.selectedTab]) do
		classdirection[k] = v;
	end
	if RaidOrganizerDialog.selectedTab == RAID_PLACEMENT_TAB_INDEX then
		for i = 1, 8 do
			table.insert(classdirection, "Group" .. i);
		end
	end
	table.insert(classdirection,1,"EMPTY");
    local pos = 1
    while (pos <= table.getn(classdirection)) do
        if groupclasses[group][slot] then
            if classdirection[pos] == groupclasses[group][slot] then
                break
            end
        else
            break
        end
        pos = pos + 1
    end
    pos = pos - richtung
    if 0 == pos then
        pos = table.getn(classdirection)
    end
    if table.getn(classdirection)+1 == pos then
        pos = 1
    end
    if "EMPTY" == classdirection[pos] then
        groupclasses[group][slot] = nil
    else
        groupclasses[group][slot] = classdirection[pos]
    end
	self:RefreshTables()
    self:UpdateGroupClassTextures()
end -- }}}

function RaidOrganizer:GetLabelByClass(class) -- {{{
    if (not class) or class == "" then
        return L["FREE"]
    end
    return L[class]
end -- }}}

function RaidOrganizer:MultipleArrangementCheckBox_OnClick()
	if RaidOrganizerDialog.selectedTab == RAID_FILL_TAB_INDEX then
		RaidOrganizerDialogEinteilungOptionenMultipleArrangementCheckBox:SetChecked(nil)
	end
	if RaidOrganizerDialogEinteilungOptionenMultipleArrangementCheckBox:GetChecked() == nil then
		for name, groupTable in pairs(RO_RaiderTable[RaidOrganizerDialog.selectedTab]) do
			local count = 0
			for i=2, MAX_GROUP_NB + 1 do
				if groupTable[i] then
					count = count + 1
					if (count > 1) then
						groupTable[i] = nil
					end
				end
			end
		end
	end
	self:UpdateDialogValues()
end

function RaidOrganizer:DisplayGroupNbCheckBox_OnClick()
	self:RefreshTables()
	self:UpdateRaiderLayout()
end


function RaidOrganizer:SortGroupClass()
	local function SortEinteilung(a, b) --{{{
		if b == nil then return true end
		if a == nil then return false end
		if a ~= b then
			if a == "WARRIOR" then return true end
			if b == "WARRIOR" then return false end
			if a == "ROGUE" then return true end
			if b == "ROGUE" then return false end
			if a == "MAGE" then return true end
			if b == "MAGE" then return false end
			if a == "WARLOCK" then return true end
			if b == "WARLOCK" then return false end
			if a == "HUNTER" then return true end
			if b == "HUNTER" then return false end
			if a == "PRIEST" then return true end
			if b == "PRIEST" then return false end
			if a == "SHAMAN" then return true end
			if b == "SHAMAN" then return false end
			if a == "DRUID" then return true end
			if b == "DRUID" then return false end
			if a == "PALADIN" then return true end
			if b == "PALADIN" then return false end
			if a == "Group1" then return true end
			if b == "Group1" then return false end
			if a == "Group2" then return true end
			if b == "Group2" then return false end
			if a == "Group3" then return true end
			if b == "Group3" then return false end
			if a == "Group4" then return true end
			if b == "Group4" then return false end
			if a == "Group5" then return true end
			if b == "Group5" then return false end
			if a == "Group6" then return true end
			if b == "Group6" then return false end
			if a == "Group7" then return true end
			if b == "Group7" then return false end
			if a == "Group8" then return true end
			if b == "Group8" then return false end
			if a == "EMPTY" then return true end
			if b == "EMPTY" then return false end
		else
			return a<b
		end
		return true
    end --}}}
	for i=1, MAX_GROUP_NB do
		if self.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][i] > 0 then
			for j=1, self.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][i] do
				if groupclasses[i][j] == nil then groupclasses[i][j] = "EMPTY" end
			end
		end
	end
    for i=1, MAX_GROUP_NB do
		if self.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][i] > 0 then
			table.sort(groupclasses[i], SortEinteilung)
		end
	end
	for i=1, MAX_GROUP_NB do
		if self.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][i] > 0 then
			for j=1, self.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][i] do
				if groupclasses[i][j] == "EMPTY" then groupclasses[i][j] = nil end
			end
		end
	end
end

function RaidOrganizer:SetAllRemain()
	for key, value in pairs(RO_RaiderTable[RaidOrganizerDialog.selectedTab]) do
		for grp = 1, MAX_GROUP_NB do
			if self.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][grp] > 0 then
				value[grp + 1] = nil
			end
		end
	end
	einteilung = {}
	self:UpdateDialogValues()
	self:TriggerEvent("RaidOrganizer_OnTooltipUpdate")
end

function RaidOrganizer:AutoFill() -- {{{
	self:SortGroupClass()
	self:RefreshTables()
	local function shuffleTable( t )
		if not t then return end
		local rand = math.random 
		local iterations = table.getn(t)
		local j
		for i = iterations, 2, -1 do
			j = rand(i)
			t[i], t[j] = t[j], t[i]
		end
	end
	if RaidOrganizerDialog.selectedTab == ROLE_TAB_INDEX then self:RoleAutoComplete(); self:UpdateDialogValues(); return end
	if ((RaidOrganizerDialog.selectedTab == BUFF_MAGE_TAB_INDEX or RaidOrganizerDialog.selectedTab == BUFF_PRIEST_TAB_INDEX or RaidOrganizerDialog.selectedTab == BUFF_DRUID_TAB_INDEX)) then
		self:SetAllRemain()
		shuffleTable(einteilung[1])
		local nbBuffer = 0
		for i=1, table.getn(einteilung[1]) do
			if RO_RaiderTable[RaidOrganizerDialog.selectedTab][einteilung[1][i]][1] == 1 then
				nbBuffer = nbBuffer + 1
			end
		end
		local tableGroup = {}
		for group=1, MAX_GROUP_NB do
			if self.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][group] > 0 then
				for slot=1, self.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][group] do
					if groupclasses[group][slot] then
						table.insert(tableGroup, group)
						break
					end
				end
			end
		end
		local tableIndex = 1
		local progress = table.getn(tableGroup)/nbBuffer
		for _, name in pairs(einteilung[1]) do
			if RO_RaiderTable[RaidOrganizerDialog.selectedTab][name][1] == 1 then
				if tableIndex > table.getn(tableGroup) then break end
				while tableIndex <= progress do
					RO_RaiderTable[RaidOrganizerDialog.selectedTab][name][tableGroup[tableIndex]+1] = 1
					tableIndex = tableIndex + 1
				end
				progress = progress + table.getn(tableGroup)/nbBuffer
			end
		end
		self:UpdateDialogValues()
	else
		shuffleTable(einteilung[1])
		for group=1, MAX_GROUP_NB do
			if self.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][group] > 0 then
				for slot=1, self.SLOT_PER_GROUP_PER_TAB[RaidOrganizerDialog.selectedTab][group] do
					if groupclasses[group][slot] then
						if not einteilung[group+1][slot] then
							for key, name in pairs(einteilung[1]) do
								if RO_RaiderTable[RaidOrganizerDialog.selectedTab][name][1] == 1 then
									if RO_RaiderTable[RaidOrganizerDialog.selectedTab][name][group+1] == nil then
										local class, engClass = UnitClass(self:GetUnitByName(name))
										local _,_, grpIdx = string.find(groupclasses[group][slot], "Group(%d)")
										if engClass == groupclasses[group][slot] or tonumber(grpIdx) == groupByName[name] then
											RO_RaiderTable[RaidOrganizerDialog.selectedTab][name][group+1] = 1
											table.remove(einteilung[1], key)
											if RaidOrganizerDialogEinteilungOptionenMultipleArrangementCheckBox:GetChecked() == nil then
												RO_RaiderTable[RaidOrganizerDialog.selectedTab][name][1] = nil
											else
												table.insert(einteilung[1], name)
											end
											break;
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
	self:UpdateDialogValues()
	self:TriggerEvent("RaidOrganizer_OnTooltipUpdate")
end -- }}}

function RaidOrganizer:TabButton_OnClick(idx)
	RaidOrganizer_SetTab(idx);
	RaidOrganizer:Dialog()
end

function RaidOrganizer:ShowBar()
	if not RaidOrganizer.db.char.showBar then
		RaidOrganizerButtonsBar:Hide()
	else
		RaidOrganizerButtonsBar:Show()
	end
end

function RaidOrganizer:ResizeBar(nbRow, spacing)
	local rowTab = {1, 2, 3, 3, 5, 5, 5, 5, 9}
	local colTab = {9, 5, 3, 3, 2, 2, 2, 2, 1}
	local isHorizontal
	nbRow = rowTab[nbRow]
	local nbCol = colTab[nbRow]
	local it = 1
	for i=2, SYNC_TAB_NB do
		if it == nbCol then
			getglobal("RaidOrganizerButtonsBarTab" .. i):SetPoint("TOPLEFT", getglobal("RaidOrganizerButtonsBarTab" .. i - nbCol), "BOTTOMLEFT", 0, -spacing )
			it = 1
		else
			getglobal("RaidOrganizerButtonsBarTab" .. i):SetPoint("TOPLEFT", getglobal("RaidOrganizerButtonsBarTab" .. i - 1), "TOPRIGHT", spacing, 0 )
			it = it + 1
		end
	end
	RaidOrganizerButtonsBar:SetWidth( nbCol * (30 + spacing) - spacing + 10)
	RaidOrganizerButtonsBar:SetHeight( nbRow * (30 + spacing) - spacing + 10)
	RaidOrganizerButtonsBar:Show()
	self:UpdateAlpha()
end

function RaidOrganizer:SetBarTexture(bgfile)
	if barBackgroundTextures[bgfile] then 
		self.db.char.barBackground = bgfile; 
		ROBar_backdrop.bgFile = bgfile;
		RaidOrganizerButtonsBar:SetBackdrop(nil);
		RaidOrganizerButtonsBar:SetBackdrop(ROBar_backdrop);
		RaidOrganizerButtonsBar:SetBackdropColor(self.db.char.color.r, self.db.char.color.g, self.db.char.color.b, self.db.char.color.a)
	end
end

function RaidOrganizer:SetBarEdge(edgefile)
	if barBackgroundEdges[edgefile] then 
		self.db.char.barEdges = edgefile; 
		ROBar_backdrop.edgeFile = edgefile;
		RaidOrganizerButtonsBar:SetBackdrop(nil);
		RaidOrganizerButtonsBar:SetBackdrop(ROBar_backdrop);
		RaidOrganizerButtonsBar:SetBackdropColor(self.db.char.color.r, self.db.char.color.g, self.db.char.color.b, self.db.char.color.a)
	end
end


function RaidOrganizer:UpdateAlpha()
	local alphaValue = 1
	for i=1, SYNC_TAB_NB do 
		if newAttrib[i] == true then
			alphaValue = loadstring("return RaidOrganizer.db.char.icon" .. i .. "alphahighlight")()
		else
			alphaValue = loadstring("return RaidOrganizer.db.char.icon" .. i .. "alphanormal")()
		end
		getglobal("RaidOrganizerButtonsBarTab" .. i):SetAlpha(alphaValue)
	end
end

function RaidOrganizer:WriteTooltipText(idx)
	if not RaidOrganizer:IsActive() then return end
	newAttrib[idx] = false
	self:UpdateAlpha()
	GameTooltip:SetText(this.tooltiptext);
	local color = {1, 1, 1};
	GameTooltip:AddDoubleLine( "________", "____________", 1, 1, 1, 1, 1, 1);
	local playerNameTable = {}
	for group=1, MAX_GROUP_NB do
		if self.SLOT_PER_GROUP_PER_TAB[idx][group] > 0 then
			local groupName = self.db.account.sets[idx][RO_CurrentSet[idx]].GroupNames[group]
			if idx == HEAL_TAB_INDEX then
				groupName = self:ReplaceTokens(groupName)
			end
			if groupName == "CROSS" then
				color = {1, 0, 0};
			elseif groupName == "SQUARE" then
				color = {0, 0.5, 1};
			elseif groupName == "MOON" then
				color = {0.76, 0.92, 0.89};
			elseif groupName == "TRIANGLE" then
				color = {0, 1, 0};
			elseif groupName == "DIAMOND" then
				color = {1, 0, 1};
			elseif groupName == "CIRCLE" then
				color = {1, 0.5, 0};
			elseif groupName == "STAR" then
				color = {1, 1, 0};
			end
			
			playerNameTable = {}
			for nameChar in RO_RaiderTable[idx] do
				if RO_RaiderTable[idx][nameChar][group + 1] then
					local _, engClass = UnitClass(self:GetUnitByName(nameChar))
					if not (engClass == nil or engClass == "") then
						if playerNameTable[engClass] == nil then
							playerNameTable[engClass] = nameChar
						else
							playerNameTable[engClass] = playerNameTable[engClass] .. ", " .. nameChar
						end
						if UnitName('player') == nameChar then
							playerNameTable[engClass] = "--> " .. playerNameTable[engClass]
						end
					end
				end
			end
			local firstLine = true
			for _,engClassIt in pairs (classTab[idx]) do
				if not (playerNameTable[engClassIt] == nil) then
					if (firstLine == true) then
						GameTooltip:AddDoubleLine( groupName .. " : ", playerNameTable[engClassIt], color[1], color[2], color[3], RO_CLASS_COLOR[engClassIt].r, RO_CLASS_COLOR[engClassIt].g, RO_CLASS_COLOR[engClassIt].b);
						firstLine = false
					else
						GameTooltip:AddDoubleLine( "  ", playerNameTable[engClassIt], 0, 0, 0, RO_CLASS_COLOR[engClassIt].r, RO_CLASS_COLOR[engClassIt].g, RO_CLASS_COLOR[engClassIt].b);
					end
				end
			end
			if (firstLine == true) then 
				GameTooltip:AddDoubleLine( groupName .. " : ", "", color[1], color[2], color[3], 1, 1, 1);
			end
			GameTooltip:AddDoubleLine( "________", "____________", 1, 1, 1, 1, 1, 1);
		end
	end
	GameTooltip:Show()
end

function RaidOrganizer:UpdateTableFromRole(name, role, class)
	if class == "PRIEST" then
		if not RO_RaiderTable[HEAL_TAB_INDEX][name] then RO_RaiderTable[HEAL_TAB_INDEX][name] = {} end
		if not RO_RaiderTable[BUFF_PRIEST_TAB_INDEX][name] then RO_RaiderTable[BUFF_PRIEST_TAB_INDEX][name] = {} end
		if role == "HEALER" then 
			if RO_RaiderTable[HEAL_TAB_INDEX][name][1] == 0 then RO_RaiderTable[HEAL_TAB_INDEX][name][1] = 1; end
			if RO_RaiderTable[BUFF_PRIEST_TAB_INDEX][name][1] == 0 then RO_RaiderTable[BUFF_PRIEST_TAB_INDEX][name][1] = 1; end
		else
			RO_RaiderTable[HEAL_TAB_INDEX][name] = {};
			RO_RaiderTable[HEAL_TAB_INDEX][name][1] = 0;
			RO_RaiderTable[BUFF_PRIEST_TAB_INDEX][name] = {};
			RO_RaiderTable[BUFF_PRIEST_TAB_INDEX][name][1] = 0;
		end
	elseif class == "DRUID" then
		if not RO_RaiderTable[HEAL_TAB_INDEX][name] then RO_RaiderTable[HEAL_TAB_INDEX][name] = {} end
		if not RO_RaiderTable[BUFF_DRUID_TAB_INDEX][name] then RO_RaiderTable[BUFF_DRUID_TAB_INDEX][name] = {} end
		if not RO_RaiderTable[TANK_TAB_INDEX][name] then RO_RaiderTable[TANK_TAB_INDEX][name] = {} end
		if role == "HEALER" then 
			if RO_RaiderTable[HEAL_TAB_INDEX][name][1] == 0 then RO_RaiderTable[HEAL_TAB_INDEX][name][1] = 1; end
			if RO_RaiderTable[BUFF_DRUID_TAB_INDEX][name][1] == 0 then RO_RaiderTable[BUFF_DRUID_TAB_INDEX][name][1] = 1; end
			RO_RaiderTable[TANK_TAB_INDEX][name] = {};
			RO_RaiderTable[TANK_TAB_INDEX][name][1] = 0; 
		elseif role == "TANK" then
			RO_RaiderTable[HEAL_TAB_INDEX][name] = {};
			RO_RaiderTable[HEAL_TAB_INDEX][name][1] = 0; 
			RO_RaiderTable[BUFF_DRUID_TAB_INDEX][name] = {};
			RO_RaiderTable[BUFF_DRUID_TAB_INDEX][name][1] = 0;
			if RO_RaiderTable[TANK_TAB_INDEX][name][1] == 0 then RO_RaiderTable[TANK_TAB_INDEX][name][1] = 1; end
		else
			RO_RaiderTable[HEAL_TAB_INDEX][name] = {};
			RO_RaiderTable[HEAL_TAB_INDEX][name][1] = 0; 
			if RO_RaiderTable[BUFF_DRUID_TAB_INDEX][name][1] == 0 then RO_RaiderTable[BUFF_DRUID_TAB_INDEX][name][1] = 1; end
			RO_RaiderTable[TANK_TAB_INDEX][name] = {};
			RO_RaiderTable[TANK_TAB_INDEX][name][1] = 0; 
		end
	elseif class == "WARRIOR" then
		if not RO_RaiderTable[TANK_TAB_INDEX][name] then RO_RaiderTable[TANK_TAB_INDEX][name] = {} end
		if role == "TANK" then if RO_RaiderTable[TANK_TAB_INDEX][name][1] == 0 then RO_RaiderTable[TANK_TAB_INDEX][name][1] = 1; end
		else RO_RaiderTable[TANK_TAB_INDEX][name] = {}; RO_RaiderTable[TANK_TAB_INDEX][name][1] = 0;
		end
	elseif class == "PALADIN" then
		if not RO_RaiderTable[HEAL_TAB_INDEX][name] then RO_RaiderTable[HEAL_TAB_INDEX][name] = {} end
		if role == "HEALER" then if RO_RaiderTable[HEAL_TAB_INDEX][name][1] == 0 then RO_RaiderTable[HEAL_TAB_INDEX][name][1] = 1; end
		else RO_RaiderTable[HEAL_TAB_INDEX][name] = {}; RO_RaiderTable[HEAL_TAB_INDEX][name][1] = 0;
		end
	elseif class == "SHAMAN" then
		if not RO_RaiderTable[HEAL_TAB_INDEX][name] then RO_RaiderTable[HEAL_TAB_INDEX][name] = {} end
		if role == "HEALER" then if RO_RaiderTable[HEAL_TAB_INDEX][name][1] == 0 then RO_RaiderTable[HEAL_TAB_INDEX][name][1] = 1; end
		else RO_RaiderTable[HEAL_TAB_INDEX][name] = {}; RO_RaiderTable[HEAL_TAB_INDEX][name][1] = 0;
		end
	end
end

function RaidOrganizer:RoleAutoComplete()
	local classLUT = {
		["WARRIOR"] = "TANK",
		["DRUID"] = "HEALER",
		["PRIEST"] = "HEALER",
		["SHAMAN"] = "HEALER",
		["PRIEST"] = "HEALER",
		["ROGUE"] = "MELEE",
		["MAGE"] = "CASTER",
		["WARLOCK"] = "CASTER",
		["HUNTER"] = "MELEE",
	}
	self:RefreshTables()
	for name, value in RO_RaiderTable[ROLE_TAB_INDEX] do
		local _,engClass = UnitClass(self:GetUnitByName(name))
		local role = classLUT[engClass]
		if RO_HybrideSpec[name] ~= nil then
			role = RO_HybrideSpec[name]
		end
		if value[1] == 1 then
			value[1] = nil
			if role == "TANK" then
				value[2] = 1
			elseif role == "HEALER" then
				value[3] = 1
			elseif role == "MELEE" then
				value[4] = 1
			elseif role == "CASTER" then
				value[5] = 1
			end
			self:UpdateTableFromRole(name, role, engClass)
		end
	end
end
------------------------------
--      Event Handlers      --
------------------------------
function RaidOrganizer:RAID_ROSTER_UPDATE()
	self.senderTable = {{}, {}, {}, {}, {}, {}, {}, {}, {}}
	if self.b_whosSyncingDisplay then
		self:TriggerEvent("RaidOrganizer_OnTooltipUpdate")
	end
	if IsPlayerInRaid then
		self:RefreshRaiderTable()
		self:RefreshTables()
		self:RoleAutoComplete()
		if RaidOrganizerDialog:IsShown() then
			self:UpdateLayoutSize()
			self:RefreshTables()
			self:UpdateGroupClassTextures()
			self:UpdateRaiderLayout()
		end
		if not UnitInRaid('player') then
			IsPlayerInRaid = false
			if self:IsActive() then
				self:ToggleActive()
			end
			self:ResetData()
		elseif (IsRaidLeader() or IsRaidOfficer()) then
			for tab = 1, SYNC_TAB_NB do
				if RO_syncTab[tab] == true then
					RaidOrganizer:RaidOrganizer_SendSync(tab);
				end
			end
		end
	else
		IsPlayerInRaid = true
		if not self:IsActive() then
			self:ToggleActive()
		end
	end
end

function RaidOrganizer:CHAT_MSG_ADDON(prefix, message, type, sender)
	
	if (prefix == "ROVersion") then 
		if self.b_versionQuery then
			self.RO_version_table[sender] = message
			self:TriggerEvent("RaidOrganizer_OnTooltipUpdate")
		end
	end
	
	if (prefix ~= "RaidOrganizer") then return end

	if (type ~= "RAID") then return end
	local _, _, askPattern, tab_id = string.find(message, '(%a+)%s+(%d+)');
	if (askPattern == "ONLOAD") then
		if sender == UnitName('player') then
			return
		elseif (IsRaidLeader() or IsRaidOfficer()) then
			for tab = 1, SYNC_TAB_NB do
				if RO_syncTab[tab] == true then
					RaidOrganizer:RaidOrganizer_SendSync(tab);
				end
			end
		end
		return
	elseif (askPattern == "VQUERY") then
		SendAddonMessage("ROVersion", tostring(self.version), 'RAID', sender)
		return
	end
	for i = 1, GetNumRaidMembers() do
		local name, rank = GetRaidRosterInfo(i)
		if name == sender then
			if rank == 0 then	
				return
			else
				break
			end
		end
	end
	if askPattern == "MANUAL" then
		DEFAULT_CHAT_FRAME:AddMessage("团队组织者! : 同步中... " .. RaidOrganizer_Tabs[tonumber(tab_id)][1] .. ", 分配任务来自 " .. sender);
		newAttrib[tonumber(tab_id)] = true;
		self:UpdateAlpha()
		return
	end
	local pattern = '(%d+)%s+(%d+)';
	local _, _, tab_id, length  = string.find(message, pattern);
	tab_id = tonumber(tab_id);
	length = tonumber(length);
	
	if tab_id > SYNC_TAB_NB then
		return
	end
	self.senderTable[tab_id][sender] = 1;
	if self.b_whosSyncingDisplay then
		self:TriggerEvent("RaidOrganizer_OnTooltipUpdate")
	end
	if length == 0 then
		RO_RaiderTable[tab_id] = {}; -- message to reset tab
		return
	end
	
	for i = 1, length do
		pattern = pattern .. '%s+(%a+)%s+(%d+)';
	end
	local sync_raider_table  = {string.find(message, pattern)};
	
	local charName;
	local charGroup;
	local value;
	for i = 1, length do
		charName = sync_raider_table[3 + i * 2];
		if not RO_RaiderTable[tab_id][charName] then
			RO_RaiderTable[tab_id][charName] = {};
		end
		
		for j = 1, string.len(sync_raider_table[4 + i * 2]) do
			charGroup = tonumber(string.sub(sync_raider_table[4 + i * 2], j, j));
			if charGroup >= 1 and charGroup <= MAX_GROUP_NB and self.SLOT_PER_GROUP_PER_TAB[tab_id][charGroup] > 0 then
				RO_RaiderTable[tab_id][charName][charGroup + 1] = 1;
				RO_RaiderTable[tab_id][charName][1] = nil;
			end
		end
	end
	if RaidOrganizerDialog:IsShown() then
		self:UpdateDialogValues()
	end
	self:TriggerEvent("RaidOrganizer_OnTooltipUpdate")
end

function RaidOrganizer:AutoSync_OnClick()
	if RaidOrganizerDialog.selectedTab == RAID_FILL_TAB_INDEX then
		if not ((IsRaidLeader() or IsRaidOfficer())) then
			RaidOrganizerDialogBroadcastAutoSync:SetChecked(false)
			DEFAULT_CHAT_FRAME:AddMessage("团队组织者! : Can't set Set Raid Layout checkbox if not raid lead")
		end
		if RaidOrganizerDialogBroadcastAutoSync:GetChecked() == 1 then
			RaidOrganizerDialogBroadcastSync:SetText("Set Raid Layout")
		else
			RaidOrganizerDialogBroadcastSync:SetText("Get Raid Layout")
		end
	elseif RaidOrganizerDialogBroadcastAutoSync:GetChecked() then
		if not ((IsRaidLeader() or IsRaidOfficer())) then
			RO_syncTab[RaidOrganizerDialog.selectedTab] = false
			RaidOrganizerDialogBroadcastAutoSync:SetChecked(false)
			RaidOrganizerDialogBroadcastSync:SetText("询问同步")
			DEFAULT_CHAT_FRAME:AddMessage("RaidOrganizer : Can't set Send Sync checkbox if not raid lead or assistant")
		else
			RaidOrganizerDialogBroadcastSync:SetText("发送同步")
			RO_syncTab[RaidOrganizerDialog.selectedTab] = true
		end
	else
		RaidOrganizerDialogBroadcastSync:SetText("询问同步")
		RO_syncTab[RaidOrganizerDialog.selectedTab] = false
	end
end
		
function RaidOrganizer:ReorganizeRaid()
	if RaidOrganizerDialogBroadcastAutoSync:GetChecked() == 1 then
		if not IsRaidLeader() then return end
		self:RefreshRaiderTable()
		self:UpdateDialogValues()
		raidIDPerGroup = {{},{},{},{},{},{},{},{}}
		for i=1, MAX_GROUP_NB do
			if self.SLOT_PER_GROUP_PER_TAB[RAID_FILL_TAB_INDEX][i] > 0 then
				raidIDPerGroup[i] = {0, 0, 0, 0, 0}
			end
		end
		local count = 0
		local group_count = {0, 0, 0, 0, 0, 0, 0, 0}
		for i=1, MAX_RAID_MEMBERS do
			if UnitExists("raid"..i) then
				local unitname,_,subgroup = GetRaidRosterInfo(i)
				for j=1,5 do
					if raidIDPerGroup[subgroup][j] == 0 then
						raidIDPerGroup[subgroup][j] = i
						group_count[subgroup] = group_count[subgroup] + 1
						break
					end
				end
			end
		end
		local backup_group = 0
		for key, value in pairs(group_count) do
			if value < 5 then
				backup_group = key
			end
		end
			
		if backup_group == 0 then DEFAULT_CHAT_FRAME:AddMessage("RaidOrganizer : Reorganize Raid can't be performed if raid is full. Remove a raider and try again.") 	return end

		for i=1, MAX_RAID_MEMBERS do
			if UnitExists("raid"..i) then
				unitname = UnitName("raid"..i)
				local group = 0
				if RO_RaiderTable[RAID_FILL_TAB_INDEX][unitname] then
					for j = 1, MAX_GROUP_NB do
						if self.SLOT_PER_GROUP_PER_TAB[RAID_FILL_TAB_INDEX][j] > 0 then
							if RO_RaiderTable[RAID_FILL_TAB_INDEX][unitname][j+1] == 1 then
								group = j
								break
							end
						end
					end
					if group > 0 then
						if not (groupByName[unitname] == group) then
							local currentID = i
							local currentGroup = groupByName[unitname]
							local currentTableIndex = 0
							local targetID = 0
							local targetGroup = group
							local targetTableIndex = 0
							for k = 1, 5 do
								if raidIDPerGroup[currentGroup][k] == currentID then
									currentTableIndex = k
									break
								end
							end
							
							if group_count[targetGroup] == 5 then
								for targetTableIndex = 1, 5 do
									targetID = raidIDPerGroup[targetGroup][targetTableIndex]
									if (not (RO_RaiderTable[RAID_FILL_TAB_INDEX][UnitName("raid"..targetID)][targetGroup+1] == 1)) then
										SetRaidSubgroup(targetID, backup_group)
										SetRaidSubgroup(currentID, targetGroup)
										SetRaidSubgroup(targetID, currentGroup)
										groupByName[UnitName("raid"..targetID)] = currentGroup
										groupByName[unitname] = targetGroup
										raidIDPerGroup[targetGroup][targetTableIndex] = i
										raidIDPerGroup[currentGroup][currentTableIndex] = targetID
										break
									end
								end
							else
								for targetTableIndex = 1, 5 do
									if raidIDPerGroup[targetGroup][targetTableIndex] == 0 then
										SetRaidSubgroup(currentID, targetGroup)
										groupByName[unitname] = targetGroup
										raidIDPerGroup[currentGroup][currentTableIndex] = 0
										group_count[currentGroup] = group_count[currentGroup] - 1
										raidIDPerGroup[targetGroup][targetTableIndex] = currentID
										group_count[targetGroup] = group_count[targetGroup] + 1
										break
									end
								end
							end
						end
					end
				end
			end
		end
	else
		self:RefreshRaiderTable()
		for name, value in RO_RaiderTable[RAID_FILL_TAB_INDEX] do
			value[1] = nil
			for i=1, MAX_GROUP_NB do
				if self.SLOT_PER_GROUP_PER_TAB[RAID_FILL_TAB_INDEX][i] > 0 then
					if i == groupByName[name] then
						value[i+1] = 1
					else
						value[i+1] = nil
					end
				end
			end
		end
		self:UpdateDialogValues()
	end
end

function RaidOrganizer:RaidOrganizer_SyncOnClick()
	if RaidOrganizerDialog.selectedTab == RAID_FILL_TAB_INDEX then
		self:ReorganizeRaid()
		return
	end
	
	-- other tab, sync
	if (RaidOrganizerDialogBroadcastAutoSync:GetChecked()) then
		if not (IsRaidLeader() or IsRaidOfficer()) then
			RaidOrganizerDialogBroadcastAutoSync:SetChecked(false)
			RaidOrganizerDialogBroadcastSync:SetText("询问同步")
			DEFAULT_CHAT_FRAME:AddMessage("Try to send sync while not being raid lead or assistant : click again to ask sync or ask promotion before checking send sync checkbox")
		else
			self:RaidOrganizer_SendSync(0)
		end
	else
		self:RaidOrganizer_AskSync()
	end
end

function RaidOrganizer:RaidOrganizer_AskSync()
	self.senderTable = {{}, {}, {}, {}, {}, {}, {}, {}, {}}
	if self.b_whosSyncingDisplay then
		self:TriggerEvent("RaidOrganizer_OnTooltipUpdate")
	end
	SendAddonMessage("RaidOrganizer", "ONLOAD 0", "RAID")
end

function RaidOrganizer:VersionQuery()
	self.b_versionQuery = not self.b_versionQuery
	self:TriggerEvent("RaidOrganizer_OnTooltipUpdate")
	if self.b_versionQuery == false then return end
	if (IsRaidLeader() or IsRaidOfficer()) then 
		self.RO_version_table = {}
		SendAddonMessage("RaidOrganizer", "VQUERY 0", "RAID")
	else 
		RaidOrganizer.b_versionQuery = false
		DEFAULT_CHAT_FRAME:AddMessage("You have to be raid lead or assistant to check raid version")
	end
end

function RaidOrganizer:RaidOrganizer_SendSync(id)
	local msg = "";
	local tmp_msg = "";
	local length = 0;
	local nbPlayers = 0
	local first = true;
	local tab_id = 0;
	if id == 0 then
		tab_id = RaidOrganizerDialog.selectedTab;
		SendAddonMessage("RaidOrganizer", "MANUAL " .. tostring(tab_id), "RAID")
	else
		tab_id = id;
	end
	
	--Reset tab for destination
	SendAddonMessage("RaidOrganizer", tab_id .. " 0", "RAID")
	
	for nameChar in RO_RaiderTable[tab_id] do
		tmp_msg = "";
		first = true;
		for group=1, MAX_GROUP_NB do
			if self.SLOT_PER_GROUP_PER_TAB[tab_id][group] > 0 then
				if RO_RaiderTable[tab_id][nameChar][group + 1] == 1 then
					if first then
						nbPlayers = nbPlayers + 1;
						tmp_msg = nameChar .. " " .. tostring(group);
						first = false;
					else
						tmp_msg = tmp_msg .. tostring(group);
					end
				end
			end
		end
		length = length + string.len(tmp_msg);

		if length > 200 then
			msg = tostring(tab_id) .. " " .. tostring(nbPlayers - 1) .. " " .. msg;
			SendAddonMessage("RaidOrganizer", msg, "RAID")
			msg = tmp_msg .. " ";
			length = string.len(tmp_msg);
			nbPlayers = 1;
		else
			if not (tmp_msg == "") then
				msg = msg .. tmp_msg .. " ";
				length = length + string.len(tmp_msg);
			end
		end
	end
	if not (msg == "") then
		msg = tostring(tab_id) .. " " .. nbPlayers .. " " .. msg;
		SendAddonMessage("RaidOrganizer", msg, "RAID")
	end
end

function RaidOrganizer:TooltipUpdate(tablet)
	tablet:SetTitle("团队组织者! |cff00ff00汉化 By" .. RaidOrganizer.version .. "|r")
	if RaidOrganizer:IsActive() then
		local attb = tablet:AddCategory('columns', 2,
				'child_textR', 1, 'child_textG', 0.82, 'child_textB', 0,
				'child_text2R', 1, 'child_text2G', 1, 'child_text2B', 1
			)
		attb:AddLine("text", "|cffffffff我的分配 :" .. "|r", 'size', 14);
		local user = UnitName('player')
		local first = false
		local tmpcolor = "ffffffff"
		for i=1, SYNC_TAB_NB do
			first = true
			if RO_RaiderTable[i][user] then
				for j=1, MAX_GROUP_NB do
					if self.SLOT_PER_GROUP_PER_TAB[i][j] > 0 then
						if RO_RaiderTable[i][user][j + 1] == 1 then
							if self.db.account.sets[i][RO_CurrentSet[i]].GroupNames[j] == "CROSS" then
								tmpcolor = "ffff0000";
							elseif self.db.account.sets[i][RO_CurrentSet[i]].GroupNames[j] == "SQUARE" then
								tmpcolor = "ff0090ff";
							elseif self.db.account.sets[i][RO_CurrentSet[i]].GroupNames[j] == "MOON" then
								tmpcolor = "ffafe1dc";
							elseif self.db.account.sets[i][RO_CurrentSet[i]].GroupNames[j] == "TRIANGLE" then
								tmpcolor = "ff00ff00";
							elseif self.db.account.sets[i][RO_CurrentSet[i]].GroupNames[j] == "DIAMOND" then
								tmpcolor = "ffff00ff";
							elseif self.db.account.sets[i][RO_CurrentSet[i]].GroupNames[j] == "CIRCLE" then
								tmpcolor = "ffff8000";
							elseif self.db.account.sets[i][RO_CurrentSet[i]].GroupNames[j] == "STAR" then
								tmpcolor = "ffffff00";
							else
								tmpcolor = "ffffffff";
							end
							if first then
								attb:AddLine("text", " ");
								attb:AddLine("text", RaidOrganizer_Tabs[i][1], "text2", "|c" .. tmpcolor .. self.db.account.sets[i][RO_CurrentSet[i]].GroupNames[j] .. "|r");
								first = false
							else
								attb:AddLine("text", " ", "text2", "|c" .. tmpcolor .. self.db.account.sets[i][RO_CurrentSet[i]].GroupNames[j] .. "|r");
							end
						end
					end
				end
			end
		end
		if (IsRaidLeader() or IsRaidOfficer()) and RaidOrganizer.b_versionQuery then
			local cat = tablet:AddCategory(
				'columns', 2,
				'child_textR', 1, 'child_textG', 0.82, 'child_textB', 0,
				'child_text2R', 1, 'child_text2G', 1, 'child_text2B', 1
			)
			local str1, str2 = "", "";
			local color1, color2 = "ffffffff", "ffffffff";
			local tmpstr = "";

			cat:AddLine("text", "|c" .. tmpcolor .. "版本查询 :" .. "|r", 'size', 14);
			cat:AddLine("text", " ");
			local charName = ""
			local charVersion = ""
			for i=1, MAX_RAID_MEMBERS do
				charName = ""
				charVersion = ""
				if UnitExists("raid"..i) then
					for key,value in pairs(RaidOrganizer.RO_version_table) do
						if key == UnitName("raid"..i) then
							charName = key
							charVersion = value
							break
						end
					end
					if charName ~= "" then
						tmpstr = charName .. " " .. charVersion;
						if charVersion == RaidOrganizer.version then
							tmpcolor = "ffffffff"
						elseif charVersion < RaidOrganizer.version then
							tmpcolor = "ffff8000"
						else
							tmpcolor = "ff00ff00"
						end
					else
						if UnitIsConnected("raid"..i) then
							tmpstr = UnitName("raid"..i) .. " N/A";
							tmpcolor = "ffff0000"
						else
							tmpstr = UnitName("raid"..i) .. " 离线";
							tmpcolor = "ff808080"
						end
					end
					if str1 == "" then str1 = tmpstr; color1 = tmpcolor; else str2 = tmpstr; color2 = tmpcolor end
					if str2 ~= "" then cat:AddLine("text", "|c" .. color1 .. str1 .. "|r","text2", "|c" .. color2 .. str2 .. "|r"); str1 = ""; str2 = ""; end
				end
			end
			if str1 ~= "" then cat:AddLine("text", "|c" .. color1 .. str1 .. "|r"); str1 = ""; str2 = ""; end
		end
		if RaidOrganizer.b_whosSyncingDisplay then
			local cat2 = tablet:AddCategory(
				'columns', 2,
				'child_textR', 1, 'child_textG', 0.82, 'child_textB', 0,
				'child_text2R', 1, 'child_text2G', 1, 'child_text2B', 1
			)
			local str1, str2 = "", "";
			
			cat2:AddLine("text", "|cffffffff谁是同步的 :" .. "|r", 'size', 14);
			cat2:AddLine("text", " ");
			for i=1, SYNC_TAB_NB do
				str1 = RaidOrganizer_Tabs[i][1]
				for name,_ in pairs(RaidOrganizer.senderTable[i]) do
					str2 = str2 .. "|cffffffff" .. name .. "|r "
				end
				cat2:AddLine("text", str1,"text2", str2); str1 = ""; str2 = "";
			end
		end
		tablet:SetHint("|cffeda55f点击|r 显示快捷栏. |cffeda55f右键|r 显示设置. |cffeda55fShift+键|r 显示对话框. ")
	else
		local cat = tablet:AddCategory("colums", 1)
		cat:AddLine("text", "团队组织者当前被禁用.")
		tablet:SetHint("|cffeda55f点击|r 启用.")
	end
end
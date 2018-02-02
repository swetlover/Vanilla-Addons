-- By Zisu (http://www.curse-gaming.com/en/profile-122056.html)
local AceLocale = AceLibrary("AceLocale-2.1")

AceLocale:RegisterTranslation("RaidOrganizerOptions", "zhCN", function()
    return {
		["AA"] = "GG"
	}
end)

AceLocale:RegisterTranslation("RaidOrganizer", "zhCN", function()
    return {
        ["CLOSE"] = "关闭",
        ["RESET"] = "重置所有",
		["RESETTAB"] = "重置标签",
		["ALLREMAIN"] = "所有->剩余",
        ["RAID"] = "发送到团队",
        ["CHANNEL"] = "频道",
        ["DISPEL"] = "驱散",
        ["MT"] = "坦克",
        ["HEAL"] = "治疗",
        ["DECURSE"] = "驱散",
        ["REMAINS"] = "剩余",
        ["ARRANGEMENT"] = "安排",
        ["BROADCAST"] = "广播",
        ["OPTIONS"] = "设置",
        ["STATS"] = "统计",
        ["PALADIN"] = "圣骑士",
        ["DRUID"] = "德鲁伊",
        ["PRIEST"] = "牧师",
        ["SHAMAN"] = "萨满祭司",
		["ROGUE"] = "盗贼",
		["WARRIOR"] = "战士",
		["MAGE"] = "法师",
		["WARLOCK"] = "术士",
		["HUNTER"] = "猎人",
		["Group1"] = "队伍 1",
		["Group2"] = "队伍 2",
		["Group3"] = "队伍 3",
		["Group4"] = "队伍 4",
		["Group5"] = "队伍 5",
		["Group6"] = "队伍 6",
		["Group7"] = "队伍 7",
		["Group8"] = "队伍 8",
        ["PALADINS"] = "圣骑士",
        ["DRUIDS"] = "德鲁伊",
        ["PRIESTS"] = "牧师",
        ["SHAMANS"] = "萨满祭司",
		["ROGUES"] = "盗贼",
		["WARRIORS"] = "战士",
		["MAGES"] = "法师",
		["WARLOCKS"] = "术士",
		["HUNTERS"] = "猎人",
        ["HEALARRANGEMENT1"] = "治疗分配",
		["HEALARRANGEMENT2"] = "坦克分配",
		["HEALARRANGEMENT3"] = "脚踢-打断 分配",
		["HEALARRANGEMENT4"] = "控制 分配",
		["HEALARRANGEMENT5"] = "解诅咒 分配",
		["HEALARRANGEMENT6"] = "智力Buff 分配",
		["HEALARRANGEMENT7"] = "耐力Buff 分配",
		["HEALARRANGEMENT8"] = "爪子Buff 分配",
        ["FFA"] = "其他人补位!", -- was der rest machen darf
        ["NO_CHANNEL"] = "你必须加入频道 %q 才能通告治疗的分配",
        ["NOT_IN_RAID"] = "你不在一个团队中",
        ["FREE"] = "空",
		["MULTIPLE_ARRANGEMENT"] = "多重分配",
        ["EDIT_LABEL"] = "新的组标签 %u",
        ["SHOW_DIALOG"] = "显示/隐藏 对话框",
        ["LABELS"] = "标签",
        ["SAVEAS"] = "另存为",
        ["SET_SAVEAS"] = "输入新配置的名称",
        ["SET_DEFAULT"] = "Default",
        ["SET_CANNOT_DELETE_DEFAULT"] = "不能删除默认设置",
        ["SET_CANNOT_SAVE_DEFAULT"] = "你不能重写默认设置",
        ["SET_ALREADY_EXISTS"] = "配置 %q 已经存在",
        ["SET_TO_MANY_SETS"] = "你不能拥有超过32套配置",
        ["AUTOSORT_DESC"] = "自动排序队伍",
        ["REPLY_NO_ARRANGEMENT"] = "你没有被指派",
        ["REPLY_ARRANGEMENT_FOR"] = "你被分配到",
        ["AUTOFILL"] = "自动填充",
        ["MSG_HEAL_FOR_ARRANGEMENT"] = "私聊给团员分配方案.",
        ["WHISPER"] = "私聊治疗们自己的任务",
        ["ARRANGEMENT_FOR"] = "你的分配:",
    }
end)

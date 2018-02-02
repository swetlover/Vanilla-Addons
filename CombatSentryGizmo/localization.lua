--Language Localization-----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------

--HIGHLIGHT_FONT_COLOR_CODE = "|cffffffff";
--RED_FONT_COLOR_CODE = "|cffff2020";
--NORMAL_FONT_COLOR_CODE = "|cffffd200";


CSG_VERSION = 0.76;

-- Colors
CSG_NML_TXT = "|cffffd200"
CSG_WHT_TXT = "|cffffffff"
CSG_GRY_TXT = "|cffC0C0C0"
CSG_DGY_TXT = "|cff585858"
CSG_RED_TXT = "|cffff2020"
CSG_GRN_TXT = "|cff20ff20"
CSG_YLW_TXT = "|cffffff00"
CSG_BLE_TXT = "|cff3366ff"

CSG_TITLE = "|cffffffffC|cffffd200ombat |cffffffffS|cffffd200entry |cffffffffG|cffffd200izmo"..NORMAL_FONT_COLOR_CODE;
CSG_TITLE_NOSPACE = "|cffffffffC|cffffd200ombat|cffffffffS|cffffd200entry|cffffffffG|cffffd200izmo"..NORMAL_FONT_COLOR_CODE;
CSG_TITLE_TOOLTIP = "|cffffd200CSG"..NORMAL_FONT_COLOR_CODE;
CSG_TITLE_TOOLTIP_TITLE = "|cffffffffC|cffC0C0C0ombat|cffffffffS|cffC0C0C0entry|cffffffffG|cffC0C0C0izmo"..NORMAL_FONT_COLOR_CODE;
CSG_TITLE_CHAT = "|cffffff00CSG: |cffffffff";


		CSG_OPTION_ON_TOOLTIP = "|cffffffff"..CSG_TITLE_TOOLTIP_TITLE.." |cffffffff开关\n|cffffd200当禁用时，"..CSG_TITLE_TOOLTIP.." 将会关闭并且不起任何作用。";
		CSG_OPTION_DETECT_TOOLTIP = "|cffffffff侦测敌人\n|cffffd200开启敌人侦测\n\n|cffff2020警告：|cffffd200在你的帧速和网络连接情况都较差的情况下开启敌人检测和自动目标信息获取对你选择目标有潜在的混乱可能性。推荐在此情况下关闭自动目标信息获取。";
		CSG_OPTION_CREATURES_TOOLTIP = "|cffffffff生物开关\n|cffffd200选择是否将生物信息（非玩家）显示在"..CSG_TITLE_TOOLTIP..".";
		CSG_OPTION_INFOTARGET_TOOLTIP = "|cffffffff自动目标信息\n|cffffd200打开 "..CSG_TITLE_TOOLTIP.."的攻击者信息收集系统。\n\n|cffff2020警告：|cffffd200当打开时，"..CSG_TITLE_TOOLTIP.." 将会收集你的敌人的信息。关闭时，"..CSG_TITLE_TOOLTIP.."将不会尝试收集敌人的信息。当然，如果你手动选择敌人或者鼠标悬浮于敌人，他们的信息将会替代。(盗贼请注意，不要打开这个选项，否则将会丢掉你的组合点数！) ";
		CSG_OPTION_ANCHOR_TOOLTIP = "|cffffffff开关锚点\n|cffffd200选择是否一直显示"..CSG_TITLE_TOOLTIP.."锚点, 或者仅显示于需要的时候。当你需要重新定位的时候，打开这个选项是很必要的。";
		
		CSG_OPTION_MENU_TOOLTIP = "|cffffffff选项菜单\n|cffffd200打开"..CSG_TITLE_TOOLTIP.."选项菜单";

		CSG_MENU_AB_OCCUPIED = "需要时";
		CSG_MENU_AB_OCCUPIED_TOOLTIP = "锚点仅在下列情况时候显示\n在你的列表里面有可见的敌人";
		CSG_MENU_AB_ALWAYS = "一直";
		CSG_MENU_AB_ALWAYS_TOOLTIP = "锚点将一直显示\n(在你想重新定位它的时候比较好)";
		CSG_MENU_AB_NEVER = "从不";
		CSG_MENU_AB_NEVER_TOOLTIP = "将不显示锚点";

		CSG_MENU_SCALE = "缩放";
		CSG_MENU_SCALE_TOOLTIP = "|cffffffff"..CSG_MENU_SCALE.."\n|cffffd200改变敌对列表"..CSG_TITLE_TOOLTIP.."的缩放比例。";
		CSG_MENU_MAX_F = "最大攻击列表数";
		CSG_MENU_MAX_F_TOOLTIP = "|cffffffff"..CSG_MENU_MAX_F.."\n|cffffd200选择你的敌对列表上所有目标的最大显示数量。";
		CSG_MENU_MAX_NA = "最大非攻击列表数";
		CSG_MENU_MAX_NA_TOOLTIP = "|cffffffff"..CSG_MENU_MAX_NA.."\n|cffffd200选择你的敌对列表上非攻击者的最大显示数量。";
		CSG_MENU_MAX_A = "最多显示敌人";
		CSG_MENU_MAX_A_TOOLTIP = "|cffffffff"..CSG_MENU_MAX_A.."\n|cffffd200选择你的敌对列表上攻击者的最大显示数量。";
		CSG_MENU_TIMEOUT_NA = "非攻击者保存时间";
		CSG_MENU_TIMEOUT_NA_TOOLTIP = "|cffffffff"..CSG_MENU_TIMEOUT_NA.."\n|cffffd200选择非攻击者目标在失去后存留在你的敌对列表上的最长时间。";
		CSG_MENU_TIMEOUT_A = "攻击者保存时间";
		CSG_MENU_TIMEOUT_A_TOOLTIP = "|cffffffff"..CSG_MENU_TIMEOUT_A.."\n|cffffd200选择攻击者目标在失去后存留在你的敌对列表上的最长时间。";
		CSG_MENU_TIMEOUT_H = "治疗者/辅助者保存时间";
		CSG_MENU_TIMEOUT_H_TOOLTIP = "|cffffffff"..CSG_MENU_TIMEOUT_H.."\n|cffffd200选择（治疗者/辅助者）目标在失去后存留在你的敌对列表上的最长时间。";
		CSG_MENU_SOUNDS_ALL = "打开所有声效";
		CSG_MENU_SOUNDS_ALL_TOOLTIP = "|cffffffff"..CSG_MENU_SOUNDS_ALL.."\n|cffffd200开启所有"..CSG_TITLE_TOOLTIP.."声效。取消选择"..CSG_TITLE_TOOLTIP.."将阻止播放声音。";
	
		CSG_TEXT_WELCOME = "|cff3366ffCombat Sentry Gizmo v"..CSG_VERSION.."b 已加载 |cff20ff20(/csg 获取选项)";
		CSG_TEXT_SLASHCOMMAND = "|cff20ff20/csg off|cff3366ff -关闭CSG，|cff20ff20/csg on|cff3366ff -打开CSG，|cff20ff20/csg toggle|cff3366ff -切换CSG打开/关闭状态，|cff20ff20/csg detect|cff3366ff -打开/关闭敌人侦测，|cff20ff20/csg creatures|cff3366ff -打开/关闭生物显示，|cff20ff20/csg infotarget|cff3366ff -打开/关闭自动记录目标信息";
		
		CSG_TEXT_ENEMYDETECTION_OFF = CSG_TITLE_CHAT.."侦测敌人现在：|cffff2020-关闭-";
		CSG_TEXT_ENEMYDETECTION_ON = CSG_TITLE_CHAT.."侦测敌人现在：|cff20ff20-打开-";
		CSG_TEXT_CREATURES_OFF = CSG_TITLE_CHAT.."生物显示现在：|cffff2020-关闭-";
		CSG_TEXT_CREATURES_ON = CSG_TITLE_CHAT.."生物显示现在：|cff20ff20-打开-";
		CSG_TEXT_CSG_OFF = CSG_TITLE_CHAT.."现在：|cffff2020-关闭-";
		CSG_TEXT_CSG_ON = CSG_TITLE_CHAT.."现在：|cff20ff20-打开-";

		CSG_L_YOU = "你";

		--CSG_DAM_HITBLOCK = "(.+) hits (.+) for (%d+). (.+) blocked";
		CSG_DAM_HIT = "(.+)击中(.+)造成(%d+)点伤害";
		CSG_DAM_CRIT = "(.+)对(.+)造成(%d+)的致命一击伤害";

		CSG_SDAM_HIT = "(.+)的(.+)击中(.+)造成(%d+)点伤害";
		CSG_SDAM_CRIT = "(.+)(.+)对(.+)造成(%d+)的致命一击伤害";
		CSG_SDAM_BLOCK = "(.+)的(.+)被格挡过去";
		CSG_SDAM_BLOCKBY = "(.+)的(.+)被(.+)格挡过去";
		CSG_SDAM_DEFLECT = "(.+)的(.+)被偏斜了";
		CSG_SDAM_DEFLECTBY = "(.+)的(.+)被(.+)偏斜了";
		CSG_SDAM_DODGE = "(.+)的(.+)被闪躲过去";
		CSG_SDAM_DODGEBY = "(.+)的(.+)被(.+)闪躲过去";
		CSG_SDAM_EVADE = "(.+)的(.+)被闪避过去";
		CSG_SDAM_EVADEBY = "(.+)的(.+)被(.+)闪避过去";
		CSG_SDAM_FAIL = "(.+)的(.+)施放失败。(.+)对此免疫";
		CSG_SDAM_MISS = "(.+)的(.+)没有击中(.+)";
		CSG_SDAM_PARRY = "(.+)的(.+)被招架了"; --??
		CSG_SDAM_RESIST = "(.+)的(.+)被抵抗了";
		CSG_SDAM_RESISTBY = "(.+)的(.+)被(.+)抵抗了";

		CSG_MISS_MISS = "(.+)没有击中(.+)";
		CSG_MISS_PARRY = "(.+)发起了攻击。(.+)招架住了";
		CSG_MISS_EVADE = "(.+)发起了攻击。(.+)闪避开了";
		CSG_MISS_DODGE = "(.+)发起了攻击。(.+)闪躲开了";
		CSG_MISS_DEFLECT = "(.+)发起了攻击。(.+)闪开了";
		CSG_MISS_BLOCK = "(.+)发起了攻击。(.+)格挡住了";
		CSG_MISS_ABSORB = "(.+)发起了攻击。(.+)吸收了";

		CSG_SPLL_HEALCRIT = "(.+)的(.+)发挥极效，为(.+)恢复了(%d+)点生命值";
		CSG_SPLL_HEAL = "(.+)的(.+)为(.+)恢复了(%d+)点生命值";
		CSG_SPLL_CAST = "(.+)对(.+)施放了(.+)";
		CSG_SPLL_CASTS = "(.+)在(.+)的(.+)上施放了(.+)";
		CSG_SPLL_CASTS2 = "(.+)开始施放(.+)";
		CSG_SPLL_GAINS = "(.+)获得了(.+)的效果";
		CSG_SPLL_GAINS2 = "(.+)获得.*(%d+)(.+)";
		CSG_SPLL_BPERFORM = "(.+)开始施展(.+)";
		CSG_SPLL_BCAST = "(.+)开始施放(.+)";

		CSG_DIES = "(.+)死亡";
		CSG_SLAINBY = "被(.+)杀死了";

		CSG_MAGE = "法师";
		CSG_WARLOCK = "术士";
		CSG_PRIEST = "牧师";
		CSG_DRUID = "德鲁伊";
		CSG_SHAMAN = "萨满祭司";
		CSG_PALADIN = "圣骑士";
		CSG_ROGUE = "盗贼";
		CSG_HUNTER = "猎人";
		CSG_WARRIOR = "战士";
		CSG_UNKNOWN = "未知目标";

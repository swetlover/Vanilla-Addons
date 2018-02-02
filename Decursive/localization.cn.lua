--[[
 Decursive (v 1.9.8) add-on for World of Warcraft UI
 Copyright (C) 2006 Archarodim ( http://www.2072productions.com/?to=decursive-continued.txt )
 This is the continued work of the original Decursive (v1.9.4) by Quu
 Decursive 1.9.4 is in public domain ( www.quutar.com )
 
 License:
	This program is free software; you can redistribute it and/or
	modify it under the terms of the GNU General Public License
	as published by the Free Software Foundation; either version 2
	of the License, or (at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.
 
	You should have received a copy of the GNU General Public License
	along with this program; if not, write to the Free Software
	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
--]]

-------------------------------------------------------------------------------
-- the constants for the mod (non localized)
-------------------------------------------------------------------------------
DCR_VERSION_STRING = "一键驱散 1.9.8.4";
BINDING_HEADER_DECURSIVE = "一键驱散";

DCR_MACRO_COMMAND  = "/decursive";
DCR_MACRO_SHOW     = "/dcrshow";
DCR_MACRO_HIDE     = "/dcrhide";
DCR_MACRO_OPTION   = "/dcroption";
DCR_MACRO_RESET    = "/dcrreset";

DCR_MACRO_PRADD    = "/dcrpradd";
DCR_MACRO_PRCLEAR  = "/dcrprclear";
DCR_MACRO_PRLIST   = "/dcrprlist";
DCR_MACRO_PRSHOW   = "/dcrprshow";

DCR_MACRO_SKADD    = "/dcrskadd";
DCR_MACRO_SKCLEAR  = "/dcrskclear";
DCR_MACRO_SKLIST   = "/dcrsklist";
DCR_MACRO_SKSHOW   = "/dcrskshow";
DCR_MACRO_DEBUG	   = "/dcrdebug";

-- DO NOT TRANSLATE, THOSE ARE ALWAYS ENGLISH
DCR_CLASS_DRUID   = 'DRUID';
DCR_CLASS_HUNTER  = 'HUNTER';
DCR_CLASS_MAGE    = 'MAGE';
DCR_CLASS_PALADIN = 'PALADIN';
DCR_CLASS_PRIEST  = 'PRIEST';
DCR_CLASS_ROGUE   = 'ROGUE';
DCR_CLASS_SHAMAN  = 'SHAMAN';
DCR_CLASS_WARLOCK = 'WARLOCK';
DCR_CLASS_WARRIOR = 'WARRIOR';

DCR_DISEASE = 'Disease';
DCR_MAGIC   = 'Magic';
DCR_POISON  = 'Poison';
DCR_CURSE   = 'Curse';
DCR_CHARMED = 'Charm';

-------------------------------------------------------------------------------
-- Simplified Chinese localization
-------------------------------------------------------------------------------
if ( GetLocale() == "zhCN" ) then

DCR_ALLIANCE_NAME = '联盟';

DCR_LOC_CLASS_DRUID   = '德鲁伊';
DCR_LOC_CLASS_HUNTER  = '猎人';
DCR_LOC_CLASS_MAGE    = '法师';
DCR_LOC_CLASS_PALADIN = '圣骑士';
DCR_LOC_CLASS_PRIEST  = '牧师';
DCR_LOC_CLASS_ROGUE   = '盗贼';
DCR_LOC_CLASS_SHAMAN  = '萨满祭司';
DCR_LOC_CLASS_WARLOCK = '术士';
DCR_LOC_CLASS_WARRIOR = '战士';

DCR_STR_OTHER	    = '其它';
DCR_STR_ANCHOR	    = '定位器';
DCR_STR_OPTIONS	    = '选项设置';
DCR_STR_CLOSE	    = '关闭';
DCR_STR_DCR_PRIO    = '优先列表';
DCR_STR_DCR_SKIP    = '忽略列表';
DCR_STR_QUICK_POP   = '快速添加器';
DCR_STR_POP	    = '快速添加列表';
DCR_STR_GROUP	    = '小队';

DCR_STR_NOMANA	    = '法力不足。';
DCR_STR_UNUSABLE    = '暂时不能净化。';
DCR_STR_NEED_CURE_ACTION_IN_BARS = 'Decursive在你的动作条上找不到任何可用的净化法术图标。Decursive需要它来检查施法距离。';


DCR_UP		    = '上移';
DCR_DOWN	    = '下移';

DCR_PRIORITY_SHOW   = '优';
DCR_POPULATE	    = '添';
DCR_SKIP_SHOW	    = '忽';
DCR_ANCHOR_SHOW	    = '锚';
DCR_OPTION_SHOW	    = '设';
DCR_CLEAR_PRIO	    = '清';
DCR_CLEAR_SKIP	    = '清';


DCR_LOC_AF_TYPE = {};
DCR_LOC_AF_TYPE [DCR_DISEASE] = '疾病';
DCR_LOC_AF_TYPE [DCR_MAGIC]   = '魔法';
DCR_LOC_AF_TYPE [DCR_POISON]  = '中毒';
DCR_LOC_AF_TYPE [DCR_CURSE]   = '诅咒';
DCR_LOC_AF_TYPE [DCR_CHARMED] = '诱惑';


DCR_PET_FELHUNTER = "地狱猎犬";
DCR_PET_DOOMGUARD = "末日守卫";
DCR_PET_FEL_CAST  = "吞噬魔法";
DCR_PET_DOOM_CAST = "驱散魔法";

DCR_SPELL_CURE_DISEASE        = '祛病术';
DCR_SPELL_ABOLISH_DISEASE     = '驱除疾病';
DCR_SPELL_PURIFY              = '纯净术';
DCR_SPELL_CLEANSE             = '清洁术';
DCR_SPELL_DISPELL_MAGIC       = '驱散魔法';
DCR_SPELL_CURE_POISON         = '消毒术';
DCR_SPELL_ABOLISH_POISON      = '驱毒术';
DCR_SPELL_REMOVE_LESSER_CURSE = '解除次级诅咒';
DCR_SPELL_REMOVE_CURSE        = '解除诅咒';
DCR_SPELL_PURGE               = '净化术';
DCR_SPELL_NO_RANK             = '';
DCR_SPELL_RANK_1              = '等级 1';
DCR_SPELL_RANK_2              = '等级 2';

BINDING_NAME_DCRCLEAN   = "净化队伍";
BINDING_NAME_DCRSHOW    = "显示/隐藏工具条";
BINDING_NAME_DCROPTION  = "显示/隐藏选项设置界面";

BINDING_NAME_DCRPRADD     = "将目标添加到优先列表";
BINDING_NAME_DCRPRCLEAR   = "清空优先列表";
BINDING_NAME_DCRPRLIST    = "在聊天窗口显示优先列表内容";
BINDING_NAME_DCRPRSHOW    = "显示/隐藏优先列表界面";

BINDING_NAME_DCRSKADD   = "将目标添加到忽略列表";
BINDING_NAME_DCRSKCLEAR = "清空忽略列表";
BINDING_NAME_DCRSKLIST  = "在聊天窗口显示忽略列表内容";
BINDING_NAME_DCRSKSHOW  = "显示/隐藏忽略列表界面";


DCR_DISABLE_AUTOSELFCAST = "Decursive检测到选项设置“%s”已启用。\n\n此选项激活时，Decursive将不能正常工作。\n\n你想要禁用这个选项设置吗？";

DCR_PRIORITY_LIST  = "设置优先列表";
DCR_SKIP_LIST_STR  = "设置忽略列表";
DCR_SKIP_OPT_STR   = "选项设置";
DCR_POPULATE_LIST  = "列表快速添加器";
DCR_MOVE_ID        = "左键上移\n右键下移\nShift+点击删除";
DCR_HIDE_MAIN      = "隐藏工具条";
DCR_SHOW_MSG	   = "如果你想要显示Decursive的工具条，输入/dcrshow。";
DCR_IS_HERE_MSG	   = "Decursive初始化完毕。";

DCR_PRINT_CHATFRAME = "在聊天窗口显示信息";
DCR_PRINT_CUSTOM    = "在游戏画面中显示信息";
DCR_PRINT_ERRORS    = "显示错误信息";

DCR_SHOW_TOOLTIP    = "在实时列表中显示浮动提示";
DCR_REVERSE_LIVELIST= "反向显示实时列表";
DCR_TIE_LIVELIST    = "根据工具条是否可见显示/隐藏实时列表";
DCR_HIDE_LIVELIST   = "隐藏实时列表";

DCR_AMOUNT_AFFLIC   = "实时列表显示人数：";
DCR_BLACK_LENGTH    = "黑名单持续时间(秒)：";
DCR_SCAN_LENGTH     = "实时检测时间间隔(秒)：";
DCR_ABOLISH_CHECK   = "在施法前检查是否需要净化";
DCR_BEST_SPELL      = "总是使用最高等级法术进行净化";
DCR_RANDOM_ORDER    = "随机净化玩家";
DCR_CURE_PETS       = "检测并净化宠物";
DCR_IGNORE_STEALTH  = "忽略潜行的玩家";
DCR_PLAY_SOUND	    = "有玩家需要净化时播放声音提示";
DCR_ANCHOR          = "Decursive文字定位";
DCR_CHECK_RANGE     = "在净化前检查是否超出施法距离";
DCR_FAST_RANGE_CHECK= "启用快速(不精确)距离检测";
DCR_DONOT_BL_PRIO   = "不将优先列表中的玩家加入黑名单";
DCR_CHOOSE_CURE	    = "净化类型选择";
DCR_ABORT_SIP	    = "在净化前中止正在施放的法术";

-- $s is spell name
-- $a is affliction name/type
-- $t is target name
DCR_DISPELL_ENEMY    = "对敌方施放$s。";
DCR_NOT_CLEANED      = "没有任何效果被驱除。";
DCR_CLEAN_STRING     = "驱除$t受到的$a效果。";
DCR_SPELL_FOUND      = "找到$s法术。";
DCR_NO_SPELLS        = "没有找到驱除不良效果的法术。";
DCR_NO_SPELLS_RDY    = "驱除不良效果的法术尚未准备好。";
DCR_OUT_OF_RANGE     = "$t距离太远。$a效果无法被驱除。";
DCR_IGNORE_STRING    = "忽略$t受到的$a效果。";

DCR_INVISIBLE_LIST = {
	["潜伏"]	= true,
	["潜行"]	= true,
	["影遁"]	= true,
}

-- this causes the target to be ignored!!!!
DCR_IGNORELIST = {
	["放逐术"]	= true,
	["相位变换"]	= true,
};

-- ignore this effect
DCR_SKIP_LIST = {
	["无梦睡眠"]	= true,
	["强效无梦睡眠"]= true,
	["昏睡"]	= true,
	["强效昏睡"]	= true,
	["心灵视界"]	= true,
	["变异注射"]	= true,
	["腐蚀耐力"]	= true,
	["淹没"]	= true,
};

-- ignore the effect bassed on the class
DCR_SKIP_BY_CLASS_LIST = {
	[DCR_CLASS_WARRIOR] = {
		["上古狂乱"]	= true,
		["点燃法力"]	= true,
		["污浊之魂"]	= true,
		["法力燃烧"]	= true,
	};
	[DCR_CLASS_ROGUE] = {
		["沉默"]	= true,
		["上古狂乱"]	= true,
		["点燃法力"]	= true,
		["污浊之魂"]	= true,
		["法力燃烧"]	= true,
		["音素爆破"]	= true,
	};
	[DCR_CLASS_HUNTER] = {
		["熔岩镣铐"]	= true,
	};
	[DCR_CLASS_MAGE] = {
		["熔岩镣铐"]	= true,
	};
};

DCR_USER_CHECK_DETECT1  = "DECURSIVE";
DCR_USER_CHECK_DETECT2  = "检查";
DCR_USER_CHECK_RESPONSE = "姓名：%s  /  职业：%s  /  版本：%s";

end

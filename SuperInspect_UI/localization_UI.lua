
SI_IB_CATEGORIES = {'ATT', 'BON', 'SBON', 'RES', 'SKILL', 'OBON', 'COH'};
SI_IB_YELLOW = "|cffffff00";

--ITEM_SPELL_TRIGGER_ONEQUIP = "Equip:";
--ITEM_SPELL_TRIGGER_ONPROC = "Chance on hit:";
--ITEM_SPELL_TRIGGER_ONUSE = "Use:";
-- equip and set bonus patterns:
SI_IB_EQUIP_PREFIX = ITEM_SPELL_TRIGGER_ONEQUIP.." ";
SI_IB_COH_PREFIX = ITEM_SPELL_TRIGGER_ONPROC.." ";
SI_IB_USE_PREFIX = ITEM_SPELL_TRIGGER_ONUSE.." ";


--Language Localization-----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
--TO ADD:
--Chance on hit: blah blah
--Balanced weapon?


--English--------------------------------------------------
-----------------------------------------------------------
if (GetLocale() == "zhCN") then
	SI_DURABILITY = "耐久度";

	SI_COMPARE_TOOLTIP = "将当前目标的属性加成信息\n复制到比较窗口中,\n以便于同其他玩家进行比较。";

	-- general
	SI_IB_TEXT = "装备属性加成";
	SI_IB_TEXT_MISSINGDATA = "走进10码范围来获取更好的属性加成扫描";
	SI_TEXT_CACHEPLAYER = "缓存玩家";
	SI_TEXT_CACHEPLAYERCACHED = "玩家物品列表缓存。";
	SI_TEXT_CACHEPLAYERFROMCACHE = "玩家物品份缓存载入。";

	SI_IB_CAT_ATT = "属性";
	SI_IB_CAT_RES = "抗性";
	SI_IB_CAT_SKILL = "技能";
	SI_IB_CAT_BON = "战斗";
	SI_IB_CAT_SBON = "法术";
	SI_IB_CAT_OBON = "生命值和法力值";
	SI_IB_CAT_COH = "命中率";
		
	-- bonus names
	SI_IB_ARMOR 	= "强化护甲";

	SI_IB_FISHING	= "钓鱼";
	SI_IB_MINING	= "采矿";
	SI_IB_HERBALISM	= "草药学";
	SI_IB_SKINNING	= "剥皮";
	SI_IB_DEFENSE	= "防御技能";
		
	SI_IB_HIT_WOUND = "重伤目标";      --SI_IB_HIT_WOUND = "Wound Target for";
	SI_IB_HIT_SHADOW = "暗影箭"; 

	SI_IB_BLOCK = "格挡几率";
	SI_IB_DODGE = "躲避几率";
	SI_IB_PARRY = "招架几率";
	SI_IB_CRIT = "近战致命";
	SI_IB_RANGEDCRIT = "远程致命";
	SI_IB_TOHIT = "命中率";
	SI_IB_WEPDMG = "武器伤害";
	SI_IB_XTRAHIT = "额外攻击";      --SI_IB_XTRAHIT = "Extra Hit Chance";
	SI_IB_RANDMG = "远程伤害";
	SI_IB_DMG = "法术伤害";
	SI_IB_ARCANEDMG = "奥术伤害";
	SI_IB_FIREDMG = "火焰伤害";
	SI_IB_FROSTDMG = "冰霜伤害";
	SI_IB_HOLYDMG = "神圣伤害";
	SI_IB_NATUREDMG = "自然伤害";
	SI_IB_SHADOWDMG = "暗影伤害";
	SI_IB_SPELLCRIT = "法术致命";
	SI_IB_SPELLTOHIT = "法术命中";
	SI_IB_HOLYCRIT = "神圣暴击";
	
	SI_IB_HEAL = "治疗量";
	SI_IB_HEALCRIT = "极效治疗";
	SI_IB_HEALTHREG = "生命回复";
	SI_IB_MANAREG = "法力回复";
	SI_IB_HEALTH = "生命值";
	SI_IB_MANA = "法力值";

	-- set bonus patterns:
	SI_IB_SET_PREFIX = "套装：";

	SI_IB_EQUIP_PATTERNS = {
		{ pattern = "+(%d+) 攻击强度。", effect = "ATTACKPOWER" },
		{ pattern = "+(%d+) 远程攻击强度。", effect = "RANGEDATTACKPOWER" },
		{ pattern = "使你用盾牌格挡攻击的几率提高(%d+)%%。", effect = "BLOCK" },
		{ pattern = "使你躲闪攻击的几率提高(%d+)%%。", effect = "DODGE" },
		{ pattern = "使你招架攻击的几率提高(%d+)%%。", effect = "PARRY" },
		{ pattern = "使你的法术造成致命一击的几率提高(%d+)%%。", effect = "SPELLCRIT" },
		{ pattern = "使你造成致命一击的几率提高(%d+)%%。", effect = "CRIT" },
		{ pattern = "使你的远程武器造成致命一击的几率提高(%d+)%%。", effect = "RANGEDCRIT" },
		{ pattern = "使你的神圣系法术的致命一击和极效治疗几率提高(%d+)%%。", effect = "HEALCRIT" },
		{ pattern = "提高奥术法术和效果所造成的伤害，最多(%d+)点。", effect = "ARCANEDMG" },
		{ pattern = "提高火焰法术和效果所造成的伤害，最多(%d+)点。", effect = "FIREDMG" },
		{ pattern = "提高冰霜法术和效果所造成的伤害，最多(%d+)点。", effect = "FROSTDMG" },
		{ pattern = "提高神圣法术和效果所造成的伤害，最多(%d+)点。", effect = "HOLYDMG" },
		{ pattern = "提高自然法术和效果所造成的伤害，最多(%d+)点。", effect = "NATUREDMG" },
		{ pattern = "提高暗影法术和效果所造成的伤害，最多(%d+)点。", effect = "SHADOWDMG" },
		{ pattern = "使治疗法术和效果所回复的生命值提高(%d+)点。", effect = "HEAL" },
		{ pattern = "提高法术所造成的治疗效果，最多(%d+)点。", effect = "HEAL" },
		{ pattern = "提高所有法术和魔法效果所造成的伤害和治疗效果，最多(%d+)点。", effect = "HEAL" },
		{ pattern = "提高所有法术和魔法效果所造成的伤害和治疗效果，最多(%d+)点。", effect = "DMG" },
		{ pattern = "每+%d+秒恢复(%d+)点生命值。", effect = "HEALTHREG" },
		{ pattern = "每+%d+秒回复(%d+)点生命值。", effect = "HEALTHREG" },
		{ pattern = "每+%d+秒恢复(%d+)点法力值。", effect = "MANAREG" },
		{ pattern = "每+%d+秒回复(%d+)点法力值。", effect = "MANAREG" },
		{ pattern = "使你击中目标的几率提高(%d+)%%。", effect = "TOHIT" },
		{ pattern = "使你的生命值和法力值回复提高(%d+)点", effect = {"HEALTHREG", "MANAREG"} },
		{ pattern = "防御技能提高(%d+)点。", effect = "DEFENSE" },
		{ pattern = "防御提高(%d+)点。", effect = "DEFENSE" },
		{ pattern = "使你的法术击中敌人的几率提高(%d+)%%。", effect = "SPELLTOHIT" },
		{ pattern = "使你的盾牌的格挡值提高(%d+)点。", effect = "BLOCKAMT" },
		{ pattern = "击中目标后有(%d+)%%的机率获得1次额外的攻击机会。", effect = "XTRAHIT" },
		{ pattern = "使目标遭到重创，对其造成(%d+)点伤害。", effect = "HIT_WOUND" },
		{ pattern = "向目标射出一支暗影箭，对其造成%d+到(%d+)点暗影伤害。", effect = "HIT_SHADOW" },
		{ pattern = "向敌人发射一支暗影箭，对其造成(%d+)点暗影伤害。", effect = "HIT_SHADOW" },
	};


	SI_IB_S1 = {
		{ pattern = "奥术", 	effect = "ARCANE" },	
		{ pattern = "火焰", 	effect = "FIRE" },	
		{ pattern = "冰霜", 	effect = "FROST" },	
		{ pattern = "神圣", 	effect = "HOLY" },	
		{ pattern = "暗影",	effect = "SHADOW" },	
		{ pattern = "自然", 	effect = "NATURE" },
	}; 	

	SI_IB_S2 = {
		{ pattern = "抗性", 	effect = "RES" },	
		{ pattern = "伤害", 	effect = "DMG" },
		{ pattern = "效果", 	effect = "DMG" },
	}; 	
		
	SI_IB_TOKEN_EFFECT = {
		["所有属性"] 			= {"STR", "AGI", "STA", "INT", "SPI"},
		["力量"]			= "STR",
		["敏捷"]				= "AGI",
		["耐力"]				= "STA",
		["智力"]			= "INT",
		["精神"] 				= "SPI",

		["所有抗性"] 	= { "ARCANERES", "FIRERES", "FROSTRES", "NATURERES", "SHADOWRES"},
		["所有魔法抗性"] 	= { "ARCANERES", "FIRERES", "FROSTRES", "NATURERES", "SHADOWRES"},
		["钓鱼技能"]				= "FISHING",
		["鱼饵"]		= "FISHING", --new
		["提高钓鱼"]	= "FISHING", --new
		["采矿"]				= "MINING",
		["草药学"]			= "HERBALISM",
		["剥皮"]			= "SKINNING",
		["防御"]				= "DEFENSE",

		["攻击强度"] 		= "ATTACKPOWER",
		["躲避"] 				= "DODGE",
		["格挡"]				= "BLOCK",
		["盾牌格挡"]				= "BLOCKAMT", --new
		["躲闪"]			= "BLOCK",
		["命中"] 				= "TOHIT",
		["法术命中"] 				= "SPELLTOHIT",
		["远程攻击强度"] = "RANGEDATTACKPOWER",
		["生命值每+%d+秒"] = "HEALTHREG",
		["治疗法术"] 		= "HEAL", --new
		["提高治疗"] 	= "HEAL", --new
		["治疗和法术伤害"] = {"HEAL", "DMG"}, --new
		["伤害和治疗法术"] = {"HEAL", "DMG"}, --new
		["法术治疗和伤害"] = {"HEAL", "DMG"}, --new
		["法术伤害和治疗"] = {"HEAL", "DMG"},	--new
		["法力值每+%d+秒"] 	= "MANAREG",
		["法力回复"] 	= "MANAREG",
		["法术伤害"] 	= "DMG",
		["致命"] 			= "CRIT", --new
		["致命一击"] 		= "CRIT",
		["伤害"] 	= "DMG",
		["生命值"]	= "HEALTH",
		["HP"]				= "HEALTH", --new
		["法力值"]	= "MANA",
		["护甲"]				= "ARMOR",
		["强化护甲"]	= "ARMOR",
		["武器伤害"]	= "WEPDMG",

		--Scope (+X Damage) 
	};	

	SI_IB_OTHER_PATTERNS = {
		{ pattern = "每5秒恢复(%d+)点法力值。", effect = "MANAREG" },
		{ pattern = "每5秒回复(%d+)点法力值。", effect = "MANAREG" },
		{ pattern = "鱼饵 %+(%d+)（%d分钟）", effect = "FISHING" },
		{ pattern = "每%d秒回复(%d+)点生命值。", effect = "HEALTHREG" },
		{ pattern = "每%d秒恢复(%d+)点生命值。", effect = "HEALTHREG" },
		{ pattern = "赞达拉力量徽章", effect = "ATTACKPOWER", value = 30 },
		{ pattern = "赞达拉魔力徽章", effect = {"DMG", "HEAL"}, value = 18 },
		{ pattern = "赞达拉宁静徽章", effect = "HEAL", value = 33 },
		
		{ pattern = "初级巫师之油", effect = {"DMG", "HEAL"}, value = 8 },
		{ pattern = "次级巫师之油", effect = {"DMG", "HEAL"}, value = 16 },
		{ pattern = "巫师之油", effect = {"DMG", "HEAL"}, value = 24 },
		{ pattern = "卓越巫师之油", effect = {"DMG", "HEAL", "SPELLCRIT"}, value = {36, 36, 1} },

		{ pattern = "初级法力之油", effect = "MANAREG", value = 4 },
		{ pattern = "次级法力之油", effect = "MANAREG", value = 8 },
		{ pattern = "卓越法力之油", effect = { "MANAREG", "HEAL"}, value = {12, 25} },
		{ pattern = "瞄准镜（%+(%d+) 伤害）", effect = "RANDMG" },

	};

	--TRANSLATE ME
	SI_BONUSWINDOWTITLE = "装备属性加成";
	SI_ITEMSHIDE = "隐藏物品";
	SI_ITEMSSHOW = "显示物品";
	SI_ITEMBUTTON_TOOLTIP = "显示/隐藏目标的装备";
	SI_HONORHIDE = "隐藏荣誉";
	SI_HONORSHOW = "显示荣誉";
	SI_HONORBUTTON_TOOLTIP = "显示/隐藏目标的荣誉信息";
	SI_BONUSESHIDE = "隐藏属性加成";
	SI_BONUSESSHOW = "显示属性加成";
	SI_BONUSESBUTTON_TOOLTIP = "显示/隐藏目标装备的属性加成";
	SI_MOBINFOHIDE = "隐藏怪物信息";
	SI_MOBINFOSHOW = "显示怪物信息";
	SI_MOBINFOBUTTON_TOOLTIP = "显示/隐藏已知的怪物信息";
	SI_LEVEL = "等级";
	SI_NOTARGET = "你必须选定一个目标";
	SI_REQUESTHONOR = "读取荣誉信息...";
	SI_REQUESTHONORFAILED = "读取失败！(可能距离过远)";
	SI_SETS = "套装信息";
	SI_RAREELITE = ITEM_QUALITY3_DESC..ELITE;
end

--German---------------------------------------------------
-----------------------------------------------------------
--Last Update : 03/02/2006 
if ( GetLocale() == "deDE" ) then
	SI_DURABILITY = "Haltbarkeit";

	SI_COMPARE_TOOLTIP = "Anklicken um die Werte zu kopieren und diese mit einem anderen Spieler zu vergleichen";

       -- Allgemeines
       SI_IB_TEXT = "Gegenstandboni";
       SI_IB_TEXT_MISSINGDATA = "Um einen genauere Boniliste zu erhalten bitte auf 10 Meter dem Ziel naehern.";
	   SI_TEXT_CACHEPLAYER = "Spieler wird zwischengespeichert";
	   SI_TEXT_CACHEPLAYERCACHED = "Gegenstaende zwischengespeichert";
	   SI_TEXT_CACHEPLAYERFROMCACHE = "Gegenstaende aus dem Zwischenspeicher";	   
       SI_IB_DISPLAY_NONE = "Keine Anzeige";
       SI_IB_SHORTDISPLAY = "Kurze Beschriftung";

       SI_IB_CAT_ATT = "Attribute";
       SI_IB_CAT_RES = "Widerstand";
       SI_IB_CAT_SKILL = "Fertigkeiten";
       SI_IB_CAT_BON = "Nah- und Fernkampf";
       SI_IB_CAT_SBON = "Zauber";
       SI_IB_CAT_OBON = "Leben und Mana";

	SI_IB_HIT_WOUND = "Verwundet das Ziel"; 
	SI_IB_HIT_SHADOW = "Schattenblitz";

       -- Namen der Boni
       SI_IB_STR = "St\195\164rke";
       SI_IB_AGI = "Beweglichkeit";
       SI_IB_STA = "Ausdauer";
       SI_IB_INT = "Intelligenz";
       SI_IB_SPI = "Willenskraft";
       SI_IB_ARMOR = "Verst\195\164rkte R\195\188stung";

       SI_IB_ARCANERES = "Arkanwiderstand";
       SI_IB_FIRERES   = "Feuerwiderstand";
       SI_IB_NATURERES = "Naturwiderstand";
       SI_IB_FROSTRES  = "Frostwiderstand";
       SI_IB_SHADOWRES = "Schattenwiderstand";

       SI_IB_FISHING   = "Angeln";
       SI_IB_MINING    = "Bergbau";
       SI_IB_HERBALISM = "Kr\195\164uterkunde";
       SI_IB_SKINNING  = "K\195\188rschnerei";
       SI_IB_DEFENSE   = "Verteidigung";

       SI_IB_BLOCK = "Blocken"; --this should say "Chance to Block" instead
       SI_IB_DODGE = "Ausweichen";
       SI_IB_PARRY = "Parieren";
       SI_IB_ATTACKPOWER = "Angriffskraft";
       --TRANSLATE
       SI_IB_WEPDMG = "Waffenschaden"; --new
	SI_IB_XTRAHIT = "Extra Hit Chance";
	SI_IB_RANDMG = "Fernkampfschaden";
       SSI_IB_WOUND = "Verwundet das Ziel";

       SI_IB_CRIT = "krit. Treffer";
       SI_IB_RANGEDATTACKPOWER = "Distanzangriffskraft";
       SI_IB_RANGEDCRIT = "krit. Schuss";
       SI_IB_TOHIT = "Trefferchance";
       SI_IB_DMG = "Zauberschaden";
       SI_IB_ARCANEDMG = "Arkanschaden";
       SI_IB_FIREDMG = "Feuerschaden";
       SI_IB_FROSTDMG = "Frostschaden";
       SI_IB_HOLYDMG = "Heiligschaden";
       SI_IB_NATUREDMG = "Naturschaden";
       SI_IB_SHADOWDMG = "Schattenschaden";
       SI_IB_SPELLCRIT = "krit. Zauber";
       SI_IB_HOLYCRIT 	= "krit. Heiligzauber";
       SI_IB_SPELLTOHIT = "Zaubertrefferchance";
       
       SI_IB_HEAL = "Heilung";
       SI_IB_HEALTHREG = "Lebensregeneration";
       SI_IB_MANAREG = "Manaregeneration";
       SI_IB_HEALTH = "Lebenspunkte";
       SI_IB_MANA = "Manapunkte";

       -- "Verwenden: " und Set-Suchmuster
       SI_IB_SET_PREFIX = "Set: ";

       SI_IB_EQUIP_PATTERNS = {
        { pattern = "%+(%d+) bei allen Widerstandsarten%.", effect = { "ARCANERES", "FIRERES", "FROSTRES", "NATURERES", "SHADOWRES"} },
        { pattern = "Erh\195\182ht Eure Chance, Angriffe mit einem Schild zu blocken, um (%d+)%%%.", effect = "BLOCK" },
        { pattern = "Erh\195\182ht Eure Chance, einem Angriff auszuweichen, um (%d+)%%%.", effect = "DODGE" },
        { pattern = "Erh\195\182ht Eure Chance, einen Angriff zu parieren, um (%d+)%%%.", effect = "PARRY" },
		{ pattern = "Erh\195\182ht Eure Chance, einen kritischen Treffer durch Zauber zu erzielen, um (%d+)%%%.", effect = "SPELLCRIT" },
		{ pattern = "Erh\195\182ht Eure Chance auf einen kritischen Effekt mit Heiligzaubern um (%d+)%%%.", effect = "HOLYCRIT" },
		{ pattern = "Erh\195\182ht Eure Chance, einen kritischen Treffer durch Heiligzauber zu erzielen, um (%d+)%%%.", effect = "HOLYCRIT" },
        { pattern = "Erh\195\182ht Eure Chance, einen kritischen Schlag zu erzielen, um (%d+)%%%.", effect = "CRIT" },
		{ pattern = "Erh\195\182ht Eure Chance, einen kritischen Treffer zu erzielen, um (%d+)%%%.", effect = "CRIT" },
        { pattern = "Erh\195\182ht Eure Chance, mit Geschosswaffen einen kritischen Schlag zu erzielen, um (%d+)%.", effect = "RANGEDCRIT" },
        { pattern = "Erh\195\182ht durch Arkanzauber und Arkaneffekte zugef\195\188gten Schaden um bis zu (%d+)%.", effect = "ARCANEDMG" },
        { pattern = "Erh\195\182ht durch Feuerzauber und Feuereffekte zugef\195\188gten Schaden um bis zu (%d+)%.", effect = "FIREDMG" },
        { pattern = "Erh\195\182ht durch Frostzauber und Frosteffekte zugef\195\188gten Schaden um bis zu (%d+)%.", effect = "FROSTDMG" },
        { pattern = "Erh\195\182ht durch Heiligzauber und Heiligeffekte zugef\195\188gten Schaden um bis zu (%d+)%.", effect = "HOLYDMG" },
        { pattern = "Erh\195\182ht durch Naturzauber und Natureffekte zugef\195\188gten Schaden um bis zu (%d+)%.", effect = "NATUREDMG" },
        { pattern = "Erh\195\182ht durch Schattenzauber und Schatteneffekte zugef\195\188gten Schaden um bis zu (%d+)%.", effect = "SHADOWDMG" },
        { pattern = "Erh\195\182ht durch Zauber und magische Effekte zugef\195\188gten Schaden und Heilung um bis zu (%d+)%.", effect = {"HEAL","DMG"} },
        { pattern = "Erh\195\182ht durch Zauber und Effekte verursachte Heilung um bis zu (%d+)%.", effect = "HEAL" },
        { pattern = "Erh\195\182ht die durch Zauber und Effekte verursachte Heilung um bis zu (%d+)%.", effect = "HEAL" },
        { pattern = "Stellt alle %d Sek%. (%d+) Punkt%(e%) Gesundheit wieder her%.", effect = "HEALTHREG" },
        { pattern = "Stellt alle %d Sek%. (%d+) Punkt%(e%) Mana wieder her%.", effect = "MANAREG" },
        { pattern = "Verbessert Eure Trefferchance um (%d+)%%%.", effect = "TOHIT" },
        { pattern = "Erh\195\182ht Eure Chance mit Zaubern zu treffen um (%d+)%%%.", effect = "SPELLTOHIT" },
	    { pattern = "Erh\195\182ht Gesundheits%- und Manaregeneration um (%d+)%.", effect = {"HEALTHREG2", "MANAREG2"} },
	    { pattern = "Erh\195\182ht Verteidigung um %+(%d+)", effect = "DEFENSE" },
	    { pattern = "Verteidigung %+(%d+).", effect = "DEFENSE" },
	    { pattern = "Erh\195\182ht den Blockwert Eures Schildes um (%d+)", effect = "BLOCKAMT" }, 
       };

	SI_IB_S1 = {
		{ pattern = "Arkan", 	effect = "ARCANE" },	
		{ pattern = "Feuer", 	effect = "FIRE" },	
		{ pattern = "Frost", 	effect = "FROST" },	
		{ pattern = "Heilig", 	effect = "HOLY" },	
		{ pattern = "Schatten", effect = "SHADOW" },	
		{ pattern = "Natur", 	effect = "NATURE" }}; 	

	SI_IB_S2 = {
		{ pattern = "widerst", 	effect = "RES" },	
		{ pattern = "schaden", 	effect = "DMG" },
		{ pattern = "effekte", 	effect = "DMG" }}; 

       -- Suchmuster f??ige Gegenstandsboni
       SI_IB_TOKEN_EFFECT = {
               ["Alle Werte"]                  = {"STR", "AGI", "STA", "INT", "SPI"},
               ["St\195\164rke"]                               = "STR",
               ["Beweglichkeit"]               = "AGI",
               ["Ausdauer"]                    = "STA",
               ["Intelligenz"]                 = "INT",
               ["Willenskraft"]                = "SPI",

               ["Alle Widerstandsarten"]       = { "ARCANERES", "FIRERES", "FROSTRES", "NATURERES", "SHADOWRES"},

               ["Angeln"]                              = "FISHING",
               ["Angelk\195\182der"]                   = "FISHING",
	       ["Angelschnur"]  = "FISHING",
	       ["Verbessertes Angeln"] = "FISHING",  -- ??
               ["Bergbau"]                             = "MINING",
               ["Kr\195\164uterkunde"]         = "HERBALISM",
               ["K\195\188rschnerei"]          = "SKINNING",
               ["Verteidigung"]                = "DEFENSE",
               ["Verteidigungsfertigkeit"] = "DEFENSE",

               ["Angriffskraft"]               = "ATTACKPOWER",
               ["Ausweichen"]                  = "DODGE",
               ["Blocken"]                             = "BLOCK",
	       ["Schildblockwert"]    = "BLOCKAMT", 
               ["Trefferchance"]               = "TOHIT",
               ["Distanzangriffskraft"] = "RANGEDATTACKPOWER",
               ["Gesundheit alle 5 Sek."] = "HEALTHREG",
               ["Heilzauber"]                  = "HEAL",
               ["Mana alle 5 Sek."]    = "MANAREG",
               ["Manaregeneration"]    = "MANAREG",
               ["Zauberschaden erh\195\182hen"]= "DMG",
               ["Kritischer Treffer"]  = "CRIT",
	       ["kritischen Treffer"]    = "CRIT",
               ["Zauberschaden"]               = "DMG",
               ["Blocken"]                             = "BLOCK",
               ["Gesundheit"]                  = "HEALTH",
               ["GP"]    = "HEALTH", 
               ["Heilzauber"]                  = "HEAL",
	       ["Verbesserte Heilung"]  = "HEAL",  -- ??
               ["Heilung und Zauberschaden"] = {"HEAL","DMG"},
               ["Schadens- und Heilzauber"] = {"HEAL","DMG"},
	       ["Schadenszauber und Heilzauber"] = {"HEAL", "DMG"},
	       ["Zauberschaden und Heilung"] = {"HEAL", "DMG"},   -- ??
               ["Zaubertrefferchance"] = "SPELLTOHIT",
               ["Mana"]                                = "MANA",
               ["R\195\188stung"]                      = "ARMOR",
               ["Verst\195\164rkte R\195\188stung"]= "ARMOR",
	       ["Waffenschaden"] = "WEPDMG",
               };


	SI_IB_OTHER_PATTERNS = {
		{ pattern = "Manaregeneration (%d+) .+ %d Sek%.", effect = "MANAREG" },
		{ pattern = "Zandalarianisches Siegel der Macht", effect = "ATTACKPOWER", value = 30 },
		{ pattern = "Zandalarianisches Siegel des Mojo", effect = {"DMG", "HEAL"}, value = 18 },
		{ pattern = "Zandalarianisches Siegel der Inneren Ruhe", effect = "HEAL", value = 33 },

		{ pattern = "Schwaches Zauberöl", effect = {"DMG", "HEAL"}, value = 8 },
		{ pattern = "Geringes Zauberöl", effect = {"DMG", "HEAL"}, value = 16 },
		{ pattern = "Zauberöl", effect = {"DMG", "HEAL"}, value = 24 },
		{ pattern = "Hervorragendes Zauberöl", effect = {"DMG", "HEAL", "SPELLCRIT"}, value = {36, 36, 1} },

		{ pattern = "Schwaches Manaöl", effect = "MANAREG", value = 4 },
		{ pattern = "Geringes Manaöl", effect = "MANAREG", value = 8 },
		{ pattern = "Hervorragendes Manaöl", effect = { "MANAREG", "HEAL"}, value = {12, 25} },

		{ pattern = "Zielfernrohr %(%+(%d+) Schaden%)", effect = "RANDMG" },
	};

	SI_BONUSWINDOWTITLE = "Gegenstandsboni";
	SI_ITEMSHIDE = "Items verstecken";
	SI_ITEMSSHOW = "Items zeigen";
	SI_ITEMBUTTON_TOOLTIP = "Zeigen/Verstecken der Gegenst\195\164nde.";
	SI_HONORHIDE = "Ehre verstecken";
	SI_HONORSHOW = "Ehre zeigen";
	SI_HONORBUTTON_TOOLTIP = "Zeigen/Verstecken der Ehrensystem-Daten.";
	SI_BONUSESHIDE = "Boni verstecken";
	SI_BONUSESSHOW = "Boni zeigen";
	SI_BONUSESBUTTON_TOOLTIP = "Zeigen/Verstecken der Gegenstandsboni.";
	SI_MOBINFOHIDE = "MobInfo verstecken";
	SI_MOBINFOSHOW = "MobInfo zeigen";
	SI_MOBINFOBUTTON_TOOLTIP = "Toggle targeted mob's information gathered";
	SI_LEVEL = "Stufe";
	SI_NOTARGET = "Ihr m\195\188sst ein Ziel angew\195\164hlt haben.";
	SI_REQUESTHONOR = "Rufe Ehrensystem-Daten ab...";
	SI_REQUESTHONORFAILED = "Abruf der Daten fehlgeschlagen\n(Ziel evtl. zu weit entfernt)";
	SI_SETS = "Sets";
	SI_RAREELITE = ELITE..ITEM_QUALITY3_DESC;
end


--French---------------------------------------------------
-----------------------------------------------------------
--French Translation By 
-- Sasmira ( Cosmos Team )
-- Sparrows
-- Drooky
--Last Update : 04/04/2006 By Sasmira

if (GetLocale() == "frFR") then
SI_DURABILITY = "Durabilit\195\169";

SI_COMPARE_TOOLTIP = "Cliquez pour copier les bonus\nvers une fen\195\170tre de comparaison\nShift-Click pour envoyer les bonus\ndans la fen\195\170tre de chat ouverte";

-- general
SI_IB_TEXT = "Bonus Objets";
SI_IB_TEXT_MISSINGDATA = "You must go to 10 Yards range to get a better bonus scan.";
SI_TEXT_CACHEPLAYER = "Caching Player";
SI_TEXT_CACHEPLAYERCACHED = "Player itemlist cached.";
SI_TEXT_CACHEPLAYERFROMCACHE = "Playeritems loaded from cache.";

SI_IB_CAT_ATT = "Attributs";
SI_IB_CAT_RES = "R\195\169sistance";
SI_IB_CAT_SKILL = "Comp\195\169tances";
SI_IB_CAT_BON = "Combat";
SI_IB_CAT_SBON = "Sorts";
SI_IB_CAT_OBON = "Vie & mana";

SI_IB_HIT_WOUND = "Blesse la cible pour";
SI_IB_HIT_SHADOW = "Trait d\'ombre";

-- bonus names
SI_IB_ARMOR = "Armure renforc\195\169e";

SI_IB_FISHING = "P\195\170che";
SI_IB_MINING = "Minage";
SI_IB_HERBALISM = "Herborisme";
SI_IB_SKINNING = "D\195\169pecage";
SI_IB_DEFENSE = "D\195\169fense";
SI_IB_WEPDMG = "Dommages d\'armes"; 
SI_IB_XTRAHIT = "Chance de toucher"; 
SI_IB_RANDMG = "Dommages \195\160 distance"; 
SI_IB_WOUND = "Blesse la cible pour"; -- Done 

SI_IB_BLOCK = "Chances de Blocage";
SI_IB_DODGE = "Chances de Esquive";
SI_IB_PARRY = "Chances de Parade";
SI_IB_CRIT = "Coups Critiques";
SI_IB_RANGEDCRIT = "Tirs Crit.";
SI_IB_TOHIT = "Chance de toucher";
SI_IB_DMG = "D\195\169gats";
SI_IB_ARCANEDMG = "D\195\169gats d\'Arcanes";
SI_IB_FIREDMG = "D\195\169gats de Feu";
SI_IB_FROSTDMG = "D\195\169gats de Froid";
SI_IB_HOLYDMG = "D\195\169gats Sacr\195\169s";
SI_IB_NATUREDMG = "D\195\169gats de Nature";
SI_IB_SHADOWDMG = "D\195\169gats des Ombres";
SI_IB_SPELLCRIT = "Sorts Crit.";
SI_IB_SPELLTOHIT = "Chance de toucher (sorts)";
SI_IB_HOLYCRIT = "Soins Crit.";


SI_IB_HEAL = "Soins";
SI_IB_HEALCRIT = "Soins Crit.";
SI_IB_HEALTHREG = "R\195\169gen. Vie";
SI_IB_MANAREG = "R\195\169gen. Mana";
SI_IB_HEALTH = "Pts de Vie";
SI_IB_MANA = "Pts de Mana"; 

-- equip and set bonus patterns:
SI_IB_EQUIP_PREFIX = "Equip\195\169 : ";
SI_IB_SET_PREFIX = "Ensemble : ";
--SI_IB_SET_PREFIX = "Complet: "; --only when you're inspecting yourself but that's another story with current code :).
SI_IB_COH_PREFIX = "Chance de toucher: "; -- fixed 

SI_IB_EQUIP_PATTERNS = {
{ pattern = "+(%d+) \195\160 la puissance d'attaque%.", effect = "ATTACKPOWER" },
{ pattern = "+(%d+) \195\160 la puissance des attaques \195\160 distance%.", effect = "RANGEDATTACKPOWER" },
{ pattern = "Augmente vos chances de bloquer une attaque de (%d+)%%%.", effect = "BLOCK" },
{ pattern = "Augmente vos chances d'esquiver une attaque de (%d+)%%%.", effect = "DODGE" },
{ pattern = "Augmente vos chances de parer une attaque par (%d+)%%%.", effect = "PARRY" },
{ pattern = "Augmente vos chances d'infliger des coups critiques avec vos sorts de (%d+)%%%.", effect = "SPELLCRIT" },
{ pattern = "Augmente vos chances d'infliger un coup critique de (%d+)%%%.", effect = "CRIT" },
{ pattern = "Augmente vos chances d'infliger un coup critique avec une arme \195\160 feu par (%d+)%%%.", effect = "RANGEDCRIT" },
{ pattern = "Augmente vos chances de lancer un soin critique par (%d+)%%%.", effect = "HEALCRIT" },
{ pattern = "Augmente les points de d\195\169g\195\162ts inflig\195\169s par les effets et les sorts des Arcanes de (%d+)% au maximum.", effect = "ARCANEDMG" },
{ pattern = "Augmente les points de d\195\169g\195\162ts inflig\195\169s par vos sorts et effets de Feu de (%d+)% au maximum.", effect = "FIREDMG" },
{ pattern = "Augmente les points de d\195\169g\195\162ts inflig\195\169s par les sorts et les effets de givre de (%d+)% au maximum.", effect = "FROSTDMG" },
{ pattern = "Augmente les dommages realises par les sorts Sacr\195\169s de (%d+)%.", effect = "HOLYDMG" },
{ pattern = "Augmente les points de d\195\169g\195\162ts inflig\195\169s par les sorts et les effets de Nature (%d+)% au maximum.", effect = "NATUREDMG" },
{ pattern = "Augmente les points de d\195\169g\195\162ts inflig\195\169s par les sorts et les effets d'ombre de (%d+)% au maximum.", effect = "SHADOWDMG" },
{ pattern = "(%d+)% aux d\195\169g\195\162ts des sorts d'ombres.", effect = "SHADOWDMG" },
{ pattern = "(%d+)% aux d\195\169g\195\162ts des sorts et aux soins", effect = "HEAL" },
{ pattern = "(%d+)% aux d\195\169g\195\162ts des sorts et aux soins", effect = "DMG" },
{ pattern = "(%d+)% aux d\195\169g\195\162ts des sorts", effect = "DMG" },
{ pattern = "Augmente les soins prodigu\195\169s par les sorts et effets de (%d+)% au maximum.", effect = "HEAL" },
{ pattern = "Augmente les d\195\169g\195\162ts et les soins prodigu\195\169s par les sorts et effets magiques de (%d+)% au maximum.", effect = "HEAL" },
{ pattern = "Augmente les d\195\169g\195\162ts et les soins produits par les sorts et effets magiques de (%d+)% au maximum.", effect = "DMG" },
{ pattern = "Rend (%d+) points de vie .+ %d secondes", effect = "HEALTHREG" },
{ pattern = "Rend (%d+) points de mana .+ %d secondes.", effect = "MANAREG" },
{ pattern = "Augmente vos chances de toucher de (%d+)%%%.", effect = "TOHIT" },
{ pattern = "Augmente vos chances de toucher avec des sorts de (%d+)%%%.", effect = "SPELLTOHIT" },
{ pattern = "P\195\170che augment\195\169e de (%d+)%.", effect = "FISHING" },
{ pattern = "D\195\169fense augment\195\169e de (%d+)%.", effect = "DEFENSE"},
{ pattern = "Augmente les d\195\169g\195\162ts et les soins produits par les sorts et effets magiques de (%d+)% au maximum.", effect = {"HEAL", "DMG" }},
};


	SI_IB_S1 = {
		{ pattern = "Arcane", effect = "ARCANE" },
		{ pattern = "Feu", effect = "FIRE" },
		{ pattern = "Givre", effect = "FROST" },
		{ pattern = "Sacr\195\169", effect = "HOLY" },
		{ pattern = "Ombre", effect = "SHADOW" },
		{ pattern = "Nature", effect = "NATURE" },
		{ pattern = "arcanes", effect = "ARCANE" },
		{ pattern = "feu", effect = "FIRE" },
		{ pattern = "givre", effect = "FROST" },
		{ pattern = "ombre", effect = "SHADOW" },
		{ pattern = "nature", effect = "NATURE" }
	};

	SI_IB_S2 = {
		{ pattern = "\195\169sistance", effect = "RES" },
		{ pattern = "d\195\169g\195\162ts", effect = "DMG" },
		{ pattern = "effets", effect = "DMG" }
	}; 

SI_IB_TOKEN_EFFECT = {
["Toutes les caract\195\169ristiques"] = {"STR", "AGI", "STA", "INT", "SPI"},
["Force"] = "STR",
["Agilit\195\169"] = "AGI",
["Endurance"] = "STA",
["Intelligence"] = "INT",
["Esprit"] = "SPI",

["\195\160 toutes les r\195\169sistances"] = { "ARCANERES", "FIRERES", "FROSTRES", "NATURERES", "SHADOWRES"},

["P\195\170che"] = "FISHING",
["Minage"] = "MINING",
["Herborisme"] = "HERBALISM",
["D\195\169pecage"] = "SKINNING",
["D\195\169fense"] = "DEFENSE",

["Puissance d\'Attaque"] = "ATTACKPOWER",
["Esquive"] = "DODGE",
["Bloquer"] = "BLOCK",
["Blocage"] = "BLOCK",
["Score de blocage"] = "BLOCKAMT",
["Puissance d\'attaque \195\160 distance"] = "RANGEDATTACKPOWER",
["Soins toutes les 5 sec."] = "HEALTHREG",
["Sorts de Soins"] = "HEAL",
["Mana toutes les 5 sec."] = "MANAREG",
["Dommages des Sorts"] = "DMG",
["Critique"] = "CRIT",
["D\195\169gats"] = "DMG",
["Vie"] = "HEALTH",
["PV"] = "HEALTH",
["Mana"] = "MANA",
["Armure"] = "ARMOR",
["Armure :"] = "ARMOR",
["Armure renforc\195\169e"] = "ARMOR",
}; 

--TRANSLATE ME
SI_IB_OTHER_PATTERNS = {
{ pattern = "Mana Regen (%d+) .+ %d+ sec%.", effect = "MANAREG" },
{ pattern = "Cachet de puissance zandalar", effect = "ATTACKPOWER", value = 30 },
{ pattern = "Cachet de mojo zandalar", effect = {"DMG", "HEAL"}, value = 18 },
{ pattern = "Cachet de s\195\169r\195\169nit\195\169 zandalar", effect = "HEAL", value = 33 },

{ pattern = "Huile de sorcier mineure", effect = {"DMG", "HEAL"}, value = 8 },
{ pattern = "Huile de sorcier infÃ©rieure", effect = {"DMG", "HEAL"}, value = 16 },
{ pattern = "Huile de sorcier brillante", effect = {"DMG", "HEAL", "SPELLCRIT"}, value = {36, 36, 1} },
{ pattern = "Huile de sorcier", effect = {"DMG", "HEAL"}, value = 24 },

{ pattern = "Huile de mana mineure", effect = "MANAREG", value = 4 },
{ pattern = "Huile de mana infÃ©rieure", effect = "MANAREG", value = 8 },
{ pattern = "Huile de mana brillante", effect = { "MANAREG", "HEAL"}, value = {12, 25} },
};

SI_BONUSWINDOWTITLE = "Bonus d\'objet";
SI_ITEMSHIDE = "Cacher Objets";
SI_ITEMSSHOW = "Montrer Objets";
SI_ITEMBUTTON_TOOLTIP = "Affiche l\'inventaire de la cible";
SI_HONORHIDE = "Cacher Honeur";
SI_HONORSHOW = "Montrer Honeur";
SI_HONORBUTTON_TOOLTIP = "Affiche l\'honneur de la cible";
SI_BONUSESHIDE = "Cacher Bonus";
SI_BONUSESSHOW = "Montrer Bonus";
SI_BONUSESBUTTON_TOOLTIP = "Affiche les bonus d\'objet de la cible";
SI_MOBINFOHIDE = "Cacher infos";
SI_MOBINFOSHOW = "Montrer infos";
SI_MOBINFOBUTTON_TOOLTIP = "Affiche les infos du monstre";
SI_LEVEL = "Niveau";
SI_NOTARGET = "Vous devez avoir une cible";
SI_REQUESTHONOR = "Recherche de l\'Honneur...";
SI_REQUESTHONORFAILED = "Recherche \195\169chou\195\169e\n(votre cible doit \196\170tre trop loin)";
SI_SETS = "Sets";
SI_RAREELITE = ELITE..ITEM_QUALITY3_DESC;
end 
-------------------------------
-------------------------------

SI_DURABILITYPATTERN = "^"..SI_DURABILITY.."%s(%d+)%s?/%s?(%d+)";

SI_IB_SETNAME_PATTERN = "^(.*) %(%d/(%d)%)$";

SI_IB_MULTISET_PREFIX = "%((%d*)%).*"..SI_IB_SET_PREFIX;

SI_IB_PREFIX_PATTERN = "^%+(%d+)%%?(.+)$";
SI_IB_SUFFIX_PATTERN = "^(.+)%+(%d+)%%?$";

SI_IB_EFFECTS = {
	{ effect = "STR",			name = SPELL_STAT0_NAME,		 	format = "+%d",			cat = "ATT" },
	{ effect = "AGI",			name = SPELL_STAT1_NAME, 			format = "+%d",			cat = "ATT" },
	{ effect = "STA",			name = SPELL_STAT2_NAME, 			format = "+%d",			cat = "ATT" },
	{ effect = "INT",			name = SPELL_STAT3_NAME, 			format = "+%d",			cat = "ATT" },
	{ effect = "SPI",			name = SPELL_STAT4_NAME,			format = "+%d",			cat = "ATT" },
	{ effect = "ARMOR",			name = SI_IB_ARMOR,				format = "+%d",			cat = "ATT" },

	{ effect = "ARCANERES",			name = RESISTANCE6_NAME,		format = GREEN_FONT_COLOR_CODE.."+%d",			cat = "RES" },
	{ effect = "FIRERES",			name = RESISTANCE2_NAME, 			format = GREEN_FONT_COLOR_CODE.."+%d",			cat = "RES" },
	{ effect = "NATURERES", 		name = RESISTANCE3_NAME, 		format = GREEN_FONT_COLOR_CODE.."+%d",			cat = "RES" },
	{ effect = "FROSTRES",			name = RESISTANCE4_NAME, 		format = GREEN_FONT_COLOR_CODE.."+%d",			cat = "RES" },
	{ effect = "SHADOWRES",			name = RESISTANCE5_NAME,		format = GREEN_FONT_COLOR_CODE.."+%d",			cat = "RES" },

	{ effect = "DEFENSE",			name = SI_IB_DEFENSE, 			format = "+%d",			cat = "SKILL" },
	{ effect = "MINING",			name = SI_IB_MINING,			format = "+%d",			cat = "SKILL" },
	{ effect = "HERBALISM",			name = SI_IB_HERBALISM, 		format = "+%d",			cat = "SKILL" },
	{ effect = "SKINNING", 			name = SI_IB_SKINNING, 		format = "+%d",			cat = "SKILL" },
	{ effect = "FISHING",			name = SI_IB_FISHING,			format = "+%d",			cat = "SKILL" },

	{ effect = "ATTACKPOWER", 		name = ATTACK_POWER_TOOLTIP, 		format = "+%d",			cat = "BON" },
	{ effect = "WEPDMG", 			name = SI_IB_WEPDMG, 			format = "+%d",			cat = "BON" },
	{ effect = "CRIT",			name = SI_IB_CRIT, 			format = "+%d%%",		cat = "BON" },
	{ effect = "BLOCK",			name = SI_IB_BLOCK, 			format = "+%d%%",		cat = "BON" },
	{ effect = "BLOCKAMT",			name = BLOCK, 			format = "+%d",		cat = "BON" },
	{ effect = "DODGE",			name = SI_IB_DODGE, 			format = "+%d%%",		cat = "BON" },
	{ effect = "PARRY", 			name = SI_IB_PARRY, 			format = "+%d%%",		cat = "BON" },
	{ effect = "TOHIT", 			name = SI_IB_TOHIT, 			format = "+%d%%",		cat = "BON" },
	{ effect = "XTRAHIT", 			name = SI_IB_XTRAHIT, 			format = "+%d%%",		cat = "BON" },
	{ effect = "RANDMG", 			name = SI_IB_RANDMG, 			format = "+%d",			cat = "BON" },
	{ effect = "RANGEDATTACKPOWER",		name = RANGED_ATTACK_POWER,	format = "+%d",			cat = "BON" },
	{ effect = "RANGEDCRIT",		name = SI_IB_RANGEDCRIT,		format = "+%d%%",		cat = "BON" },

	{ effect = "DMG",			name = SI_IB_DMG, 			format = "+%d",			cat = "SBON" },
	{ effect = "HEAL",			name = SI_IB_HEAL, 			format = "+%d",			cat = "SBON"},
	{ effect = "SPELLCRIT", 		name = SI_IB_SPELLCRIT,		format = "+%d%%",		cat = "SBON" },
	{ effect = "SPELLTOHIT", 		name = SI_IB_SPELLTOHIT,		format = "+%d%%",		cat = "SBON" },
	{ effect = "ARCANEDMG", 		name = SI_IB_ARCANEDMG, 		format = "+%d",			cat = "SBON" },
	{ effect = "FIREDMG", 			name = SI_IB_FIREDMG, 			format = "+%d",			cat = "SBON" },
	{ effect = "FROSTDMG",			name = SI_IB_FROSTDMG, 		format = "+%d",			cat = "SBON" },
	{ effect = "HOLYDMG",			name = SI_IB_HOLYDMG, 			format = "+%d",			cat = "SBON" },
	{ effect = "NATUREDMG",			name = SI_IB_NATUREDMG, 		format = "+%d",			cat = "SBON" },
	{ effect = "SHADOWDMG",			name = SI_IB_SHADOWDMG, 		format = "+%d",			cat = "SBON" },

	{ effect = "HEALTH",			name = SI_IB_HEALTH,			format = "+%d",			cat = "OBON" },
	{ effect = "HEALTHREG",			name = SI_IB_HEALTHREG,		format = "%d HP/5s",		cat = "OBON" },
	{ effect = "MANA",			name = SI_IB_MANA, 			format = "+%d",			cat = "OBON" },
	{ effect = "MANAREG",			name = SI_IB_MANAREG, 			format = "%d MP/5s",		cat = "OBON" },

	{ effect = "HIT_SHADOW",		name = SI_IB_HIT_SHADOW, 			format = "%d",		cat = "COH" },
	{ effect = "HIT_WOUND",			name = SI_IB_HIT_WOUND, 			format = "%d",		cat = "COH" },
};
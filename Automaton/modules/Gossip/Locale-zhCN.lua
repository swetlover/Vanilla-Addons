--By Kurax Kuang
--update by wangmarsfa
--Credits to Thomas Mo(昏睡墨鱼)@CWDG
local L = AceLibrary("AceLocale-2.2"):new("Automaton_Gossip")

L:RegisterTranslations("zhCN", function() return {
["Gossip"] = "Gossip",
["Automatically complete quests and skip gossip text"] = "还任务时自动跳过闲聊窗口，直接完成任务",

--------------
-- Gossip Text
--------------

["<Touch the unstable rift crystal.>"] = "<Touch the unstable rift crystal.>", -- Need translation, MC entrance
["<Place my hand on the orb.>"] = "<Place my hand on the orb.>", -- Need translation, BWL entrance
["Transport me to the Molten Core, Lothos."] = "Transport me to the Molten Core, Lothos.",
["Thank you, Stable Master. Please take the animal."] = "Thank you, Stable Master. Please take the animal.", -- Need translation, AV quest
["With pleasure. These things stink!"] = "With pleasure. These things stink!", -- Need translation, AV quest
["Trick or Treat!"] = "不给糖就捣乱！",
["Grant me your mark, wise ancient."] = "赐予我你的印记吧，睿智的古树。",
["Grant me your mark, mighty ancient."] = "赐予我你的印记吧，强大的古树。",
["Please take me to the master's lair."] = "请带我去主人的巢穴。",
["I need a pack of incendiary bombs."] = "我需要燃烧弹包。",
["I'm ready to go to Durholde Keep."] = "我准备好去敦霍尔德城堡了。",
["I require a chrono-beacon, Sa'at."] = "我需要一个时空道标，萨艾特。",
["Naturalist, please grant me your boon."] = "Naturalist, please grant me your boon.", -- Need translation, in SP, before the final boss
["I would be grateful for any aid you can provide, Priestess."] = "I would be grateful for any aid you can provide, Priestess.",

-------------
-- Quest Text
-------------

-- Fishing
["Apprentice Angler"] = "钓鱼学徒",
["Speckled Tastyfish"] = "斑点可口鱼",

-- Alterac Valley quests
["Empty Stables"] = "补充坐骑",
["Ram Hide Harnesses"] = "羊皮坐具",
["Alterac Ram Hide"] = "奥特兰克山羊皮",
["Ram Riding Harnesses"] = "山羊坐具",
["Frostwolf Hide"] = "霜狼毛皮",
["More Booty!"] = "取之于敌",
["More Armor Scraps"] = "护甲碎片",
["Armor Scraps"] = "护甲碎片",
["Coldtooth Supplies"] = "冷齿矿洞的补给",
["Irondeep Supplies"] = "深铁矿洞的补给",
["Lokholar the Ice Lord"] = "冰雪之王洛克霍拉",
["Stormpike Soldier's Blood"] = "联盟士兵的血",
["A Gallon of Blood"] = "联盟之血",
["Ivus the Forest Lord"] = "森林之王伊弗斯",
["Storm Crystal"] = "风暴水晶",
["Crystal Cluster"] = "水晶簇",
["Call of Air - Slidore's Fleet"] = "天空的召唤 - 斯里多尔的空军",
["Call of Air - Vipore's Fleet"] = "天空的召唤 - 维波里的空军",
["Call of Air - Ichman's Fleet"] = "天空的召唤 - 艾克曼的空军",
["Frostwolf Soldier's Medal"] = "部落士兵的勋章",
["Frostwolf Lieutenant's Medal"] = "部落士官的勋章",
["Frostwolf Commander's Medal"] = "部落指挥官的勋章",
["Call of Air - Guse's Fleet"] = "天空的召唤 - 古斯的部队",
["Call of Air - Jeztor's Fleet"] = "天空的召唤 - 杰斯托的部队",
["Call of Air - Mulverick's Fleet"] = "天空的召唤 - 穆维里克的部队",
["Stormpike Soldier's Flesh"] = "联盟士兵的食物",
["Stormpike Lieutenant's Flesh"] = "联盟士官的食物",
["Stormpike Commander's Flesh"] = "联盟指挥官的食物",

-- Felwood salves
["Salve via Gathering"] = "采集换药膏",
["Fel Creep"] = "魔藤",
["Salve via Mining"] = "采矿换药膏",
["Tainted Vitriol"] = "被污染的硫酸盐",
["Salve via Skinning"] = "剥皮换药膏",
["Patch of Tainted Skin"] = "被污染的毛皮",
["Salve via Hunting"] = "狩猎换药膏",
["Corrupted Soul Shard"] = "被污染的灵魂碎片",
["Salve via Disenchanting"] = "分解换药膏",
["Lesser Nether Essence"] = "次级虚空精华",

-- Felwood plants
["Corrupted Whipper Root"] = "被腐化的鞭根草",
["Corrupted Songflower"] = "被腐化的轻歌花",
["Corrupted Windblossom"] = "被腐化的迎风花",
["Corrupted Night Dragon"] = "被腐化的夜龙草",
["Cenarion Plant Salve"] = "塞纳里奥植物药膏",

-- Ravenholdt
["Syndicate Emblems"] = "辛迪加徽章",
["Syndicate Emblem"] = "辛迪加徽章",

-- Thorium Shells -> Thorium Arrows
["A Fair Trade"] = "公平交易",
["Thorium Shells"] = "瑟银弹",

-- Cenarion
["Encrypted Twilight Texts"] = "暮光密文信",
["Encrypted Twilight Text"] = "暮光密文信",

-- Argent Dawn
["Minion's Scourgestones"] = "爪牙的天灾石",
["Minion's Scourgestone"] = "爪牙的天灾石",
["Invader's Scourgestones"] = "侵略者的天灾石",
["Invader's Scourgestone"] = "侵略者的天灾石",
["Corruptor's Scourgestones"] = "堕落者的天灾石",
["Corruptor's Scourgestone"] = "堕落者的天灾石",
["Bone Fragments"] = "白骨碎片",
["Crypt Fiend Parts"] = "地穴魔的碎片",
["Core of Elements"] = "元素之核",
["Dark Iron Scraps"] = "黑铁碎片",

-- Timbermaw
["Feathers for Grazle"] = "给格拉兹的羽毛",
["Feathers for Nafien"] = "给纳菲恩的羽毛",
["Beads for Salfa"] = "给萨尔法的珠串",
["Deadwood Headdress Feather"] = "死木头饰羽毛",
["Winterfall Spirit Beads"] = "冬泉灵魂珠串",

-- Cauldron quests
["Gahrron's Withering Cauldron"] = "盖罗恩农场的瘟疫之锅",
["Writhing Haunt Cauldron"] = "嚎哭鬼屋的瘟疫之锅",
["Felstone Field Cauldron"] = "费尔斯通农场的瘟疫之锅",
["Dalson's Tears Cauldron"] = "达尔松之泪的瘟疫之锅",
["Arcane Quickener"] = "奥术催化剂",
["Ectoplasmic Resonator"] = "外膜震荡体",
["Somatic Intensifier"] = "细胞增强剂",
["Osseous Agitator"] = "骨质分离素",

-- Gadgetzan
["Water Pouch Bounty"] = "收集水袋",
["Wastewander Water Pouch"] = "废土水袋",

-- Thorium Brotherhood
["Gaining Acceptance"] = "获得信任",
["Dark Iron Residue"] = "黑铁残油",
["Restoring Fiery Flux Supplies via Kingsblood"] = "炽热助熔剂的补给：皇血草",
["Kingsblood"] = "皇血草",
["Restoring Fiery Flux Supplies via Iron"] = "炽热助熔剂的补给：铁锭",
["Iron Bar"] = "铁锭",
["Restoring Fiery Flux Supplies via Heavy Leather"] = "炽热助熔剂的补给：重皮",
["Heavy Leather"] = "重皮",
["Incendosaur Scale"] = "熏火龙的鳞片",
["Coal"] = "煤块",
["Favor Amongst the Brotherhood, Dark Iron Ore"] = "兄弟会的好感 - 黑铁矿石",
["Dark Iron Ore"] = "黑铁矿石",
["Favor Amongst the Brotherhood, Blood of the Mountain"] = "兄弟会的好感 - 山脉之血",
["Blood of the Mountain"] = "山脉之血",
["Favor Amongst the Brotherhood, Core Leather"] = "兄弟会的好感 - 熔火犬皮",
["Core Leather"] = "熔火犬皮",
["Favor Amongst the Brotherhood, Fiery Core"] = "兄弟会的好感 - 炽热之核",
["Fiery Core"] = "炽热之核",
["Favor Amongst the Brotherhood, Lava Core"] = "兄弟会的好感 - 熔岩之核",
["Lava Core"] = "熔岩之核",

-- City faction
["Additional Runecloth"] = "更多的符文布",
["Runecloth"] = "符文布",

-- Wildhammer faction
["Troll Necklace Bounty"] = "巨魔部族项链",
["Troll Tribal Necklace"] = "巨魔部族项链",

-- E'ko quests
["Chillwind E'ko Item"] = "冰风魂精",
["Chillwind E'ko Quest"] = "冰风魂精",
["Frostmaul E'ko Item"] = "霜槌魂精",
["Frostmaul E'ko Quest"] = "霜槌魂精",
["Frostsaber E'ko Item"] = "霜刃魂精",
["Frostsaber E'ko Quest"] = "霜刃魂精",
["Ice Thistle E'ko Item"] = "冰草魂精",
["Ice Thistle E'ko Quest"] = "冰草魂精",
["Shardtooth E'ko Item"] = "碎齿魂精",
["Shardtooth E'ko Quest"] = "碎齿魂精",
["Wildkin E'ko Item"] = "枭兽魂精",
["Wildkin E'ko Quest"] = "枭兽魂精",
["Winterfall E'ko"] = "寒水魂精",

-- Zul'Gurub quests
["Zulian, Razzashi, and Hakkari Coins"] = "祖利安、拉扎什和哈卡莱硬币",
["Zulian Coin"] = "祖利安硬币",
["Razzashi Coin"] = "拉扎什硬币",
["Hakkari Coin"] = "哈卡莱硬币",
["Gurubashi, Vilebranch, and Witherbark Coins"] = "古拉巴什、邪枝和枯木硬币",
["Gurubashi Coin"] = "古拉巴什硬币",
["Vilebranch Coin"] = "邪枝硬币",
["Witherbark Coin"] = "枯木硬币",
["Sandfury, Skullsplitter, and Bloodscalp Coins"] = "沙怒、碎颅和血顶硬币",
["Sandfury Coin"] = "沙怒硬币",
["Skullsplitter Coin"] = "碎颅硬币",
["Bloodscalp Coin"] = "血顶硬币",

-- AQ War Effort (Horde)
["The Horde Needs More Runecloth Bandages!"] = "部落需要更多符文布绷带！",
["The Horde Needs More Mageweave Bandages!"] = "部落需要更多魔纹绷带！",
["The Horde Needs More Wool Bandages!"] = "部落需要更多绒线绷带！",
["The Horde Needs More Rugged Leather!"] = "部落需要更多硬甲皮！",
["The Horde Needs More Thick Leather!"] = "部落需要更多厚皮！",
["The Horde Needs More Heavy Leather!"] = "部落需要更多重皮！",
["The Horde Needs More Purple Lotus!"] = "部落需要更多紫莲花！",
["The Horde Needs More Firebloom!"] = "部落需要更多火焰花！",
["The Horde Needs More Peacebloom!"] = "部落需要更多宁神花！",
["The Horde Needs More Mithril Bars!"] = "部落需要更多秘银锭！",
["The Horde Needs More Tin Bars!"] = "部落需要更多锡锭！",
["The Horde Needs More Copper Bars!"] = "部落需要更多铜锭！",
["The Horde Needs More Lean Wolf Steaks!"] = "部落需要更多瘦狼排！",
["The Horde Needs More Spotted Yellowtail!"] = "部落需要更多斑点黄尾鱼！",
["The Horde Needs More Baked Salmon!"] = "部落需要更多烤鲑鱼！",

-- AQ War Effort (Alliance)
["The Alliance Needs More Linen Bandages!"] = "联盟需要更多亚麻绷带！",
["The Alliance Needs More Silk Bandages!"] = "联盟需要更多丝质绷带！",
["The Alliance Needs More Runecloth Bandages!"] = "联盟需要更多符文布绷带！",
["The Alliance Needs More Light Leather!"] = "联盟需要更多轻皮！",
["The Alliance Needs More Medium Leather!"] = "联盟需要更多中皮！",
["The Alliance Needs More Thick Leather!"] = "联盟需要更多厚皮！",
["The Alliance Needs More Stranglekelp!"] = "联盟需要更多荆棘藻！",
["The Alliance Needs More Purple Lotus!"] = "联盟需要更多紫莲花！",
["The Alliance Needs More Arthas' Tears!"] = "联盟需要更多阿尔萨斯之泪！",
["The Alliance Needs More Copper Bars!"] = "联盟需要更多铜锭！",
["The Alliance Needs More Iron Bars!"] = "联盟需要更多铁锭！",
["The Alliance Needs More Thorium Bars!"] = "联盟需要更多瑟银锭！",
["The Alliance Needs More Rainbow Fin Albacore!"] = "联盟需要更多彩鳍鱼！",
["The Alliance Needs More Roast Raptor!"] = "联盟需要更多烤迅猛龙肉！",
["The Alliance Needs More Spotted Yellowtail!"] = "联盟需要更多斑点黄尾鱼！",

-- AQ War Effort Items
["Linen Bandage"] = "亚麻绷带",
["Wool Bandage"] = "绒线绷带",
["Silk Bandage"] = "丝质绷带",
["Mageweave Bandage"] = "魔纹绷带",
["Runecloth Bandage"] = "符文布绷带",
["Light Leather"] = "轻皮",
["Medium Leather"] = "中皮",
["Heavy Leather"] = "重皮",
["Thick Leather"] = "厚皮",
["Rugged Leather"] = "硬甲皮",
["Purple Lotus"] = "紫莲花",
["Stranglekelp"] = "荆棘藻",
["Arthas' Tears"] = "阿尔萨斯之泪",
["Firebloom"] = "火焰花",
["Peacebloom"] = "宁神花",
["Copper Bar"] = "铜锭",
["Tin Bar"] = "锡锭",
["Iron Bar"] = "铁锭",
["Mithril Bar"] = "秘银锭",
["Thorium Bar"] = "瑟银锭",
["Lean Wolf Steak"] = "瘦狼排",
["Spotted Yellowtail"] = "斑点黄尾鱼",
["Baked Salmon"] = "烤鲑鱼",
["Roast Raptor"] = "烤迅猛龙肉",
["Rainbow Fin Albacore"] = "彩鳍鱼",

-- Commendation Signets
["One Commendation Signet"] = "一枚荣誉徽章",
["Ten Commendation Signets"] = "十枚荣誉徽章",
["Horde Commendation Signet"] = "部落荣誉徽章",
["Alliance Commendation Signet"] = "联盟荣誉徽章",

	-------------
-- Burning Crusade
	-------------

--Scryers
["More Firewing Signets"] = "更多火翼徽记",
["Single Firewing Signet"] = "单枚火翼徽记",
["Firewing Signet"] = "火翼徽记",
["More Sunfury Signets"] = "更多日怒徽记",
["Single Sunfury Signet"] = "单枚日怒徽记",
["Sunfury Signet"] = "日怒徽记",
["Arcane Tomes"] = "奥法宝典",
["Arcane Tome"] = "奥法宝典",

--Aldor
["Strained Supplies"] = "物资紧张",
["Dreadfang Venom Sac"] = "巨牙毒囊",
["More Marks of Sargeras"] = "更多萨格拉斯印记",
["Single Mark of Sargeras"] = "单枚萨格拉斯印记",
["Mark of Sargeras"] = "萨格拉斯印记",
["More Marks of Kil'jaeden"] = "更多基尔加丹印记",
["Single Mark of Kil'jaeden"] = "单枚基尔加丹印记",
["Mark of Kil'jaeden"] = "基尔加丹印记",
["Fel Armaments"] = "邪能装备",
["Fel Armament"] = "邪能装备",

-- Zangarmarsh

-- Cenarion Refuge
["Identify Plant Parts"] = "鉴定植物",
["Unidentified Plant Parts"] = "未鉴定过的植物",
["Coilfang Armaments"] = "盘牙武器",

-- Sporeggar
["More Spore Sacs"] = "更多孢子囊",
["Mature Spore Sac"] = "成熟的孢子囊",
["More Tendrils!"] = "更多卷须！",
["Bog Lord Tendril"] = "沼泽领主的卷须",
["More Glowcaps"] = "更多亮顶蘑菇",
["Glowcap"] = "亮顶蘑菇",
["Bring Me Another Shrubbery!"] = "我还要红色木槿！",
["Sanguine Hibiscus"] = "红色木槿",
["More Fertile Spores"] = "更多成熟的孢子",
["Fertile Spore"] = "成熟的孢子",

-- Terokkar Forest

-- Spinebreaker Hold
["More Arakkoa Feathers"] = "更多羽毛",
["Arakkoa Feather"] = "鸦人的羽毛",

-- Skettis
["More Shadow Dust"] = "更多暗影之尘",
["Shadow Dust"] = "暗影之尘",

-- Nagrand

	-- Garadar/Telaar
["More Warbeads"] = "更多作战念珠",
["More Warbeads!"] = "更多作战念珠！",
["Obsidian Warbeads"] = "黑曜石作战念珠",

-- Halaa
["Oshu'gun Crystal Powder"] = "沃舒古水晶尘",
["Oshu'gun Crystal Powder Sample"] = "沃舒古水晶尘样本",

-- Aeris Landing
["More Heads Full of Ivory"] = "更多象牙",
["Pair of Ivory Tusks"] = "象牙",
["More Crystal Fragments"] = "更多水晶碎片",
["Oshu'gun Crystal Fragment"] = "沃舒古水晶碎片",
["More Obsidian Warbeads"] = "更多黑曜石作战念珠",

-- Netherstorm

-- Area 52
["Another Heap of Ethereals"] = "更多叛徒的徽记",
["Zaxxis Insignia"] = "萨克希斯徽记",
	
-- Ethereum
["Ethereum Prisoner I.D. Catalogue"] = "复仇军囚犯的标识牌",
["Ethereum Prisoner I.D. Tag"] = "复仇军囚犯标识牌",

-- Shadowmoon Valley

-- Netherwing Ledge
["Accepting All Eggs"] = "所有的龙卵",
["Netherwing Egg"] = "灵翼龙卵",

	-- 2.4 Battleground mark turn-in
  ["Concerted Efforts"] = "共同的努力",
  ["For Great Honor"] = "无上的荣耀",
  ["Alterac Valley Mark of Honor"] = "奥特兰克山谷荣誉奖章",
	["Arathi Basin Mark of Honor"] = "阿拉希盆地荣誉奖章",
	["Warsong Gulch Mark of Honor"] = "战歌峡谷荣誉奖章",
	["Eye of the Storm Mark of Honor"] = "风暴之眼荣誉奖章",
			
} end )
--[[
	Name: Babble-ItemSet-2.2
	Revision: $Rev: 1000 $
	Author(s): Lichery
	Description: A library to provide localizations for factions.
	Dependencies: AceLibrary, AceLocale-2.2
]]
-- Проверить ЗГ, АК20, АК40, Т3, разобраться с сетами AB
local MAJOR_VERSION = "Babble-ItemSet-2.2"
local MINOR_VERSION = tonumber(string.sub("$Revision: 1000 $", 12, -3))

if not AceLibrary then error(MAJOR_VERSION .. " requires AceLibrary") end

if not AceLibrary:HasInstance("AceLocale-2.2") then error(MAJOR_VERSION .. " requires AceLocale-2.2") end

local _, x = AceLibrary("AceLocale-2.2"):GetLibraryVersion()
MINOR_VERSION = MINOR_VERSION * 100000 + x

if not AceLibrary:IsNewVersion(MAJOR_VERSION, MINOR_VERSION) then return end

local BabbleItemSet = AceLibrary("AceLocale-2.2"):new(MAJOR_VERSION)

-- uncomment below for debug information
-- BabbleItemSet:EnableDebugging()

BabbleItemSet:RegisterTranslations("zhCN", function()
	return {
	-- Blacksmithing Crafted Sets
		["Bloodsoul Embrace"] = "血魂的拥抱",
		["Imperial Plate"] = "君王板甲",
		["The Darksoul"] = "黑暗之魂",
    -- Tailoring Crafted Sets
		["Bloodvine Garb"] = "血藤",
    -- Leatherworking Crafted Sets
		["Black Dragon Mail"] = "黑龙锁甲",
		["Blood Tiger Harness"] = "血虎",
		["Blue Dragon Mail"] = "蓝龙锁甲",
		["Devilsaur Armor"] = "魔暴龙护甲",
		["Green Dragon Mail"] = "绿龙锁甲",
		["Ironfeather Armor"] = "铁羽护甲",
		["Primal Batskin"] = "原始蝙蝠皮套装",
		["Stormshroud Armor"] = "雷暴",
		["Volcanic Armor"] = "火山",
    --Pre60 Sets
		["Battlegear of Undead Slaying"] = "亡灵毁灭者",
		["Bloodmail Regalia"] = "血链",
		["Cadaverous Garb"] = "苍白",
		["Chain of the Scarlet Crusade"] = "血色十字军链甲",
		["Dal'Rend's Arms"] = "雷德双刀",
		["Deathbone Guardian"] = "亡者之骨",
		["Defias Leather"] = "迪菲亚皮甲",
		["Embrace of the Viper"] = "毒蛇的拥抱",
		["Garb of the Undead Slayer"] = "亡灵屠戮者的装备",
		["Ironweave Battlesuit"] = "铁纹作战套装",
		["Major Mojo Infusion"] = "极效魔精套装",
		["Necropile Raiment"] = "骨堆",
		["Overlord's Resolution"] = "督军的决心",
		["Prayer of the Primal"] = "远古祷言",
		["Primal Blessing"] = "原始祝福",
		["Regalia of Undead Cleansing"] = "亡灵净化者",
		["Shard of the Gods"] = "天神碎片",
		["Spider's Kiss"] = "蜘蛛之吻",
		["Spirit of Eskhandar"] = "艾斯卡达尔之魂",
		["The Gladiator"] = "角斗士",
		["The Postmaster"] = "邮差",
		["The Twin Blades of Hakkari"] = "哈卡莱双刃",
		["Undead Slayer's Armor"] = "亡灵屠戮者的护甲",
		["Zanzil's Concentration"] = "赞吉尔的专注",
    --ZG Sets
		["Augur's Regalia"] = "预言者套装",
		["Confessor's Raiment"] = "忏悔者衣饰",
		["Demoniac's Threads"] = "恶魔师护甲",
		["Freethinker's Armor"] = "思考者护甲",
		["Haruspex's Garb"] = "占卜师套装",
		["Illusionist's Attire"] = "幻术师套装",
		["Madcap's Outfit"] = "狂妄者套装",
		["Predator's Armor"] = "捕猎者套装",
		["Vindicator's Battlegear"] = "辩护者重甲",
    --AQ20 Sets
		["Battlegear of Eternal Justice"] = "永恒的公正",
		["Battlegear of Unyielding Strength"] = "坚定的力量",
		["Emblems of Veiled Shadows"] = "笼罩之阴影",
		["Finery of Infinite Wisdom"] = "无尽的智慧",
		["Gift of the Gathering Storm"] = "聚集的风暴",
		["Implements of Unspoken Names"] = "禁断的邪语",
		["Symbols of Unending Life"] = "不灭的生命",
		["Trappings of the Unseen Path"] = "隐秘的通途",
		["Trappings of Vaulted Secrets"] = "魔法的秘密",
    --AQ40 Sets
		["Avenger's Battlegear"] = "复仇者",
		["Conqueror's Battlegear"] = "征服者",
		["Deathdealer's Embrace"] = "死亡执行者的拥抱",
		["Doomcaller's Attire"] = "厄运召唤者",
		["Enigma Vestments"] = "神秘套装",
		["Garments of the Oracle"] = "神谕者",
		["Genesis Raiment"] = "起源套装",
		["Stormcaller's Garb"] = "风暴召唤者",
		["Striker's Garb"] = "攻击者",
    --T0 Sets
		["Battlegear of Valor"] = "勇气",
		["Beaststalker Armor"] = "野兽追猎者",
		["Dreadmist Raiment"] = "鬼雾",
		["Lightforge Armor"] = "光铸护甲",
		["Magister's Regalia"] = "博学者的徽记",
		["Shadowcraft Armor"] = "迅影",
		["The Elements"] = "元素",
		["Vestments of the Devout"] = "虔诚",
		["Wildheart Raiment"] = "野性之心",
    --T0.5 Sets
		["Battlegear of Heroism"] = "英勇",
		["Beastmaster Armor"] = "兽王",
		["Darkmantle Armor"] = "暗幕",
		["Deathmist Raiment"] = "死雾",
		["Feralheart Raiment"] = "狂野之心",
		["Sorcerer's Regalia"] = "巫师",
		["Soulforge Armor"] = "魂铸",
		["The Five Thunders"] = "五雷",
		["Vestments of the Virtuous"] = "坚贞",
    --T1 Sets
		["Arcanist Regalia"] = "奥术师",
		["Battlegear of Might"] = "力量",
		["Cenarion Raiment"] = "塞纳里奥",
		["Felheart Raiment"] = "恶魔之心",
		["Giantstalker Armor"] = "巨人追猎者",
		["Lawbringer Armor"] = "秩序之源",
		["Nightslayer Armor"] = "夜幕杀手",
		["The Earthfury"] = "大地之怒",
		["Vestments of Prophecy"] = "预言",
    --T2 Sets
		["Battlegear of Wrath"] = "愤怒",
		["Bloodfang Armor"] = "血牙",
		["Dragonstalker Armor"] = "巨龙追猎者",
		["Judgement Armor"] = "审判",
		["Nemesis Raiment"] = "复仇",
		["Netherwind Regalia"] = "灵风",
		["Stormrage Raiment"] = "怒风",
		["The Ten Storms"] = "无尽风暴",
		["Vestments of Transcendence"] = "卓越",
    --T3 Sets
		["Bonescythe Armor"] = "骨镰",
		["Cryptstalker Armor"] = "地穴追猎者",
		["Dreamwalker Raiment"] = "梦游者",
		["Frostfire Regalia"] = "霜火",
		["Plagueheart Raiment"] = "瘟疫之心",
		["Redemption Armor"] = "救赎",
		["The Earthshatterer"] = "碎地者",
		["Vestments of Faith"] = "信仰",
		["Dreadnaught's Battlegear"] = "无畏",
	--PvP Epic Horde Sets
		["Warlord's Battlegear"] = "督军的战甲",
		["Warlord's Earthshaker"] = "督军的震撼",
		["Warlord's Pursuit"] = "督军的猎装",
		["Warlord's Raiment"] = "督军的神服",
		["Warlord's Regalia"] = "督军的法衣",
		["Warlord's Sanctuary"] = "督军的圣装",
		["Warlord's Threads"] = "督军的魔装",
		["Warlord's Vestments"] = "督军的制服",
    --PvP Epic Alliance Sets		
		["Field Marshal's Aegis"] = "元帅的庇护",
		["Field Marshal's Battlegear"] = "元帅的战甲",
		["Field Marshal's Pursuit"] = "元帅的猎装",
		["Field Marshal's Raiment"] = "元帅的神服",
		["Field Marshal's Regalia"] = "元帅的法衣",
		["Field Marshal's Sanctuary"] = "元帅的圣装",
		["Field Marshal's Threads"] = "元帅的魔装",
		["Field Marshal's Vestments"] = "元帅的制服",
    --PvP Rare Horde Sets
		["Champion's Refuge"] = "勇士的庇护",
		["Champion's Pursuance"] = "勇士的职责",
		["Champion's Arcanum"] = "勇士的秘密",
		["Champion's Investiture"] = "勇士的授权",
		["Champion's Guard"] = "勇士的套装",
		["Champion's Stormcaller"] = "勇士的风暴",
		["Champion's Dreadgear"] = "勇士的鬼纹",
		["Champion's Battlearmor"] = "勇士的战铠",
    --PvP Rare Alliance Sets	
		["Lieutenant Commander's Refuge"] = "少校的庇护",
		["Lieutenant Commander's Pursuance"] = "少校的职责",
		["Lieutenant Commander's Arcanum"] = "少校的秘密",
		["Lieutenant Commander's Redoubt"] = "少校的壁垒",
		["Lieutenant Commander's Investiture"] = "少校的授权",
		["Lieutenant Commander's Guard"] = "少校的护卫",
		["Lieutenant Commander's Dreadgear"] = "少校的鬼纹",
		["Lieutenant Commander's Battlearmor"] = "少校的战铠",
	--AB Rare Horde Sets
		["The Defiler's Determination"] = "污染者的果断",
		["The Defiler's Fortitude"] = "污染者的坚韧",
		["The Defiler's Intent"] = "污染者的专注",
		["The Defiler's Purpose"] = "污染者的毅力",
		["The Defiler's Resolution"] = "污染者的决心",
		["The Defiler's Will"] = "污染者的意志",
	--AB Rare Alliance Sets
		["The Highlander's Determination"] = "高地人的果断",
		["The Highlander's Fortitude"] = "高地人的坚韧",
		["The Highlander's Intent"] = "高地人的专注",
		["The Highlander's Purpose"] = "高地人的毅力",
		["The Highlander's Resolution"] = "高地人的决心",
		["The Highlander's Resolve"] = "高地人的执著",
		["The Highlander's Will"] = "高地人的意志",
		
		["Twilight Trappings"] = "暮光套装",
		
		
		["Lieutenant Commander's Aegis"] = "少校的庇护",
		["Lieutenant Commander's Battlegear"] = "少校的战甲",
		["Lieutenant Commander's Pursuit"] = "少校的猎装",
		["Lieutenant Commander's Raiment"] = "少校的神服",
		["Lieutenant Commander's Regalia"] = "少校的法衣",
		["Lieutenant Commander's Sanctuary"] = "少校的圣装",
		["Lieutenant Commander's Threads"] = "少校的魔装",
		["Lieutenant Commander's Vestments"] = "少校的制服",	
		
		["Champion's Battlegear"] = "勇士的战甲",
		["Champion's Earthshaker"] = "勇士的震撼",
		["Champion's Pursuit"] = "勇士的猎装",
		["Champion's Raiment"] = "勇士的神服",
		["Champion's Regalia"] = "勇士的法衣",
		["Champion's Sanctuary"] = "勇士的圣装",
		["Champion's Threads"] = "勇士的魔装",
		["Champion's Vestments"] = "勇士的制服",
	}
end)

BabbleItemSet:RegisterTranslations("ruRU", function()
	return {
	-- Blacksmithing Crafted Sets
		["Bloodsoul Embrace"] = "Объятия Кровавого Духа",
		["Imperial Plate"] = "Исперские латы",
		["The Darksoul"] = "Темная душа",
    -- Tailoring Crafted Sets
		["Bloodvine Garb"] = "Одеяния кровавой лозы",
    -- Leatherworking Crafted Sets
		["Black Dragon Mail"] = "Кольчуга Черного дракона",
		["Blood Tiger Harness"] = "Доспехи кровавого тигра",
		["Blue Dragon Mail"] = "Кольчужный доспех из чешуи синего дракона",
		["Devilsaur Armor"] = "Доспехи из кожи дьявозавра",
		["Green Dragon Mail"] = "Кольчуга Зеленого дракона",
		["Ironfeather Armor"] = "Железноперые доспехи",
		["Primal Batskin"] = "Шкура древней летучей мыши",
		["Stormshroud Armor"] = "Доспехи Грозового покрова",
		["Volcanic Armor"] = "Вулканические доспехи",
    --Pre60 Sets
		["Battlegear of Undead Slaying"] = "Броня истребителя нежити",
		["Bloodmail Regalia"] = "Регалии Кровавой кольчуги",
		["Cadaverous Garb"] = "Трупный наряд",
		["Chain of the Scarlet Crusade"] = "Цепь Алого ордена",
		["Dal'Rend's Arms"] = "Руки Дал'Ренда",
		["Deathbone Guardian"] = "Костяной Страж",
		["Defias Leather"] = "Кожаные доспехи Братства Справедливости",
		["Embrace of the Viper"] = "Объятия гадюки",
		["Garb of the Undead Slayer"] = "Облачение Истребителя нежити",
		["Ironweave Battlesuit"] = "Железотканые доспехи",
		["Major Mojo Infusion"] = "Великое вуду",
		["Necropile Raiment"] = "Одеяния Праха",
		["Overlord's Resolution"] = "Решимость Властителя",
		["Prayer of the Primal"] = "Молитва Изначального",
		["Primal Blessing"] = "Простое Благословение",
		["Regalia of Undead Cleansing"] = "Регалии Зачистки Нежити",
		["Shard of the Gods"] = "Осколок Богов",
		["Spider's Kiss"] = "Поцелуй паука",
		["Spirit of Eskhandar"] = "Дух Эсхандара",
		["The Gladiator"] = "Гладиатор",
		["The Postmaster"] = "Вестник",
		["The Twin Blades of Hakkari"] = "Парные клинки Хаккари",
		["Undead Slayer's Armor"] = "Доспехи истребителя нежити",
		["Zanzil's Concentration"] = "Сосредоточение Занзила",
    --ZG Sets
		["Augur's Regalia"] = "Регалии Авгура",
		["Confessor's Raiment"] = "Облачение Исповедника",
		["Demoniac's Threads"] = "Дьявольские нити",
		["Freethinker's Armor"] = "Доспехи Вольнодумца",
		["Haruspex's Garb"] = "Наряд гаруспика",
		["Illusionist's Attire"] = "Наряд Мастера иллюзий",
		["Madcap's Outfit"] = "Одеяния безумца",
		["Predator's Armor"] = "Доспехи Хищника",
		["Vindicator's Battlegear"] = "Броня воздаятеля",
    --AQ20 Sets
		["Battlegear of Eternal Justice"] = "Броня Вечной Справедливости",
		["Battlegear of Unyielding Strength"] = "Броня неумолимой силы",
		["Emblems of Veiled Shadows"] = "Знаки сокрытых теней",
		["Finery of Infinite Wisdom"] = "Облачение беспредельной мудрости",
		["Gift of the Gathering Storm"] = "Дар Зова Бури",
		["Implements of Unspoken Names"] = "Воплощение Неназванных имен",
		["Symbols of Unending Life"] = "Символы Бесконечной жизни",
		["Trappings of the Unseen Path"] = "Ловушки Незримого Пути",
		["Trappings of Vaulted Secrets"] = "Облачение Погребенных тайн",
    --AQ40 Sets
		["Avenger's Battlegear"] = "Броня Мстителя",
		["Conqueror's Battlegear"] = "Броня Завоевателя",
		["Deathdealer's Embrace"] = "Объятия торговца смертью",
		["Doomcaller's Attire"] = "Наряд Призывателя Рока",
		["Enigma Vestments"] = "Облачение Тайны",
		["Garments of the Oracle"] = "Облачение Оракула",
		["Genesis Raiment"] = "Ризы сотворения",
		["Stormcaller's Garb"] = "Одеяния Зова Бури",
		["Striker's Garb"] = "Одеяния бойца",
    --T0 Sets
		["Battlegear of Valor"] = "Броня Доблести",
		["Beaststalker Armor"] = "Доспехи загонщика",
		["Dreadmist Raiment"] = "Одеяния Багрового Тумана",
		["Lightforge Armor"] = "Доспехи Светлой стали",
		["Magister's Regalia"] = "Регалии Магистра",
		["Shadowcraft Armor"] = "Доспехи незаметности",
		["The Elements"] = "Стихии",
		["Vestments of the Devout"] = "Ризы Благочестия",
		["Wildheart Raiment"] = "Облачение дикого сердца",
    --T0.5 Sets
		["Battlegear of Heroism"] = "Броня Героизма",
		["Beastmaster Armor"] = "Доспехи Повелителя зверей",
		["Darkmantle Armor"] = "Доспехи Покрова тьмы",
		["Deathmist Raiment"] = "Одеяния тумана смерти",
		["Feralheart Raiment"] = "Одеяния буйного сердца",
		["Sorcerer's Regalia"] = "Регалии чародея",
		["Soulforge Armor"] = "Доспехи Закаленного духа",
		["The Five Thunders"] = "Пять Громов",
		["Vestments of the Virtuous"] = "Ризы Добродетели",
    --T1 Sets
		["Arcanist Regalia"] = "Регалии Чародея",
		["Battlegear of Might"] = "Броня Мощи",
		["Cenarion Raiment"] = "Кенарийские одеяния",
		["Felheart Raiment"] = "Одеяния Сердца Скверны",
		["Giantstalker Armor"] = "Доспехи Истребителя великанов",
		["Lawbringer Armor"] = "Доспехи Судии",
		["Nightslayer Armor"] = "Доспехи ночного убийцы",
		["The Earthfury"] = "Гнев Земли",
		["Vestments of Prophecy"] = "Ризы Пророчества",
    --T2 Sets
		["Battlegear of Wrath"] = "Броня Гнева",
		["Bloodfang Armor"] = "Доспехи Кровавых Клыков",
		["Dragonstalker Armor"] = "Доспехи охотника на драконов",
		["Judgement Armor"] = "Доспехи Правосудия",
		["Nemesis Raiment"] = "Одеяния Возмездия",
		["Netherwind Regalia"] = "Регалия ветра Пустоты",
		["Stormrage Raiment"] = "Одеяния Ярости Бури",
		["The Ten Storms"] = "Десять Бурь",
		["Vestments of Transcendence"] = "Ризы Превосходства",
    --T3 Sets
		["Bonescythe Armor"] = "Доспехи костяной косы",
		["Cryptstalker Armor"] = "Доспехи Расхитителя гробниц",
		["Dreamwalker Raiment"] = "Одеяния сновидца",
		["Frostfire Regalia"] = "Регалии ледяного огня",
		["Plagueheart Raiment"] = "Облачение проклятого сердца",
		["Redemption Armor"] = "Доспехи Возмездия",
		["The Earthshatterer"] = "Землекрушитель",
		["Vestments of Faith"] = "Ризы веры",
		["Dreadnaught's Battlegear"] = "Броня неустрашимости",
	--PvP Epic Horde Sets
		["Warlord's Battlegear"] = "Броня вождя",
		["Warlord's Earthshaker"] = "Землекрушитель вождя",
		["Warlord's Pursuit"] = "Облачение вождя",
		["Warlord's Raiment"] = "Облачение вождя",
		["Warlord's Regalia"] = "Регалии Вождя",
		["Warlord's Sanctuary"] = "Снаряжение военачальника",
		["Warlord's Threads"] = "Нити вождя",
		["Warlord's Vestments"] = "Облачение полководца",
    --PvP Epic Alliance Sets		
		["Field Marshal's Aegis"] = "Эгида фельдмаршала",
		["Field Marshal's Battlegear"] = "Броня фельдмаршала",
		["Field Marshal's Pursuit"] = "Облачение фельдмаршала",
		["Field Marshal's Raiment"] = "Одеяния фельдмаршала",
		["Field Marshal's Regalia"] = "Регалии фельдмаршала",
		["Field Marshal's Sanctuary"] = "Снаряжение фельдмаршала",
		["Field Marshal's Threads"] = "Нити фельдмаршала",
		["Field Marshal's Vestments"] = "Одежды фельдмаршала",
    --PvP Rare Horde Sets
		["Champion's Refuge"] = "Спасение Защитника",
		["Champion's Pursuance"] = "Упорство Защитника",
		["Champion's Arcanum"] = "Тайна Защитника",
		["Champion's Investiture"] = "Убор Защитника",
		["Champion's Guard"] = "Стража Защитника",
		["Champion's Stormcaller"] = "Зов Бури Защитника",
		["Champion's Dreadgear"] = "Грозные доспехи Защитника",
		["Champion's Battlearmor"] = "Латы Защитника",
    --PvP Rare Alliance Sets	
		["Lieutenant Commander's Refuge"] = "Защита лейтенанта-командора",
		["Lieutenant Commander's Pursuance"] = "Упорство лейтенанта-командора",
		["Lieutenant Commander's Arcanum"] = "Тайна лейтенанта-командора",
		["Lieutenant Commander's Redoubt"] = "Оплот лейтенанта-командора",
		["Lieutenant Commander's Investiture"] = "Убор лейтенанта-командора",
		["Lieutenant Commander's Guard"] = "Стража лейтенанта-командора",
		["Lieutenant Commander's Dreadgear"] = "Грозные доспехи лейтенанта-командора",
		["Lieutenant Commander's Battlearmor"] = "Боевые доспехи лейтенанта-командора",
	--AB Rare Horde Sets
		["The Defiler's Determination"] = "Решимость Осквернителя",
		["The Defiler's Fortitude"] = "Стойкость Осквернителя",
		["The Defiler's Intent"] = "Цель Осквернителя",
		["The Defiler's Purpose"] = "Решимость Осквернителя",
		["The Defiler's Resolution"] = "Решимость Осквернителя",
		["The Defiler's Will"] = "Воля Осквернителя",
	--AB Rare Alliance Sets
		["The Highlander's Determination"] = "Решимость горца",
		["The Highlander's Fortitude"] = "Стойкость горца",
		["The Highlander's Intent"] = "Упорство горца",
		["The Highlander's Purpose"] = "Цель горца",
		["The Highlander's Resolution"] = "Решимость горца",
		["The Highlander's Resolve"] = "Твердость горца",
		["The Highlander's Will"] = "Воля горца",
		
		["Twilight Trappings"] = "Сумеречное облачение",
		
		
		["Lieutenant Commander's Aegis"] = "Эгида лейтенанта-командора",
		["Lieutenant Commander's Battlegear"] = "Броня лейтенанта-командора",
		["Lieutenant Commander's Pursuit"] = "Облачение лейтенанта-командора",
		["Lieutenant Commander's Raiment"] = "Одеяния лейтенанта-командора",
		["Lieutenant Commander's Regalia"] = "Регалии лейтенанта-командора",
		["Lieutenant Commander's Sanctuary"] = "Снаряжение лейтенанта-командора",
		["Lieutenant Commander's Threads"] = "Нити лейтенанта-командора",
		["Lieutenant Commander's Vestments"] = "Облачение лейтенанта-командора",
		
		["Champion's Battlegear"] = "Броня защитника",
		["Champion's Earthshaker"] = "Землекрушитель Защитника",
		["Champion's Pursuit"] = "Облачение Защитника",
		["Champion's Raiment"] = "Одеяния Защитника",
		["Champion's Regalia"] = "Регалии Защитника",
		["Champion's Sanctuary"] = "Снаряжение Защитника",
		["Champion's Threads"] = "Нити Защитника",
		["Champion's Vestments"] = "Одежды Защитника",
	}
end)


BabbleItemSet:Debug()
BabbleItemSet:SetStrictness(true)

AceLibrary:Register(BabbleItemSet, MAJOR_VERSION, MINOR_VERSION)
BabbleItemSet = nil
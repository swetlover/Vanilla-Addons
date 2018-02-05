	--Chinese Local : CWDG Translation Team Thomas Mo (昏睡墨鱼)
	--$Rev:
	--$Date:

local L = AceLibrary("AceLocale-2.2"):new("Automaton_Gossip")

L:RegisterTranslations("zhTW", function() return {
["Gossip"] = "Gossip",
["Automatically complete quests and skip gossip text"] = "還任務時自動跳過閒聊窗口，直接完成任務",

--------------
-- Gossip Text
--------------
["<Touch the unstable rift crystal.>"] = "<Touch the unstable rift crystal.>",
["<Place my hand on the orb.>"] = "<Place my hand on the orb.>",
["Thank you, Stable Master. Please take the animal."] = "Thank you, Stable Master. Please take the animal.",
["With pleasure. These things stink!"] = "With pleasure. These things stink!",
["Trick or Treat!"] = "Trick or Treat!",
["Grant me your mark, wise ancient."] = "Grant me your mark, wise ancient.",
["Grant me your mark, mighty ancient."] = "Grant me your mark, mighty ancient.",
["Please take me to the master's lair."] = "Please take me to the master's lair.",
["I require a chrono-beacon, Sa'at."] = "I require a chrono-beacon, Sa'at.",
["I need a pack of incendiary bombs."] = "I need a pack of incendiary bombs.",
["I'm ready to go to Durholde Keep."] = "I'm ready to go to Durholde Keep.",
["Naturalist, please grant me your boon."] = "Naturalist, please grant me your boon.",

-------------
-- Quest Text
-------------
-- Alterac Valley quests
["Empty Stables"] = "Empty Stables",
["Ram Hide Harnesses"] = "Ram Hide Harnesses",
["Alterac Ram Hide"] = "Alterac Ram Hide",
["Ram Riding Harnesses"] = "Ram Riding Harnesses",
["Frostwolf Hide"] = "Frostwolf Hide",
["More Booty!"] = "More Booty!",
["More Armor Scraps"] = "More Armor Scraps",
["Armor Scraps"] = "Armor Scraps",
["Coldtooth Supplies"] = "Coldtooth Supplies",
["Irondeep Supplies"] = "Irondeep Supplies",
["Lokholar the Ice Lord"] = "Lokholar the Ice Lord",
["Stormpike Soldier's Blood"] = "Stormpike Soldier's Blood",
["A Gallon of Blood"] = "A Gallon of Blood",
["Ivus the Forest Lord"] = "Ivus the Forest Lord",
["Storm Crystal"] = "Storm Crystal",
["Crystal Cluster"] = "Crystal Cluster",
["Call of Air - Slidore's Fleet"] = "Call of Air - Slidore's Fleet",
["Call of Air - Vipore's Fleet"] = "Call of Air - Vipore's Fleet",
["Call of Air - Ichman's Fleet"] = "Call of Air - Ichman's Fleet",
["Frostwolf Soldier's Medal"] = "Frostwolf Soldier's Medal",
["Frostwolf Lieutenant's Medal"] = "Frostwolf Lieutenant's Medal",
["Frostwolf Commander's Medal"] = "Frostwolf Commander's Medal",
["Call of Air - Guse's Fleet"] = "Call of Air - Guse's Fleet",
["Call of Air - Jeztor's Fleet"] = "Call of Air - Jeztor's Fleet",
["Call of Air - Mulverick's Fleet"] = "Call of Air - Mulverick's Fleet",
["Stormpike Soldier's Flesh"] = "Stormpike Soldier's Flesh",
["Stormpike Lieutenant's Flesh"] = "Stormpike Lieutenant's Flesh",
["Stormpike Commander's Flesh"] = "Stormpike Commander's Flesh",

-- Felwood salves
["Salve via Gathering"] = "Salve via Gathering",
["Fel Creep"] = "Fel Creep",
["Salve via Mining"] = "Salve via Mining",
["Tainted Vitriol"] = "Tainted Vitriol",
["Salve via Skinning"] = "Salve via Skinning",
["Patch of Tainted Skin"] = "Patch of Tainted Skin",
["Salve via Hunting"] = "Salve via Hunting",
["Corrupted Soul Shard"] = "Corrupted Soul Shard",
["Salve via Disenchanting"] = "Salve via Disenchanting",
["Lesser Nether Essence"] = "次級虛空精華",

-- Felwood plants
["Corrupted Whipper Root"] = "Corrupted Whipper Root",
["Corrupted Songflower"] = "Corrupted Songflower",
["Corrupted Windblossom"] = "Corrupted Windblossom",
["Corrupted Night Dragon"] = "Corrupted Night Dragon",
["Cenarion Plant Salve"] = "Cenarion Plant Salve",

-- Ravenholdt
["Syndicate Emblems"] = "Syndicate Emblems",
["Syndicate Emblem"] = "Syndicate Emblem",

-- Thorium Shells -> Thorium Arrows
["A Fair Trade"] = "A Fair Trade",
["Thorium Shells"] = "瑟銀彈",

-- Cenarion
["Encrypted Twilight Texts"] = "Encrypted Twilight Texts",
["Encrypted Twilight Text"] = "Encrypted Twilight Text",

-- Argent Dawn
["Minion's Scourgestones"] = "Minion's Scourgestones",
["Minion's Scourgestone"] = "Minion's Scourgestone",
["Invader's Scourgestones"] = "Invader's Scourgestones",
["Invader's Scourgestone"] = "Invader's Scourgestone",
["Corruptor's Scourgestones"] = "Corruptor's Scourgestones",
["Corruptor's Scourgestone"] = "Corruptor's Scourgestone",
["Bone Fragments"] = "Bone Fragments",
["Crypt Fiend Parts"] = "Crypt Fiend Parts",
["Core of Elements"] = "Core of Elements",
["Dark Iron Scraps"] = "Dark Iron Scraps",

-- Timbermaw
["Feathers for Grazle"] = "Feathers for Grazle",
["Feathers for Nafien"] = "Feathers for Nafien",
["Beads for Salfa"] = "Beads for Salfa",
["Deadwood Headdress Feather"] = "Deadwood Headdress Feather",
["Winterfall Spirit Beads"] = "Winterfall Spirit Beads",

-- Cauldron quests
["Gahrron's Withering Cauldron"] = "Gahrron's Withering Cauldron",
["Writhing Haunt Cauldron"] = "Writhing Haunt Cauldron",
["Felstone Field Cauldron"] = "Felstone Field Cauldron",
["Dalson's Tears Cauldron"] = "Dalson's Tears Cauldron",
["Arcane Quickener"] = "Arcane Quickener",
["Ectoplasmic Resonator"] = "Ectoplasmic Resonator",
["Somatic Intensifier"] = "Somatic Intensifier",
["Osseous Agitator"] = "Osseous Agitator",

-- Gadgetzan
["Water Pouch Bounty"] = "Water Pouch Bounty",
["Wastewander Water Pouch"] = "Wastewander Water Pouch",

-- Thorium Brotherhood
["Gaining Acceptance"] = "Gaining Acceptance",
["Dark Iron Residue"] = "Dark Iron Residue",
["Restoring Fiery Flux Supplies via Kingsblood"] = "Restoring Fiery Flux Supplies via Kingsblood",
["Kingsblood"] = "Kingsblood",
["Restoring Fiery Flux Supplies via Iron"] = "Restoring Fiery Flux Supplies via Iron",
["Iron Bar"] = "Iron Bar",
["Restoring Fiery Flux Supplies via Heavy Leather"] = "Restoring Fiery Flux Supplies via Heavy Leather",
["Heavy Leather"] = "重皮",
["Incendosaur Scale"] = "Incendosaur Scale",
["Coal"] = "Coal",
["Favor Amongst the Brotherhood, Dark Iron Ore"] = "Favor Amongst the Brotherhood, Dark Iron Ore",
["Dark Iron Ore"] = "Dark Iron Ore",
["Favor Amongst the Brotherhood, Blood of the Mountain"] = "Favor Amongst the Brotherhood, Blood of the Mountain",
["Blood of the Mountain"] = "Blood of the Mountain",
["Favor Amongst the Brotherhood, Core Leather"] = "Favor Amongst the Brotherhood, Core Leather",
["Core Leather"] = "Core Leather",
["Favor Amongst the Brotherhood, Fiery Core"] = "Favor Amongst the Brotherhood, Fiery Core",
["Fiery Core"] = "Fiery Core",
["Favor Amongst the Brotherhood, Lava Core"] = "Favor Amongst the Brotherhood, Lava Core",
["Lava Core"] = "Lava Core",

-- City faction
["Additional Runecloth"] = "Additional Runecloth",
["Runecloth"] = "Runecloth",

-- Wildhammer faction
["Troll Necklace Bounty"] = "Troll Necklace Bounty",
["Troll Tribal Necklace"] = "Troll Tribal Necklace",

-- E'ko quests
["Chillwind E'ko Item"] = "Chillwind E'ko Item",
["Chillwind E'ko Quest"] = "Chillwind E'ko Quest",
["Frostmaul E'ko Item"] = "Frostmaul E'ko Item",
["Frostmaul E'ko Quest"] = "Frostmaul E'ko Quest",
["Frostsaber E'ko Item"] = "Frostsaber E'ko Item",
["Frostsaber E'ko Quest"] = "Frostsaber E'ko Quest",
["Ice Thistle E'ko Item"] = "Ice Thistle E'ko Item",
["Ice Thistle E'ko Quest"] = "Ice Thistle E'ko Quest",
["Shardtooth E'ko Item"] = "Shardtooth E'ko Item",
["Shardtooth E'ko Quest"] = "Shardtooth E'ko Quest",
["Wildkin E'ko Item"] = "Wildkin E'ko Item",
["Wildkin E'ko Quest"] = "Wildkin E'ko Quest",
["Winterfall E'ko"] = "Winterfall E'ko",

-- Zul'Gurub quests
["Zulian, Razzashi, and Hakkari Coins"] = "Zulian, Razzashi, and Hakkari Coins",
["Zulian Coin"] = "Zulian Coin",
["Razzashi Coin"] = "Razzashi Coin",
["Hakkari Coin"] = "Hakkari Coin",
["Gurubashi, Vilebranch, and Witherbark Coins"] = "Gurubashi, Vilebranch, and Witherbark Coins",
["Gurubashi Coin"] = "Gurubashi Coin",
["Vilebranch Coin"] = "Vilebranch Coin",
["Witherbark Coin"] = "Witherbark Coin",
["Sandfury, Skullsplitter, and Bloodscalp Coins"] = "Sandfury, Skullsplitter, and Bloodscalp Coins",
["Sandfury Coin"] = "Sandfury Coin",
["Skullsplitter Coin"] = "Skullsplitter Coin",
["Bloodscalp Coin"] = "Bloodscalp Coin",

-- AQ War Effort (Horde)
["The Horde Needs More Runecloth Bandages!"] = "The Horde Needs More Runecloth Bandages!",
["The Horde Needs More Mageweave Bandages!"] = "The Horde Needs More Mageweave Bandages!",
["The Horde Needs More Wool Bandages!"] = "The Horde Needs More Wool Bandages!",
["The Horde Needs More Rugged Leather!"] = "The Horde Needs More Rugged Leather!",
["The Horde Needs More Thick Leather!"] = "The Horde Needs More Thick Leather!",
["The Horde Needs More Heavy Leather!"] = "The Horde Needs More Heavy Leather!",
["The Horde Needs More Purple Lotus!"] = "The Horde Needs More Purple Lotus!",
["The Horde Needs More Firebloom!"] = "The Horde Needs More Firebloom!",
["The Horde Needs More Peacebloom!"] = "The Horde Needs More Peacebloom!",
["The Horde Needs More Mithril Bars!"] = "The Horde Needs More Mithril Bars!",
["The Horde Needs More Tin Bars!"] = "The Horde Needs More Tin Bars!",
["The Horde Needs More Copper Bars!"] = "The Horde Needs More Copper Bars!",
["The Horde Needs More Lean Wolf Steaks!"] = "The Horde Needs More Lean Wolf Steaks!",
["The Horde Needs More Spotted Yellowtail!"] = "The Horde Needs More Spotted Yellowtail!",
["The Horde Needs More Baked Salmon!"] = "The Horde Needs More Baked Salmon!",

-- AQ War Effort (Alliance)
["The Alliance Needs More Linen Bandages!"] = "The Alliance Needs More Linen Bandages!",
["The Alliance Needs More Silk Bandages!"] = "The Alliance Needs More Silk Bandages!",
["The Alliance Needs More Runecloth Bandages!"] = "The Alliance Needs More Runecloth Bandages!",
["The Alliance Needs More Light Leather!"] = "The Alliance Needs More Light Leather!",
["The Alliance Needs More Medium Leather!"] = "The Alliance Needs More Medium Leather!",
["The Alliance Needs More Thick Leather!"] = "The Alliance Needs More Thick Leather!",
["The Alliance Needs More Stranglekelp!"] = "The Alliance Needs More Stranglekelp!",
["The Alliance Needs More Purple Lotus!"] = "The Alliance Needs More Purple Lotus!",
["The Alliance Needs More Arthas' Tears!"] = "The Alliance Needs More Arthas' Tears!",
["The Alliance Needs More Copper Bars!"] = "The Alliance Needs More Copper Bars!",
["The Alliance Needs More Iron Bars!"] = "The Alliance Needs More Iron Bars!",
["The Alliance Needs More Thorium Bars!"] = "The Alliance Needs More Thorium Bars!",
["The Alliance Needs More Rainbow Fin Albacore!"] = "The Alliance Needs More Rainbow Fin Albacore!",
["The Alliance Needs More Roast Raptor!"] = "The Alliance Needs More Roast Raptor!",
["The Alliance Needs More Spotted Yellowtail!"] = "The Alliance Needs More Spotted Yellowtail!",

-- AQ War Effort Items
["Linen Bandage"] = "亞麻繃帶",
["Wool Bandage"] = "絨線繃帶",
["Silk Bandage"] = "絲質繃帶",
["Mageweave Bandage"] = "魔紋繃帶",
["Runecloth Bandage"] = "符文布繃帶",
["Light Leather"] = "輕皮",
["Medium Leather"] = "中皮",
["Heavy Leather"] = "重皮",
["Thick Leather"] = "厚皮",
["Rugged Leather"] = "硬甲皮",
["Purple Lotus"] = "Purple Lotus",
["Stranglekelp"] = "Stranglekelp",
["Arthas' Tears"] = "Arthas' Tears",
["Firebloom"] = "Firebloom",
["Peacebloom"] = "Peacebloom",
["Copper Bar"] = "Copper Bar",
["Tin Bar"] = "Tin Bar",
["Iron Bar"] = "Iron Bar",
["Mithril Bar"] = "Mithril Bar",
["Thorium Bar"] = "Thorium Bar",
["Lean Wolf Steak"] = "瘦狼排",
["Spotted Yellowtail"] = "斑點黃尾魚",
["Baked Salmon"] = "烤鮭魚",
["Roast Raptor"] = "烤迅猛龍肉",
["Rainbow Fin Albacore"] = "彩鰭魚",

-- Commendation Signets
["One Commendation Signet"] = "One Commendation Signet",
["Ten Commendation Signets"] = "Ten Commendation Signets",
["Horde Commendation Signet"] = "Horde Commendation Signet",
["Alliance Commendation Signet"] = "Alliance Commendation Signet",

-- Burning Crusade

--Scryers
["More Firewing Signets"] = "More Firewing Signets",
["Single Firewing Signet"] = "Single Firewing Signet",
["Firewing Signet"] = "Firewing Signet",
["More Sunfury Signets"] = "More Sunfury Signets",
["Single Sunfury Signet"] = "Single Sunfury Signet",
["Sunfury Signet"] = "Sunfury Signet",
["Arcane Tomes"] = "Arcane Tomes",
["Arcane Tome"] = "Arcane Tome",

--Aldor
["More Marks of Sargeras"] = "More Marks of Sargeras",
["Single Mark of Sargeras"] = "Single Mark of Sargeras",
["Mark of Sargeras"] = "Mark of Sargeras",
["More Marks of Kil'jaeden"] = "More Marks of Kil'jaeden",
["Single Mark of Kil'jaeden"] = "Single Mark of Kil'jaeden",
["Mark of Kil'jaeden"] = "Mark of Kil'jaeden",
["Fel Armaments"] = "Fel Armaments",
["Fel Armament"] = "Fel Armament",

-- Zangarmarsh

-- Cenarion Refuge
["Identify Plant Parts"] = "Identify Plant Parts",
["Unidentified Plant Parts"] = "Unidentified Plant Parts",
["Coilfang Armaments"] = "Coilfang Armaments",

-- Sporeggar
["More Spore Sacs"] = "More Spore Sacs",
["Mature Spore Sac"] = "Mature Spore Sac",
["More Tendrils!"] = "More Tendrils!",
["Bog Lord Tendril"] = "Bog Lord Tendril",
["More Glowcaps"] = "More Glowcaps",
["Glowcap"] = "Glowcap",
["Bring Me Another Shrubbery!"] = "Bring Me Another Shrubbery!",
["Sanguine Hibiscus"] = "Sanguine Hibiscus",
["More Fertile Spores"] = "More Fertile Spores",
["Fertile Spore"] = "Fertile Spore",

-- Terokkar Forest

-- Spinebreaker Hold
["More Arakkoa Feathers"] = "More Arakkoa Feathers",
["Arakkoa Feather"] = "Arakkoa Feather",
-- Skettis
["More Shadow Dust"] = "More Shadow Dust",
["Shadow Dust"] = "Shadow Dust",

-- Nagrand

-- Garadar
["More Warbeads!"] = "More Warbeads!",
["Obsidian Warbeads"] = "Obsidian Warbeads",

-- Halaa
["Oshu'gun Crystal Powder"] = "Oshu'gun Crystal Powder",
["Oshu'gun Crystal Powder Sample"] = "Oshu'gun Crystal Powder Sample",

-- Aeris Landing
["More Heads Full of Ivory"] = "More Heads Full of Ivory",
["Pair of Ivory Tusks"] = "Pair of Ivory Tusks",
["More Crystal Fragments"] = "More Crystal Fragments",
["Oshu'gun Crystal Fragment"] = "Oshu'gun Crystal Fragment",
["More Obsidian Warbeads"] = "More Obsidian Warbeads",

-- Netherstorm

-- Area 52
["Another Heap of Ethereals"] = "Another Heap of Ethereals",
["Zaxxis Insignia"] = "Zaxxis Insignia",

-- Shadowmoon Valley

-- Netherwing Ledge
["Accepting All Eggs"] = "Accepting All Eggs",
["Netherwing Egg"] = "Netherwing Egg",

} end )
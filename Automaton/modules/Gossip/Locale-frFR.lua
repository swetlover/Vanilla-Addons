local L = AceLibrary("AceLocale-2.2"):new("Automaton_Gossip")

L:RegisterTranslations("frFR", function() return {
	["Gossip"] = "Gossip",
	["Automatically complete quests and skip gossip text"] = "Automatically complete quests and skip gossip text",

	--------------
	-- Gossip Text
	--------------
	["<Touch the unstable rift crystal.>"] = "<Touch the unstable rift crystal.>",
	["<Place my hand on the orb.>"] = "<Placez ma main sur l'orbe.>",
	["Thank you, Stable Master. Please take the animal."] = "Thank you, Stable Master. Please take the animal.",
	["With pleasure. These things stink!"] = "Avec plaisir ! Ces trucs-là sentent mauvais.",
	["Trick or Treat!"] = "Trick or Treat!",
	["Grant me your mark, wise ancient."] = "Grant me your mark, wise ancient.",
	["Grant me your mark, mighty ancient."] = "Grant me your mark, mighty ancient.",
	["I require a chrono-beacon, Sa'at."] = "Il me faudrait une chrono-balise, Sa'at.",
	["Please take me to the master's lair."] = "Je vous en prie, conduisez-moi au repaire du maître.",
	["I need a pack of incendiary bombs."] = "J'ai besoin d'un paquet de bombes incendiaires.",
	["I'm ready to go to Durholde Keep."] = "Je suis prête à me rendre au donjon de Fort-de-Durn.",
	["I'm ready to go to Durholde Keep."] = "Je suis prêt à me rendre au donjon de Fort-de-Durn.",
	["Naturalist, please grant me your boon."] = "Naturalist, please grant me your boon.",

	-------------
	-- Quest Text
	-------------
	-- Alterac Valley quests
	["Empty Stables"] = "Écuries vides",
	["Ram Hide Harnesses"] = "Harnais en cuir de bélier",
	["Alterac Ram Hide"] = "Peau de bélier d'Alterac",
	["Ram Riding Harnesses"] = "Harnais pour béliers",
	["Frostwolf Hide"] = "Peau de loup des glaces",
	["More Booty!"] = "Plus de butin !",
	["More Armor Scraps"] = "Plus de morceaux d'armure !",
	["Armor Scraps"] = "Morceaux d'armures",
	["Coldtooth Supplies"] = "Fournitures de Froide-dent",
	["Irondeep Supplies"] = "Fournitures de Gouffrefer",
	["Lokholar the Ice Lord"] = "Lokholar le Seigneur des Glaces",
	["Stormpike Soldier's Blood"] = "Sang de soldat stormpike",
	["A Gallon of Blood"] = "Quelques litres de sang",
	["Ivus the Forest Lord"] = "Ivus le Seigneur des forêts",
	["Storm Crystal"] = "Cristal de tempête",
	["Crystal Cluster"] = "Grappes de cristaux",
	["Call of Air - Slidore's Fleet"] = "L'appel des airs - l'escadrille de Slidore",
	["Call of Air - Vipore's Fleet"] = "L'appel des airs - l'escadrille de Vipore",
	["Call of Air - Ichman's Fleet"] = "L'appel des airs - l'escadrille d'Ichman",
	["Frostwolf Soldier's Medal"] = "Médaille de soldat frostwolf",
	["Frostwolf Lieutenant's Medal"] = "Médaille de lieutenant frostwolf",
	["Frostwolf Commander's Medal"] = "	Médaille de commandant frostwolf",
	["Call of Air - Guse's Fleet"] = "L'appel des airs - l'escadrille de Guse",
	["Call of Air - Jeztor's Fleet"] = "L'appel des airs - l'escadrille de Jeztor",
	["Call of Air - Mulverick's Fleet"] = "L'appel des airs - l'escadrille de Mulverick",
	["Stormpike Soldier's Flesh"] = "Chair de soldat stormpike",
	["Stormpike Lieutenant's Flesh"] = "Chair de lieutenant stormpike",
	["Stormpike Commander's Flesh"] = "Chair de commandant stormpike",

	-- Felwood salves
	["Salve via Gathering"] = "Du baume contre une récolte",
	["Fel Creep"] = "Gangrimpante",
	["Salve via Mining"] = "Du baume par la pioche",
	["Tainted Vitriol"] = "Vitriol contaminé",
	["Salve via Skinning"] = "Du baume contre des peaux",
	["Patch of Tainted Skin"] = "Morceau de peau contaminée",
	["Salve via Hunting"] = "Du baume en chassant",
	["Corrupted Soul Shard"] = "Fragment d'âme corrompue",
	["Salve via Disenchanting"] = "Du baume contre des désenchantements",
	["Lesser Nether Essence"] = "Essence du néant inférieure",

	-- Felwood plants
	["Corrupted Whipper Root"] = "Navetille corrompue",
	["Corrupted Songflower"] = "Fleur-de-chant corrompue",
	["Corrupted Windblossom"] = "Fleur-de-vent corrompue",
	["Corrupted Night Dragon"] = "Dragon nocturne corrompu",
	["Cenarion Plant Salve"] = "Baume végétal cénarien",

	-- Ravenholdt
	["Syndicate Emblems"] = "Emblèmes du Syndicat",
	["Syndicate Emblem"] = "Emblème du Syndicat",

	-- Thorium Shells -> Thorium Arrows
	["A Fair Trade"] = "A Fair Trade",
	["Thorium Shells"] = "Obus en thorium",

	-- Cenarion
	["Encrypted Twilight Texts"] = "Les textes du crépuscule cryptés",
	["Encrypted Twilight Text"] = "Texte du crépuscule crypté",

	-- Argent Dawn
	["Minion's Scourgestones"] = "Pierre du Fléau des serviteurs",
	["Minion's Scourgestone"] = "Pierre du Fléau des serviteurs",
	["Invader's Scourgestones"] = "Pierres du Fléau des envahisseurs",
	["Invader's Scourgestone"] = "Pierre du Fléau des envahisseurs",
	["Corruptor's Scourgestones"] = "Pierres du Fléau des corrupteurs",
	["Corruptor's Scourgestone"] = "Pierre du Fléau des corrupteurs",
	["Bone Fragments"] = "Bone Fragments",
	["Crypt Fiend Parts"] = "Morceaux de démon des cryptes",
	["Core of Elements"] = "Noyau des éléments",
	["Dark Iron Scraps"] = "Morceaux de sombrefer",

	-- Timbermaw
	["Feathers for Grazle"] = "Des plumes pour Grifleur",
	["Feathers for Nafien"] = "Des plumes pour Nafien",
	["Beads for Salfa"] = "Des perles pour Salfa",
	["Deadwood Headdress Feather"] = "Coiffure de plumes mort-bois",
	["Winterfall Spirit Beads"] = "Perles d'esprit tombe-hiver",

	-- Cauldron quests
	["Gahrron's Withering Cauldron"] = "Chaudron de la Flétrissure de Gahrron",
	["Writhing Haunt Cauldron"] = "Le Chaudron du Repaire putride",
	["Felstone Field Cauldron"] = "Le Chaudron du champ de Felstone",
	["Dalson's Tears Cauldron"] = "Chaudron des Larmes de Dalson",
	["Arcane Quickener"] = "Catalyseur des arcanes",
	["Ectoplasmic Resonator"] = "Résonateur ectoplasmique",
	["Somatic Intensifier"] = "Intensificateur somatique",
	["Osseous Agitator"] = "Agitateur osseux",

	-- Gadgetzan
	["Water Pouch Bounty"] = "Prime de la poche à eau",
	["Wastewander Water Pouch"] = "Outre de Bat-le-désert",

	-- Thorium Brotherhood
	["Gaining Acceptance"] = "Se faire accepter",
	["Dark Iron Residue"] = "Résidu de sombrefer",
	["Restoring Fiery Flux Supplies via Kingsblood"] = "Réapprovisionnement en flux embrasé (Sang-royal)",
	["Kingsblood"] = "Sang-royal",
	["Restoring Fiery Flux Supplies via Iron"] = "Réapprovisionnement en flux embrasé (Fer)",
	["Iron Bar"] = "Barre de fer",
	["Restoring Fiery Flux Supplies via Heavy Leather"] = "Réapprovisionnement en flux embrasé (Cuir lourd)",
	["Heavy Leather"] = "Cuir lourd",
	["Incendosaur Scale"] = "Ecaille d'Incendosaure",
	["Coal"] = "Charbon",
	["Favor Amongst the Brotherhood, Dark Iron Ore"] = "Faveur auprès de la Confrérie, Minerai de sombre",
	["Dark Iron Ore"] = "Minerai de sombrefer",
	["Favor Amongst the Brotherhood, Blood of the Mountain"] = "Faveur auprès de la Confrérie, Sang de la montagne",
	["Blood of the Mountain"] = "Sang de la montagne",
	["Favor Amongst the Brotherhood, Core Leather"] = "Faveur auprès de la Confrérie, Cuir du Magma",
	["Core Leather"] = "Cuir du Magma",
	["Favor Amongst the Brotherhood, Fiery Core"] = "Faveur auprès de la Confrérie, Noyau de feu",
	["Fiery Core"] = "Noyau de feu",
	["Favor Amongst the Brotherhood, Lava Core"] = "Faveur auprès de la Confrérie, Noyau de lave",
	["Lava Core"] = "Noyau de lave",

	-- City faction
	["Additional Runecloth"] = "Encore de l'étoffe runique",
	["Runecloth"] = "Etoffe runique",

	-- Wildhammer faction
	["Troll Necklace Bounty"] = "Chasse aux colliers trolls",
	["Troll Tribal Necklace"] = "Collier tribal troll",

	-- E'ko quests
	["Chillwind E'ko Item"] = "E'ko de Noroît",
	["Chillwind E'ko Quest"] = "L'E'ko de Noroît",
	["Frostmaul E'ko Item"] = "E'ko de Cognegivre",
	["Frostmaul E'ko Quest"] = "L'E'ko de Cognegivre",
	["Frostsaber E'ko Item"] = "E'ko de sabre-de-givre",
	["Frostsaber E'ko Quest"] = "L'E'ko des sabres-de-givre",
	["Ice Thistle E'ko Item"] = "E'ko de Chardon de glace",
	["Ice Thistle E'ko Quest"] = "L'E'ko des Chardon de Glace",
	["Shardtooth E'ko Item"] = "E'ko de Croc acéré",
	["Shardtooth E'ko Quest"] = "L'E'ko des Crocs acérés",
	["Wildkin E'ko Item"] = "E'ko d'Indomptable",
	["Wildkin E'ko Quest"] = "L'E'ko des Indomptables",
	["Winterfall E'ko"] = "E'ko des Tombe-hiver",

	-- Zul'Gurub quests
	["Zulian, Razzashi, and Hakkari Coins"] = "Pièces zuliennes, razzashi et hakkari",
	["Zulian Coin"] = "Pièce zulienne",
	["Razzashi Coin"] = "Pièce Razzashi",
	["Hakkari Coin"] = "Pièce hakkari",
	["Gurubashi, Vilebranch, and Witherbark Coins"] = "Pièces Gurubashi, Vilebranch et Fânécorce",
	["Gurubashi Coin"] = "Pièce Gurubashi",
	["Vilebranch Coin"] = "Pièce Vilebranch",
	["Witherbark Coin"] = "Pièce Fânécorce",
	["Sandfury, Skullsplitter, and Bloodscalp Coins"] = "Pièces Furie-des-sables, Casse-crâne et Scalp-rouge",
	["Sandfury Coin"] = "Pièce Furie-des-sables",
	["Skullsplitter Coin"] = "Pièce Casse-crâne",
	["Bloodscalp Coin"] = "Pièce Scalp-rouge",

	-- AQ War Effort (Horde)
	["The Horde Needs More Runecloth Bandages!"] = "La Horde a besoin de plus de bandages en étoffe runique !",
	["The Horde Needs More Mageweave Bandages!"] = "La Horde a besoin de plus de bandages en tisse-mage",
	["The Horde Needs More Wool Bandages!"] = "La Horde a besoin de plus de bandages en laine !",
	["The Horde Needs More Rugged Leather!"] = "La Horde a besoin de plus de cuir robuste !",
	["The Horde Needs More Thick Leather!"] = "La Horde a besoin de plus de cuir épais !",
	["The Horde Needs More Heavy Leather!"] = "La Horde a besoin de plus de cuir lourd !",
	["The Horde Needs More Purple Lotus!"] = "La Horde a besoin de plus de lotus pourpre !",
	["The Horde Needs More Firebloom!"] = "La Horde a besoin de plus de fleur de feu !",
	["The Horde Needs More Peacebloom!"] = "La Horde a besoin de plus de pacifique !",
	["The Horde Needs More Mithril Bars!"] = "La Horde a besoin de plus de barres mithril !",
	["The Horde Needs More Tin Bars!"] = "La Horde a besoin de plus de barres d'étain !",
	["The Horde Needs More Copper Bars!"] = "La Horde a besoin de plus de barres de cuivre !",
	["The Horde Needs More Lean Wolf Steaks!"] = "La Horde a besoin de plus de steaks de loup !",
	["The Horde Needs More Spotted Yellowtail!"] = "La Horde a besoin de plus de jaune-queue tacheté !",
	["The Horde Needs More Baked Salmon!"] = "La Horde a besoin de plus de pain de saumon !",

	-- AQ War Effort (Alliance)
	["The Alliance Needs More Linen Bandages!"] = "L'Alliance a besoin de plus de bandages en lin !",
	["The Alliance Needs More Silk Bandages!"] = "L'Alliance a besoin de plus de bandages en soie !",
	["The Alliance Needs More Runecloth Bandages!"] = "L'Alliance a besoin de plus de bandages en étoffe runique !",
	["The Alliance Needs More Light Leather!"] = "L'Alliance a besoin de plus de cuir léger !",
	["The Alliance Needs More Medium Leather!"] = "L'Alliance a besoin de plus de cuir moyen !",
	["The Alliance Needs More Thick Leather!"] = "L'Alliance a besoin de plus de cuir épais !",
	["The Alliance Needs More Stranglekelp!"] = "L'Alliance a besoin de plus d'étouffante !",
	["The Alliance Needs More Purple Lotus!"] = "L'Alliance a besoin de plus de lotus pourpre !",
	["The Alliance Needs More Arthas' Tears!"] = "L'Alliance a besoin de plus de l'armes d'Arthas !",
	["The Alliance Needs More Copper Bars!"] = "L'Alliance a besoin de plus de barres de cuivre !",
	["The Alliance Needs More Iron Bars!"] = "L'Alliance a besoin de plus de barres de fer !",
	["The Alliance Needs More Thorium Bars!"] = "L'Alliance a besoin de plus de barres de thorium !",
	["The Alliance Needs More Rainbow Fin Albacore!"] = "L'Alliance a besoin de plus de thon arc-en-ciel !",
	["The Alliance Needs More Roast Raptor!"] = "L'Alliance a besoin de plus de rôti de raptor !",
	["The Alliance Needs More Spotted Yellowtail!"] = "L'Alliance a besoin de plus de jaune-queue tacheté !",

	-- AQ War Effort Items
	["Linen Bandage"] = "Bandage en lin",
	["Wool Bandage"] = "Bandage en laine",
	["Silk Bandage"] = "Bandage en soie",
	["Mageweave Bandage"] = "Bandage en tisse-mage",
	["Runecloth Bandage"] = "Bandage en étoffe runique",
	["Light Leather"] = "Cuir léger",
	["Medium Leather"] = "Cuir moyen",
	["Heavy Leather"] = "Cuir lourd",
	["Thick Leather"] = "Cuir épais",
	["Rugged Leather"] = "Cuir robuste",
	["Purple Lotus"] = "Lotus pourpre",
	["Stranglekelp"] = "Etouffante",
	["Arthas' Tears"] = "Larmes d'Arthas",
	["Firebloom"] = "Fleur de feu",
	["Peacebloom"] = "Pacifique",
	["Copper Bar"] = "Barre de cuivre",
	["Tin Bar"] = "Barre d'étain",
	["Iron Bar"] = "Barre de fer",
	["Mithril Bar"] = "Barre de mithril",
	["Thorium Bar"] = "Barre de thorium",
	["Lean Wolf Steak"] = "Steak de loup",
	["Spotted Yellowtail"] = "Jaune-queue tacheté",
	["Baked Salmon"] = "Pain de saumon",
	["Roast Raptor"] = "Rôti de raptor",
	["Rainbow Fin Albacore"] = "Thon arc-en-ciel",

	-- Commendation Signets
	["One Commendation Signet"] = "Une chevalière de mérite",
	["Ten Commendation Signets"] = "Dix chevalières de mérite",
	["Horde Commendation Signet"] = "Chevalière de mérite de la Horde",
	["Alliance Commendation Signet"] = "Chevalière de mérite de l'Alliance",

	-- Burning Crusade

	--Scryers
	["More Firewing Signets"] = "De nouvelles chevalières Aile-de-feu",
	["Single Firewing Signet"] = "Une chevalière Aile-de-feu",
	["Firewing Signet"] = "Chevalière Aile-de-feu",
	["More Sunfury Signets"] = "De nouvelles chevalières Solfurie",
	["Single Sunfury Signet"] = "Une chevalière Solfurie",
	["Sunfury Signet"] = "Chevalière Solfurie",
	["Arcane Tomes"] = "Tomes des arcanes",
	["Arcane Tome"] = "Tome des arcanes",

	--Aldor
	["More Marks of Sargeras"] = "De nouvelles marques de Sargeras",
	["Single Mark of Sargeras"] = "Une marque de Sargeras",
	["Mark of Sargeras"] = "Marque de Sargeras",
	["More Marks of Kil'jaeden"] = "De nouvelles marques de Kil'jaeden",
	["Single Mark of Kil'jaeden"] = "Une marque de Kil'jaeden",
	["Mark of Kil'jaeden"] = "Marque de Kil'jaeden",
	["Fel Armaments"] = "Armes gangrenées",
	["Fel Armament"] = "Armes gangrenées",

	-- Zangarmarsh

	-- Cenarion Refuge
	["Identify Plant Parts"] = "Identifier les morceaux de plantes",
	["Unidentified Plant Parts"] = "Morceaux de plantes non identifiées",
	["Coilfang Armaments"] = "Armes de Glissecroc",
	
	-- Sporeggar
	["More Spore Sacs"] = "Encore des sacs de spores",
	["Mature Spore Sac"] = "Sac de spores à maturité",
	["More Tendrils!"] = "Plus de vrilles !",
	["Bog Lord Tendril"] = "Vrille de seigneur-tourbe",
	["More Glowcaps"] = "More Glowcaps",
	["Glowcap"] = "Chapeluisant",
	["Bring Me Another Shrubbery!"] = "Ramenez-moi un autre jardinet !",
	["Sanguine Hibiscus"] = "Hibiscus sanguin",
	["More Fertile Spores"] = "Plus de spores fertiles",
	["Fertile Spore"] = "Spores fertiles",

	-- Terokkar Forest

	-- Spinebreaker Hold
	["More Arakkoa Feathers"] = "Plus de plumes",
	["Arakkoa Feather"] = "Plumes d'arakkoa",
	
	-- Skettis
	["More Shadow Dust"] = "Plus de poussière ombreuse",
	["Shadow Dust"] = "Poussière ombreuse",

	-- Nagrand

	-- Garadar
	["More Warbeads!"] = "Plus de perles de guerre",
	["Obsidian Warbeads"] = "Perles de guerre d'obsidienne",

	-- Halaa
	["Oshu'gun Crystal Powder"] = "La poudre de cristal d'Oshu'gun",
	["Oshu'gun Crystal Powder Sample"] = "Echantillon de poudre de cristal d'Oshu'gun",

	-- Aeris Landing
	["More Heads Full of Ivory"] = "Encore plus d'ivoire plein la tête",
	["Pair of Ivory Tusks"] = "Paire de défenses d'ivoire",
	["More Crystal Fragments"] = "Encore des fragments de cristal",
	["Oshu'gun Crystal Fragment"] = "Fragment de cristal d'Oshu'gun",
	["More Obsidian Warbeads"] = "Encore des perles de guerre d'obsidienne",
	
	-- Netherstorm

	-- Area 52
	["Another Heap of Ethereals"] = "Un autre monceau d'éthériens",
	["Zaxxis Insignia"] = "Insigne de Zaxxis",
	
	-- Ethereum
	["Ethereum Prisoner I.D. Catalogue"] = "Répertorier les prisonniers de l'Ethereum",
	["Ethereum Prisoner I.D. Tag"] = "Plaque d'identité de prisonnier de l'Ethereum",

	-- Shadowmoon Valley

	-- Netherwing Ledge
	["Accepting All Eggs"] = "Tous les œufs sont bons à prendre",
	["Netherwing Egg"] = "Oeuf de l'Aile-du-Néant",

	-- 2.4 Battleground mark turn-in
  ["Concerted Efforts"] = "Des efforts concertés",
  ["For Great Honor"] = "Pour un grand honneur",
  ["Alterac Valley Mark of Honor"] = "Marque d'honneur de la vallée d'Alterac",
	["Arathi Basin Mark of Honor"] = " Marque d'honneur du bassin d'Arathi",
	["Warsong Gulch Mark of Honor"] = "Marque d'honneur du goulet des Chanteguerres",
	["Eye of the Storm Mark of Honor"] = " Marque d'honneur de l'Oeil du cyclone",
			
} end )
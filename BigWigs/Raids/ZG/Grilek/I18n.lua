------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.zg.grilek
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Grilek",

	-- commands
	avatar_cmd = "avatar",
	avatar_name = "天神下凡警报",
	avatar_desc = "天神下凡警报 (激怒阶段).",
	
	melee_cmd = "melee",
	melee_name = "近战警报",
	melee_desc = "在天神下凡被施放前发出警告，近战类可以及时离开BOSS.",

	announce_cmd = "announce",
	announce_name = "密语玩家",
	announce_desc = "让玩家知道他们正在被格里雷克追.",

	puticon_cmd = "puticon",
	puticon_name = "头像图标",
	puticon_desc = "一个RAID图标对目标玩家.\n\n(需要L或A)",
	
	-- triggers
	trigger_avatarGain = "格里雷克获得了天神下凡的效果。",
	trigger_avatarGone = "天神下凡效果从格里雷克身上消失。",
	
	-- messages
	msg_avatarSoon = "天神下凡马上! 近战退!",
	msg_avatarNow = "天神下凡! 远离boss!",
	msg_avatarYou = "格里雷克在追你! 快跑!",
	msg_avatarWhisper = "格里雷克在追你! 快跑!",
	msg_avatarOther = "格里雷克在追 %s!",
	
	-- bars
	bar_avatar = "天神下凡",
	
	-- misc	

} end )

L:RegisterTranslations("deDE", function() return {
	cmd = "Grilek",

	-- commands
	avatar_cmd = "avatar",
	avatar_name = "Alarm für Avatar",
	avatar_desc = "Ankündigen wenn der Boss Avatar ist (Raserei Phase).",
	
	melee_cmd = "melee",
	melee_name = "Warnunken für die Nahkämpfer",
	melee_desc = "Warnt bevor Avatar gewirkt wird, sodass die Nahkämpfer Zeit haben sich vom Boss zu entfernen.",

	announce_cmd = "announce",
	announce_name = "Benachrichtigt Spieler",
	announce_desc = "Informiert Spieler, dass Gri\'lek sie verfolgt, sodass sie rechtzeitig weglaufen können.",

	puticon_cmd = "puticon",
	puticon_name = "Setzt Schlachtzugssymbole",
	puticon_desc = "Setzt ein Schlachtzugssymbol auf den verfolgten Spieler.\n\n(Benötigt Schlachtzugleiter oder Assistent)",
	
	-- triggers
	trigger_avatarGain = "Gri\'lek bekommt \'Avatar\'\.",
	trigger_avatarGone = "Avatar schwindet von Gri\'lek\.",
	
	-- messages
	msg_avatarSoon = "Avatar bald! Nahkämpfer raus!",
	msg_avatarNow = "Avatar! Geh weg vom Boss!",
	msg_avatarYou = "Gri'lek kommt auf dich zu! Lauf weg!",
	msg_avatarWhisper = "Gri'lek kommt auf dich zu! Lauf weg!",
	msg_avatarOther = "Gri'lek verfolgt %s!",
	
	-- bars
	bar_avatar = "Avatar",
	
	-- misc	

} end )

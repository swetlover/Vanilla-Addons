------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.naxx.loatheb
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Loatheb",

	-- commands
	doom_cmd = "doom",
	doom_name = "必然的厄运警报",
	doom_desc = "必然的厄运的警报",

	curse_cmd = "curse",
	curse_name = "诅咒驱散警报",
	curse_desc = "警报当洛欧塞布诅咒驱散时",
	
	spore_cmd = "spore",
	spore_name = "孢子警报",
	spore_desc = "孢子的警报",

	-- triggers
	trigger_doom = "受到了必然的厄运效果的影响。",
	--trigger_curse = "Loatheb's Chains of Ice is removed.",
    trigger_curse  = "憎恨者的(.+)诅咒被移除了。",
	
	-- messages	doomwarn = "Inevitable Doom %d! %d sec to next!",
	msg_doomSoon = "必然的厄运 %d 5秒!",
	msg_curse = "诅咒移除! 重上诅咒!",    
	msg_doomChangeSoon = "厄运计时改变 %s 秒!",
	msg_doomChangeNow = "必然的厄运现在每隔15秒发动一次！",
	msg_engage = "憎恨者来势汹汹, 2 分钟后施放必然的厄运!",
	--msg_spore = "Spore spawned",
	
	-- bars
	bar_doom = "必然的厄运 %d",
	bar_curse = "移除诅咒",
	bar_softEnrage = "厄运每15秒",
	bar_spore = "下次孢子",
	
	-- misc

} end )
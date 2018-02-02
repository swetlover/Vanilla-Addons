EU_LOCKBOXES = {
    ["Battered Junkbox"] = 75,
    ["Worn Junkbox"] = 125,
    ["Sturdy Junkbox"] = 175,
    ["Heavy Junkbox"] = 250,
    ["Ornate Bronze Lockbox"] = 0,
    ["Heavy Bronze Lockbox"] = 0,
    ["Iron Lockbox"] = 75,
    ["Strong Iron Lockbox"] = 125,
    ["Steel Lockbox"] = 175,
    ["Reinforced Steel Lockbox"] = 225,
    ["Mithril Lockbox"] = 225,
    ["Thorium Lockbox"] = 225,
    ["Eternium Lockbox"] = 225,
    ["Small Locked Chest"] = 0,
    ["Ironbound Locked Chest"] = 175,
    ["Reinforced Locked Chest"] = 250,
    ["Sturdy Locked Chest"] = 75,
    ["Battered Chest"] = 0
}

EU_UNLOCKBUTTON = "Unlock";
EU_SKILLTAB_LOCKPICKING = "Lockpicking";
EU_PICKLOCK_ABILITY = "Pick Lock";

EU_TOO_LOW_LOCKPICKING = "Sorry but I can't open %s - I have %s lockpicking although I need %s.";

EU_TOOLTIP_LOCKED = "Locked";

EA_COMPAT_LW_UNSUPPORTED = "[EasyUnlock] Update Link Wrangler to v1.39 or newer to enable lockpicking info on tooltips.";
--
-- 汉语.于是乎乎汉化,参考bilei发布的v114b汉化版
--

if(GetLocale() == "zhCN") then
    EU_LOCKBOXES = {
        ["破损的垃圾箱"] = 75,
		["破旧的垃圾箱"] = 125,
		["坚固的垃圾箱"] = 175,
		["重垃圾箱"] = 250,
		["精制青铜宝箱"] = 0,
		["厚重青铜宝箱"] = 0,
		["铁质宝箱"] = 75,
		["精铁宝箱"] = 125,
		["钢质宝箱"] = 175,
		["强化钢质宝箱"] = 225,
		["秘银宝箱"] = 225,
		["瑟银宝箱"] = 225,
		["恒金宝箱"] = 225,
		["小型上锁宝箱"] = 0,
		["坚固的上锁宝箱"] = 175,
		["加固的宝箱"] = 250,
		["结实的宝箱"] = 75,
		["破损的箱子"] = 0
}
    
    EU_UNLOCKBUTTON = "开锁";
    EU_SKILLTAB_LOCKPICKING = "开锁";
    EU_PICKLOCK_ABILITY = "开锁";
    
    EU_TOO_LOW_LOCKPICKING = "对不起，我不能打开%s - 我的开锁技能是%s开这个箱子需要%s。"; 
 
    EU_TOOLTIP_LOCKED = "已锁";
    
    EA_COMPAT_LW_UNSUPPORTED = "[EasyUnlock]请升级Link Wrangler插件到v1.39版或更新版本才能在提示信息上显示撬锁信息.";
end
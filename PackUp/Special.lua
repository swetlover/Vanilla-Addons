PU_BagSpec = {}

PU_BagSpec[PACKUP_BAG_NORMAL] = {
	{key = PACKUP_INFO_NAME, value = nil}
}

PU_BagSpec[PACKUP_BAG_QUIVER] = {
	{key = PACKUP_INFO_TYPE, value = {"弹药"}},
	{key = PACKUP_INFO_SUBTYPE, value = {"箭"}}
}

PU_BagSpec[PACKUP_BAG_AMMO] = {
	{key = PACKUP_INFO_TYPE, value = {"弹药"}},
	{key = PACKUP_INFO_SUBTYPE, value = {"子弹"}}
}

PU_BagSpec[PACKUP_BAG_SOUL] = {
	{key = PACKUP_INFO_NAME, value = {"灵魂碎片"}}
}

PU_BagSpec[PACKUP_BAG_HERB] = {
	{key = PACKUP_INFO_TYPE, value = {"商品"}},
	{key = PACKUP_INFO_NAME, value = {"银叶草","地根草","魔皇草","石南草","雨燕草","跌打草","皇血草","活根草","枯叶草","金棘草","冬刺草","太阳草","盲目草","梦叶草","山鼠草","冰盖草","宁神花","野钢花","火焰花","紫莲花","瘟疫花","黑莲花","荆棘藻","墓地苔","卡德加的胡须","野葡萄藤","阿尔萨斯之泪","幽灵菇","格罗姆之血","黄金参"}}
}

PU_BagSpec[PACKUP_BAG_ENCHANT] = {
	{key = PACKUP_INFO_TYPE, value = {"商品"}},
	{key = PACKUP_INFO_NAME, value = {"连结水晶", {"大块(.+)碎片"}, {"小块(.+)碎片"}, {"强效(.+)精华"}, {"次级(.+)精华"}, {"(.+)之尘"},{"^符文(.+)棒$"}}}
}
--
PU_BagSpec[PACKUP_BAG_MINE] = {
}

PU_BagSpec[PACKUP_BAG_GEM] = {
}

PU_BagSpec[PACKUP_BAG_ENGINEER] = {
}
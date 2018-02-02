-- BagID
PACKUP_BAGID_BODY = {
	{bagID = 0, enable = true, order = PACKUP_ORDER_ASC}
	,{bagID = 1, enable = true, order = PACKUP_ORDER_ASC}
	,{bagID = 2, enable = true, order = PACKUP_ORDER_ASC}
	,{bagID = 3, enable = true, order = PACKUP_ORDER_ASC}
	,{bagID = 4, enable = true, order = PACKUP_ORDER_ASC}
}
PACKUP_BAGID_BANK = {
	{bagID = -1, enable = true, order = PACKUP_ORDER_ASC}
	,{bagID = 5, enable = true, order = PACKUP_ORDER_ASC}
	,{bagID = 6, enable = true, order = PACKUP_ORDER_ASC}
	,{bagID = 7, enable = true, order = PACKUP_ORDER_ASC}
	,{bagID = 8, enable = true, order = PACKUP_ORDER_ASC}
	,{bagID = 9, enable = true, order = PACKUP_ORDER_ASC}
	,{bagID = 10, enable = true, order = PACKUP_ORDER_ASC}
}

-- User Define Order
PACKUP_UDO = {}

-- User Define Order : Bag
PACKUP_ORDER_BAG = "$Bag"
PACKUP_UDO[PACKUP_ORDER_BAG] = {
	{key = PACKUP_INFO_SUBTYPE, value = {PACKUP_BAG_NORMAL}, order = 0}
	,{key = PACKUP_INFO_SUBTYPE, value = {PACKUP_BAG_ENGINEER, PACKUP_BAG_GEM, PACKUP_BAG_MINE, PACKUP_BAG_ENCHANT, PACKUP_BAG_HERB, PACKUP_BAG_SOUL, PACKUP_BAG_AMMO, PACKUP_BAG_QUIVER}, order = 1}
}

-- User Define Order : Item
PACKUP_ORDER_ITEM = "$Item"
PACKUP_UDO[PACKUP_ORDER_ITEM] = {
	{key = PACKUP_INFO_NAME, value = {"超级炉石", "炉石"}, order = 31},
	{key = PACKUP_INFO_NAME, value = {"点卷"}, order = 30},
	{key = PACKUP_INFO_NAME, value = {"铁匠之锤", "剥皮小刀", "血镰刀" , "点金石", "矿工锄", "奥金钓鱼竿", "纳特·帕格的超级钓鱼竿FC-5000型", "布拉普家族鱼竿", "粗铁鱼竿" , "强化钓鱼竿" , "鱼竿", "扳手", "盗贼工具", "符文铜棒", "符文银棒", "符文金棒", "符文真银棒", "符文奥金棒"}, order = 29},
	{key = PACKUP_INFO_NAME, value = {"条纹霜刃豹缰绳", "斑点霜刃豹缰绳", "条纹夜刃豹缰绳", "迅捷雷刃豹缰绳", "迅捷雾刃豹缰绳", "迅捷霜刃豹缰绳", "红色机械陆行鸟", "蓝色机械陆行鸟", "绿色机械陆行鸟", "未涂色的机械陆行鸟", "迅捷绿色机械陆行鸟", "迅捷白色机械陆行鸟", "迅捷黄色机械陆行鸟", "杂色马缰绳", "栗色马缰绳", "棕色马缰绳", "迅捷白马", "迅捷棕马", "迅捷褐色马", "灰山羊", "白山羊", "棕山羊", "迅捷灰山羊", "迅捷白山羊", "迅捷棕山羊", "棕狼号角", "暗灰狼号角", "暗棕狼号角", "迅捷棕狼号角", "迅捷灰狼号角", "迅捷森林狼号角", "灰色科多兽", "棕色科多兽", "大型棕色科多兽", "大型灰色科多兽", "大型白色科多兽", "绿色迅猛龙之哨", "青色迅猛龙之哨", "紫色迅猛龙之哨", "迅捷蓝色迅猛龙", "迅捷绿色迅猛龙", "迅捷橙色迅猛龙", "棕色骸骨军马", "蓝色骸骨军马", "红色骸骨军马", "绿色骸骨军马", "绿色骷髅战马", "紫色骷髅战马", "红色其拉共鸣水晶", "蓝色其拉共鸣水晶", "黄色其拉共鸣水晶", "绿色其拉共鸣水晶", "黑色其拉共鸣水晶", "迅捷祖利安猛虎", "拉扎什迅猛龙", "雷矛军用坐骑", "霜狼嗥叫者的号角", "黑色战驹", "黑色战豹", "黑色战羊", "黑色作战陆行鸟", "红色骸骨战马", "黑色战狼", "黑色作战科多兽", "黑色战斗迅猛龙", "死亡军马的缰绳","黑色战驹缰绳"}, order = 28},
	{key = PACKUP_INFO_TYPE, value = {"武器"}, order = 27},
	{key = PACKUP_INFO_TYPE, value = {"护甲"}, order = 26},
	{key = PACKUP_INFO_NAME, value = {"竞技场高手饰物"}, order = 25},
	{key = PACKUP_INFO_NAME, value = {"麻痹药膏" , "麻痹药膏 II" , "麻痹药膏 III", "速效药膏" , "速效药膏 II" , "速效药膏 III" , "速效药膏 IV" , "速效药膏 V" , "速效药膏 VI" , "致残药膏" , "致残药膏 II" , "致命药膏" , "致命药膏 II" , "致命药膏 III" , "致命药膏 IV" , "致命药膏 V" , "致伤药膏" , "致伤药膏 II" , "致伤药膏 III" , "致伤药膏 IV" , "闪光粉" , "蚀骨灰" , "堕落之尘", "痛苦精华", "苦楚精华", "丧命草" , "致盲粉"}, order = 24},
	{key = PACKUP_INFO_NAME, value = {"轻羽毛" , "枫树种子", "荆棘种子", "灰木种子", "角树种子", "铁木种子", "传送符文", "传送门符文", "魔粉" , "十字章" , "神圣蜡烛", "圣洁蜡烛", "野生浆果", "野生棘根草", "地狱火石", "恶魔雕像", "王者印记", "神圣符印", "鱼油", "闪亮的鱼鳞", "灵魂碎片"}, order = 23},
	{key = PACKUP_INFO_NAME, value = {"大地图腾" ,"火焰图腾","水之图腾","空气图腾"}, order = 22},
	{key = PACKUP_INFO_NAME, value = {"亚麻绷带", "厚亚麻绷带", "绒线绷带", "厚绒线绷带", "丝质绷带", "厚丝质绷带", "魔纹绷带", "厚魔纹绷带", "符文布绷带", "厚符文布绷带", "高地丝质绷带", "高地魔纹布绷带", "高地符文布绷带", "阿拉希盆地魔纹绷带", "阿拉希盆地符文布绷带", "战歌峡谷丝质绷带", "战歌峡谷魔纹布绷带", "战歌峡谷符文布绷带", "奥特兰克厚符文布绷带"}, order = 21},
	{key = PACKUP_INFO_NAME, value = {"强烈爆焰炸弹", "瑟银手榴弹", "高爆炸弹", "大炸弹", "致密炸药", "秘银破片炸弹", "重磅铁制炸弹", "地精工兵炸药", "大型爆盐炸弹", "简易投掷炸弹", "地精暗雷", "实心炸弹", "铁皮手雷", "重磅青铜炸弹", "大型铜壳炸弹", "劣质炸药"}, order = 20},
	{key = PACKUP_INFO_NAME, value = {"绿色焰火", "筛盐器", "机械修理包", "雪王9000型", "高级假人", "联合收割机组件", "粗制望远镜", "普通瞄准镜", "活动假人", "机械松鼠笼", "粗制瞄准镜", "精密奥金转换器", "瑟银管", "瑟银零件", "真银变压器", "致密炸药粉", "密银外壳", "不牢固的扳机", "密银管", "侏儒微调器", "实心炸药", "发条式同步协调陀螺仪", "铁棒", "黄金能量核心", "青铜框架", "烈性炸药", "高速青铜齿轮", "青铜管", "银触媒", "粗制火药粉", "铜质调节器", "铜管", "一把螺栓", "劣质火药", "练习锁"}, order = 19},
	{key = PACKUP_INFO_NAME, value = {"轻皮" , "轻毛皮" , "中皮" , "中毛皮" , "重皮" , "重毛皮" , "厚皮" , "厚毛皮" , "硬甲皮" , "熟化轻毛皮", "熟化重毛皮", "熟化厚毛皮", "熟化毛皮", "魔化皮" , "厚狼皮", "碎皮" , "原始虎皮", "原始蝙蝠皮", "熔火犬皮", "奇美拉皮革", "霜刃豹皮革", "魔暴龙皮", "破烂的皮革", "薄科多兽皮", "战熊皮", "熔火犬皮", "迅猛龙的外皮", "暗影猎豹毛皮", "龟壳", "蝎鳞", "蝎壳", "龙鳞", "厚蝎磷" , "黑色雏龙鳞片", "红色雏龙鳞片", "绿色幼龙鳞片", "闪亮的彩色龙鳞", "黑龙鳞片", "红龙鳞片", "绿龙鳞片", "蓝龙鳞片", "飞蛇鳞片", "梦幻龙鳞"}, order = 18},
	{key = PACKUP_INFO_NAME, value = {"铜矿石" , "锡矿石" , "银矿石" , "真银矿石", "铁矿石" , "金矿石" , "秘银矿石", "瑟银矿石", "黑铁矿石", "火岩矿石", "源质矿石", "小块黑曜石碎片", "大块黑曜石碎片"}, order = 17},
	{key = PACKUP_INFO_NAME, value = {"铜锭" , "锡锭" , "青铜锭" , "银锭" , "金锭" , "铁锭" , "真银锭" , "秘银锭" , "瑟银锭" , "黑铁锭" , "魔化瑟银锭", "钢锭" , "奥金锭"}, order = 16},
	{key = PACKUP_INFO_NAME, value = {"阿尔萨斯之泪", "黑莲花", "盲目草", "石南草", "跌打草", "梦叶草", "地根草", "枯叶草", "火焰花", "幽灵菇", "黄金参", "金棘草", "墓地苔", "格罗姆之血", "冰盖草", "卡德加的胡须", "皇血草", "活根草", "魔皇草", "山鼠草", "宁神花", "瘟疫花", "紫莲花", "银叶草", "荆棘藻", "太阳草", "雨燕草", "野钢花", "冬刺草", "野葡萄藤"}, order = 15},
	{key = PACKUP_INFO_NAME, value = {"亚麻布", "毛料", "丝绸", "魔纹布", "符文布", "恶魔布", "月布", "亚麻布卷", "毛布卷", "丝绸卷", "魔纹布卷", "符文布卷"}, order = 14},
	{key = PACKUP_INFO_NAME, value = {"奇异之尘", "灵魂之尘", "幻象之尘", "梦境之尘", "幻影之尘", "次级魔法精华", "强效魔法精华", "次级星界精华", "强效星界精华", "次级秘法精华", "强效秘法精华", "次级虚空精华", "强效虚空精华", "次级不灭精华", "强效不灭精华", "小块微光碎片", "大块微光碎片", "小块闪光碎片", "大块闪光碎片", "小块强光碎片", "大块强光碎片", "小块魔光碎片", "大块魔光碎片", "连结水晶", "空瓶", "铅瓶", "水晶瓶", "灌魔之瓶"}, order = 13},
	{key = PACKUP_INFO_NAME, value = {"暗影石" , "黄水晶" , "绿玛瑙" , "虎眼石" , "孔雀石" , "次级月亮石", "红宝石" , "蓝宝石" , "翡翠" , "艾泽拉斯钻石", "奥术水晶", "青绿石" , "巨型绿宝石", "大猫眼石", "有光泽的小珍珠", "彩色珍珠", "黑珍珠" , "金珍珠" , "蓝珍珠"}, order = 12},
	{key = PACKUP_INFO_NAME, value = {"初级治疗药水", "次级治疗药水", "强效治疗药水", "治疗药水", "超强治疗药水", "极效治疗药水", "特效治疗药水", "透明治疗药水", "作战治疗药水", "超强治疗药膏", "极效治疗药膏", "特效治疗药膏"}, order = 11},
	{key = PACKUP_INFO_NAME, value = {"初级法力药水", "次级法力药水", "法力药水", "强效法力药水", "极效法力药水", "特效法力药水", "作战法力药水", "超强法力药水", "超强法力药膏", "极效法力药膏", "特效法力药膏"}, order = 10},
	{key = PACKUP_INFO_NAME, value = {"暗影防护药水", "暗影药水", "暴怒药水", "冰霜防护药水", "超级能量药水", "超强巨魔之血药水", "初级活力药水", "初级抗魔药水", "初级石盾药水", "次级隐形药水", "次级石盾药水", "多重抗性药水", "化石药水", "昏睡药水", "活力行动药水", "火焰防护药水", "净化药水", "精练智慧药水", "极效活力药水", "极效巨魔之血药水", "抗魔药水", "魔血药水", "怒气药水", "泰坦药水", "特效巨魔之血药水", "特效活力药水", "强力巨魔之血药水", "强效暗影防护药水", "强效奥术防护药水", "强效冰霜防护药水", "强效昏睡药水", "强效火焰防护药水", "强效火焰防护药水", "强效怒气药水", "强效石盾药水", "强效自然防护药水", "弱效巨魔之血药水", "神圣防护药水", "速游药水", "迅捷药水", "野葡萄药水", "隐形药水", "有限无敌药水", "自然防护药水", "暗影之力药剂", "奥法药剂", "冰霜之力药剂", "超强防御药剂", "初级防御药剂", "初级坚韧药剂", "初级敏捷药剂", "次级敏捷药剂", "防御药剂", "火力药剂", "极效抗毒药剂", "坚韧药剂", "巨人药剂", "抗毒药剂", "蛮力药剂", "猫眼药剂", "猫鼬药剂", "梦境药剂", "密林药剂", "敏捷药剂", "诺格弗格药剂", "强力抗毒药剂", "强力奥法药剂", "强力防御药剂", "强力火力药剂", "强力敏捷药剂", "食人魔力量药剂", "狮王之力药剂", "水下呼吸药剂", "特效抗毒药剂", "屠魔药剂", "先知药剂", "血藻抗性药剂", "血藻闪避药剂", "增长药剂", "侦测次级隐形药剂", "侦测恶魔药剂", "侦测亡灵药剂", "智慧药剂", "强效聪颖药剂", "滋补药剂", "自由行动药剂", "冬泉火酒", "阿尔萨斯的礼物", "超级能量合剂", "献祭之油", "冰霜之油", "暗影之油", "石鳞鱼油", "火焰之油", "黑口鱼油", "幻象染料"}, order = 9},
	{key = PACKUP_INFO_TYPE, value = {"消耗品"}, order = 8},
	{key = PACKUP_INFO_TYPE, value = {"配方"}, order = 7},
	{key = PACKUP_INFO_TYPE, value = {"材料"}, order = 6},
	{key = PACKUP_INFO_TYPE, value = {"商品"}, order = 5},
	{key = PACKUP_INFO_TYPE, value = {"其他"}, order = 4},
	{key = PACKUP_INFO_TYPE, value = {"容器"}, order = 3},
	{key = PACKUP_INFO_TYPE, value = {"任务"}, order = 2},
	{key = PACKUP_INFO_UNKONW, value = {"[Unknow]"}, order = 1},
}

-- User Define Order : Enchant
PACKUP_ORDER_ENCHANT = "$Enchant"
PACKUP_UDO[PACKUP_ORDER_ENCHANT] = {
	{key = PACKUP_INFO_NAME, value = {"符文奥金棒","符文真银棒","符文金棒","符文银棒","符文铜棒"}, order = 6}
	,{key = PACKUP_INFO_NAME, value = {"大块魔光碎片","大块强光碎片","大块闪光碎片","大块微光碎片","连结水晶"}, order = 5}
	,{key = PACKUP_INFO_NAME, value = {"小块魔光碎片","小块强光碎片","小块闪光碎片","小块微光碎片"}, order = 4}
	,{key = PACKUP_INFO_NAME, value = {"强效不灭精华","强效虚空精华","强效星界精华","强效秘法精华","强效魔法精华"}, order = 3}
	,{key = PACKUP_INFO_NAME, value = {"次级不灭精华","次级虚空精华","次级星界精华","次级秘法精华","次级魔法精华"}, order = 2}
	,{key = PACKUP_INFO_NAME, value = {"幻影之尘","梦境之尘","幻象之尘","灵魂之尘","奇异之尘"}, order = 1}
}

-- User Order Group
PACKUP_ORDERGROUP = {}

PACKUP_BAG_SPECIAL = "$Special"
PACKUP_ORDERGROUP[PACKUP_BAG_SPECIAL] = {
	{key = PACKUP_INFO_QUANTITY, order = PACKUP_ORDER_ASC}
	,{key = PACKUP_INFO_NAME, order = PACKUP_ORDER_DESC}
}

PACKUP_ORDERGROUP[PACKUP_BAG_NORMAL] = {
	{key = PACKUP_ORDER_ITEM, order = PACKUP_ORDER_DESC},
	{key = PACKUP_INFO_RARITY, order = PACKUP_ORDER_DESC},
	{key = PACKUP_INFO_NAME, order = PACKUP_ORDER_DESC},
	{key = PACKUP_INFO_QUANTITY, order = PACKUP_ORDER_ASC},
	{key = PACKUP_INFO_TYPE, order = PACKUP_ORDER_DESC},
}

PACKUP_ORDERGROUP[PACKUP_BAG_ENCHANT] = {
	{key = PACKUP_ORDER_ENCHANT, order = PACKUP_ORDER_DESC}
}

local L = AceLibrary("AceLocale-2.2"):new("sRaidFrames")

-------------------------------------------------------------------------------
-- Localization                                                              --
-------------------------------------------------------------------------------

L:RegisterTranslations("zhCN", function() return {
	["hidden"] = "隐藏",
	["shown"] = "显示",
	
	["_Aggro notification"] = "仇恨通知",
	["Aggro notification"] = "仇恨的通告",
	["Red name on aggro"] = "仇恨名字变红色",
	["Enable/Disable name color change on aggro"] = "开启/禁用 仇恨改变名字颜色",
	["Red status bar"] = "红色状态条",
	["Enable/Disable statusbar color change on aggro"] = "开启/禁用 仇恨高边状态条颜色",
	["Red aura"] = "红色光环",
	["Enable/Disable background color change on aggro"] = "开启/禁用 仇恨背景颜色变化",
	
	["_Pure view"] = "视觉感受",
	["Pure view"] = "视觉感受",

	["Status bar - class color"] = "状态条 - 职业颜色",
	["Class colored status bar"] = "职业颜色状态栏",
	["Unit name - class color"] = "单位名字 - 职业颜色",
	["Class colored unit name"] = "职业颜色单位名字",
	["Status bar - black color"] = "状态条 - 黑暗色",
	["Black colored status bar when friendly unit is targeting you"] = "黑色状态条当友方单位目标是你时",
	
	["Purple colored status bar when friendly unit is targeted by you"] = "紫色状态条当友方单位目标是你时",
	["Status bar - purple color"] = "状态条 - 紫色",
	
	["Vertical orientation"] = "血条垂直方向",
	["Full size statusbar"] = "全尺寸的状态条",
	["_Healing indicators"] = "治疗指标",
	["Show/Hide incoming heal indicators"] = "显示/隐藏 承受治疗指标",
	["Round"] = "圆形",
	["Square"] = "正方形",
	["None"] = "无",
	["Apply best settings"] = "应用最佳设置",
	["Load predefined settings for best visual effect"] = "载入预定义设置以获得最佳视觉效果",
	
	["_Load profiles"] = "加载配置文件",
	["Classic - 5 per column"] = "经典 - 每列5",
	["Classic - 8 per column"] = "经典 - 每列8",
	["Classic - 10 per column"] = "经典 - 每列10",
	["Classic - 20 per column"] = "经典 - 每列20",
	["Grid - Vertical 8 per column"] = "Grid - 垂直8每列",
	["Grid - Horizontal 8 per row"] = "Grid - 水平8每列",
	["Compact - Vertical 8 per column"] = "紧密 - 垂直8每列",
	["Compact - Horizontal 8 per row"] = "紧密 - 水平8每列",
	
	["_Focus frame"] = "焦点框",
	["Use keybinding to add/remove focus units."] = "使用快捷键添加/消除焦点框",
	["Add WSG carrier to focus"] = "添加战歌旗手到焦点框";
	["Auto add WSG carrier to focus frame"] = "自动添加战歌旗手到焦点框",
	
	["Load predefined settings"] = "加载预定义的设置",
	["Common"] = "常见",
	["Aggro"] = "仇恨",
	["Healer"] = "治疗者",
	
	["Load focus profiles"] = "加载焦点配置文件",
	["Load predefined profiles"] = "加载预定义的配置文件",
	
	["Disable colored debuff aura"] = "禁用debuff光环色彩",
	["Disable background color change when unit has debuff"] = "禁用当单元框架获得debuff时背景颜色",
	["Disable bottom buff name"] = "禁用buff按钮名字",
	["Short unit names"] = "简短单元名字",
	["Reduce unit name to three letters"] = "将单位名减为三个字母",
	["Show group number"] = "显示队伍组数",
	["Add group number to unit name string"] = "增加队伍组数到单元名称字符串里",
	
	["_Focus frames"] = "焦点框",
	["Sort focus"] = "焦点排序",
	["Dynamic sort lvl1 - health"] = "动态排序 lvl1 - 生命值",
	["Dynamic sort lvl2 - range"] = "动态排序 lvl2 - 范围",
	["Dynamic sort lvl3 - class"] = "动态排序 lvl3 - 职业",
	["Dynamic sort lvl3 - anti overheal"] = "动态排序 lvl3 - 过量治疗",
	["Aggro units on top"] = "仇恨单位在上方",
	
	["Focus aura"] = "焦点光环",
	
	["Frame size"] = "框架大小",
	["Size"] = "大小",
	["Size of the raid frames"] = "raid的框架大小",
	["Scale"] = "规模",
	["Width"] = "宽度",
	
	
	["Special aura - Target"] = "特殊的光环 - 目标",
	["Change background color to blue of target unit"] = "将目标单元背景颜色更改为蓝色",
	
	["Special aura - Enemy target"] = "特殊的光环 - 敌对目标",
	["Change background color to red of enemy target unit"] = "将敌人目标单位背景颜色改为红色",
	
	["Exclude target unit from sorting"] = "排除目标单元进行排序",
	["Target on top"] = "目标在上方",
	

	
	["Lock"] = "锁定";
	["Show group titles"] = "显示队伍标题",
	["Extra width"] = "额外的宽度",
	["Focus frame extra width"] = "焦点框架额外宽度",
	["Units limit number"] = "单位数量限制",
	["Units limit number"] = "单位数量限制",
	

	["Populate with range"] = "范围填充",
	["Automatically populate focus frame with units in range"] = "自动对焦单位范围内的焦点框",
	
	["Set unit HP filter"] = "设置单位HP过滤",
	["Unit filtering treshold"] = "单位过滤阀值",
	
	["Requires UI reload"] = "需要UI重新加载",
	
	["Lock"] = "锁定",
	["Lock/Unlock the raid frames"] = "锁定/解锁 raid框架",
	["Unlocked"] = "解锁",
	["Locked"] = "锁定",

	["Hide party interface"] = "隐藏队伍接口",
	["Hide party interface in raid - Blizzard's version may fail sometimes"] = "在raid里隐藏队伍接口 - 暴雪的版本有时可能会失败",

	["Health text"] = "生命值文本",
	["Set health display type"] = "设置生命值显示类型",
	["Current and max health"] = "当前/最大生命值",
	["Health deficit"] = "亏损生命值",
	["Health percentage"] = "生命值百分比",
	["Current health"] = "当前生命值",
	["Hide health text"] = "隐藏生命值文本",

	["Invert health bars"] = "反转生命值条",
	["Invert the growth of the health bars"] = "反向生长的生命值条",

	["Buff filter"] = "Buff过滤器",
	["Set buff filter"] = "设置buff过滤",
	["Add buff"] = "添加buff",
	["Add a buff"] = "添加一个buff",
	["<name of buff>"] = "<buff名字>",
	
	["Debuff filter"] = "Debuff过滤器",
	["Set debuff filter"] = "设置debuff过滤",
	["Add debuff"] = "添加debuff",
	["Add a debuff"] = "添加一个debuff",
	["<name of debuff>"] = "<debuff名称>",

	["Show group titles"] = "显示队伍标题",
	["Toggle display of titles above each group frame"] = "在每个组框架上切换标题的显示",
	["Group subsort"] = "队伍排序方式",
	["Select how you wish to sort the members of each group"] = "选择你想对每个组成员排序的方式。",
	["By name"] = "名字",
	["By class"] = "职业",
	["Grid like"] = "类似Grid",
	["Blizzard default"] = "暴雪默认",
	["Group sort"] = "分组排序",
	["Group method"] = "分组方法",
	["Dead and offline units sub sort"] = "死亡和离线的单位分类",
	["Dead or offline units are moved to the bottom of frame"] = "死亡或离线的单位被移到框架底部",
	["Reverse sort"] = "反向排序",
	
	["Select how you wish to show the groups"] = "选择你想对每个组成员排序的方式",
	["By group"] = "队伍",
	["By class"] = "职业",
	["By order"] = "顺序",
	["Units per column"] = "每列单位",
	["Set max number of units in column - effect only if Grid like group sort is enabled"] = "设置列中的最大单位数 - 只有启用类似Grid组排序时才会生效",
	["Pyramid BottomRight"] = "右下角",
	["Pyramid BottomLeft"] = "左下角",
	["Pyramid TopRight"] = "右上角",
	["Pyramid TopLeft"] = "左上角",


	["Anchor"] = "锚点",
	["Set the anchor of buffs/debuffs"] = "设置buff/debuff的锚点",
	["Set size of buff/debuff texture"] = "设置buff/debuff纹理大小",
	["Buff/debuff texture size"] = "buff/debuff纹理大小",	
	["Buff/Debuff visibility"] = "Buff/Debuff能见度",
	["Show buffs or debuffs on the raid frames"] = "显示buff或debuff在团队框架",
	["Only buffs"] = "只显示buff",
	["Only debuffs"] = "只显示debuff",
	["Buffs and debuffs"] = "buff和debuff",
	["Nothing"] = "无",
	["Power type visiblity"] = "蓝条/怒气条可见性",
	["Toggle the display of certain power types (Mana, Rage, Energy)"] = "切换显示某些能量类型的显示(法力值,怒气,能量)",
	["Mana"] = "法力值",
	["Toggle the display of mana bars"] = "切换法力值条的显示",
	["Energy & Focus"] = "能量 & 焦点",
	["Toggle the display of energy and focus bars"] = "切换能量和焦点栏的显示。",
	["Rage"] = "怒气",
	["Toggle the display of rage bars"] = "切换显示怒气条",
	["Show dispellable debuffs"] = "显示可驱散的debuff",
	["Toggle display of dispellable debuffs"] = "切换显示驱散debuff",
	

	["Show filtered buffs"] = "显示过滤的buff",
	["Toggle display of filtered buffs"] = "切换显示过滤的buff",
	
	["Show dispellable debuffs within range"] = "显示范围内可驱散的debuff",
	["Toggle display debuffs within 28Y range"] = "切换显示28码内的可驱散debuff",
	["Show filtered debuffs"] = "显示过滤的debuff",
	["Toggle display of filtered debuffs"] = "切换显示过滤的debuff",
	
	["Buff/debuff slot number"] = "buff/debuff 槽数量",
	["Set max number of buffs and debuffs"] = "设置最大数量buff和debuff",

	["Set the growth of the buffs/debuffs"] = "设置buff/debuff生长方向",

	["Buffs/Debuffs"] = "Buffs/Debuffs",
	["_Buffs/Debuffs"] = "Buffs/Debuffs",
	["Bar textures"] = "条的纹理",
	["Set the texture used on health and mana bars"] = "设置生命值和法力值的纹理",

	["Scale"] = "大小",
	["Set the scale of the raid frames"] = "设置团队框架的大小",
	["Layout"] = "布局",
	["Set the layout of the raid frames"] = "设置团队框架的布局",
	["Reset layout"] = "重置布局",
	["Reset the position of sRaidFrames"] = "重置团度框架的布局",
	["Predefined Layout"] = "预定义的布局",
	["Set a predefined layout for the raid frames"] = "设置一个预定义的团队框架布局",
	["Sticky"] = "粘性",
	["CT_RaidAssist"] = "CT_RaidAssist",
	["Horizontal"] = "水平",
	["Vertical"] = "垂直",

	["Background color"] = "背景颜色",
	["Change the background color"] = "改变背景颜色",
	["Border color"] = "边框颜色",
	["Change the border color"] = "改变边框颜色",
	["Border"] = "边框",
	["Set about borders around the raid frames"] = "设置团队框边框",
	["Toggle border"] = "切换边框",
	["Toggle the display of borders around the raid frames"] = "切换显示团队框的边框",
	["Border texture"] = "边框纹理",
	["Select border texture"] = "选择边框纹理",
	["Original"] = "初始",
	["Ace"] = "Ace",
	["Santa"] = "Santa",
	["ThickEdge"] = "ThickEdge",
	["Snow"] = "Snow",
	["Grid"] = "Grid",
	["Tooltip display"] = "工具提示显示",
	["Determine when a tooltip is displayed"] = "确定当工具提示显示",
	["Never"] = "从不",
	["Only when not in combat"] = "只有在没有战斗的时候",
	["Always"] = "总是",
	["Highlight units with aggro"] = "高亮仇恨单位",
	["Turn the border of units who have aggro red"] = "获得仇恨的单位显示红色边框",
	["_Range"] = "范围(重要)",
	["Set about range"] = "设置范围",
	["Show estimated range"] = "显示估计范围",
	["Show estimated range next to player's name"] = "显示玩家名字旁边的估计范围",
	["Show estimated range only for focus units"] = "只显示焦点框架的估计范围",
	["Enable light range check"] = "启用光点范围检查(建议)",
	["Enable 28y range check in Instances and 40y coordinates dependant range check in Outdoors and Bgs - Suggested when you neither play healing class nor using Blizzard frames, agUnitFrames or LunaUnitFrames"] = "启用副本28码范围检查与野外和战场40码范围坐标依赖检查 - 建议当如果你既不玩治疗职业也不使用暴雪框架,ag框架,luna框架时",
	
	["Enable accurate range check"] = "启用精确范围检查",
	["Enable 40y range check that requires certain spells to be on actionbar and Blizzard frames, agUnitFrames or LunaUnitFrames to be present - Only healing classes can use accurate range check"] = "启用40码检查.这就要求某些法术要在动作条和暴雪的框架里。AG框架或者luna框架支持。只有治疗职业可以使用这个选项。",
	
	["Enable combined range check"] = "启用组合范围检查",
	["Enable 40y accurate range check only in combat otherwise light range check is active"] = "启用只有在战斗中40码精确范围检查.否则就激活光点范围检查",
    

	["_Arrows"] = "箭头",
	["Coordinates dependant functionality, won't work in instances"] = "坐标相关的功能,在副本中不起作用",
	["Enable arrows"] = "启用箭头",
	["Enable unit arrows"] = "启用单位箭头",
	["Focus units only"] = "只有焦点单位",
	["Enable arrows only for focus units"] = "启用箭头,只有焦点单位",


	["_Debug"] = "调试",
	["Set about debug"] = "设置调试",
	["Enable range calculation debug"] = "启用范围计算调试",
	["Range accuracy calculation, only for testing"] = "距离精度计算，仅用于测试",
	["Enable incomming heal debug"] = "启用承受治疗调试",
	["Incomming heal debug, only for testing. Prefixes: HCOM - HealComm, SRF - SRaidFrames, HBOT - HealBot, HAS - Healer Assist"] = "承受治疗调试,仅用于测试,前缀:HCOM - HealComm, SRF - SRaidFrames, HBOT - HealBot, HAS - Healer Assist",
	["Enable incomming resurrection debug"] = "启用承受复活调试",
	["Incomming resurrection debug, only for testing. Prefixes: HCOM - HealComm, SRF - SRaidFrames, HBOT - HealBot, HAS - Healer Assist"] = "承受复活调试,仅用于测试,前缀:HCOM - HealComm, SRF - SRaidFrames, HBOT - HealBot, HAS - Healer Assist",
	
	
	["Alpha"] = "透明度",
	["The alpha level for units who are out of range"] = "超出范围的单位的透明度等级。",
	
	["Range frequency"] = "范围刷新率",
	["The interval between which range checks are performed"] = "执行范围检查之间的间隔。",
	
	["Accurate range frequency factor"] = "精确范围刷新率",
	["Increase or decrease time needed for full units scan - if you experience performance drop please increase the value"] = "增加或减少全单元扫描所需的时间 - 如果你体验性能下降，请增加值。",

	["Show Group/Class"] = "显示 队伍/职业",
	["Toggle the display of certain Groups/Classes - Active if frames are locked"] = "切换显示某些队伍/职业 - 如果框架锁定就激活",
	["Classes"] = "职业",
	["Warriors"] = "战士",
	["Toggle the display of Warriors"] = "切换显示战士",
	["Paladins"] = "圣骑士",
	["Toggle the display of Paladins"] = "切换显示圣骑士",
	["Shamans"] = "萨满祭司",
	["Toggle the display of Shamans"] = "切换显示萨满祭司",
	["Hunters"] = "猎人",
	["Toggle the display of Hunters"] = "切换显示猎人",
	["Warlocks"] = "术士",
	["Toggle the display of Warlocks"] = "切换显示术士",
	["Mages"] = "法师",
	["Toggle the display of Mages"] = "切换显示法师",
	["Druids"] = "德鲁伊",
	["Toggle the display of Druids"] = "切换显示德鲁伊",
	["Rogues"] = "盗贼",
	["Toggle the display of Rogues"] = "切换显示盗贼",
	["Priests"] = "牧师",
	["Toggle the display of Priests"] = "切换显示牧师",

	["Groups"] = "队伍",
	["Group 1"] = "队伍 1",
	["Toggle the display of Group 1"] = "切换显示队伍 1",
	["Group 2"] = "队伍 2",
	["Toggle the display of Group 2"] = "切换显示队伍 2",
	["Group 3"] = "队伍 3",
	["Toggle the display of Group 3"] = "切换显示队伍 3",
	["Group 4"] = "队伍 4",
	["Toggle the display of Group 4"] = "切换显示队伍 4",
	["Group 5"] = "队伍 5",
	["Toggle the display of Group 5"] = "切换显示队伍 5",
	["Group 6"] = "队伍 6",
	["Toggle the display of Group 6"] = "切换显示队伍 6",
	["Group 7"] = "队伍 7",
	["Toggle the display of Group 7"] = "切换显示队伍 7",
	["Group 8"] = "队伍 8",
	["Toggle the display of Group 8"] = "切换显示队伍 8",

	["Growth"] = "生长方向",
	["Set the growth of the raid frames"] = "设置团队框的生长",
	["Up"] = "上",
	["Down"] = "下",
	["Left"] = "左",
	["Right"] = "右",
	["Combined"] = "合并",
	["TopRight"] = "左上",
	["BottomRight"] = "右下",


	["Border"] = "边框",
	["Toggle the display of borders around the raid frames"] = "切换显示团队框的边框",
	["Frame spacing"] = "框架间距",
	["Set the spacing between each of the raid frames"] = "设置每个团队框之间的距离",

	["Offline"] = "离线",
	["Ghost"] = "幽灵",
	["Dead"] = "死亡",
	["Resurrected"] = "复活",
	["Can Recover"] = "可恢复",
	["Feign Death"] = "假死",
	["Unknown"] = "未知",

	["Warrior"] = "战士",
	["Mage"] = "法师",
	["Paladin"] = "圣骑士",
	["Shaman"] = "萨满祭司",
	["Druid"] = "德鲁伊",
	["Hunter"] = "猎人",
	["Rogue"] = "盗贼",
	["Warlock"] = "术士",
	["Priest"] = "牧师",
	
	["Shield"] = "盾",
	["Carrier"] = "旗手",
	["Rezzed"] = "复活",
	["Soulstoned"] = "灵魂石",
	["Intervened"] = "干涉",
	["Innervate"] = "激活",
	["Spirit"] = "灵魂",
	["Shield Wall"] = "盾墙",
	["Last stand"] = "破釜沉舟",
	["Gifted"] = "生命赐福",
	["Ice block"] = "寒冰屏障",
	["Vanished"] = "消失",
	["Stealthed"] = "潜行",
	["Infused"] = "灌注",
	["Fear Ward"] = "防护恐惧结界",
	["Protection"] = "防护",
	["Divine Shield"] = "圣盾术",

	["Right-click for options."] = "右键设置",
} end)

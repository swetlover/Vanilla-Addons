--[[
Localization for Shammy Buff
English Client
Instructions: Change the below text in QUOTES to reflect what the 
english words mean in your language. Pretty simple!

-- |cffffd200 and |cffffff00 are color codes, ignore those. Change the words only.
]]

SB_Version = "3.5" -- Do not touch

-- Misc Stuff
BINDING_HEADER_SBUFF = "萨满自动buff"
BINDING_NAME_SBUFF_CAST = "萨满buff一键"
SB_UC = "幽暗城"
SB_Org = "奥格瑞玛"
SB_Thu = "雷霆崖"
SB_Fish = "鱼竿"

--All lower case for the Coms
SB_HelpCom = "help"
SB_ResetCom = "reset"
SB_DebugCom = "debug"
SB_CastCom = "cast"

SB_Help1 = "萨满自动buff v|cffffd200".. SB_Version .."|cffffff00 by 60addons"
SB_Help2 = "/sbuff |cffffd200- 启动配置"
SB_Help3 = "/sbuff cast |cffffd200- 用宏来施放而不是一个快捷键"
SB_Help4 = "/sbuff wep buffname|cffffd200 - 要施放的武器buff的名称" 
SB_Help5 = "/sbuff reset |cffffd200- 使用此方法重置所有值" 
SB_Help6 = "/sbuff debug |cffffd200- 窗口显示/屏蔽 信息"
SB_Help7 = "/sbuff help |cffffd200- 帮助菜单"

-- Spell Names
SB_WindWep = "风怒武器"
SB_FlameWep = "火舌武器"
SB_FrostWep = "冰封武器"
SB_RockWep = "石化武器"
SB_Windfury = "风怒"
SB_Flametongue = "火舌"
SB_Frostbrand = "冰封" 
SB_Rockbiter = "石化" 
SB_Weapon = "武器"
SB_Bezerk = "狂暴"
SB_NS = "自然迅捷"
SB_LHW = "次级治疗波" 
SB_HW = "治疗波"
SB_LS = "闪电之盾"
SB_GhostWolf = "幽魂之狼"

-- Messages
SB_Welcome = "|cffffd200 萨满自动buff v|cffffff00" .. SB_Version .. "|cffffd200 by 60addons - 使用: |cffffff00 /sbuff"
SB_NotWelcome = "|cffffd200 萨满自动buff v|cffffff00" .. SB_Version .. "|cffffd200 by 60addons 不加载, 你不是一个萨满祭司!"
SB_NSNOW = "自然迅捷 现在治疗!"
SB_ResetCom2 = "所有变量在第一次运行状态下重置为默认值"
SB_Invalid = "无效的命令! |cffffff00"
SB_BezNOW = "现在狂暴!"
SB_DebuffMsg = "固化 Debuff 检测!"
SB_AutoBuff = "自动buff: |cffffff00"
SB_RecastLS = "重铸闪电盾"
SB_RecastWep = "重铸武器buff!"
SB_DecError = "你没有 Decursive. 禁用此功能!"
SB_Waiting = "一个法术正在等待目标。"
SB_VarError = "变量缺失！重装所有的全局变量!"

-- CT integration
SBCT_Name = "萨满自动buff 设置"
SBCT_Icon = "Interface\\Icons\\Spell_Nature_LightningShield"
SBCT_Description = "点击编辑你的 萨满自动buff设置!"
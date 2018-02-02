--[[

	Ability List： ---------
		-- A table list of abilities/spells, classes that use them, damage and art.
		-- Originally used by CombatSentryGizmo to give players a visual
		-- icon of what was being cast against them and others around them.

		copyright 2005 by Chester

	V 0.1

]]--

------------------------------------------------------------------

CSG_AbilityList = { 

--COMBAT
--BUFF
--DEBUFF
--------------------------------------------------
--------------------------------------------------

--==DRUID==
--26
	["驱毒术"] = {
		cl	= CSG_DRUID, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 26,		
	},
--
--44
	["树皮术"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 44,		
	},
--
--14
	["重击"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 14,
	},

--
--20
	["猎豹形态"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,		
	},
  
--
--28
	["挑战咆哮"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,		
	},
--
--20
	["爪击"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 20,
	},

--
--28
	["畏缩"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 28,
	},

--
--26
	["急奔"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 26,
	},

--
--10
	["挫志咆哮"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--40
	["巨熊形态"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,		
	},
  
--
--12
	["狂怒"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,		
	},
--
--8
	["纠缠根须"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 8,
	},

--
--18
	["精灵之火"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 18,
	},

--
--25
	["精灵之火(熊)"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 25,
	},

--
--25
	["精灵之火(豹)"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 25,
	},

--
--40
	["豹之优雅"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 40,		
	},

--
--20
	["野性冲锋"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 20,		
	},

--
--32
	["凶猛撕咬"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 32,
	},

--
--36
	["狂暴回复"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 36,
	},

--
--8
	["治疗之触"] = {
		cl	= CSG_DRUID, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 8,
	},

--
--18
	["休眠"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 18,
	},

--
--40
	["飓风"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 40,
	},

--
--40
	["激活"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,		
	},

--
--1
	["野性印记"] = {
		cl	= CSG_DRUID, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--18
	["槌击"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 18,
	},

-------FIX AFTER HERE
--
--4
	["月火术"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
		
		[10] = 10,
	},

--
--10
	["自然之握"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["自然迅捷"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["清晰预兆"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--36
	["突袭"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["潜行"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--24
	["扫击"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--32
	["毁灭"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["重生"] = {
		cl	= CSG_DRUID, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--12
	["愈合"] = {
		cl	= CSG_DRUID, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--4
	["回春术"] = {
		cl	= CSG_DRUID, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--24
	["解除诅咒"] = {
		cl	= CSG_DRUID, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--20
	["撕扯"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--22
	["撕碎"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--22
	["安抚动物"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["星火术"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--16
	["挥击"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--6
	["荆棘术"] = {
		cl	= CSG_DRUID, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--24
	["猛虎之怒"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--32
	["追踪人型生物"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--30
	["宁静"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["旅行形态"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
  
--
--6
	["愤怒"] = {
		cl	= CSG_DRUID, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--

--==HUNTER==
--20
	["瞄准射击"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--6
	["奥术射击"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["野兽守护"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--20
	["猎豹守护"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--10
	["雄鹰守护"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--4
	["灵猴守护"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--40
	["豹群守护"] = {
		cl	= CSG_HUNTER, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--46
	["野性守护"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--24
	["野兽知识"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--8
	["震荡射击"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--30
	["反击"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["威慑"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["逃脱"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--34
	["逃脱"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--48
	["逃脱"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--12
	["扰乱射击"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["扰乱射击"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["扰乱射击"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--40
	["扰乱射击"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--50
	["扰乱射击"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--60
	["扰乱射击"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--14
	["鹰眼术"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--34
	["爆炸陷阱"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--44
	["爆炸陷阱"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--54
	["爆炸陷阱"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--14
	["野兽之眼"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--30
	["假死"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--32
	["照明弹"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--20
	["冰冻陷阱"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--40
	["冰冻陷阱"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--60
	["冰冻陷阱"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--28
	["冰霜陷阱"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--20
	["低吼"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["低吼"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--40
	["低吼"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--50
	["低吼"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--60
	["低吼"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--6
	["猎人印记"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--22
	["猎人印记"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--40
	["猎人印记"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--58
	["猎人印记"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--16
	["献祭陷阱"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--26
	["献祭陷阱"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--36
	["献祭陷阱"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--46
	["献祭陷阱"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--56
	["献祭陷阱"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["胁迫"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--40
	["割伤"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--50
	["割伤"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--60
	["割伤"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--12
	["治疗宠物"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["治疗宠物"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--28
	["治疗宠物"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--36
	["治疗宠物"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--44
	["治疗宠物"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--52
	["治疗宠物"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--60
	["治疗宠物"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--16
	["猫鼬撕咬"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["猫鼬撕咬"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--44
	["猫鼬撕咬"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--58
	["猫鼬撕咬"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--18
	["多重射击"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["多重射击"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--42
	["多重射击"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--54
	["多重射击"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--26
	["急速射击"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--8
	["猛禽一击"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--16
	["猛禽一击"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--24
	["猛禽一击"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--32
	["猛禽一击"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--40
	["猛禽一击"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--48
	["猛禽一击"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--56
	["猛禽一击"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--14
	["恐吓野兽"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["恐吓野兽"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--46
	["恐吓野兽"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["驱散射击"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--22
	["毒蝎钉刺"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--32
	["毒蝎钉刺"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--42
	["毒蝎钉刺"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--52
	["毒蝎钉刺"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--4
	["毒蛇钉刺"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--10
	["毒蛇钉刺"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--18
	["毒蛇钉刺"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--26
	["毒蛇钉刺"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--34
	["毒蛇钉刺"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--42
	["毒蛇钉刺"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--50
	["毒蛇钉刺"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--58
	["毒蛇钉刺"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--40
	["灵魂联结"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--50
	["灵魂联结"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--60
	["灵魂联结"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--1
	["追踪野兽"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--32
	["追踪恶魔"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--50
	["追踪龙类"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--26
	["追踪元素生物"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--40
	["追踪巨人"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--24
	["追踪隐藏生物"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--10
	["追踪人型生物"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--18
	["追踪亡灵"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--40
	["强击光环"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--50
	["强击光环"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--60
	["强击光环"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--36
	["蝰蛇钉刺"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--46
	["蝰蛇钉刺"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--56
	["蝰蛇钉刺"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--40
	["乱射"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--50
	["乱射"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--58
	["乱射"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--12
	["摔绊"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--38
	["摔绊"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--60
	["摔绊"] = {
		cl	= CSG_HUNTER, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--

--==MAGE==
--18
	["魔法增效"] = {
		cl	= CSG_MAGE, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--14
	["魔爆术"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--1
	["奥术智慧"] = {
		cl	= CSG_MAGE, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--8
	["奥术飞弹"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--40
	["奥术强化"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--36
	["冲击波"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["闪现术"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--20
	["暴风雪"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["急速冷却"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--40
	["燃烧"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--26
	["冰锥术"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--6
	["造食术"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--28
	["制造魔法玛瑙"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--48
	["制造魔法黄水晶"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--38
	["制造魔法翡翠"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--58
	["制造魔法红宝石"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--4
	["造水术"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--24
	["法术反制"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--12
	["魔法抑制"] = {
		cl	= CSG_MAGE, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--16
	["侦测魔法"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--20
	["唤醒"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--6
	["火焰冲击"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["防护火焰结界"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--6
	["火球术"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--16
	["烈焰风暴"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--10
	["霜甲术"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--10
	["冰霜新星"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--22
	["防护冰霜结界"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--4
	["寒冰箭"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["冰甲术"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--40
	["寒冰护体"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["寒冰屏障"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--34
	["魔甲术"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["法力护盾"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--8
	["变形术"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

-- Portals are here for completeness
--50
	["传送门：达纳苏斯"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--40
	["传送门：铁炉堡"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--40
	["传送门：奥格瑞玛"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--40
	["传送门：暴风城"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--50
	["传送门：雷霆崖"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--40
	["传送门：幽暗城"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--30
	["气定神闲"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["炎爆术"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--18
	["解除次级诅咒"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--22
	["灼烧"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--12
	["缓落术"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--30
	["传送：达纳苏斯"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--20
	["传送：铁炉堡"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--20
	["传送：奥格瑞玛"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--20
	["传送：暴风城"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--30
	["传送：雷霆崖"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--20
	["传送：幽暗城"] = {
		cl	= CSG_MAGE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--

--==PALADIN==
--18
	["自由祝福"] = {
		cl	= CSG_PALADIN, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--40
	["王者祝福"] = {
		cl	= CSG_PALADIN, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--40
	["光明祝福"] = {
		cl	= CSG_PALADIN, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--4
	["力量祝福"] = {
		cl	= CSG_PALADIN, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--10
	["保护祝福"] = {
		cl	= CSG_PALADIN, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--46
	["牺牲祝福"] = {
		cl	= CSG_PALADIN, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--26
	["拯救祝福"] = {
		cl	= CSG_PALADIN, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--20
	["庇护祝福"] = {
		cl	= CSG_PALADIN, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--14
	["智慧祝福"] = {
		cl	= CSG_PALADIN, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--42
	["清洁术"] = {
		cl	= CSG_PALADIN, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--22
	["专注光环"] = {
		cl	= CSG_PALADIN, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--30
	["奉献"] = {
		cl	= CSG_PALADIN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--1
	["虔诚光环"] = {
		cl	= CSG_PALADIN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["神恩术"] = {
		cl	= CSG_PALADIN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},


--30
	["神圣干涉"] = {
		cl	= CSG_PALADIN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--6
	["圣佑术"] = {
		cl	= CSG_PALADIN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--34
	["圣盾术"] = {
		cl	= CSG_PALADIN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["驱邪术"] = {
		cl	= CSG_PALADIN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--36
	["火焰抗性光环"] = {
		cl	= CSG_PALADIN, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["圣光闪现"] = {
		cl	= CSG_PALADIN, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--32
	["冰霜抗性光环"] = {
		cl	= CSG_PALADIN, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--8
	["制裁之锤"] = {
		cl	= CSG_PALADIN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--6
	["圣光术"] = {
		cl	= CSG_PALADIN, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["神圣之盾"] = {
		cl	= CSG_PALADIN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--40
	["神圣震击"] = {
		cl	= CSG_PALADIN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--50
	["神圣愤怒"] = {
		cl	= CSG_PALADIN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--4
	["审判"] = {
		cl	= CSG_PALADIN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--10
	["圣疗术"] = {
		cl	= CSG_PALADIN, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--8
	["纯净术"] = {
		cl	= CSG_PALADIN, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--24
	["救赎"] = {
		cl	= CSG_PALADIN, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--40
	["忏悔"] = {
		cl	= CSG_PALADIN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--16
	["惩罚光环"] = {
		cl	= CSG_PALADIN, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["圣洁光环"] = {
		cl	= CSG_PALADIN, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["命令圣印"] = {
		cl	= CSG_PALADIN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--16
	["愤怒圣印"] = {
		cl	= CSG_PALADIN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--22
	["公正圣印"] = {
		cl	= CSG_PALADIN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--30
	["光明圣印"] = {
		cl	= CSG_PALADIN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--10
	["正义圣印"] = {
		cl	= CSG_PALADIN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--38
	["智慧圣印"] = {
		cl	= CSG_PALADIN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--6
	["十字军圣印"] = {
		cl	= CSG_PALADIN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--28
	["暗影抗性光环"] = {
		cl	= CSG_PALADIN, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--24
	["超度亡灵"] = {
		cl	= CSG_PALADIN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--

--==PRIEST==
--32
	["废除疾病"] = {
		cl	= CSG_PRIEST, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--14
	["驱除疾病"] = {
		cl	= CSG_PRIEST, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--18
	["绝望祷言"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--28
	["噬灵瘟疫"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--18
	["驱散魔法"] = {
		cl	= CSG_PRIEST, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--40
	["神圣之灵"] = {
		cl	= CSG_PRIEST, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["艾露恩的赐福"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--8
	["渐隐术"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["回馈"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["快速治疗"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["专注施法"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--40
	["强效治疗术"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--16
	["治疗术"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["虚弱妖术"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["神圣之火"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--40
	["神圣新星"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--12
	["心灵之火"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["心灵专注"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--4
	["次级治疗术"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--34
	["漂浮术"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--24
	["法力燃烧"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--10
	["心灵震爆"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["精神控制"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["精神鞭笞"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["安抚心灵"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--22
	["心灵视界"] = {
		cl	= CSG_PRIEST, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--1
	["真言术：韧"] = {
		cl	= CSG_PRIEST, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--6
	["真言术：盾"] = {
		cl	= CSG_PRIEST, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["治疗祷言"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--14
	["心灵尖啸"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--8
	["恢复"] = {
		cl	= CSG_PRIEST, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--10
	["复活术"] = {
		cl	= CSG_PRIEST, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["束缚亡灵"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--40
	["束缚亡灵"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--60
	["束缚亡灵"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["防护暗影"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--42
	["防护暗影"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--56
	["防护暗影"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--4
	["暗言术：痛"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--10
	["暗言术：痛"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--18
	["暗言术：痛"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--26
	["暗言术：痛"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--34
	["暗言术：痛"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--42
	["暗言术：痛"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--50
	["暗言术：痛"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--58
	["暗言术：痛"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--40
	["暗影形态"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},


--28
	["暗影守卫"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--36
	["暗影守卫"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--44
	["暗影守卫"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--52
	["暗影守卫"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--60
	["暗影守卫"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["沉默"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--6
	["惩击"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--14
	["惩击"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--22
	["惩击"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["惩击"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--38
	["惩击"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--46
	["惩击"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--54
	["惩击"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["救赎之魂"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--18
	["星辰碎片"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--26
	["星辰碎片"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--34
	["星辰碎片"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--42
	["星辰碎片"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--50
	["星辰碎片"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--58
	["星辰碎片"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["虚弱之触"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["虚弱之触"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--40
	["虚弱之触"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--50
	["虚弱之触"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--60
	["虚弱之触"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["吸血鬼的拥抱"] = {
		cl	= CSG_PRIEST, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--

--==ROGUE==
--40
	["冲动"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--18
	["伏击"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--26
	["伏击"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--34
	["伏击"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--42
	["伏击"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--50
	["伏击"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["剑刃乱舞"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--34
	["致盲"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--34
	["致盲粉"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--26
	["偷袭"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--30
	["冷血"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["致残毒药"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["致命毒药"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--38
	["致命毒药"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--46
	["致命毒药"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--54
	["致命毒药"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--24
	["侦测陷阱"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--30
	["解除陷阱"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--22
	["扰乱"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--8
	["闪避"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--8
	["剔骨"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--14
	["破甲"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--16
	["佯攻"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--14
	["绞喉"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["鬼魅攻击"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--6
	["凿击"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--35
	["出血"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--28
	["速效毒药"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--36
	["速效毒药"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--44
	["速效毒药"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--52
	["速效毒药"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--60
	["速效毒药"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--12
	["脚踢"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["肾击"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--24
	["麻痹毒药"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--38
	["麻痹毒药"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--52
	["麻痹毒药"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--16
	["开锁"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--4
	["偷窃"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--40
	["预谋"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["伺机待发"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["无情打击"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["还击"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["割裂"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--40
	["安全降落"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--10
	["闷棍"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--1
	["邪恶攻击"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--10
	["切割"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--42
	["切割"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--10
	["疾跑"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--1
	["潜行"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--22
	["消失"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--32
	["致伤毒药"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--40
	["致伤毒药"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--48
	["致伤毒药"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--56
	["致伤毒药"] = {
		cl	= CSG_ROGUE, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--

--==SHAMAN==
--12
	["先祖之魂"] = {
		cl	= CSG_SHAMAN, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["星界传送"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--40
	["治疗链"] = {
		cl	= CSG_SHAMAN, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--32
	["闪电链"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--22
	["祛病术"] = {
		cl	= CSG_SHAMAN, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--16
	["消毒术"] = {
		cl	= CSG_SHAMAN, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--38
	["祛病图腾"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--4
	["地震术"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--6
	["地缚图腾"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--20
	["元素集中"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--40
	["元素掌握"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--26
	["视界术"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--12
	["火焰新星图腾"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--28
	["抗火图腾"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--10
	["烈焰震击"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--28
	["火舌图腾"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--10
	["火舌武器"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--24
	["抗寒图腾"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["冰霜震击"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["冰封武器"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--58
	["冰封武器"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["幽魂之狼"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--42
	["风之优雅图腾"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["根基图腾"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--30
	["治疗之泉图腾"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--6
	["治疗波"] = {
		cl	= CSG_SHAMAN, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["次级治疗波"] = {
		cl	= CSG_SHAMAN, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--8
	["闪电箭"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--8
	["闪电之盾"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--26
	["熔岩图腾"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--26
	["法力之泉图腾"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--40
	["法力之潮图腾"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["自然抗性图腾"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["自然迅捷"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--22
	["消毒图腾"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--12
	["净化术"] = {
		cl	= CSG_SHAMAN, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["复生"] = {
		cl	= CSG_SHAMAN, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--1
	["石化武器"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["灼热图腾"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--34
	["岗哨图腾"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--14
	["石肤图腾"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--40
	["风暴打击"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--10
	["大地之力图腾"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--18
	["战栗图腾"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--22
	["水下呼吸"] = {
		cl	= CSG_SHAMAN, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--28
	["水上行走"] = {
		cl	= CSG_SHAMAN, 
		ob	= 1, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--32
	["风怒图腾"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["风怒武器"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--36
	["风墙图腾"] = {
		cl	= CSG_SHAMAN, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--

--==WARLOCK==
--20
	["诅咒增幅"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--28
	["放逐术"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--40
	["燃烧"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--4
	["腐蚀术"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--36
	["制造火焰石"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--46
	["制造强效火焰石"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--28
	["制造次级火焰石"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--56
	["制造极效火焰石"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--34
	["制造治疗石"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--46
	["制造强效治疗石"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--22
	["制造次级治疗石"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--58
	["制造极效治疗石"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--10
	["制造初级治疗石"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--40
	["制造灵魂石"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--50
	["制造强效灵魂石"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--30
	["制造次级灵魂石"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--60
	["制造极效灵魂石"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--18
	["制造初级灵魂石"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--36
	["制造法术石"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--48
	["制造强效法术石"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--60
	["制造极效法术石"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--8
	["痛苦诅咒"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--60
	["厄运诅咒"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--30
	["疲劳诅咒"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--14
	["鲁莽诅咒"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--44
	["暗影诅咒"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--26
	["语言诅咒"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--4
	["虚弱诅咒"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--32
	["元素诅咒"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--40
	["黑暗契约"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--42
	["死亡缠绕"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["魔甲术"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--10
	["恶魔皮肤"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["恶魔牺牲"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--50
	["侦测强效隐形"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--38
	["侦测隐形"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--26
	["侦测次级隐形"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--14
	["吸取生命"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--24
	["吸取法力"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--10
	["吸取灵魂"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["奴役恶魔"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--22
	["基尔罗格之眼"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--8
	["恐惧术"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["恶魔支配"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--12
	["生命通道"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["地狱烈焰"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--40
	["恐惧嚎叫"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--1
	["献祭"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--50
	["地狱火"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--6
	["生命分流"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["火焰之雨"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--60
	["招魂末日守卫"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["召唤仪式"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--18
	["灼热之痛"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--24
	["感知恶魔"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--6
	["暗影箭"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--32
	["防护暗影结界"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["暗影灼烧"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["生命虹吸"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--48
	["灵魂之火"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--40
	["灵魂链接"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--5
	["召唤恐惧战马"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["召唤地狱猎犬"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--40
	["召唤地狱战马"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--5
	["召唤小鬼"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["召唤魅魔"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--10
	["召唤虚空行者"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--16
	["魔息术"] = {
		cl	= CSG_WARLOCK, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--

--==WARRIOR==
--20
	["愤怒掌握"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--1
	["战斗怒吼"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--32
	["狂暴之怒"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--10
	["血性狂暴"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--40
	["残忍"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--60
	["残忍"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--26
	["挑战怒吼"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--4
	["冲锋"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["顺劈斩"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["震荡猛击"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["死亡之愿"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--14
	["挫志怒吼"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--18
	["缴械"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--24
	["斩杀"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--8
	["断筋"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--8
	["勇猛打击"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["拦截"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--22
	["破胆怒吼"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--20
	["破釜沉舟"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--16
	["惩戒痛击"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--40
	["致死打击"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--12
	["压制"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["刺耳怒吼"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--38
	["拳击"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--50
	["鲁莽"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--4
	["撕裂"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--20
	["报复"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--14
	["复仇"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--12
	["盾击"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--16
	["盾牌格挡"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--40
	["盾牌戒律"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--28
	["盾墙"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
--
--30
	["猛击"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--10
	["破甲攻击"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--30
	["横扫攻击"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--6
	["雷霆一击"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},

--
--36
	["旋风斩"] = {
		cl	= CSG_WARRIOR, 
		--type	= "Debuff",
		--icon	= "Interface\\InventoryItems\\WoWUnknownItem01",
		--minlvl	= 1,
	},
};
--

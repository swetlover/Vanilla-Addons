-- Taken from enemyFrames by kuuurtz
-- https://github.com/zetone/enemyFrames

if FOCUS_TRADECASTS_TO_TRACK then return end

FOCUS_TRADECASTS_TO_TRACK = {
	-- MISC
		['钓鱼']									= {['icon'] = [[Interface\Icons\Trade_Fishing]], 			['casttime'] = 30},
		-- ALCHEMY
		['强效治疗药水']					= {['icon'] = [[Interface\Icons\Inv_potion_52]], 			['casttime'] = 3},
		['强效火焰防护药水']			= {['icon'] = [[Interface\Icons\Inv_potion_24]], 			['casttime'] = 3},
		['魔血药剂']						= {['icon'] = [[Interface\Icons\inv_potion_45]], 			['casttime'] = 3},
		['特效治疗药水']					= {['icon'] = [[Interface\Icons\Inv_potion_54]], 			['casttime'] = 3},
		['特效法力药水']						= {['icon'] = [[Interface\Icons\Inv_potion_76]], 			['casttime'] = 3},
		['法力药水']								= {['icon'] = [[Interface\Icons\Inv_potion_72]], 			['casttime'] = 3},
		['迅捷药水']						= {['icon'] = [[Interface\Icons\Inv_potion_95]], 			['casttime'] = 3},
		['转化：奥金']						= {['icon'] = [[Interface\Icons\Inv_misc_stonetablet_05]], 	['casttime'] = 25},
	-- BLACKSMITH
		['劣质磨刀石']					= {['icon'] = [[Interface\Icons\inv_stone_sharpeningstone_01]], ['casttime'] = 5.125},
		['劣质平衡石']						= {['icon'] = [[Interface\Icons\inv_stone_weightstone_01]], 	['casttime'] = 5.125},
		['粗制磨刀石']					= {['icon'] = [[Interface\Icons\inv_stone_sharpeningstone_02]], ['casttime'] = 5.125},
		['粗制平衡石']						= {['icon'] = [[Interface\Icons\inv_stone_weightstone_02]], 	['casttime'] = 5.125},
		['重磨刀石']					= {['icon'] = [[Interface\Icons\inv_stone_sharpeningstone_03]], ['casttime'] = 5.125},
		['重平衡石']						= {['icon'] = [[Interface\Icons\inv_stone_weightstone_03]], 	['casttime'] = 5.125},
		['坚固的磨刀石']					= {['icon'] = [[Interface\Icons\inv_stone_sharpeningstone_04]], ['casttime'] = 5.125},
		['坚固的平衡石']						= {['icon'] = [[Interface\Icons\inv_stone_weightstone_04]], 	['casttime'] = 5.125},
		['致密磨刀石']					= {['icon'] = [[Interface\Icons\inv_stone_sharpeningstone_05]], ['casttime'] = 8},
		['致密平衡石']						= {['icon'] = [[Interface\Icons\inv_stone_weightstone_05]], 	['casttime'] = 8},
		-- COOKING
		['烤鼠尾鱼']							= {['icon'] = [[Interface\Icons\Inv_misc_fish_20]], 		['casttime'] = 3},
		['美味风蛇']					= {['icon'] = [[Interface\Icons\Inv_misc_monsterhead_04]], 	['casttime'] = 3},
		['菊花茶']								= {['icon'] = [[Interface\Icons\inv_drink_milk_05]], 		['casttime'] = 3},
		-- ENCHANTING
		['附魔胸甲 - 初级法力']				= {['icon'] = [[Interface\Icons\Ability_warstomp]], 		['casttime'] = 5},
		-- ENGINEERING
		['魔化皮']						= {['icon'] = [[Interface\Icons\inv_misc_rune_05]], 		['casttime'] = 12.5},
		['劣质火药']					= {['icon'] = [[Interface\Icons\inv_misc_dust_01]], 		['casttime'] = 5.125},
		['粗制火药粉']					= {['icon'] = [[Interface\Icons\inv_misc_dust_02]], 		['casttime'] = 5.125},
		['烈性火药']					= {['icon'] = [[Interface\Icons\inv_misc_dust_06]], 		['casttime'] = 5.125},
		['实心炸药']					= {['icon'] = [[Interface\Icons\inv_misc_powder_black]], 	['casttime'] = 8},
		['致密炸药粉']					= {['icon'] = [[Interface\Icons\inv_misc_ammo_gunpowder_01]],['casttime'] = 8},
		
		['扳手']						= {['icon'] = [[Interface\Icons\inv_misc_wrench_01]], 		['casttime'] = 8},
		['铜质调节器']						= {['icon'] = [[Interface\Icons\inv_gizmo_03]], 			['casttime'] = 5.125},
		['一把螺栓 ']					= {['icon'] = [[Interface\Icons\inv_misc_gear_06]], 		['casttime'] = 1.5},		
		-- FIRST AID
		['亚麻绷带']           				= {['icon'] = [[Interface\Icons\Inv_misc_bandage_15]], 		['casttime'] = 3},
		['厚亚麻绷带']     				= {['icon'] = [[Interface\Icons\Inv_misc_bandage_18]], 		['casttime'] = 3},
		['绒线绷带']           					= {['icon'] = [[Interface\Icons\Inv_misc_bandage_14]], 		['casttime'] = 3},
		['厚绒线绷带']     					= {['icon'] = [[Interface\Icons\Inv_misc_bandage_17]], 		['casttime'] = 3},
		['丝质绷带']            				= {['icon'] = [[Interface\Icons\Inv_misc_bandage_01]], 		['casttime'] = 3},
		['厚丝质绷带']      				= {['icon'] = [[Interface\Icons\Inv_misc_bandage_02]], 		['casttime'] = 3},
		['魔纹绷带']       				= {['icon'] = [[Interface\Icons\Inv_misc_bandage_19]], 		['casttime'] = 3},
		['厚魔纹绷带'] 				= {['icon'] = [[Interface\Icons\Inv_misc_bandage_20]], 		['casttime'] = 3},
		['符文布绷带']       				= {['icon'] = [[Interface\Icons\Inv_misc_bandage_11]], 		['casttime'] = 3},
		['厚符文布绷带']					= {['icon'] = [[Interface\Icons\Inv_misc_bandage_12]], 		['casttime'] = 3},
		-- LEATHERWORKING
		
		['剥皮']								= {['icon'] = [[Interface\Icons\inv_misc_pelt_wolf_01]], 	['casttime'] = 3},
		-- MINING
		['熔炼铜锭']							= {['icon'] = [[Interface\Icons\Inv_ingot_02]], 			['casttime'] = 3},
		['铜锭']								= {['icon'] = [[Interface\Icons\Inv_ingot_02]], 			['casttime'] = 3},
		['熔炼锡锭']								= {['icon'] = [[Interface\Icons\Inv_ingot_05]], 			['casttime'] = 3},
		['熔炼青铜']							= {['icon'] = [[Interface\Icons\Inv_ingot_02]], 			['casttime'] = 3},		
		['熔炼银锭']							= {['icon'] = [[Interface\Icons\Inv_ingot_01]], 			['casttime'] = 3},	
		['熔炼金锭']								= {['icon'] = [[Interface\Icons\Inv_ingot_03]], 			['casttime'] = 3},
		['熔炼铁锭']								= {['icon'] = [[Interface\Icons\Inv_ingot_04]], 			['casttime'] = 3},
		['熔炼秘银']							= {['icon'] = [[Interface\Icons\Inv_ingot_06]], 			['casttime'] = 3},
		['熔炼真银']						= {['icon'] = [[Interface\Icons\Inv_ingot_08]], 			['casttime'] = 3},
		['熔炼瑟银']							= {['icon'] = [[Interface\Icons\Inv_ingot_07]], 			['casttime'] = 3},	
		['瑟银锭']								= {['icon'] = [[Interface\Icons\Inv_ingot_07]], 			['casttime'] = 3},		
		-- TAILORING
		['亚麻布卷']						= {['icon'] = [[Interface\Icons\inv_fabric_linen_02]], 		['casttime'] = 3},
		['毛布卷']					= {['icon'] = [[Interface\Icons\inv_fabric_wool_03]], 		['casttime'] = 5.125},
		['丝绸卷']						= {['icon'] = [[Interface\Icons\inv_fabric_silk_03]], 		['casttime'] = 5.125},
		['魔纹布卷']						= {['icon'] = [[Interface\Icons\inv_fabric_mageweave_03]], 	['casttime'] = 8},
		['符文布卷']						= {['icon'] = [[Interface\Icons\inv_fabric_purplefire_02]], ['casttime'] = 12.5},
}

FOCUS_SPELLCASTS_TO_TRACK = {
	-- MISC & MOB SPELLS
		['酸液喷射']					= {['icon'] = [[Interface\Icons\spell_nature_acid_01]], 			['casttime'] = 3},
		['炸弹']						= {['icon'] = [[Interface\Icons\spell_fire_selfdestruct]], 			['casttime'] = 2},
		['黑泥术']				= {['icon'] = [[Interface\Icons\spell_shadow_callofbone]], 			['casttime'] = 3},
		['投石']						= {['icon'] = [[Interface\Icons\inv_stone_10]], 					['casttime'] = 2},
		['闪电链']				= {['icon'] = [[Interface\Icons\spell_nature_chainlightning]], 		['casttime'] = 1.8},
		['冰链术'] 				= {['icon'] = [[Interface\Icons\spell_frost_chainsofice]], 			['casttime'] = 1.5},
		['克隆']						= {['icon'] = [[Interface\Icons\spell_shadow_blackplague]], 		['casttime'] = 2.5},
		['慢性毒菌'] 				= {['icon'] = [[Interface\Icons\spell_shadow_creepingplague]], 		['casttime'] = 3},
		['残废术'] 					= {['icon'] = [[Interface\Icons\spell_shadow_cripple]], 			['casttime'] = 3},
		['水晶闪耀']				= {['icon'] = [[Interface\Icons\spell_shadow_teleport]], 			['casttime'] = 2,	['immune'] = true,},
		['水晶凝视'] 				= {['icon'] = [[Interface\Icons\ability_golemthunderclap]], 		['casttime'] = 2,	['immune'] = true,},
		['水晶沉睡'] 		= {['icon'] = [[Interface\Icons\spell_nature_sleep]], 				['casttime'] = 2,	['immune'] = true,},
		['培植种子'] 	= {['icon'] = [[Interface\Icons\inv_misc_food_45]], 				['casttime'] = 10},
		['治疗诅咒']			= {['icon'] = [[Interface\Icons\spell_shadow_antishadow]], 			['casttime'] = 1},
		['死木诅咒']		= {['icon'] = [[Interface\Icons\spell_shadow_gathershadows]], 		['casttime'] = 2},
		['玛格拉姆灵魂诅咒'] 	= {['icon'] = [[Interface\Icons\spell_shadow_unholyfrenzy]], 		['casttime'] = 2},
		['黑暗污泥']					= {['icon'] = [[Interface\Icons\spell_shadow_creepingplague]], 		['casttime'] = 5},
		['恐怖低吼'] 					= {['icon'] = [[Interface\Icons\ability_racial_cannibalize]], 		['casttime'] = 1,	['immune'] = true,},
		['热疫疲倦'] 			= {['icon'] = [[Interface\Icons\spell_nature_nullifydisease]], 		['casttime'] = 3,},
		['火焰之盾 II'] 				= {['icon'] = [[Interface\Icons\spell_fire_immolation]], 			['casttime'] = 1,},
		['烈焰尖刺']					= {['icon'] = [[Interface\Icons\spell_fire_flamebolt]], 			['casttime'] = 3,},
		['烈焰喷溅']					= {['icon'] = [[Interface\Icons\spell_fire_selfdestruct]], 			['casttime'] = 3,},		
		['冰霜凝固']				= {['icon'] = [[Interface\Icons\spell_frost_glacier]], 				['casttime'] = 2.5},
		['熊怪形态'] 				= {['icon'] = [[Interface\Icons\Inv_misc_monsterclaw_04]], 			['casttime'] = 2,	['immune'] = true,},
		['疾病软泥']				= {['icon'] = [[Interface\Icons\spell_shadow_creepingplague]], 	 	['casttime'] = 2,	['immune'] = true,},
		['分解']					= {['icon'] = [[Interface\Icons\Inv_Enchant_Disenchant]], 			['casttime'] = 3},
		['喝下初级药水']			= {['icon'] = [[Interface\Icons\Spell_holy_heal]], 					['casttime'] = 3},
		['炸药']					= {['icon'] = [[Interface\Icons\spell_fire_selfdestruct]], 			['casttime'] = 1},
		['陷地图腾']				= {['icon'] = [[Interface\Icons\spell_nature_naturetouchdecay]],	['casttime'] = .5},		
		['爆炸射击']				= {['icon'] = [[Interface\Icons\spell_fire_fireball02]], 			['casttime'] = 1},
		['冰柱']						= {['icon'] = [[Interface\Icons\spell_frost_frostbolt02]], 			['casttime'] = 1.5},
		['墨汁喷射']					= {['icon'] = [[Interface\Icons\spell_nature_sleep]], 				['casttime'] = 1,	['immune'] = true,},
		['治疗结界']				= {['icon'] = [[Interface\Icons\spell_holy_layonhands]], 			['casttime'] = 2},
		['圣光击']					= {['icon'] = [[Interface\Icons\Spell_holy_holysmite]], 			['casttime'] = 2.5},
		['蜥蜴之矢']					= {['icon'] = [[Interface\Icons\spell_nature_lightning]], 			['casttime'] = 2},
		['瘟疫之云'] 				= {['icon'] = [[Interface\Icons\spell_shadow_callofbone]], 			['casttime'] = 2,},
		['瘟疫心灵']					= {['icon'] = [[Interface\Icons\spell_shadow_callofbone]], 			['casttime'] = 4},
		['毒性射击'] 				= {['icon'] = [[Interface\Icons\ability_poisons]], 					['casttime'] = 2,},
		['快速烈焰防护结界'] 			= {['icon'] = [[Interface\Icons\spell_fire_sealoffire]], 			['casttime'] = 1.5,},
		['缩小'] 						= {['icon'] = [[Interface\Icons\spell_shadow_antishadow]], 			['casttime'] = 3,},
		['异种蝎群瘟疫'] 				= {['icon'] = [[Interface\Icons\spell_nature_nullifydisease]], 		['casttime'] = 2,},
		['减速毒药'] 				= {['icon'] = [[Interface\Icons\spell_nature_slowpoison]], 			['casttime'] = 1,},
		['毒性喷溅'] 					= {['icon'] = [[Interface\Icons\spell_nature_corrosivebreath]], 	['casttime'] = 2.5,},
		['特雷莱恩冰触术'] 	= {['icon'] = [[Interface\Icons\spell_shadow_unsummonbuilding]], 	['casttime'] = 3,},
		['游荡瘟疫']			= {['icon'] = [[Interface\Icons\spell_shadow_callofbone]], 			['casttime'] = 2},
		['弱效寒冰箭']				= {['icon'] = [[Interface\Icons\spell_frost_frostbolt02]], 			['casttime'] = 2.2},
		['凋零之触']				= {['icon'] = [[Interface\Icons\spell_nature_drowsy]], 				['casttime'] = 2},
		-- AHN'QIRAJ
		['爆炸']                 	= {['icon'] = [[Interface\Icons\Spell_fire_selfdestruct]], 			['casttime'] = 6},
			-- BLACKWING LAIR
		['暗影烈焰']            	= {['icon'] = [[Interface\Icons\Spell_fire_incinerate]], 			['casttime'] = 2},
		['龙翼打击']             	= {['icon'] = [[Interface\Icons\Inv_misc_monsterscales_14]],		['casttime'] = 1},
		['低沉咆哮']          	= {['icon'] = [[Interface\Icons\Spell_fire_fire]], 					['casttime'] = 1.75},
			-- BLACKROCK SPIRE
		['烈焰打击']              	= {['icon'] = [[Interface\Icons\Spell_fire_selfdestruct]], 			['casttime'] = 6},
			-- ONYXIA
		['吐息']                  	= {['icon'] = [[Interface\Icons\Spell_fire_fire]], 					['casttime'] = 8},
			-- MOLTEN CORE
		['黑暗治疗']              	= {['icon'] = [[Interface\Icons\Spell_shadow_chilltouch]], 			['casttime'] = 2},
		['统御意志']             	= {['icon'] = [[Interface\Icons\Spell_shadow_shadowworddominate]], 	['casttime'] = 2},
		['元素火焰']            	= {['icon'] = [[Interface\Icons\Spell_fire_fireball02]], 			['casttime'] = .5},
		['熔岩冲击']               	= {['icon'] = [[Interface\Icons\Spell_fire_fireblast]], 			['casttime'] = 1},
		['召唤拉格纳罗斯']          	= {['icon'] = [[Interface\Icons\Spell_fire_lavaspawn]],				['casttime'] = 10},
			-- DIRE MAIL
		['奥术箭']              	= {['icon'] = [[Interface\Icons\Spell_arcane_starfire]], 			['casttime'] = 1},
			-- STRATHOLME
		['女妖哀嚎']              	= {['icon'] = [[Interface\Icons\Spell_shadow_shadowbolt]], 			['casttime'] = 1.5},
		['毒液喷吐']                	= {['icon'] = [[Interface\Icons\Spell_nature_corrosivebreath]], 	['casttime'] = 2.5},
		
			-- GLOBAL
	['黑暗治疗']            = {['icon'] = [[Interface\Icons\Spell_shadow_chilltouch]], 				['casttime'] = 2},
	['逃命专家']				= {['icon'] = [[Interface\Icons\ability_rogue_trip]], 				['casttime'] = .5},
	['炉石']             = {['icon'] = [[Interface\Icons\INV_Misc_Rune_01]], 					['casttime'] = 10},
	['魔尘']              = {['icon'] = [[Interface\Icons\Inv_misc_dust_02]], 					['casttime'] = 1.5},
	['无畏冲锋']         = {['icon'] = [[Interface\Icons\Spell_nature_astralrecal]], 			['casttime'] = .1},
	['催眠术']                   = {['icon'] = [[Interface\Icons\Spell_nature_sleep]], 					['casttime'] = 1.5},
	['战争践踏']               = {['icon'] = [[Interface\Icons\Ability_warstomp]], 					['casttime'] = .5},

		-- ENGINEERING
	['劣质铜壳炸弹']       = {['icon'] = [[Interface\Icons\Inv_misc_bomb_09]], 					['casttime'] = 1},
	['大型铜壳炸弹']       = {['icon'] = [[Interface\Icons\Inv_misc_bomb_01]], 					['casttime'] = 1},
	['小型青铜炸弹']       = {['icon'] = [[Interface\Icons\Inv_misc_bomb_09]], 					['casttime'] = 1},
	['重磅青铜炸弹']         = {['icon'] = [[Interface\Icons\Inv_misc_bomb_05]], 					['casttime'] = 1},
	['铁皮手雷']            = {['icon'] = [[Interface\Icons\Inv_misc_bomb_08]], 					['casttime'] = 1},
	['重磅铁制炸弹']           = {['icon'] = [[Interface\Icons\Inv_misc_bomb_01]], 					['casttime'] = 1},
	['秘银破片炸弹']       = {['icon'] = [[Interface\Icons\Inv_misc_bomb_02]], 					['casttime'] = 1},
	['高爆炸弹']       = {['icon'] = [[Interface\Icons\Inv_misc_bomb_07]], 					['casttime'] = 1},
	['瑟银手榴弹']         = {['icon'] = [[Interface\Icons\Inv_misc_bomb_08]], 					['casttime'] = 1},
	['黑铁炸弹']          = {['icon'] = [[Interface\Icons\Inv_misc_bomb_05]], 					['casttime'] = 1},
	['奥术炸弹']             = {['icon'] = [[Interface\Icons\Spell_shadow_mindbomb]],				['casttime'] = 1},

		-- DRUID
	['纠缠根须']        = {['icon'] = [[Interface\Icons\Spell_nature_stranglevines]], 		['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'nature', 	['class'] = '德鲁伊'},
	['治疗之触']           = {['icon'] = [[Interface\Icons\Spell_nature_healingtouch]], 		['casttime'] = 3, 												['class'] = '德鲁伊'},
	['休眠']               = {['icon'] = [[Interface\Icons\Spell_nature_sleep]], 				['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'nature', 	['class'] = '德鲁伊'},
	['复生']                 = {['icon'] = [[Interface\Icons\Spell_nature_reincarnation]], 		['casttime'] = 2, 												['class'] = '德鲁伊'},
	['愈合']                = {['icon'] = [[Interface\Icons\Spell_nature_resistnature]], 		['casttime'] = 2, 												['class'] = '德鲁伊'},
	['安抚动物']           = {['icon'] = [[Interface\Icons\Ability_hunter_beastsoothe]], 		['casttime'] = 1.5, 											['class'] = '德鲁伊'},
	['星火术']                = {['icon'] = [[Interface\Icons\Spell_arcane_starfire]], 			['casttime'] = 3, 	['type'] = 'dmg', ['school'] = 'nature', 	['class'] = '德鲁伊'},
	['传送：月光林地']     = {['icon'] = [[Interface\Icons\Spell_arcane_teleportmoonglade]], 	['casttime'] = 10, 												['class'] = '德鲁伊'},
	['愤怒']                   = {['icon'] = [[Interface\Icons\Spell_nature_abolishmagic]], 		['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'nature', 	['class'] = '德鲁伊'},
		-- HUNTER
		['瞄准射击']              = {['icon'] = [[Interface\Icons\Inv_spear_07]], 					['casttime'] = 2.5, ['type'] = 'dmg', ['school'] = 'physical', 	['class'] = '猎人',	['immune'] = true,},
		['解散野兽']             = {['icon'] = [[Interface\Icons\Spell_nature_spiritwolf]], 			['casttime'] = 5},
		['野兽之眼']       = {['icon'] = [[Interface\Icons\Ability_eyeoftheowl]], 				['casttime'] = 2},
		['多重射击']              = {['icon'] = [[Interface\Icons\ability_upgrademoonglaive]], 		['casttime'] = 0.5, ['type'] = 'dmg', ['school'] = 'physical', 	['class'] = '猎人',	['immune'] = true,},
		['复活宠物']              = {['icon'] = [[Interface\Icons\Ability_hunter_beastsoothe]], 		['casttime'] = 10},
		['恐吓野兽']             = {['icon'] = [[Interface\Icons\Ability_druid_cower]], 				['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'physical', 	['class'] = '猎人'},
		-- MAGE
--        ['Arcane Missile']         = {[[Interface\Icons\Spell_nature_starfall]], 3},
--		['Arcane Missiles']         = {[[Interface\Icons\Spell_nature_starfall]], 5},
--        ['Blizzard']                = {[[Interface\Icons\Spell_frost_icestorm]], 8},
		['造食术']            = {['icon'] = [[Interface\Icons\Inv_misc_food_73cinnamonroll]], 	['casttime'] = 3, 	['class'] = '法师'},
		['造水术']           = {['icon'] = [[Interface\Icons\Inv_drink_18]], 					['casttime'] = 3, 	['class'] = '法师'},
		['制造魔法玛瑙']      = {['icon'] = [[Interface\Icons\Inv_misc_gem_emerald_01]], 			['casttime'] = 3, 	['class'] = '法师'},
		['制造魔法黄水晶']    = {['icon'] = [[Interface\Icons\Inv_misc_gem_opal_01]], 			['casttime'] = 3, 	['class'] = '法师'},
		['制造魔法翡翠']       = {['icon'] = [[Interface\Icons\Inv_misc_gem_emerald_02]], 			['casttime'] = 3, 	['class'] = '法师'},
		['制造魔法红宝石']       = {['icon'] = [[Interface\Icons\Inv_misc_gem_ruby_01]], 			['casttime'] = 3, 	['class'] = '法师'},
--        ['Evocation']               = {[[Interf ace\Icons\Spell_nature_purge]], 8},
		['火球术']                = {['icon'] = [[Interface\Icons\Spell_fire_flamebolt]], 			['casttime'] = 2.5, ['class'] = '法师',	['type'] = 'dmg', ['school'] = 'fire', },
		['寒冰箭']               = {['icon'] = [[Interface\Icons\Spell_frost_frostbolt02]], 			['casttime'] = 2.5, ['class'] = '法师', ['type'] = 'dmg', ['school'] = 'frost'},
		['烈焰风暴']             = {['icon'] = [[Interface\Icons\Spell_fire_selfdestruct]], 			['casttime'] = 3, 	['class'] = '法师'},
		['变形术']               = {['icon'] = [[Interface\Icons\Spell_nature_polymorph]], 			['casttime'] = 1.5, ['class'] = '法师', ['type'] = 'dmg', ['school'] = 'arcane',},
		['变形术：猪']          = {['icon'] = [[Interface\Icons\Spell_magic_polymorphpig]], 		['casttime'] = 1.5, ['class'] = '法师', ['type'] = 'dmg', ['school'] = 'arcane',},
		['变形术：龟']       = {['icon'] = [[Interface\Icons\Ability_hunter_pet_turtle]], 		['casttime'] = 1.5, ['class'] = '法师', ['type'] = 'dmg', ['school'] = 'arcane',},
		['传送门：达纳苏斯']       = {['icon'] = [[Interface\Icons\Spell_arcane_portaldarnassus]], 	['casttime'] = 10},
		['传送门：雷霆崖']   = {['icon'] = [[Interface\Icons\Spell_arcane_portalthunderbluff]], 	['casttime'] = 10},
		['传送门：铁炉堡']       = {['icon'] = [[Interface\Icons\Spell_arcane_portalironforge]], 	['casttime'] = 10},
		['传送门：奥格瑞玛']       = {['icon'] = [[Interface\Icons\Spell_arcane_portalorgrimmar]], 	['casttime'] = 10},
		['传送门：暴风城']       = {['icon'] = [[Interface\Icons\Spell_arcane_portalstormwind]], 	['casttime'] = 10},
		['传送门：幽暗城']       = {['icon'] = [[Interface\Icons\Spell_arcane_portalundercity]], 	['casttime'] = 10},
		['传送：达纳苏斯']     = {['icon'] = [[Interface\Icons\Spell_arcane_teleportdarnassus]], 	['casttime'] = 10},
		['传送：雷霆崖'] = {['icon'] = [[Interface\Icons\Spell_arcane_teleportthunderbluff]],['casttime'] = 10},
		['传送：铁炉堡']     = {['icon'] = [[Interface\Icons\Spell_arcane_portalironforge]], 	['casttime'] = 10},
		['传送：奥格瑞玛']     = {['icon'] = [[Interface\Icons\Spell_arcane_teleportorgrimmar]], 	['casttime'] = 10},
		['传送：暴风城']     = {['icon'] = [[Interface\Icons\Spell_arcane_teleportstormwind]], 	['casttime'] = 10},
		['传送：幽暗城']     = {['icon'] = [[Interface\Icons\Spell_arcane_teleportundercity]], 	['casttime'] = 10},
		['炎爆术']               = {['icon'] = [[Interface\Icons\Spell_fire_fireball02]], 			['casttime'] = 6, 	['type'] = 'dmg', ['school'] = 'fire', ['class'] = '法师'},
		['灼烧']                  = {['icon'] = [[Interface\Icons\Spell_fire_soulburn]], 				['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'fire', ['class'] = '法师'},
		-- PALADIN
		['愤怒之锤']         = {['icon'] = [[Interface\Icons\Ability_ThunderClap]], 				['casttime'] = 1},
		['圣光术']              = {['icon'] = [[Interface\Icons\Spell_holy_holybolt]], 				['casttime'] = 2.5},
		['神圣愤怒']              = {['icon'] = [[Interface\Icons\Spell_holy_weaponmastery]], 		['casttime'] = 2},
		['圣光闪现']          = {['icon'] = [[Interface\Icons\Spell_holy_flashheal]], 			['casttime'] = 1.5},
		['救赎']              = {['icon'] = [[Interface\Icons\Spell_holy_resurrection]], 			['casttime'] = 10},
		['召唤军马']         = {['icon'] = [[Interface\Icons\Spell_nature_swiftness]], 			['casttime'] = 3},
		['召唤战马']          = {['icon'] = [[Interface\Icons\Ability_mount_charger]], 			['casttime'] = 3},
		['超度亡灵']             = {['icon'] = [[Interface\Icons\Spell_holy_turnundead]], 			['casttime'] = 1.5},

		-- PRIEST
		['快速治疗']              = {['icon'] = [[Interface\Icons\Spell_holy_flashheal]], 			['casttime'] = 1.5},
		['强效治疗术']            = {['icon'] = [[Interface\Icons\Spell_holy_greaterheal]], 			['casttime'] = 2.5},
		['治疗术']                    = {['icon'] = [[Interface\Icons\Spell_holy_heal]], 					['casttime'] = 2.5},
		['神圣之火']               = {['icon'] = [[Interface\Icons\Spell_holy_searinglight]], 			['casttime'] = 3.5, ['type'] = 'dmg', ['school'] = 'holy', 	 ['class'] = '牧师'},
		['次级治疗术']				= {['icon'] = [[Interface\Icons\Spell_holy_lesserheal]], 			['casttime'] = 1.5},
		['法力燃烧']               = {['icon'] = [[Interface\Icons\Spell_shadow_manaburn]], 			['casttime'] = 3, 	['type'] = 'dmg', ['school'] = 'shadow', ['class'] = '牧师'},
		['心灵震爆']              = {['icon'] = [[Interface\Icons\Spell_shadow_unholyfrenzy]], 		['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'shadow', ['class'] = '牧师'},
		['精神控制']            = {['icon'] = [[Interface\Icons\Spell_shadow_shadowworddominate]], 	['casttime'] = 3, 	['type'] = 'dmg', ['school'] = 'shadow', ['class'] = '牧师'},
		['治疗祷言']       = {['icon'] = [[Interface\Icons\Spell_holy_prayerofhealing02]], 	['casttime'] = 3},
		['复活术']            = {['icon'] = [[Interface\Icons\Spell_holy_resurrection]], 			['casttime'] = 10},
		['束缚亡灵']          = {['icon'] = [[Interface\Icons\Spell_nature_slow]], 				['casttime'] = 1.5},
		['惩击']                   = {['icon'] = [[Interface\Icons\Spell_holy_holysmite]], 			['casttime'] = 2.5, ['type'] = 'dmg', ['school'] = 'holy', ['class'] = '牧师'},
			-- ROGUE
		['解除陷阱']             = {['icon'] = [[Interface\Icons\Spell_shadow_grimward]], 		['casttime'] = 5},
		['麻痹毒药']     = {['icon'] = [[Interface\Icons\Spell_nature_nullifydisease]], 	['casttime'] = 3},
		['麻痹毒药 II']  = {['icon'] = [[Interface\Icons\Spell_nature_nullifydisease]], 	['casttime'] = 3},
		['麻痹毒药 III'] = {['icon'] = [[Interface\Icons\Spell_nature_nullifydisease]], 	['casttime'] = 3},
		['速效毒药']          = {['icon'] = [[Interface\Icons\Spell_nature_corrosivebreath]], ['casttime'] = 3},
		['速效毒药 II']       = {['icon'] = [[Interface\Icons\Spell_nature_corrosivebreath]], ['casttime'] = 3},
		['速效毒药 III']      = {['icon'] = [[Interface\Icons\Spell_nature_corrosivebreath]], ['casttime'] = 3},
		['速效毒药 IV']       = {['icon'] = [[Interface\Icons\Spell_nature_corrosivebreath]], ['casttime'] = 3},
		['速效毒药 V']        = {['icon'] = [[Interface\Icons\Spell_nature_corrosivebreath]], ['casttime'] = 3},
		['速效毒药 VI']       = {['icon'] = [[Interface\Icons\Spell_nature_corrosivebreath]], ['casttime'] = 3},
		['致命毒药']           = {['icon'] = [[Interface\Icons\Ability_rogue_dualweild]], 		['casttime'] = 3},
		['致命毒药 II']        = {['icon'] = [[Interface\Icons\Ability_rogue_dualweild]], 		['casttime'] = 3},
		['致命毒药 III']       = {['icon'] = [[Interface\Icons\Ability_rogue_dualweild]], 		['casttime'] = 3},
		['致命毒药 IV']        = {['icon'] = [[Interface\Icons\Ability_rogue_dualweild]], 		['casttime'] = 3},
		['致命毒药 V']         = {['icon'] = [[Interface\Icons\Ability_rogue_dualweild]], 		['casttime'] = 3},
		['致残毒药']        = {['icon'] = [[Interface\Icons\Ability_poisonsting]], 			['casttime'] = 3},
		['开锁']               = {['icon'] = [[Interface\Icons\Spell_nature_moonkey]], 		['casttime'] = 5},
		-- SHAMAN
		['先祖之魂']        = {['icon'] = [[Interface\Icons\Spell_nature_regenerate]], 			['casttime'] = 10},
		['星界传送']           = {['icon'] = [[Interface\Icons\Spell_nature_astralrecal]], 		['casttime'] = 10},
		['治疗链']              = {['icon'] = [[Interface\Icons\Spell_nature_healingwavegreater]], 	['casttime'] = 2.5},
		['闪电链']         = {['icon'] = [[Interface\Icons\Spell_nature_chainlightning]], 		['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'nature', ['class'] = '萨满祭司'},
		['视界术']               = {['icon'] = [[Interface\Icons\Spell_nature_farsight]], 			['casttime'] = 2},
		['幽魂之狼']              = {['icon'] = [[Interface\Icons\Spell_nature_spiritwolf]], 			['casttime'] = 3},
		['治疗波']            = {['icon'] = [[Interface\Icons\Spell_nature_healingwavegreater]], 	['casttime'] = 2.5},
		['次级治疗波']     = {['icon'] = [[Interface\Icons\Spell_nature_healingwavelesser]], 	['casttime'] = 1.5},
		['闪电箭']          = {['icon'] = [[Interface\Icons\Spell_nature_lightning]], 			['casttime'] = 2.5, ['type'] = 'dmg', ['school'] = 'nature', ['class'] = '萨满祭司'},
			-- 术士
		['放逐术']                  	= {['icon'] = [[Interface\Icons\Spell_shadow_cripple]], 		['casttime'] = 1.5},
		['制造火焰石']        	= {['icon'] = [[Interface\Icons\Inv_misc_gem_bloodstone_02]], 	['casttime'] = 3},
		['制造特效火焰石']  = {['icon'] = [[Interface\Icons\Inv_stone_04]], 				['casttime'] = 3},
		['制造法术石']       	= {['icon'] = [[Interface\Icons\Inv_misc_gem_sapphire_01]], 	['casttime'] = 5},
		['制造特效法术石']    = {['icon'] = [[Interface\Icons\Spell_shadow_soulgem]], 		['casttime'] = 3},
		['奴役恶魔']           	= {['icon'] = [[Interface\Icons\Spell_shadow_enslavedemon]], 	['casttime'] = 3},
		['恐惧术']                    	= {['icon'] = [[Interface\Icons\Spell_shadow_possession]], 		['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'shadow', ['class'] = '术士'},
		['恐惧嚎叫']          	= {['icon'] = [[Interface\Icons\Spell_shadow_deathscream]], 	['casttime'] = 2, 	['type'] = 'dmg', ['school'] = 'shadow', ['class'] = '术士'},
		['献祭']               	 	= {['icon'] = [[Interface\Icons\Spell_fire_immolation]], 		['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'fire', 	 ['class'] = '术士'},
		['地狱火']                 	= {['icon'] = [[Interface\Icons\Spell_fire_incinerate]], 		['casttime'] = 2},
		['末日仪式']          	= {['icon'] = [[Interface\Icons\Spell_shadow_antimagicshell]], 	['casttime'] = 10},
		['召唤仪式']     	= {['icon'] = [[Interface\Icons\Spell_shadow_twilight]], 		['casttime'] = 5},
		['灼热之痛']            	= {['icon'] = [[Interface\Icons\Spell_fire_soulburn]], 			['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'fire', 	 ['class'] = '术士'},
		['诱惑']               	= {['icon'] = [[Interface\Icons\Spell_shadow_mindsteal]], 		['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'shadow', ['class'] = '术士'},
		['暗影箭']            		= {['icon'] = [[Interface\Icons\Spell_shadow_shadowbolt]], 		['casttime'] = 2.5, ['type'] = 'dmg', ['school'] = 'shadow', ['class'] = '术士'},
		['灵魂之火']               	= {['icon'] = [[Interface\Icons\Spell_fire_fireball02]], 		['casttime'] = 4, 	['type'] = 'dmg', ['school'] = 'fire', 	 ['class'] = '术士'},
		['灵魂石复活']    	= {['icon'] = [[Interface\Icons\Spell_shadow_soulgem]], 		['casttime'] = 3},
		['召唤恐惧战马']       	= {['icon'] = [[Interface\Icons\Ability_mount_dreadsteed]], 	['casttime'] = 3},
		['召唤地狱猎犬']        	= {['icon'] = [[Interface\Icons\Spell_shadow_summonfelhunter]], ['casttime'] = 10},
		['召唤地狱战马']         	= {['icon'] = [[Interface\Icons\Spell_nature_swiftness]], 		['casttime'] = 3},
		['召唤小鬼']              	= {['icon'] = [[Interface\Icons\Spell_shadow_summonimp]], 		['casttime'] = 10},
		['召唤魅魔']         	= {['icon'] = [[Interface\Icons\Spell_shadow_summonsuccubus]], 	['casttime'] = 10},
		['召唤虚空行者']       	= {['icon'] = [[Interface\Icons\Spell_shadow_summonvoidwalker]],['casttime'] = 10},
		-- WARRIOR
	['猛击']               			= {['icon'] = [[Interface\Icons\ability_warrior_decisivestrike]], ['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'physical', ['class'] = '战士',	['immune'] = true,},
}

FOCUS_CHANNELED_HEALS_SPELLCASTS_TO_TRACK = {
	-- DRUID
	['宁静']           	= {['icon'] = [[Interface\Icons\Spell_nature_tranquility]], ['casttime'] = 10,  ['tick'] = 2},
	-- FIRST AID
	['急救']           	= {['icon'] = [[Interface\Icons\Spell_holy_heal]], 			['casttime'] = 7, 	['tick'] = 1},
	-- WARLOCK
	['生命通道']           = {['icon'] = [[Interface\Icons\Spell_shadow_lifedrain]], 	['casttime'] = 10, 	['tick'] = 1},
}

FOCUS_CHANNELED_SPELLCASTS_TO_TRACK = {
	-- MISC
	['侏儒死亡射线']		= {['icon'] = [[Interface\Icons\inv_gizmo_08]], 			['casttime'] = 4},
	-- DRUID
	['飓风']				= {['icon'] = [[Interface\Icons\Spell_nature_cyclone]], 	['casttime'] = 9.5, 	['tick'] = 1},

	-- HUNTER
	['鹰眼术']      			= {['icon'] = [[Interface\Icons\Ability_hunter_eagleeye]], 	['casttime'] = 60},
	['野兽之眼']       = {['icon'] = [[Interface\Icons\Ability_eyeoftheowl]], 		['casttime'] = 60},

	-- MAGE
	['奥术飞弹']         	= {['icon'] = [[Interface\Icons\Spell_nature_starfall]], 	['casttime'] = 2.5,		['tick'] = 3},
	['奥术飞弹']         = {['icon'] = [[Interface\Icons\Spell_nature_starfall]], 	['casttime'] = 4.5, 	['tick'] = 3},
	['暴风雪']                = {['icon'] = [[Interface\Icons\Spell_frost_icestorm]], 	['casttime'] = 7.5, 	['tick'] = 1},
	['唤醒']               = {['icon'] = [[Interface\Icons\Spell_nature_purge]], 		['casttime'] = 8},

	-- PRIEST
	['精神鞭笞']   	       	= {['icon'] = [[Interface\Icons\Spell_shadow_siphonmana]], 	['casttime'] = 3, 		['tick'] = 1},
	['心灵视界']             = {['icon'] = [[Interface\Icons\Spell_holy_mindvision]], 	['casttime'] = 30},

	-- WARLOCK
	['吸取生命']              = {['icon'] = [[Interface\Icons\Spell_shadow_lifedrain02]], ['casttime'] = 4.5, 	['tick'] = 1},
	['吸取法力']              = {['icon'] = [[Interface\Icons\Spell_shadow_siphonmana]], 	['casttime'] = 4.5, 	['tick'] = 1},
	['吸取灵魂 ']            	= {['icon'] = [[Interface\Icons\Spell_shadow_haunting]], 	['casttime'] = 14.5, 	['tick'] = 3},
	['火焰之雨']            = {['icon'] = [[Interface\Icons\Spell_shadow_rainoffire]], 	['casttime'] = 7.5, 	['tick'] = 2},
}

FOCUS_INSTANT_SPELLCASTS_TO_TRACK = {
	-- MISC
	['射击']				= true,

	-- DRUID
	['月火术'] 			= true,

	-- MAGE
	['魔爆术'] 	= true,
	['冰锥术']		= true,
	['火焰冲击']			= true,
	['冰霜新星']			= true,

	-- PALADIN
	['神圣震击']			= true,

	-- PRIEST
	['神圣新星'] 			= true,

	-- SHAMAN
	['地震术'] 		= true,
	['烈焰震击']			= true,
	['冰霜震击']			= true,

	-- WARLOCK
	['暗影灼烧'] 			= true,
}

------------------------------------------------------------
-- Buffs
------------------------------------------------------------

FOCUS_BORDER_DEBUFFS_COLOR = {
	["none"]		= { 0.8, 0.0, 0.0, 1.0 },
	["curse"]		= { 0.6, 0.0, 1.0, 1.0 },
	["disease"]		= { 0.6, 0.4, 0.0, 1.0 },
	["magic"]		= { 0.2, 0.6, 1.0, 1.0 },
	["physical"]	= { 0.8, 0.0, 0.0, 1.0 },
	["poison"] 		= { 0.0, 0.6, 0.0, 1.0 },
}

FOCUS_INTERRUPTS_TO_TRACK = {
	["脚踢"] = true,
	["地震术"] = true,
	["拳击"] = true,
	["盾击"] = true,
}

FOCUS_INTERRUPT_BUFFS_TO_TRACK = {
	-- MISC
	['地狱火效果'] = true, ['铁皮手雷'] = true,  ['无畏冲锋'] = true, ['潮汐咒符'] = true, ['瑟银手榴弹'] = true,
	-- DRUID
	['重击'] = true, 					['熊形态'] = true, 	['猎豹形态'] = true,				['巨熊形态'] = true,
	['野性冲锋效果'] = true, 	['枭兽形态'] = true, ['自然迅捷'] =  true, 	['血袭'] = true,
	['旅行形态'] = true, 			['星火昏迷'] = true,
	-- HUNTER
	['猎豹守护'] =  true, 	['雄鹰守护'] =  true, ['灵猴守护'] =  true, 	['冰冻陷阱效果'] = true,
	['强化震荡射击'] = true,['胁迫'] = true, 		['驱散射击'] = true, 			['翼龙钉刺'] = true,
	-- MAGE
	['闪现术'] = true, 		['法术反制 - 沉默'] = true, ['防护火焰结界'] = true, 	['霜甲术'] = true,	['防护冰霜结界'] = true,
	['寒冰护体'] = true, ['冰甲术'] = true, 				['寒冰屏障'] = true, 	['冲击'] = true, 		['魔甲术'] = true,
	['法力护盾'] = true, ['变形术'] = true, 				['变形术：猪'] = true, 						['变形术：龟'] = true,
	-- PALADIN
	['神圣干涉'] = true, 	['圣佑术'] = true, 		['圣盾术'] = true, ['制裁之锤'] = true,
	['十字军圣印'] = true, 	['正义圣印'] = true, 	['昏迷'] = true,
	-- PRIEST
	['昏阙'] = true, ['心灵之火'] = true, ['心灵尖啸'] = true,   ['沉默'] = true,
	-- ROGUE
	['致盲'] = true, ['偷袭'] = true, ['凿击'] = true, ['肾击'] = true, ['脚踢 - 沉默'] = true,
	-- SHAMAN
	['元素掌握'] =  true, ['幽魂之狼'] = true, ['闪电之盾'] = true, ['自然迅捷'] =  true,
	-- WARLOCK
	['死亡缠绕'] = true, ['恐惧术'] = true, ['防护暗影结界'] = true, ['法术封锁'] = true,
	-- WARRIOR
	['冲锋击昏'] = true, ['震荡猛击'] = true, ['拦截昏迷'] = true, 	['破胆怒吼'] = true, ['锤击昏迷效果'] = true,
	['复仇昏迷'] = true, 	['盾击 - 沉默'] = true,
}

FOCUS_TIME_MODIFIER_BUFFS_TO_TRACK = {
	['树皮术']					= {['mod'] = 1.4, 	['list'] = {'all'}},	-- its 1 second flat increase but 1.4 should be close enough
	['语言诅咒'] 			= {['mod'] = 1.6, 	['list'] = {'all'}},

	['眼之诅咒'] 			= {['mod'] = 1.2, 	['list'] = {'all'}},

	['麻痹毒药'] 		= {['mod'] = 1.6, 	['list'] = {'all'}},	['麻痹毒药 II'] 		= {['mod'] = 1.6, 	['list'] = {'all'}},	['麻痹毒药 III'] 		= {['mod'] = 1.6, 	['list'] = {'all'}},

	['水晶蜘蛛之牙'] 	= {['mod'] = 1.1, 	['list'] = {'all'}},

	['自然迅捷'] 		= {['mod'] = 0.1, 	['list'] = {'治疗链', '闪电链', '视界术', '幽魂之狼', '治疗波', '次级治疗波', '闪电箭',   -- shaman
														'纠缠根须', '治疗之触', '休眠', '复生', '愈合', '安抚动物', '愤怒'}}, -- druid

	['急速射击']					= {['mod'] = .6, 	['list'] = {'瞄准射击'}},
	['暗影冥思'] 				= {['mod'] = 0, 	['list'] = {'暗影箭'}},
	['恶魔支配']				= {['mod'] = 0.05, 	['list'] = {'召唤地狱猎犬', '召唤小鬼', '召唤魅魔', '召唤虚空行者'}},

	['气定神闲'] 			= {['mod'] = 0, 	['list'] = {'火球术', '寒冰箭', '炎爆术', '灼烧', '变形术', '变形术：猪', '变形术：龟'}},
	['思维敏捷']				= {['mod'] = 0.66, 	['list'] = {'火球术', '寒冰箭', '炎爆术', '灼烧', '变形术', '变形术：猪', '变形术：龟'}},
}

FOCUS_BUFFS_TO_TRACK = {

	-- MISC & MOBS
	['急救']				= {['icon'] = [[Interface\Icons\Spell_holy_heal]],					['duration'] = 8,	['display'] = true,},
	['逃跑']					= {['icon'] = [[Interface\Icons\spell_magic_polymorphchicken]],		['duration'] = 10,},
	['自由行动']     		= {['icon'] = [[Interface\Icons\Inv_potion_04]], 					['duration'] = 30, 	['type'] = 'magic', 	['prio'] = 4},
	['无敌']        	= {['icon'] = [[Interface\Icons\Spell_holy_divineintervention]], 	['duration'] = 6, 	['type'] = 'magic',		['prio'] = 5},
	['活力自由行动'] 		= {['icon'] = [[Interface\Icons\Inv_potion_07]], 					['duration'] = 5, 	['type'] = 'magic', 	['prio'] = 4},
	['撒网器']        		= {['icon'] = [[Interface\Icons\ability_ensnare]], 					['duration'] = 10, 	['type'] = 'physical',	['prio'] = 2},
	['感知']        		= {['icon'] = [[Interface\Icons\Spell_nature_sleep]], 				['duration'] = 20,},
	['新近包扎']		= {['icon'] = [[Interface\Icons\inv_misc_bandage_08]],				['duration'] = 60,	['display'] = true,},
	["无畏冲锋"] 		= {['icon'] = [[Interface\Icons\Spell_nature_astralrecal]], 		['duration'] = 12, 	['type'] = 'magic', 	['prio'] = 3},
	["催眠术"] 					= {['icon'] = [[Interface\Icons\Spell_nature_sleep]], 				['duration'] = 12, 	['type'] = 'magic', 	['prio'] = 3},
	['石像形态'] 				= {['icon'] = [[Interface\Icons\Inv_gauntlets_03]], 				['duration'] = 8,},
	['潮汐咒符'] 			= {['icon'] = [[Interface\Icons\Spell_frost_summonwaterelemental]], ['duration'] = 3, 	['type'] = 'magic', 	['prio'] = 2},
	['眼之结界']			= {['icon'] = [[Interface\Icons\spell_totem_wardofdraining]],		['duration'] = 6,							['prio'] = 3},
	['亡灵意志']   	= {['icon'] = [[Interface\Icons\Spell_shadow_raisedead]], 			['duration'] = 5,							['prio'] = 2},
	['喝水']   				= {['icon'] = [[Interface\Icons\INV_Drink_07]], 					['duration'] = 0},

		-- ENGINEERING
	["闪光雷"] 				= {['icon'] = [[Interface\Icons\Spell_Shadow_Darksummoning]], 		['duration'] = 10, 	['prio'] = 2},
	['火焰反射器']         	= {['icon'] = [[Interface\Icons\Spell_fire_sealoffire]], 			['duration'] = 5},
	['冰霜反射器']        	= {['icon'] = [[Interface\Icons\Spell_frost_frostward]], 			['duration'] = 5},
	['暗影反射器']       	= {['icon'] = [[Interface\Icons\Spell_shadow_antishadow]], 			['duration'] = 5},
	['瑟银手榴弹'] 		= {['icon'] = [[Interface\Icons\Spell_fire_selfdestruct]], 			['duration'] = 3, 	['type'] = 'physical', ['prio'] = 2},
	['铁皮手雷'] 			= {['icon'] = [[Interface\Icons\Spell_fire_selfdestruct]], 			['duration'] = 3, 	['type'] = 'physical', ['prio'] = 2},

		-- DRUID
	['驱毒术']         	= {['icon'] = [[Interface\Icons\Spell_nature_nullifypoison_02]],	['duration'] = 8,	['type'] = 'magic' },
	['树皮术']				= {['icon'] = [[Interface\Icons\Spell_nature_stoneclawtotem]],		['duration'] = 15,	['type'] = 'magic', 	['prio'] = 2},
	['急奔']					= {['icon'] = [[Interface\Icons\ability_druid_dash]],				['duration'] = 15,	['type'] = 'physical',},
	['挫志咆哮']		= {['icon'] = [[Interface\Icons\ability_druid_demoralizingroar]],	['duration'] = 30,	['display'] = true,},
	['纠缠根须'] 		= {['icon'] = [[Interface\Icons\Spell_nature_stranglevines]], 		['duration'] = 12, 	['type'] = 'magic', 	['prio'] = 1, 	['dr'] = 'Controlled Root'},
	['狂怒']					= {['icon'] = [[Interface\Icons\Ability_druid_enrage]],				['duration'] = 10,	['display'] = true,},
	['野性冲锋效果']		= {['icon'] = [[Interface\Icons\Ability_hunter_pet_bear]],			['duration'] = 4,	['type'] = 'physical', 	['prio'] = 1},
	['狂暴回复']	= {['icon'] = [[Interface\Icons\ability_bullrush]],					['duration'] = 10,	['display'] = true,},
	['低吼']					= {['icon'] = [[Interface\Icons\ability_physical_taunt]],			['duration'] = 3,	['display'] = true,},
	["休眠"] 				= {['icon'] = [[Interface\Icons\Spell_nature_sleep]], 				['duration'] = 20, 	['type'] = 'magic', 	['prio'] = 3},
	['激活'] 				= {['icon'] = [[Interface\Icons\Spell_nature_lightning]], 			['duration'] = 20, 	['type'] = 'magic', 	['prio'] = 2},
	['虫群']			= {['icon'] = [[Interface\Icons\Spell_nature_insectswarm]],			['duration'] = 12,	['display'] = true,},
	['月火术']				= {['icon'] = [[Interface\Icons\spell_nature_starfall]],			['duration'] = 12,	['display'] = true,},
	['自然之赐']			= {['icon'] = [[Interface\Icons\Spell_nature_naturesblessing]],		['duration'] = 15,	['display'] = true,},
	['自然之握']        	= {['icon'] = [[Interface\Icons\Spell_nature_natureswrath]], 		['type'] = 'magic', ['duration'] = 45},
	['血袭']					= {['icon'] = [[Interface\Icons\Ability_druid_supriseattack]],		['duration'] = 2,	['display'] = true,},
	['扫击']					= {['icon'] = [[Interface\Icons\Ability_druid_disembowel]],			['duration'] = 9,	['display'] = true,},
	['撕扯']						= {['icon'] = [[Interface\Icons\Ability_ghoulfrenzy]],				['duration'] = 12,	['display'] = true,},
	['猛虎之怒']			= {['icon'] = [[Interface\Icons\ability_mount_jungletiger]],		['duration'] = 6,	['display'] = true,},

	--[[	HUNTER 	]]--
	['狂野怒火']			= {['icon'] = [[Interface\Icons\ability_druid_ferociousbite]],		['duration'] = 18,							['prio'] = 2},
	['震荡射击']			= {['icon'] = [[Interface\Icons\Spell_frost_stun]],					['duration'] = 4, 	['type'] = 'magic',		['prio'] = 1},
	['反击']			= {['icon'] = [[Interface\Icons\Ability_warrior_challange]],		['duration'] = 5,	['type'] = 'physical',	['prio'] = 1},
	['威慑']				= {['icon'] = [[Interface\Icons\ability_whirlwind]],				['duration'] = 10, 							['prio'] = 1},
	['献祭陷阱效果']	= {['icon'] = [[Interface\Icons\Spell_fire_flameshock]],			['duration'] = 15,	['display'] = true,},
	['强化震荡射击'] = {['icon'] = [[Interface\Icons\Spell_frost_stun]], 				['duration'] = 3, 	['type'] = 'magic', 	['prio'] = 2},
	['强化摔绊']		= {['icon'] = [[Interface\Icons\Ability_rogue_trip]],				['duration'] = 5,	['type'] = 'physical',},
	['胁迫']			= {['icon'] = [[Interface\Icons\ability_devour]],					['duration'] = 3,	['type'] = 'physical',	['prio'] = 1},
	['快速射击']				= {['icon'] = [[Interface\Icons\ability_warrior_innerrage]],		['duration'] = 12,	['display'] = true,},
	['急速射击']				= {['icon'] = [[Interface\Icons\ability_hunter_runningshot]],		['duration'] = 15,	['type'] = 'magic',},
	['驱散射击']			= {['icon'] = [[Interface\Icons\Ability_golemstormbolt]],			['duration'] = 4, 	['type'] = 'physical',	['prio'] = 2},
	["恐吓野兽"] 			= {['icon'] = [[Interface\Icons\Ability_druid_cower]], 				['duration'] = 10, 	['type'] = 'magic', 	['prio'] = 2, 	['dr'] = 'Fear'},
	['毒蝎钉刺']			= {['icon'] = [[Interface\Icons\Ability_hunter_criticalshot]],		['duration'] = 20,	['display'] = true,},
	['毒蛇钉刺']			= {['icon'] = [[Interface\Icons\Ability_hunter_quickshot]],			['duration'] = 15,	['display'] = true,},
	["冰冻陷阱效果"] 	= {['icon'] = [[Interface\Icons\Spell_frost_chainsofice]], 			['duration'] = 20, 	['type'] = 'magic',		['prio'] = 3},
	['蝰蛇钉刺']				= {['icon'] = [[Interface\Icons\Ability_hunter_aimedshot]], 		['duration'] = 8, 	['type'] = 'poison', 	['prio'] = 1},
	['摔绊']				= {['icon'] = [[Interface\Icons\Ability_rogue_trip]],				['duration'] = 10,	['type'] = 'physical',},
	['翼龙钉刺']			= {['icon'] = [[Interface\Icons\Inv_spear_02]], 					['duration'] = 12, 	['type'] = 'poison', 	['prio'] = 3},
	--['Feign Death']				= {['icon'] = [[Interface\Icons\Ability_Rogue_FeignDeath]], 		['duration'] = 0},

		-- MAGE
	['奥术强化']			= {['icon'] = [[Interface\Icons\spell_nature_lightning]],			['duration'] = 15,	['display'] = true,},
	['冲击波'] 				= {['icon'] = [[Interface\Icons\Spell_holy_excorcism_02]], 			['duration'] = 6, 	['type'] = 'physical', 	['prio'] = 1},
	['节能施法']			= {['icon'] = [[Interface\Icons\Spell_frost_manaburn]], 			['duration'] = 15,  ['type'] = 'magic', 	},
	['法术反制 - 沉默'] = {['icon'] = [[Interface\Icons\Spell_frost_iceshock]], 			['duration'] = 4,  	['type'] = 'magic', 	['prio'] = 2},
	["冰锥术"] 			= {['icon'] = [[Interface\Icons\Spell_frost_glacier]], 				['duration'] = 10, 	['type'] = 'magic',		['display'] = true,},
	["冰冻"] 				= {['icon'] = [[Interface\Icons\Spell_frost_frostarmor02]], 		['duration'] = 7, 	['type'] = 'magic', ['display'] = true,},
	['火球术']				= {['icon'] = [[Interface\Icons\Spell_fire_flamebolt]],				['duration'] = 8,	['type'] = 'physical', ['display'] = true,},
	["霜寒刺骨"] 				= {['icon'] = [[Interface\Icons\Spell_frost_frostarmor]], 			['duration'] = 5, 	['type'] = 'magic', 	['prio'] = 1},
	["冰霜新星"] 				= {['icon'] = [[Interface\Icons\Spell_frost_frostnova]], 			['duration'] = 8, 	['type'] = 'magic', 	['prio'] = 1, 	['dr'] = 'Controlled Root'},
	['防护冰霜结界']             	= {['icon'] = [[Interface\Icons\Spell_frost_frostward]], 			['duration'] = 30, 	['type'] = 'magic'},
	['寒冰箭']				= {['icon'] = [[Interface\Icons\Spell_frost_frostbolt02]], 			['duration'] = 10, 	['type'] = 'magic',		['display'] = true,},
	['防护火焰结界']              	= {['icon'] = [[Interface\Icons\Spell_fire_firearmor]], 			['duration'] = 30, 	['type'] = 'magic'},
	['寒冰护体']				= {['icon'] = [[Interface\Icons\Spell_ice_lament]], 				['duration'] = 60, 	['type'] = 'magic'},
	['寒冰屏障']              	= {['icon'] = [[Interface\Icons\Spell_frost_frost]], 				['duration'] = 10, 	['prio'] = 5},
	['冲击'] 					= {['icon'] = [[Interface\Icons\Spell_fire_meteorstorm]], 			['duration'] = 2, 	['type'] = 'physical', 	['prio'] = 1},
	['痛苦诅咒']		= {['icon'] = [[Interface\Icons\Spell_fire_soulburn]],				['duration'] = 30,	['display'] = true,},
	["变形术"] 				= {['icon'] = [[Interface\Icons\Spell_nature_polymorph]], 			['duration'] = 12, 	['type'] = 'magic', 	['prio'] = 3, 	['dr'] = 'Polymorph'},
	['变形术：猪']          = {['icon'] = [[Interface\Icons\Spell_magic_polymorphpig]], 		['duration'] = 12, 	['type'] = 'magic', 	['prio'] = 3, 	['dr'] = 'Polymorph'},
	['变形术：龟']       = {['icon'] = [[Interface\Icons\Ability_hunter_pet_turtle]],		['duration'] = 12, 	['type'] = 'magic', 	['prio'] = 3, 	['dr'] = 'Polymorph'},
	['炎爆术']				= {['icon'] = [[Interface\Icons\Spell_fire_fireball02]],			['duration'] = 12,	['display'] = true,},
	['缓落术']				= {['icon'] = [[Interface\Icons\spell_magic_featherfall]],			['duration'] = 30,	['display'] = true,},
	['深冬之寒']			= {['icon'] = [[Interface\Icons\Spell_frost_chillingblast]], 		['duration'] = 15, 	['type'] = 'magic', 	['display'] = true,},

	--['Frost Armor']				= {['icon'] = [[Interface\Icons\spell_frost_frostarmor02]],			['duration'] = 30,	['display'] = true,},

		-- PALADIN
	['牺牲祝福']	= {['icon'] = [[Interface\Icons\spell_holy_sealofsacrifice]],		['duration'] = 30,	['display'] = true,},
	['保护祝福'] 	= {['icon'] = [[Interface\Icons\Spell_holy_sealofprotection]], 		['duration'] = 10, 	['type'] = 'magic', 	['prio'] = 2},
	['自由祝福']    	= {['icon'] = [[Interface\Icons\Spell_holy_sealofvalor]], 			['duration'] = 16, 	['type'] = 'magic'},
	['圣佑术']      	= {['icon'] = [[Interface\Icons\Spell_holy_restoration]], 			['duration'] = 8, 	['prio'] = 4},
	['圣盾术']			= {['icon'] = [[Interface\Icons\Spell_holy_divineintervention]], 	['duration'] = 12, 	['prio'] = 5},
	['自律']				= {['icon'] = [[Interface\Icons\spell_holy_removecurse]], 			['duration'] = 60, 	['display'] = true,},
	["制裁之锤"] 		= {['icon'] = [[Interface\Icons\Spell_holy_sealofmight]], 			['duration'] = 5, 	['type'] = 'magic',		['prio'] = 1,	['dr'] = 'Controlled Stun'},
	['十字军审判'] = {['icon'] = [[Interface\Icons\Spell_holy_holysmite]], 			['duration'] = 10, 	['type'] = 'magic',						['display'] = true,},
	['公正审判'] 	= {['icon'] = [[Interface\Icons\Spell_holy_sealofwrath]], 			['duration'] = 10, 	['type'] = 'magic',						['display'] = true,},
	['圣光审判'] 		= {['icon'] = [[Interface\Icons\spell_holy_healingaura]], 			['duration'] = 10, 	['type'] = 'magic',						['display'] = true,},
	['智慧审判'] 	= {['icon'] = [[Interface\Icons\Spell_holy_righteousnessaura]], 	['duration'] = 10, 	['type'] = 'magic',						['display'] = true,},
	['忏悔'] 				= {['icon'] = [[Interface\Icons\Spell_holy_prayerofhealing]], 		['duration'] = 6, 	['type'] = 'magic', 	['prio'] = 3},
	['命令圣印']			= {['icon'] = [[Interface\Icons\Ability_warrior_innerrage]],		['duration'] = 30,	['display'] = true,},
	['公正圣印']			= {['icon'] = [[Interface\Icons\Spell_holy_sealofwrath]],			['duration'] = 30,	['display'] = true,},
	['光明圣印']			= {['icon'] = [[Interface\Icons\spell_holy_healingaura]],			['duration'] = 30,	['display'] = true,},
	['正义圣印']	= {['icon'] = [[Interface\Icons\Ability_ThunderBolt]],				['duration'] = 30,	['display'] = true,},
	['十字军圣印']	= {['icon'] = [[Interface\Icons\Spell_holy_holysmite]],				['duration'] = 30,	['display'] = true,},
	['智慧圣印']			= {['icon'] = [[Interface\Icons\Spell_holy_righteousnessaura]],		['duration'] = 30,	['display'] = true,},
	['昏迷'] 					= {['icon'] = [[Interface\Icons\Spell_frost_stun]], 				['duration'] = 2, 	['type'] = 'physical', 				 	['display'] = true,},
	['复仇']				= {['icon'] = [[Interface\Icons\Spell_holy_righteousnessaura]],		['duration'] = 8,	['display'] = true,},
	['辩护']				= {['icon'] = [[Interface\Icons\Spell_holy_vindication]],			['duration'] = 10,	['display'] = true,},

		-- PRIEST
	['驱除疾病']			= {['icon'] = [[Interface\Icons\Spell_nature_nullifydisease]],		['duration'] = 8,	['display'] = true,},
	['昏厥'] 				= {['icon'] = [[Interface\Icons\Spell_shadow_gathershadows]], 		['duration'] = 3, 	['type'] = 'magic', 	['prio'] = 1},
	['噬灵瘟疫']		= {['icon'] = [[Interface\Icons\Spell_shadow_blackplague]],			['duration'] = 24,	['display'] = true,},
	['光明之泉回复']			= {['icon'] = [[Interface\Icons\spell_holy_summonlightwell]],		['duration'] = 10,	['display'] = true,},
	['精神鞭笞'] 				= {['icon'] = [[Interface\Icons\Spell_shadow_siphonmana]], 			['duration'] = 3, 	['type'] = 'magic', 	['display'] = true,},
	['真言术：盾']    	= {['icon'] = [[Interface\Icons\Spell_holy_powerwordshield]], 		['duration'] = 30, 	['type'] = 'magic'},
	['能量灌注']			= {['icon'] = [[Interface\Icons\spell_holy_powerinfusion]], 		['duration'] = 15, 	['type'] = 'magic'},
	['心灵尖啸'] 			= {['icon'] = [[Interface\Icons\Spell_shadow_psychicscream]], 		['duration'] = 8, 	['type'] = 'magic', 	['prio'] = 1, 	['dr'] = 'Fear'},
	['暗影易伤']	= {['icon'] = [[Interface\Icons\Spell_shadow_blackplague]],			['duration'] = 15,	['display'] = true},
	['暗言术：痛']		= {['icon'] = [[Interface\Icons\spell_shadow_shadowwordpain]],		['duration'] = 24,	['display'] = true,},
	['沉默']					= {['icon'] = [[Interface\Icons\Spell_shadow_impphaseshift]], 		['duration'] = 5, 	['type'] = 'magic', 	['prio'] = 2},
	['恢复']					= {['icon'] = [[Interface\Icons\spell_holy_renew]],					['duration'] = 15,	['display'] = true,},
	['虚弱灵魂']			= {['icon'] = [[Interface\Icons\spell_holy_ashestoashes]],			['duration'] = 15,	['display'] = true,},
	['吸血鬼的拥抱']		= {['icon'] = [[Interface\Icons\spell_shadow_unsummonbuilding]],	['duration'] = 15, 	['type'] = 'curse'},

	--[[	ROGUE 	]]--
	['冲动']			= {['icon'] = [[Interface\Icons\spell_shadow_shadowworddominate]],	['duration'] = 15,	},
	['剑刃乱舞']			= {['icon'] = [[Interface\Icons\ability_warrior_punishingblow]],	['duration'] = 15,	['display'] = true,},
	['致盲']					= {['icon'] = [[Interface\Icons\Spell_shadow_mindsteal]],			['duration'] = 10,	['type'] = 'poison',	['prio'] = 3},
	["偷袭"] 				= {['icon'] = [[Interface\Icons\Ability_cheapshot]], 				['duration'] = 4, 	['type'] = 'physical', 	['prio'] = 1},
	['致残毒药']		= {['icon'] = [[Interface\Icons\Ability_poisonsting]],				['duration'] = 12,	['type'] = 'poison',	['display'] = true,},
	['致命毒药 V']			= {['icon'] = [[Interface\Icons\ability_rogue_dualweild]],			['duration'] = 12,	['display'] = true,},
	['闪避']					= {['icon'] = [[Interface\Icons\spell_shadow_shadowward]],			['duration'] = 15,	['display'] = true,},
	['破甲']			= {['icon'] = [[Interface\Icons\Ability_warrior_riposte]],			['duration'] = 30,	['display'] = true,},
	['绞喉']					= {['icon'] = [[Interface\Icons\ability_rogue_garrote]],			['duration'] = 18,	['display'] = true,},
	['鬼魅攻击']			= {['icon'] = [[Interface\Icons\Spell_shadow_curse]],				['duration'] = 7,	['display'] = true,},
	["凿击"] 					= {['icon'] = [[Interface\Icons\Ability_gouge]], 					['duration'] = 5, 	['type'] = 'physical', 	['prio'] = 2, 	['dr'] = 'Disorient'},
	['出血']				= {['icon'] = [[Interface\Icons\spell_shadow_lifedrain]],			['duration'] = 15,	['display'] = true,},
	['脚踢 - 沉默'] 		= {['icon'] = [[Interface\Icons\Ability_kick]], 					['duration'] = 2, 	['type'] = 'physical', 	['prio'] = 1},
	['麻痹毒药 III']	= {['icon'] = [[Interface\Icons\spell_nature_nullifydisease]],		['duration'] = 14,	['display'] = true,},
	['还击']					= {['icon'] = [[Interface\Icons\Ability_warrior_challange]],		['duration'] = 6,	['type'] = 'physical',	['prio'] = 1},
	["闷棍"] 					= {['icon'] = [[Interface\Icons\Ability_sap]], 						['duration'] = 11, 	['type'] = 'physical', 	['prio'] = 3, 	['dr'] = 'Disorient'},
	['疾跑']					= {['icon'] = [[Interface\Icons\Ability_rogue_sprint]],				['duration'] = 15,							['prio'] = 1},
	['肾击'] 			= {['icon'] = [[Interface\Icons\Ability_rogue_kidneyshot]], 		['duration'] = 6, 	['type'] = 'physical', 	['prio'] = 2,	['dr'] = 'Controlled Stun'},
	['致伤毒药 IV']			= {['icon'] = [[Interface\Icons\Inv_misc_herb_16]],					['duration'] = 15,	['type'] = 'poison',	['display'] = true,},

		-- SHAMAN
	['地缚术']				= {['icon'] = [[Interface\Icons\spell_nature_strengthofearthtotem02]],['duration'] = 5,	['type'] = 'magic',},
	['烈焰震击']				= {['icon'] = [[Interface\Icons\spell_fire_flameshock]],			['duration'] = 12,	['display'] = true,},
	['专注施法']			= {['icon'] = [[Interface\Icons\Spell_arcane_blink]],				['duration'] = 6,	['display'] = true,},
	['冰霜震击']				= {['icon'] = [[Interface\Icons\Spell_frost_frostshock]],			['duration'] = 8,	['type'] = 'magic',		['prio'] = 1, 	['dr'] = 'Frost Shock'},
	['根基图腾效果']	= {['icon'] = [[Interface\Icons\Spell_nature_groundingtotem]],		['duration'] = 10,	['type'] = 'magic',		['prio'] = 3},
	['治疗之道']				= {['icon'] = [[Interface\Icons\Spell_nature_healingway]],			['duration'] = 15,	['display'] = true,},
	['法力之潮图腾']			= {['icon'] = [[Interface\Icons\Spell_frost_summonwaterelemental]],	['duration'] = 12,},
	['风暴打击']				= {['icon'] = [[Interface\Icons\Spell_holy_sealofmight]],			['duration'] = 12,	['display'] = true,},

			-- WARLOCK
	['腐蚀术']				= {['icon'] = [[Interface\Icons\Spell_shadow_abominationexplosion]],['duration'] = 18,	['display'] = true,},
	['痛苦诅咒']			= {['icon'] = [[Interface\Icons\Spell_shadow_curseofsargeras]],		['duration'] = 24,	['display'] = true,},
	['疲劳诅咒']		= {['icon'] = [[Interface\Icons\Spell_shadow_grimward]],			['duration'] = 30,	['type'] = 'curse',},
	['语言诅咒']		= {['icon'] = [[Interface\Icons\Spell_shadow_curseoftounges]],		['duration'] = 30,	['type'] = 'curse',},
	['死亡缠绕']				= {['icon'] = [[Interface\Icons\Spell_shadow_deathcoil]],			['duration'] = 3,	['type'] = 'magic',		['prio'] = 1},
	['吸取生命']				= {['icon'] = [[Interface\Icons\Spell_shadow_lifedrain02]],			['duration'] = 5,	['display'] = true,},
	['吸取法力']				= {['icon'] = [[Interface\Icons\Spell_shadow_siphonmana]],			['duration'] = 5,	['display'] = true,},
	['吸取灵魂']				= {['icon'] = [[Interface\Icons\Spell_shadow_haunting]],			['duration'] = 15,											['display'] = true,},
	["恐惧术"] 					= {['icon'] = [[Interface\Icons\Spell_shadow_possession]], 			['duration'] = 15, 	['type'] = 'magic', 	['prio'] = 2, 	['dr'] = 'Fear'},
	['生命通道']			= {['icon'] = [[Interface\Icons\Spell_shadow_lifedrain]],			['duration'] = 10,	['display'] = true,},
	['献祭']				= {['icon'] = [[Interface\Icons\Spell_fire_immolation]],			['duration'] = 15, 	['type'] = 'magic',						['display'] = true,},
	['诱惑']				= {['icon'] = [[Interface\Icons\Spell_shadow_mindsteal]],			['duration'] = 10, 	['type'] = 'magic', 	['prio'] = 3, 	['dr'] = 'Fear'},
	['暗影灼烧']				= {['icon'] = [[Interface\Icons\spell_shadow_scourgebuild]],		['duration'] = 5,	['display'] = true,},
	['暗影冥思'] 			= {['icon'] = [[Interface\Icons\Spell_shadow_twilight]], 			['duration'] = 10, 	['type'] = 'magic'},
	['防护暗影结界']				= {['icon'] = [[Interface\Icons\Spell_shadow_antishadow]],			['duration'] = 30,	['type'] = 'magic'},
	['生命虹吸']				= {['icon'] = [[Interface\Icons\Spell_shadow_requiem]],				['duration'] = 30,	['display'] = true,},
	['恶魔皮肤']				= {['icon'] = [[Interface\Icons\Spell_shadow_ragingscream]],		['duration'] = 60*3,},
	['魔甲术']				= {['icon'] = [[Interface\Icons\Spell_shadow_ragingscream]],		['duration'] = 60*3,},

	--[[	WARRRIOR 	]]--
	['狂暴之怒']			= {['icon'] = [[Interface\Icons\Spell_nature_ancestralguardian]],	['duration'] = 10,										},
	['血性狂暴']				= {['icon'] = [[Interface\Icons\Ability_racial_bloodrage]], 		['duration'] = 10,	['display'] = true,},
	['嗜血']				= {['icon'] = [[Interface\Icons\spell_nature_bloodlust]], 			['duration'] = 8,	['display'] = true,},
	['挑战怒吼']		= {['icon'] = [[Interface\Icons\Ability_bullrush]], 				['duration'] = 6,	['display'] = true,},
	['冲锋'] 					= {['icon'] = [[Interface\Icons\Spell_frost_stun]], 				['duration'] = 1, 	['type'] = 'physical', 	['prio'] = 1,	['dr'] = 'Controlled Stun'},
	['震荡猛击'] 		= {['icon'] = [[Interface\Icons\Ability_thunderbolt]], 				['duration'] = 5, 	['type'] = 'physical', 	['prio'] = 1},
	['死亡之愿']				= {['icon'] = [[Interface\Icons\Spell_shadow_deathpact]], 			['duration'] = 30,},
	['重伤']				= {['icon'] = [[Interface\Icons\Ability_backstab]], 				['duration'] = 12,	['display'] = true,},
	['挫志怒吼']		= {['icon'] = [[Interface\Icons\ability_warrior_warcry]], 			['duration'] = 30,	['display'] = true,},
	['缴械'] 					= {['icon'] = [[Interface\Icons\Ability_warrior_disarm]], 			['duration'] = 8, 	['type'] = 'physical', 	['prio'] = 1},
	['狂怒']					= {['icon'] = [[Interface\Icons\Spell_shadow_unholyfrenzy]], 		['duration'] = 12,	['display'] = true,},
	['断筋'] 				= {['icon'] = [[Interface\Icons\Ability_shockwave]], 				['duration'] = 15, 	['type'] = 'physical', 	['prio'] = 1},
	['强化断筋'] 		= {['icon'] = [[Interface\Icons\Ability_shockwave]], 				['duration'] = 5, 	['type'] = 'physical', 	['prio'] = 2},
	['拦截昏迷'] 			= {['icon'] = [[Interface\Icons\Spell_frost_stun]], 				['duration'] = 3, 	['type'] = 'physical', 	['prio'] = 1,	['dr'] = 'Controlled Stun'},
	['破胆怒吼']		= {['icon'] = [[Interface\Icons\Ability_golemthunderclap]], 		['duration'] = 8, 	['type'] = 'physical', 	['prio'] = 2, 	['dr'] = 'Fear'},
	['破釜沉舟']				= {['icon'] = [[Interface\Icons\spell_holy_ashestoashes]], 			['duration'] = 20, },
	['锤击昏迷效果']		= {['icon'] = [[Interface\Icons\Spell_frost_stun]],					['duration'] = 3,	['type'] = 'physical',	['prio'] = 1,},
	['致死打击'] 			= {['icon'] = [[Interface\Icons\Ability_warrior_savageblow]], 		['duration'] = 10, 	['type'] = 'physical'},
	['撕裂']					= {['icon'] = [[Interface\Icons\Ability_gouge]], 					['duration'] = 21,	['display'] = true,},
	['反击风暴']				= {['icon'] = [[Interface\Icons\Ability_warrior_challange]],		['duration'] = 15,							['prio'] = 2,},
	['盾击 - 沉默'] 	= {['icon'] = [[Interface\Icons\Ability_warrior_shieldbash]], 		['duration'] = 3, 	['type'] = 'magic',		['prio'] = 2},
	['盾牌格挡']			= {['icon'] = [[Interface\Icons\ability_defend]], 					['duration'] = 5,	['display'] = true,},
	['盾墙'] 			= {['icon'] = [[Interface\Icons\Ability_warrior_shieldwall]], 		['duration'] = 10, 	 						['prio'] = 2},
	['横扫攻击']		= {['icon'] = [[Interface\Icons\Ability_rogue_slicedice]], 			['duration'] = 20,	['display'] = true,},
	['雷霆一击']			= {['icon'] = [[Interface\Icons\Spell_nature_thunderclap]], 		['duration'] = 30,	['display'] = true,},

	----------------

	-- DRUID
	['驱毒术'] = { ['icon'] = [[Interface\Icons\spell_nature_nullifypoison_02]], ['duration'] = 12 },
	['野性印记'] = { ['icon'] = [[Interface\Icons\spell_nature_regeneration]], ['duration'] = 0 },
	['愈合'] = { ['icon'] = [[Interface\Icons\spell_nature_resistnature]], ['duration'] = 0 },
	['回春术'] = { ['icon'] = [[Interface\Icons\spell_nature_rejuvenation]], ['duration'] = 0 },

	-- MAGE
	['魔法增效'] = { ['icon'] = [[Interface\Icons\spell_holy_flashheal]], ['duration'] = 0 },
	['奥术智慧'] = { ['icon'] = [[Interface\Icons\spell_holy_magicalsentry]], ['duration'] = 0 },
	['魔法抑制'] = { ['icon'] = [[Interface\Icons\spell_nature_abolishmagic]], ['duration'] = 0 },
	['魔甲术'] = { ['icon'] = [[Interface\Icons\spell_magearmor]], ['duration'] = 0 },
	['冰甲术'] = { ['icon'] = [[Interface\Icons\spell_frost_frostarmor02]], ['duration'] = 0 },
	['霜甲术'] = { ['icon'] = [[Interface\Icons\spell_frost_frostarmor02]], ['duration'] = 0 },
	['气定神闲'] = { ['icon'] = [[Interface\Icons\spell_nature_enchantarmor]], ['duration'] = 0 },

	-- PALADIN
	['王者祝福'] = { ['icon'] = [[Interface\Icons\spell_magic_magearmor]], ['duration'] = 0 },
	['力量祝福'] = { ['icon'] = [[Interface\Icons\spell_holy_fistofjustice]], ['duration'] = 0 },
	['庇护祝福'] = { ['icon'] = [[Interface\Icons\spell_holy_greaterblessingofsanctuary]], ['duration'] = 0 },
	['智慧祝福'] = { ['icon'] = [[Interface\Icons\spell_holy_sealofwisdom]], ['duration'] = 0 },

	-- PRIEST
	['神圣之灵'] = { ['icon'] = [[Interface\Icons\spell_holy_divinespirit]], ['duration'] = 0 },
	['防护恐惧结界'] = { ['icon'] = [[Interface\Icons\Spell_holy_excorcism.png]], ['duration'] = 0 },
	['能量灌注'] = { ['icon'] = [[Interface\Icons\spell_holy_powerinfusion]], ['duration'] = 0 },
	['真言术：韧'] = { ['icon'] = [[Interface\Icons\spell_holy_wordfortitude]], ['duration'] = 0 },
	['真言术：盾'] = { ['icon'] = [[Interface\Icons\spell_holy_powerwordshield]], ['duration'] = 0 },
	['恢复'] = { ['icon'] = [[Interface\Icons\spell_holy_renew]], ['duration'] = 0 },
	['防护暗影'] = { ['icon'] = [[Interface\Icons\spell_shadow_antishadow]], ['duration'] = 0 },

}

FOCUS_UNIQUE_DEBUFFS = {
	['肾击'] = {['icon'] = [[Interface\Icons\Ability_rogue_kidneyshot]], ['cp'] = {2, 3, 4, 5, 6}, 		['type'] = 'physical', ['prio'] = 2,	['dr'] = 'Controlled Stun'},
	['割裂'] 	= {['icon'] = [[Interface\Icons\Ability_rogue_rupture]], 	['cp'] = {8, 10, 12, 14, 16}, 	['type'] = 'physical', ['display'] = true,},
}

FOCUS_DEBUFF_REFRESHING_SPELLS = {
	-- DRUID
	['月火术']		= {'月火术'},
	['扫击']			= {'扫击'},
	-- HUNTER
	['摔绊']		= {'摔绊',},
	-- MAGE
	['火球术'] 		= {'火球术', },
	['暴风雪'] 		= {'深冬之寒',},
	['冰锥术'] 	= {'深冬之寒',},
	['冰霜新星'] 		= {'深冬之寒',},
	['寒冰箭'] 		= {'寒冰箭', '深冬之寒',},
	['灼烧']			= {'强化灼烧',},
	-- PALADIN
	['十字军审判'] = {'十字军审判',}, ['公正审判'] = {'公正审判',}, ['圣光审判'] = {'圣光审判',},
	['智慧审判'] = {'智慧审判',},
	-- PRIEST
	['精神鞭笞'] 				= {'暗影易伤',},
	['心灵震爆'] 				= {'暗影易伤',},
	['暗影易伤'] 	= {'暗影易伤',},
	-- ROGUE
	['出血']			= {'出血',},
	['致伤毒药 IV'] 	= {'致伤毒药 IV',},
	['致命毒药 V'] 	= {'致命毒药 V',},
	-- SHAMAN
	['烈焰震击']		= {'烈焰震击',},
	['冰霜震击']		= {'冰霜震击',},
	-- WARLOCK
	['献祭']		= {'献祭',},
	-- WARRRIOR
	['断筋']		= {'断筋',},
	['致死打击']	= {'致死打击',},
}

FOCUS_ROOTS_SNARES = {
	-- MISC
	['撒网器'] = true,
	-- DRUID
	['纠缠根须'] = true, ['野性冲锋效果'] = true,
	-- HUNTER
	['震荡射击'] = true, ['摔绊'] = true, ['强化摔绊'] = true,
	-- MAGE
	['冲击波'] = true, ["冰锥术"] = true, ["霜寒刺骨"] = true, ["冰霜新星"] = true, ['寒冰箭'] = true,
	-- PALADIN
	-- PRIEST
	['精神鞭笞'] = true,
	-- ROGUE
	-- SHAMAN
	['冰霜震击']	 = true,
	-- WARRRIOR
	['断筋'] = true, ['强化断筋'] = true,
}

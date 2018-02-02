Punsch_Tables_KnownChannels = {
	--This table is just used to find the spellname from the icon. Should only contain unnamed channeled spells cast by the user
	ByIcon = {
		MAGE = {
			["Interface\\Icons\\Spell_Frost_IceStorm"] = "暴风雪",
			["Interface\\Icons\\Spell_Nature_Purge"] = "唤醒" ,
			["Interface\\Icons\\Spell_Nature_StarFall"] = "奥术飞弹",
		},
		PRIEST = {
			["Interface\\Icons\\Spell_Holy_MindVision"] = "心灵视界",
			["Interface\\Icons\\Spell_Shadow_SiphonMana"] = "精神鞭笞",
		},
		WARLOCK = {
			["Interface\\Icons\\Spell_Shadow_RainOfFire"] = "火焰之雨",
			["Interface\\Icons\\Spell_Shadow_Haunting"] = "吸取灵魂",
			["Interface\\Icons\\Spell_Shadow_LifeDrain02"] = "吸取生命",
			["Interface\\Icons\\Spell_Shadow_SiphonMana"] = "吸取法力",
			["Interface\\Icons\\Spell_Fire_Incinerate"] = "地狱烈焰",
			["Interface\\Icons\\Spell_Shadow_LifeDrain"] = "生命通道"
		},
		HUNTER = {
			["Interface\\Icons\\Ability_Hunter_EagleEye"] = "鹰眼术",
			["Interface\\Icons\\Ability_Hunter_MendPet"] = "治疗宠物",
			["Interface\\Icons\\Ability_Hunter_BeastTaming"] = "驯服野兽",
		},
		DRUID = {
			["Interface\\Icons\\Spell_Nature_Cyclone"] = "飓风",
			["Interface\\Icons\\Spell_Nature_Tranquility"] = "宁静",
		},
		SHARED = {
			["Interface\\Icons\\INV_Misc_Bandage_12"] = "厚符文布绷带",
			["Interface\\Icons\\INV_Misc_Bandage_11"] = "符文布绷带",
			["Interface\\Icons\\INV_Misc_Bandage_20"] = "厚魔纹绷带",
			["Interface\\Icons\\INV_Misc_Bandage_19"] = "魔纹绷带",
			["Interface\\Icons\\INV_Misc_Bandage_02"] = "厚丝质绷带",
			["Interface\\Icons\\INV_Misc_Bandage_01"] = "丝质绷带",
			["Interface\\Icons\\INV_Misc_Bandage_17"] = "厚绒线绷带",
			["Interface\\Icons\\INV_Misc_Bandage_14"] = "绒线绷带",
			["Interface\\Icons\\INV_Misc_Bandage_18"] = "厚亚麻绷带",
			["Interface\\Icons\\INV_Misc_Bandage_15"] = "亚麻绷带",

		}
	},
	--This table contains all information needed to show ticks on channels properly
	ByName = {
		["暴风雪"] = {
			Tick = "time",
			TickCount = 8
		},
		["奥术飞弹"] = {
			Tick = "time",
			TickCount = 5
		},
		["唤醒"] = {
			Tick = "mana",
		},
		["精神鞭笞"] = {
			Tick = "time",
			TickCount = 3
		},
		["火焰之雨"] = {
			Tick = "time",
			TickCount = 4
		},
		["吸取灵魂"] = {
			Tick = "time",
			TickCount = 5
		},
		["吸取生命"] = {
			Tick = "time",
			TickCount = 5
		},
		["吸取法力"] = {
			Tick = "time",
			TickCount = 5
		},
		["地狱烈焰"] = {
			Tick = "time",
			TickCount = 15
		},
		["生命通道"] = {
			Tick = "time",
			TickCount = 10
		},
		["治疗宠物"] = {
			Tick = "time",
			TickCount = 5
		},
		["飓风"] = {
			Tick = "time",
			TickCount = 10
		},
		["宁静"] = {
			Tick = "time",
			TickCount = 5
		},

		--item based channels
		["厚符文布绷带"] = {
			Tick = "time",
			TickCount = 8
		},
		["符文布绷带"] = {
			Tick = "time",
			TickCount = 8
		},
		["厚魔纹绷带"] = {
			Tick = "time",
			TickCount = 8
		},
		["魔纹绷带"] = {
			Tick = "time",
			TickCount = 8
		},
		["厚丝质绷带"] = {
			Tick = "time",
			TickCount = 8
		},
		["丝质绷带"] = {
			Tick = "time",
			TickCount = 8
		},
		["厚绒线绷带"] = {
			Tick = "time",
			TickCount = 7
		},
		["绒线绷带"] = {
			Tick = "time",
			TickCount = 7
		},
		["厚亚麻绷带"] = {
			Tick = "time",
			TickCount = 6
		},
		["亚麻绷带"] = {
			Tick = "time",
			TickCount = 6
		},

		--racial channel
		["食尸"] = {
			Tick = "time",
			TickCount = 5,
			Icon = "Interface\\Icons\\Ability_Racial_Cannibalize"
		},
	}
}

--[[Implement these to an exceptiontable for world object interactions. eventually. maybe. someday.
	["First Aid"] = "Interface\\Icons\\Spell_Holy_SealOfSacrifice",
	["Herb Gathering"] = "Interface\\Icons\\INV_Misc_Flower_02",
--]]
	--/script message(ActionButton1Icon:GetTexture())

Punsch_Tables_ProfilePresets = {
	Default = {
		Name = "New Profile (Default)",
		MuteWelcomeMessage = false,
		["Entities"] = {
			["Castbar"] = {
				--Entity
				Width = 355,
				Height = 30,
				Anchor = {
					X = -177,
					Y = -215.5,
					rPoint = "CENTER",
					rTo = "",
					Point = "TOPLEFT"
				},
				Bg = {
					r = 0,
					g = 0,
					b = 0,
					a = 1
				},
				Fill = {
					r = 0.54,
					g = 0.54,
					b = 0.54,
					a = 1
				},

				Texture = "Minimalist",
				Border = {
					Show = false,
					Padding = 4,
					Size = 16,
					r = 0,
					g = 0,
					b = 0,
					a = 1,
					OnTop = true
				},

				--Bar
				AlwaysShow = false,

				ShowTextureOnFullBar = true,
				StretchTexture = false,
				Decimals = 1,

				BorderEncompassIcon = false,

				ShowIcon = true,
				IconPadding = 1,

				Spark = {
					Enable = true,
					Height = 60,
					Width = 15,
					r = 0.13,
					g = 0.23,
					b = 0.34,
					a = 1,
				},

				TextLeft = {
					X = 3,
					Y = 0,
					rPoint = "LEFT",
					Point = "LEFT",
					r = 1,
					g = 1,
					b = 1,
					a = 1,
					sr = 0,
					sg = 0,
					sb = 0,
					sa = 1,
					Font = "Vixar",
					FontSize = 14,
					FontShadowX = 0.8,
					FontShadowY = -0.8,
				},

				TextRight = {
					X = -3,
					Y = 0,
					rPoint = "RIGHT",
					Point = "RIGHT",
					r = 1,
					g = 1,
					b = 1,
					a = 1,
					sr = 0,
					sg = 0,
					sb = 0,
					sa = 1,
					Font = "Vixar",
					FontSize = 14,
					FontShadowX = 0.8,
					FontShadowY = -0.8,
					Spacing = 1,
				},

				Frame = {
					Enable = true,
					Thickness = 0.8,
					InnerBorderSize = 0,
					OuterBorderSize = 0,
					Borderr = 1,
					Borderg = 1,
					Borderb = 1,
					Bordera = 0,
					r = 0,
					g = 0,
					b = 0,
					a = 1,
				},

				--Castbar

				ShowMultiShot = false,
				ShowAimedShot = true,

				ShowRank = false,
				RankAsRoman = true,
				RankAsShort = true,
				UpperCaseSpellName = false,

				CountUpOnCast = true,
				CountUpOnChannel = false,

				ShowLag = true,


				Tick = {
					Enable = true,
					ShowLag = false,
					AsSolidColor = false,
					TopAnchor = 0,
					BotAnchor = 0.15,
					Width = 3.2,
					r = 0,
					g = 0,
					b = 0,
					a = 1
				},

				HideBlizzardBar = true,

				FillChannel = {
					r = 0.54,
					g = 0.54,
					b = 0.54,
					a = 1
				},

				Lag = {
					r = 0.95,
					g = 1,
					b = 1,
					a = 1
				},

				TextDelay = {
					X = -3,
					Y = 0,
					rPoint = "LEFT",
					Point = "RIGHT",
					r = 0.85,
					g = 0,
					b = 0,
					a = 1,
					sr = 0,
					sg = 0,
					sb = 0,
					sa = 0,
					Font = "Vixar",
					FontSize = 14,
					FontShadowX = 0.8,
					FontShadowY = -0.8,
					AnchorToDuration = true,
				},

				TextLag = {
					r = 1,
					g = 1,
					b = 1,
					a = 1,
					sr = 0,
					sg = 0,
					sb = 0,
					sa = 1,
					Font = "",
					FontSize = 9,
					FontShadowX = 1,
					FontShadowY = -1,
				},

				Fade = {
					Enable = true,
					OnChannel = false,
					Time = 0.9,
					PlayerInterruptAsFailure = true,
					FailureHoldTime = 0,
					SuccessHoldTime = 0,
					ShowLagWhileFading = true,
					Success = {
						r = 0.2,
						g = 0.6,
						b = 0.2,
						a = 1
					},
					Failure = {
						r = 0.6,
						g = 0.2,
						b = 0.2,
						a = 1
					},
					Tolerance = 0.3,
				},

				ChannelDelayToDuration = false
			},
			["Mirror"] = {
				--Entity
				Width = 170,
				Height = 11,
				Anchor = {
					X = 0,
					Y = 1,
					rPoint = "TOPRIGHT",
					rTo = "Castbar",
					Point = "BOTTOMRIGHT"
				},
				Bg = {
					r = 0,
					g = 0,
					b = 0,
					a = 1
				},

				Texture = "Minimalist",

				Border = {
					Show = false,
					Padding = 4,
					Size = 16,
					r = 0,
					g = 0,
					b = 0,
					a = 1,
					OnTop = true
				},

				--Bar
				AlwaysShow = false,
				ShowTextureOnFullBar = false;
				StretchTexture = false,
				Decimals = 1,

				BorderEncompassIcon = false,

				ShowIcon = true,
				IconPadding = 1,

				Spark = {
					Enable = true,
					Height = 22,
					Width = 15,
					r = 0.13,
					g = 0.23,
					b = 0.34,
					a = 1,
				},

				TextLeft = {
					X = 2,
					Y = 0,
					rPoint = "LEFT",
					Point = "LEFT",
					r = 1,
					g = 1,
					b = 1,
					a = 1,
					sr = 0,
					sg = 0,
					sb = 0,
					sa = 1,
					Font = "Vixar",
					FontSize = 10,
					FontShadowX = 0.8,
					FontShadowY = -0.8,
				},

				TextRight = {
					X = -2,
					Y = 0,
					rPoint = "RIGHT",
					Point = "RIGHT",
					r = 1,
					g = 1,
					b = 1,
					a = 1,
					sr = 0,
					sg = 0,
					sb = 0,
					sa = 1,
					Font = "Vixar",
					FontSize = 10,
					FontShadowX = 0.8,
					FontShadowY = -0.8,
				},

				Frame = {
					Enable = true,
					Thickness = 0.8,
					InnerBorderSize = 0,
					OuterBorderSize = 0,
					Borderr = 1,
					Borderg = 1,
					Borderb = 1,
					Bordera = 0,
					r = 0,
					g = 0,
					b = 0,
					a = 1,
				},

				--Mirror
				GrowUp = true, 
				Padding = 1,
				HideBlizzardBar = true,

				Fade = {
					Enable = true,
					Time = 0.9,
					HoldTime = 0,
				},
				Events = {
					BREATH = {
						label = "呼吸",
						enable = true,
						r = 0,
						g = 0.5,
						b = 1,
						a = 1,
						icon = "Interface\\Icons\\Spell_Shadow_DemonBreath"
					},
					EXHAUSTION = {
						label = "疲惫",
						enable = true,
						r = 1,
						g = 0.9,
						b = 0,
						a = 1,
						icon = "Interface\\Icons\\Ability_Suffocate"
					},
					FEIGNDEATH = {
						label = "假死",
						enable = true,
						r = 1,
						g = 0.7,
						b = 0,
						a = 1,
						icon = "Interface\\Icons\\Ability_Rogue_FeignDeath"
					},
					CAMP = {
						label = "小退",
						enable = true,
						r = 1,
						g = 0.7,
						b = 0,
						a = 1,
						icon = "Interface\\Icons\\Spell_Magic_PolymorphChicken"
					},
					QUIT = {
						label = "退出游戏",
						enable = true,
						r = 1,
						g = 0.7,
						b = 0,
						a = 1,
						icon = "Interface\\Icons\\Spell_Magic_PolymorphChicken"
					},
					BOOT = {
						label = "副本启动",
						enable = true,
						r = 1,
						g = 0,
						b = 0,
						a = 1,
						icon = "Interface\\Icons\\INV_Misc_Rune_01"
					},
					SUMMON = {
						label = "召唤",
						enable = true,
						r = 1,
						g = 0.3,
						b = 1,
						a = 1,
						icon = "Interface\\Icons\\Spell_Shadow_Twilight"
					},
					GAMESTART = {
						label = "游戏开始",
						enable = true,
						r = 0,
						g = 1,
						b = 0,
						a = 1,
						icon = "Interface\\Icons\\Ability_DualWield"
					},
					WSG_FLAGRESPAWN = {
						label = "旗帜重生",
						enable = true,
						r = 0,
						g = 1,
						b = 0,
						a = 1,
						icon = "Interface\\Icons\\Ability_DualWield"
					},
				}
			},
		}
	},
}

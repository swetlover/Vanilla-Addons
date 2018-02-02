--[[
	DeuceCommander
		"A graphical interface for my Ace2 mods' /commands!? EGAD!"

    By Neronix of Hellscream EU
--]]

DeuceCommander = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceConsole-2.0", "AceDB-2.0", "FuBarPlugin-2.0")

DeuceCommander.hasIcon = "Interface\\Icons\\INV_Gizmo_07"
DeuceCommander.defaultPosition = "RIGHT"

local console = AceLibrary("AceConsole-2.0")
local dewdrop = AceLibrary("Dewdrop-2.0")
local tablet = AceLibrary("Tablet-2.0")
local CATEGORIES
if GetLocale() == "zhCN" then
	CATEGORIES = {
		["Action Bars"] = "动作条",
		["Auction"] = "拍卖",
		["Audio"] = "声音",
		["Battlegrounds/PvP"] = "战场/PvP",
		["Buffs"] = "增益法术",
		["Chat/Communication"] = "聊天/交流",
		["Druid"] = "德鲁伊",
		["Hunter"] = "猎人",
		["Mage"] = "法师",
		["Paladin"] = "圣骑士",
		["Priest"] = "牧师",
		["Rogue"] = "盗贼",
		["Shaman"] = "萨满祭司",
		["Warlock"] = "术士",
		["Warrior"] = "战士",
		["Healer"] = "治疗者",
		["Tank"] = "坦克",
		["Caster"] = "施法者",
		["Combat"] = "战斗",
		["Compilations"] = "整合",
		["Data Export"] = "数据导出",
		["Development Tools"] = "开发工具",
		["Guild"] = "公会",
		["Frame Modification"] = "框体修改",
		["Interface Enhancements"] = "界面加强",
		["Inventory"] = "背包",
		["Library"] = "运行库",
		["Map"] = "地图",
		["Mail"] = "邮件",
		["Miscellaneous"] = "杂项",
		["Quest"] = "任务",
		["Raid"] = "团队",
		["Tradeskill"] = "商业技能",
		["UnitFrame"] = "人物框体",
	}
else
	CATEGORIES = {
		["Action Bars"] = "Action Bars",
		["Auction"] = "Auction",
		["Audio"] = "Audio",
		["Battlegrounds/PvP"] = "Battlegrounds/PvP",
		["Buffs"] = "Buffs",
		["Chat/Communication"] = "Chat/Communication",
		["Druid"] = "Druid",
		["Hunter"] = "Hunter",
		["Mage"] = "Mage",
		["Paladin"] = "Paladin",
		["Priest"] = "Priest",
		["Rogue"] = "Rogue",
		["Shaman"] = "Shaman",
		["Warlock"] = "Warlock",
		["Warrior"] = "Warrior",
		["Healer"] = "Healer",
		["Tank"] = "Tank",
		["Caster"] = "Caster",
		["Combat"] = "Combat",
		["Compilations"] = "Compilations",
		["Data Export"] = "Data Export",
		["Development Tools"] = "Development Tools",
		["Guild"] = "Guild",
		["Frame Modification"] = "Frame Modification",
		["Interface Enhancements"] = "Interface Enhancements",
		["Inventory"] = "Inventory",
		["Library"] = "Library",
		["Map"] = "Map",
		["Mail"] = "Mail",
		["Miscellaneous"] = "Miscellaneous",
		["Quest"] = "Quest",
		["Raid"] = "Raid",
		["Tradeskill"] = "Tradeskill",
		["UnitFrame"] = "UnitFrame",
	}
end

DeuceCommander:RegisterDB("DeuceCommanderDB")

function DeuceCommander:OnInitialize()
	self:RegisterChatCommand({"/deucecommander", "/deucecomm"})

	-- Create the root of our AceOptions table, ready for addons' tables to be inserted
	self.theTable = { type = "group", args = {} }
end

function DeuceCommander:OnEnable()
	self:Construct()

	function self:OnMenuRequest(level, value)
		dewdrop:FeedAceOptionsTable(self.theTable)
		if level == 1 then dewdrop:AddLine() end
	end

	-- When another addon's loaded, :Construct again to check if the new addon's got a slash command to be added. It's run 2 seconds after ADDON_LOADED to ensure that its slash command is definitely registered
	self:RegisterEvent("ADDON_LOADED", function() self:ScheduleEvent(self.Construct, 2, self) end)
end

function DeuceCommander:OnTooltipUpdate()
	tablet:SetHint("右键点击设置")
end

function DeuceCommander:Construct()
	for k,v in pairs(console.registry) do -- v will be the current slash command being dealt with. k is almost always 8 randomly generated characters (Why, ckknight!?)

		-- Explanation of the following logic: If there's no handler and name attached to it, it's probably not a command we should deal with
		-- In a slash command we want to deal with, .handler is a link to the addon object that the command belongs to
		-- And if the entry for the mod's already there, no need to do it again
		if type(v) == "table" and v.handler and v.handler.name and not self.theTable.args[v.handler.name] then

			local addonName = v.handler.name
			local category = GetAddOnMetadata(addonName, "X-Category") or "Miscellaneous"
			category = self:stripSpaces(category)
			if not CATEGORIES[category] then
				category = CATEGORIES["Miscellaneous"]
			else
				category = CATEGORIES[category]
			end
			-- remove space, because of a Dewdrop limitation
			category = gsub(category, " ", "_")

			if not self.theTable.args[category] then
				self.theTable.args[category] = {
					name = category,
					desc = string.format("AddOns in category %s.", category),
					type = "group",
					args = {}
				}
			end
			local cattbl = self.theTable.args[category]

			-- remove space, because of a Dewdrop limitation
			addonName = gsub(addonName, " ", "_")

			if (not v.name) or (v.name == "") then
				v.name = addonName
			end

			if (not v.desc) or (v.desc == "") then
				if (not v.handler.notes) or (v.handler.notes == "") then
					v.desc = "No Description Provided"
				else
					v.desc = v.handler.notes
				end
			end

			-- add support for "get = false" method
			if v.args then
				for kk,vv in pairs(v.args) do
					for kkk,vvv in pairs(vv) do
						if kkk == "get" and not vvv then
							v.args[kk].get=function() end
						end
					end
				end
			end

			cattbl.args[addonName] = v -- Stick the mod's table in the root group
		end
	end
end

function DeuceCommander:stripSpaces(text)
	if type(text) == "string" then
		return (string.gsub(string.gsub(text, "^%s*(.-)%s*$", "%1"), "%s%s+", " "))
	end
	return text
end
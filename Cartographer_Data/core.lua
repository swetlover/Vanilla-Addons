local L = AceLibrary("AceLocale-2.2"):new("Cartographer-Data")

L:RegisterTranslations("enUS", function() return {
	["Dark Iron"] = true,
	["Rich Thorium"] = true,
	["Small Thorium"] = true,
	["Rich Adamantite"] = true,
	["Fel Iron"] = true,
	["Vein"] = true,
	["Deposit"] = true,
	[" addon Saved Variables not found! No action taken."] = "插件保存的变量没有找到！无法激活任何功能",
	["Data Imported! Will be saved on logoff or reloadui."] = "数据导入！将在注销或小退后生效！",
} end)

L:RegisterTranslations("ruRU", function() return {
	["Dark Iron"] = "黑铁",
	["Rich Thorium"] = "富瑟",
	["Small Thorium"] = "瑟银",
	["Vein"] = "矿",
	["Deposit"] = "矿脉",
	["Fel Iron"] = "魔铁",
	[" addon Saved Variables not found! No action taken."] = " 插件保存的变量没有找到！不采取任何行动.",
	["Data Imported! Will be saved on logoff or reloadui."] = "数据导入！系统退出或重启时将保存.",
} end)


Cartographer_Data = {}

local cdata_print = function(text)
	if not DEFAULT_CHAT_FRAME:IsVisible() then
		FCF_SelectDockFrame(DEFAULT_CHAT_FRAME)
	end
	local out = "|cff999900Cartographer|r|cffff9933数据|r: "..tostring(text)
	DEFAULT_CHAT_FRAME:AddMessage(out)
end

local function round(num, digits)
	local mantissa = 10^digits
	local norm = num*mantissa
	norm = norm + 0.5
	local norm_f = math.floor(norm)
	if norm == norm_f and math.mod(norm_f, 2) ~= 0 then
		return (norm_f-1)/mantissa
	end
	return norm_f/mantissa
end

function getID(x, y)
	return round(x*1000, 0) + round(y*1000, 0)*1001
end
function getXY(id)
	return math.mod(id, 1001)/1000, math.floor(id / 1001)/1000
end
function getXYdata(id)
	return math.mod(id, 10001)/10000, math.floor(id / 10001)/10000
end

function convert_mining_node(name)
	if string.find(name, L["Dark Iron"]) then
		return L["Dark Iron"]
		elseif string.find(name, L["Rich Thorium"]) then
		return L["Rich Thorium"]
		elseif string.find(name, L["Small Thorium"]) then
		return L["Small Thorium"]
		elseif string.find(name, L["Rich Adamantite"]) then
		return L["Rich Adamantite"]
		elseif string.find(name, L["Fel Iron"]) then
		return L["Fel Iron"]
		else
		local w = string.gsub(name, " %(%d+%)", "")
		if w then
			name = w
		end
		local _, _, ore, veindep = string.find(name, "([^ ]+) ([^ ]+)$")
		if ore and veindep and veindep == L["Vein"] or veindep == L["Deposit"] then
			return ore
		end
	end
end

local function Cartographer_Data_Import(db)
	local data_import = false
	if string.lower(db) == "mining" then
		if not Cartographer_MiningDB then
			cdata_print("Cartographer_Mining"..L[" addon Saved Variables not found! No action taken."])
			return
		end
		for zone,nodes in pairs(Cartographer_Data.Mining) do
			local converted_coord, converted_node
			if string.lower(zone) == "version" then
				else
				if not Cartographer_MiningDB[zone] then
					Cartographer_MiningDB[zone] = {}
					for coords,node in pairs(nodes) do
						converted_coord = getID(getXYdata(coords))
						converted_node = convert_mining_node(node)
						Cartographer_MiningDB[zone][converted_coord] = converted_node
						data_import = true
					end
					else
					for coords,node in pairs(nodes) do
						converted_coord = getID(getXYdata(coords))
						converted_node = convert_mining_node(node)
						if not Cartographer_MiningDB[zone][converted_coord] then
							Cartographer_MiningDB[zone][converted_coord] = converted_node
							data_import = true
						end
					end
				end        
			end
		end
		elseif string.lower(db) == "herbalism" then
		if not Cartographer_HerbalismDB then
			cdata_print("Cartographer_Herbalism"..L[" addon Saved Variables not found! No action taken."])
			return
		end
		for zone,nodes in pairs(Cartographer_Data.Herbalism) do
			local converted_coord
			if string.lower(zone) == "version" then
				else
				if not Cartographer_HerbalismDB[zone] then
					Cartographer_HerbalismDB[zone] = {}
					for coords,node in pairs(nodes) do
						converted_coord = getID(getXYdata(coords))
						Cartographer_HerbalismDB[zone][converted_coord] = node
						data_import = true
					end
					else
					for coords,node in pairs(nodes) do
						converted_coord = getID(getXYdata(coords))
						if not Cartographer_HerbalismDB[zone][converted_coord] then
							Cartographer_HerbalismDB[zone][converted_coord] = node
							data_import = true
						end
					end
				end
			end
		end
		elseif string.lower(db) == "treasure" then
		if not Cartographer_TreasureDB then
			cdata_print("Cartographer_Treasure"..L[" addon Saved Variables not found! No action taken."])
			return
		end
		for zone,nodes in pairs(Cartographer_Data.Treasure) do
			local converted_coord
			if string.lower(zone) == "version" then
				else
				if not Cartographer_TreasureDB[zone] then
					Cartographer_TreasureDB[zone] = {}
					for coords,node in pairs(nodes) do
						converted_coord = getID(getXYdata(coords))
						local icon = Cartographer_Treasure:getIcon(node)
						if (icon) then
							Cartographer_TreasureDB[zone][converted_coord] = {["icon"]=icon,["title"]=node}
							data_import = true
						end
					end
					else
					for coords,node in pairs(nodes) do
						converted_coord = getID(getXYdata(coords))
						if not Cartographer_TreasureDB[zone][converted_coord] then
							local icon = Cartographer_Treasure:getIcon(node)
							if (icon) then
								Cartographer_TreasureDB[zone][converted_coord] = {["icon"]=icon,["title"]=node}
								data_import = true
							end
						end
					end
				end
			end
		end
		else
		cdata_print("   /carto_import mining | herbalism | treasure")
	end
	if data_import then cdata_print(L["Data Imported! Will be saved on logoff or reloadui."]) end
end

SlashCmdList["CARTOIMPORT"] = Cartographer_Data_Import
SLASH_CARTOIMPORT1 = "/carto_import"
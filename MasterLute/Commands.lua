local _G = getfenv()
local MasterLute = _G.MasterLute
local L = MasterLute.Locales[_G.GetLocale()].Strings
local gmatch = string.gfind

SLASH_MASTERLUTE1, SLASH_MASTERLUTE2 = L["/masterlute"], L["/lute"]
function SlashCmdList.MASTERLUTE(arg)
	local msg = {}
	for w in gmatch(arg, '[^%s]+') do
		tinsert(msg, w)
	end
	
	local help = {
		L["/masterlute enable (enables addon)"],
		L["/masterlute disable (disables addon)"],
		L["/masterlute autoload (enables or disables autoload in current zone)"],
		L["/masterlute price set <itemLink | itemID> <number> (sets the default price for item)"],
		L["/masterlute price get <itemLink | itemID> (returns item price, if any)"],
		L["/masterlute price list [, page] (lists items and prices)"],
	}
	
	if arg then
		MasterLute:print("|cff00ff00> "..arg)
	end
	
	if arg == L["enable"] then
		MasterLute.enabled = true
		MasterLute_Data.Settings.enabled = MasterLute.enabled
		MasterLute:print(L["Enabled"])
		
	elseif arg == L["disable"] then
		MasterLute.enabled = false
		MasterLute_Data.Settings.enabled = MasterLute.enabled
		MasterLute:print(L["Disabled"])
		
	elseif arg == L["autoload"] then
		local zone = _G.GetRealZoneText()
		local format = string.format
		MasterLute_Data.Settings.AutoLoad[zone] = not MasterLute_Data.Settings.AutoLoad[zone]
		if MasterLute_Data.Settings.AutoLoad[zone] then
			MasterLute:print(format(L["[autoLoad] enabled for [%s]"], zone))
		else
			MasterLute:print(format(L["[autoLoad] disabled for [%s]"], zone))
		end
		
	elseif arg and msg[1] == L["price"] and msg[2] == L["set"] then
		-- need to reparse user input due to WoW item names
		-- /masterlute price set [itemLink] 50
		local link_start, link_end, item_id, enchant_id, suffix_id, unique_id, name = strfind(arg, '|c%x%x%x%x%x%x%x%x|Hitem:(%d-):(%d-):(%d-):(%d-)|h%[(.-)%]|h|r')
		if link_start and link_end and item_id and enchant_id and suffix_id and unique_id and name then
			local price = tonumber(strsub(arg, link_end+1))
			item_id = tonumber(item_id)
			if price and item_id then
				MasterLute:print(format(L["New price %s [ID:%d] - %d"], strsub(arg, link_start, link_end), item_id, price))
				MasterLute_Data.prices[item_id] = price
			end
		elseif getn(msg) == 4 then
			-- /masterlute price set [itemID] 50
			local price = tonumber(msg[4])
			local item_id = tonumber(msg[3])
			local itemLink = MasterLute:GetItemLink(item_id)
			
			if item_id and price and itemLink then
				MasterLute:print(format(L["New price %s [ID:%d] - %d"], itemLink, item_id, price))
				MasterLute_Data.prices[item_id] = price
			end
		end
		
	elseif arg and msg[1] == L["price"] and msg[2] == L["get"] then
		-- need to reparse user input due to WoW item names
		-- /masterlute price get [itemLink]
		local link_start, link_end, item_id, enchant_id, suffix_id, unique_id, name = strfind(arg, '|c%x%x%x%x%x%x%x%x|Hitem:(%d-):(%d-):(%d-):(%d-)|h%[(.-)%]|h|r')
		if link_start and link_end and item_id and enchant_id and suffix_id and unique_id and name then
			item_id = tonumber(item_id)
			if MasterLute_Data.prices[item_id] then
				MasterLute:print(format(L["%s [ID:%s] - price %d"], strsub(arg, link_start, link_end), item_id, MasterLute_Data.prices[item_id]))
			else
				MasterLute:print(format(L["%s [ID:%s] - unknown price"], strsub(arg, link_start, link_end), item_id))
			end
		elseif getn(msg) == 3 then
			-- /masterlute price get [itemID]
			local item_id = tonumber(msg[3])
			local itemLink = MasterLute:GetItemLink(item_id)
			if item_id and itemLink then
				if MasterLute_Data.prices[item_id] then
					MasterLute:print(format(L["%s [ID:%s] - price %d"], itemLink, item_id, MasterLute_Data.prices[item_id]))
				else
					MasterLute:print(format(L["%s [ID:%s] - unknown price"], itemLink, item_id))
				end
			end
		end
		
	elseif arg == L["fixdb"] then
		local t = {}
		for k,v in pairs(MasterLute_Data.prices) do
			t[tonumber(k)] = tonumber(v)
		end
		MasterLute_Data.prices = t
		MasterLute:print(L["Dababase fixed"])
	
	elseif msg[1] == L["price"] and msg[2] == L["list"] then
		-- pagination, sorted by itemID
		local page = 1
		local page_items = 10
		local FROM = 1
		local TO = 1
		if msg[3] then
			page = tonumber(msg[3])
		end
		
		local items = 0
		for k in pairs(MasterLute_Data.prices) do
			items = items + 1
		end
		
		local pages = ceil(items / page_items)
		
		-- dumb check
		if page > pages or page < 1 then
			page = 1
		end
		
		if page == 1 then
			FROM = 1
			TO = page_items
		else
			FROM = page_items * page - page_items + 1
			TO = FROM+page_items
		end
		
		if TO > items then
			TO = items
		end
		
		local ordered_list = {}
		for k, v in pairs(MasterLute_Data.prices) do
			tinsert(ordered_list, {k, v})
		end
		sort(ordered_list, function(a, b)
			return a[1] > b[1]
		end)
		
		for i = FROM, TO, 1 do
			MasterLute:print(format(L["[%d] %s[ID:%d] - price %d"], i, MasterLute:GetItemLink(ordered_list[i][1]), ordered_list[i][1], ordered_list[i][2]))
		end
		
		MasterLute:print(format(L["Page %d / %d"], page, pages))
		
	else
		for _,line in ipairs(help) do
			MasterLute:print(line)
		end
	end
	
end
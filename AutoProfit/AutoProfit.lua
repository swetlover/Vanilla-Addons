----------------------------------------------------------------
--	AutoProfit v3.11 (June 2006)
--	Check out www.gameguidesonline.com for the latest version.
--	To learn how I used the 3D model read this: (http://www.gameguidesonline.com/guides/articles/ggoarticleoctober05_02.asp)
--	Written by Jason Allen.
----------------------------------------------------------------

autoProfitExceptions = { };
autoSell = 0;
autoSilent = 0;
totalProfit = 0;
rotation = 0;
rotrate = 0;
AUTOPROFIT_VERSION = "v3.11 2017/5/24 修正版";

local sellTimer = CreateFrame("Frame") -- d/c protection for Nostalrius
sellTimer.timeSinceLast = 0
sellTimer:Hide()
sellTimer:SetScript("OnUpdate", function() 
		if not MerchantFrame:IsVisible() then sellTimer:Hide() return end
		sellTimer.timeSinceLast = sellTimer.timeSinceLast + arg1
		if (sellTimer.timeSinceLast) > TOOLTIP_UPDATE_TIME then
			sellTimer.timeSinceLast = 0
			local count = table.getn(sellTimer.junk)
			if count > 0 then
				local bag, slot = sellTimer.junk[count][1], sellTimer.junk[count][2]
				PickupContainerItem(bag,slot)
      	MerchantItemButton_OnClick("LeftButton");
      	if (autoSilent == 0) then DEFAULT_CHAT_FRAME:AddMessage("|c00bfffff自动卖垃圾|r: 已卖 " .. GetContainerItemLink(bag, slot), 0.0, .8, 1); end
      	table.remove(sellTimer.junk,count)
			else
				sellTimer:Hide()
			end
		end
	end)

function SellJunk()

	sellTimer.junk = {}
	
	
	for bag = 0, 4 do
	
		if GetContainerNumSlots(bag) > 0 then
		
			for slot = 0, GetContainerNumSlots(bag) do
			
				local texture, itemCount, locked, quality = GetContainerItemInfo(bag, slot);
				
				if (quality == 0) then
					local result = AutoSeller_ProcessLink(GetContainerItemLink(bag, slot));
					if (result > 0) then
          table.insert(sellTimer.junk,{bag,slot})
					end
				end
				
				if (quality == -1) then
					local linkcolor = AutoSeller_ProcessLink(GetContainerItemLink(bag, slot));
					if (linkcolor == 1) then
            table.insert(sellTimer.junk,{bag,slot})
					end
							
				end

			end
			
		end
	end
	if table.getn(sellTimer.junk) > 0 then
		sellTimer:Show()
	end
		
end

function AutoProfit_OnLoad()
	SLASH_AUTOPROFIT1 = "/autoprofit";
	SLASH_AUTOPROFIT2 = "/ap";
	SlashCmdList["AUTOPROFIT"] = AutoProfit_SlashCmd;
end

function AutoProfit_Calculate()

	for bag = 0, 4 do
	
		if GetContainerNumSlots(bag) > 0 then
		
			for slot = 0, GetContainerNumSlots(bag) do
			
				local texture, itemCount, locked, quality = GetContainerItemInfo(bag, slot);
				
				if (quality == 0) then
					local result = AutoSeller_ProcessLink(GetContainerItemLink(bag, slot));
					if (result > 0) then
					AutoProfit_Tooltip:SetBagItem(bag, slot);
					end
				end
				
				if (quality == -1) then
					local linkcolor = AutoSeller_ProcessLink(GetContainerItemLink(bag, slot));
					if (linkcolor == 1) then
						AutoProfit_Tooltip:SetBagItem(bag, slot);
					end
							
				end
								
			end
			
		end
	end
	
	
end

function AutoProfit_AddCoin()

	if (arg1) then
		totalProfit = totalProfit + arg1;
	end
end

function AutoProfit_RotateModel(elapsed)

if (rotrate > 0) then rotation = rotation + (elapsed * rotrate); end

TreasureModel:SetRotation(rotation);

end;


function AutoProfit_SlashCmd(msg)

	--No switch statement in Lua? Lots of ugly if's to follow.
		
	if (msg == "") then
		DEFAULT_CHAT_FRAME:AddMessage("|c00bfffff自动卖垃圾|r " .. AUTOPROFIT_VERSION .. " by Q猫汉化.", 0.0, .80, 1);
		DEFAULT_CHAT_FRAME:AddMessage("|c00bfffff/autoprofit [item link]|r: 在列表中添加或移除物品.", 0.0, .80, 1);
		DEFAULT_CHAT_FRAME:AddMessage("|c00bfffff/autoprofit list|r: 列出列表中的所有物品.", 0.0, .80, 1);
		DEFAULT_CHAT_FRAME:AddMessage("|c00bfffff/autoprofit [number]|r: 在列表中删除该位置的物品.", 0.0, .80, 1);
		DEFAULT_CHAT_FRAME:AddMessage("|c00bfffff/autoprofit purge|r: 从列表中移除所有物品.", 0.0, .80, 1);
		DEFAULT_CHAT_FRAME:AddMessage("|c00bfffff/autoprofit silent|r: 打开和关闭切换销售报告.", 0.0, .80, 1);
		DEFAULT_CHAT_FRAME:AddMessage("|c00bfffff/autoprofit auto|r: 切换自动出售和关闭.", 0.0, .80, 1);
		--DEFAULT_CHAT_FRAME:AddMessage("For the latest version and advanced usage visit |c00bfffffwww.gameguidesonline.com|r (Under the World of Warcraft mods menu.)", 0.0, .80, 1);
		return;
	end
	
	if (msg == "purge") then
		autoProfitExceptions = { };
		DEFAULT_CHAT_FRAME:AddMessage("|c00bfffffAutoProfit|r: Deleted all exceptions.", 0.0, .80, 1);
		return;
	end
	
	if (msg == "auto") then
		if (autoSell == 0) then
			DEFAULT_CHAT_FRAME:AddMessage("|c00bfffffAutoProfit|r: Automatic selling on.", 0.0, .80, 1);
			autoSell = 1;
		else
			DEFAULT_CHAT_FRAME:AddMessage("|c00bfffffAutoProfit|r: Automatic selling off.", 0.0, .80, 1);
			autoSell = 0;
			AutosellButton:Show();
			TreasureModel:Show();
		end
		return;
	end
	
	if (msg == "silent") then
		if (autoSilent == 0) then
			DEFAULT_CHAT_FRAME:AddMessage("|c00bfffffAutoProfit|r: Sale reporting off.", 0.0, .80, 1);
			autoSilent = 1;
		else
			DEFAULT_CHAT_FRAME:AddMessage("|c00bfffffAutoProfit|r: Sale reporting on.", 0.0, .80, 1);
			autoSilent = 0;
		end
		return;
	end
	
	if (msg == "list") then
		if (table.getn(autoProfitExceptions) > 0) then
			DEFAULT_CHAT_FRAME:AddMessage("AutoProfit Exceptions: ", 0.0, .80, 1);
			for i=1,table.getn(autoProfitExceptions) do
				DEFAULT_CHAT_FRAME:AddMessage("[|c00bfffff" .. i .. "|r] " .. autoProfitExceptions[i], 0.0, .80, 1);
			end
		else
			DEFAULT_CHAT_FRAME:AddMessage("|c00bfffffAutoProfit|r: Your exceptions list is empty.", 0.0, .80, 1);
		end
		return;
	end
	
	if (string.len(msg) < 6) then
	
		if (tonumber(msg) == nil) then return; end
	
		if (tonumber(msg) > table.getn(autoProfitExceptions)) then 
			return;
		else
			DEFAULT_CHAT_FRAME:AddMessage("|c00bfffffAutoProfit|r: Removed " .. autoProfitExceptions[tonumber(msg)] .. " from exceptions list.", 0.0, .8, 1);
			table.remove(autoProfitExceptions, tonumber(msg));
			return;
		end
	end
		
		if (string.find(msg, "Hitem:") == nil) then return; end
		
		local removed = 0;
		
		if (table.getn(autoProfitExceptions) > 0) then
				
			for i=1,table.getn(autoProfitExceptions) do
				
				if (msg == autoProfitExceptions[i]) then
					DEFAULT_CHAT_FRAME:AddMessage("|c00bfffffAutoProfit|r: Removed " .. autoProfitExceptions[i] .. " from exceptions list.", 0.0, .8, 1);
					table.remove(autoProfitExceptions, i);
					removed = 1;
				end
			end
		end
		
		if (removed == 0) then
			table.insert(autoProfitExceptions, msg);
			DEFAULT_CHAT_FRAME:AddMessage("|c00bfffffAutoProfit|r: Added " .. msg .. " to exceptions list.", 0.0, .8, 1);
		end
	
	

end


function AutoSeller_ProcessLink(link)

	local color;
	local item;
	local name;
	
	for color, item, name in string.gfind(link, "|c(%x+)|Hitem:(%d+:%d+:%d+:%d+)|h%[(.-)%]|h|r") do
		
		--This prevents Dark Moon Faire items from being sold to the vendor.
		if ((name == "Small Furry Paw") or (name == "Torn Bear Pelt") or (name == "Soft Bushy Tail") or (name == "Vibrant Plume") or (name == "Evil Bat Eye") 
			or (name == "Glowing Scorpid Blood")) then
			return 0;
		end		
		
		if (color == "ff9d9d9d") then
			for i=1,table.getn(autoProfitExceptions) do
				
				if (link == autoProfitExceptions[i]) then
					return 0;
				end
			end
			
	
			return 1;
		end
		
		if (color == "ffffffff") then
			for i=1,table.getn(autoProfitExceptions) do
				
				if (link == autoProfitExceptions[i]) then

					return 1;
				end
			end
			
			return 0;
		end
		
		return 0;
	end
	
end
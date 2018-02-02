local PU_isBankOpened = false
local PU_isDisorder = false
local PU_isIncBank = false
local PU_isIncBody = true
local PU_isCompress = false

local PU_isPackingUp = false
local PU_isDataComplete = false

local PU_StepCountAll = 0
local PU_StepCountBag = 0
local PU_StepBagType

local PU_BagAll = nil
local PU_BagAllArea = nil
local PU_BagNormal = nil
local PU_BagSlot = nil
local PU_Items = nil

local function PU_Msg(msg)
	DEFAULT_CHAT_FRAME:AddMessage(msg or PACKUP_ERR_NOMSG);
end

local function PU_GetStr(str)
	if str == nil then
		return "[nil]"
	else if type(str) == "boolean" then
		if str then
			return "true"
		else
			return "false"
		end
	end
		return str
	end
end

local function PU_ShowTableData(tb, sPrefix, funPrint)
	if type(tb) ~= "table" then
		PU_Msg("PU_ShowTableData : Param [tb] Not A Table")
	end
	local i,iLen
	local sType
	local sMsg = "{"
	iLen = table.getn(tb)
	if iLen == 0 then
		sMsg = sMsg.."[Empty Table]"
	else
		for i=1, iLen do
			if i ~= 1 then
				sMsg = sMsg..","
			end
			sMsg = sMsg..funPrint(tb[i])
		end
	end
	sMsg = sMsg.."}"
	PU_Msg(sPrefix..sMsg)
end

local function PU_GetIDFromLink(itemLink)
	local _,_,itemID = string.find(itemLink,PACKUP_ITEMLINK)
	return itemID
end

function PU_GetContainerItemID(bagID,slotID)
	local itemLink = nil
	local itemID = nil
	itemLink = GetContainerItemLink(bagID,slotID)
	if itemLink ~= nil then
		itemID = PU_GetIDFromLink(itemLink)
	end
	return itemID
end

local function PU_DetectKey(item,dt)
	if dt.value == nil then
		return {result = true, index = 0};
	end
	local i
	local itemInfo = PU_GetItemInfo(item,dt.key)
	local bMatch
	for i = 1, table.getn(dt.value) do
		if type(dt.value[i]) == "table" then
			if (string.find(itemInfo.key, dt.value[i][1]) ~= nil) then
				return {result = true, index = i}
			end
		elseif itemInfo.key == dt.value[i] then
			return {result = true, index = i};
		end
	end
	return {result = false, index = 0}
end

local function PU_ParseLine(msg)
	msg = string.lower(msg)
	if msg == "" then
		PU_isDisorder = false
		PU_isCompress = false
		PU_isIncBody = true
		if PU_isBankOpened then
			PU_isIncBank = true
		else
			PU_isIncBank = false
		end
	elseif msg == "bank" then
		PU_isDisorder = false
		PU_isCompress = false
		PU_isIncBody = false
		if PU_isBankOpened then
			PU_isIncBank = true
		else
			PU_Msg(PACKUP_ERR_BANKCLOSE)
			return false
		end
	elseif msg == "bag" then
		PU_isDisorder = false
		PU_isCompress = false
		PU_isIncBody = true
		PU_isIncBank = false
	elseif msg == "compress" or msg == "zip" then
		PU_isDisorder = false
		PU_isCompress = true
		if PU_isBankOpened then
			PU_isIncBank = true
		else
			PU_isIncBank = false
		end
		PU_isIncBody = true
	else
		PU_isDisorder = true
		PU_isCompress = false
		if PU_isBankOpened then
			PU_isIncBank = true
		else
			PU_isIncBank = false
		end
		PU_isIncBody = true
	end
	return true
end

local function PU_ContainerIDToInventoryID(bagID)
	if bagID >= 1 and bagID <= 11 then
		return ContainerIDToInventoryID(bagID)
	else
		return nil
	end
end

local function PU_DetectBag(bagData)
	local invID = PU_ContainerIDToInventoryID(bagData.bagID)
	local index = table.getn(PU_BagAll)+1
	if invID == nil then
		if bagData.enable then
			PU_BagAll[index] = {
					type = PACKUP_BAG_NORMAL,
					bagID = bagData.bagID,
					order = bagData.order,
					itemID = nil
				}
			PU_BagNormal[table.getn(PU_BagNormal)+1] = {bagID = bagData.bagID, order = bagData.order}
		end
	else
		if bagData.enable then
			local itemLink = GetInventoryItemLink("player",invID)
			if itemLink ~= nil then
				local itemID = PU_GetIDFromLink(itemLink)
				PU_BagAll[index] = {
						type = PU_GetItemInfo({itemID = itemID},PACKUP_INFO_SUBTYPE).key,
						bagID = bagData.bagID,
						order = bagData.order,
						itemID = itemID
					}
				if PU_BagAll[index].type == PACKUP_BAG_NORMAL then
					PU_BagNormal[table.getn(PU_BagNormal)+1] = {bagID = bagData.bagID, order = bagData.order}
				end
			end
		end
	end
end

local function PU_Check(tb,iStart,iEnd)
	local iLen = table.getn(tb)
	if iStart < 1 or iEnd < 1 or iStart > iLen or iEnd > iLen then
		PU_Msg(PACKUP_ERR_OUTOFBOUND)
		return -1,-1,false;
	end
	if iStart > iEnd then
		iStart,iEnd = iEnd,iStart
	end
	return iStart,iEnd,true
end

local function PU_Compare(a, b, sInfo, order)
	local aInfo = PU_GetItemInfo(a,sInfo)
	local bInfo = PU_GetItemInfo(b,sInfo)
	if order == PACKUP_ORDER_ASC then
		if aInfo.key == bInfo.key then
			return (aInfo.suborder > bInfo.suborder)
		else
			return (aInfo.key < bInfo.key)
		end
	else
		if aInfo.key == bInfo.key then
			return (aInfo.suborder < bInfo.suborder)
		else
			return (aInfo.key > bInfo.key)
		end
	end
end

local function PU_AreaBubbleSort(tb, iStart, iEnd, sInfo, order)
	local bOK
	iStart,iEnd,bOK = PU_Check(tb,iStart,iEnd)
	if bOK == false then
		return
	end
	local iLen = iEnd - iStart + 1
	local i,bExchange
	for i = iStart, iEnd-1 do
		bExchange = false;
		for j = iEnd, i+1, -1 do
			if PU_Compare(tb[j],tb[j-1],sInfo,order) then
				tb[j], tb[j-1] = tb[j-1], tb[j]
				bExchange = true;
			end
		end
		if bExchange == false then
			return
		end
	end
end

local function PU_GetArea(tb,iStart,iEnd,sInfo)
	iStart,iEnd,bOK = PU_Check(tb,iStart,iEnd)
	if bOK == false then
		return {}
	end
	local area = {}
	local key,oldKey = nil
	local index = 1
	local sPos = iStart,ePos
	for i = iStart, iEnd do
		key = PU_GetItemInfo(tb[i],sInfo).key
		if oldKey == nil then
			oldKey = key
		elseif key ~= oldKey then
			area[index] = {iStart = sPos, iEnd = i - 1}
			sPos = i
			oldKey = key
			index = index + 1
		end
	end
	area[index] = {iStart = sPos, iEnd = iEnd}
	return area
end

local function PU_Sort(tbData,tbArea,sOrderKey,iOrder)
	if table.getn(tbData) < 1 then
		return tbArea
	end
	local tmpArea = {},tmpArea2
	for i = 1, table.getn(tbArea) do
		PU_AreaBubbleSort(tbData,tbArea[i].iStart,tbArea[i].iEnd,sOrderKey,iOrder)
		tmpArea2 = PU_GetArea(tbData,tbArea[i].iStart,tbArea[i].iEnd,sOrderKey)
		for j = 1, table.getn(tmpArea2) do
			tmpArea[table.getn(tmpArea)+1] = tmpArea2[j]
		end
	end
	return tmpArea
end

local function PU_CreateBagList()
	local i,iLen
	PU_BagNormal = {}
	PU_BagAll = {}
	if PU_isIncBank then
		iLen = table.getn(PACKUP_BAGID_BANK)
		for i = 1, iLen do
			PU_DetectBag(PACKUP_BAGID_BANK[i])
		end
	end
	if PU_isIncBody then
		iLen = table.getn(PACKUP_BAGID_BODY)
		for i = 1, iLen do
			PU_DetectBag(PACKUP_BAGID_BODY[i])
		end
	end

	PU_BagAllArea = {
			{iStart = 1, iEnd = table.getn(PU_BagAll)}
		}
	PU_BagAllArea = PU_Sort(PU_BagAll,PU_BagAllArea,PACKUP_ORDER_BAG,PACKUP_ORDER_DESC)

	if PU_isCompress then
		PU_BagAllArea = {
				{iStart = 1, iEnd = table.getn(PU_BagAll)}
			}
	end

	-- UI Code Start
	PU_StepCountAll = table.getn(PU_BagAllArea)
	PackUpBarAllStatusBar:SetMinMaxValues(1,PU_StepCountAll)
	-- UI Code End
end

local function PU_GetBagSlot(tbBag)
	PU_BagSlot = {}
	local itemID
	local index = 1
	local i
	local iStart, iEnd, iStep
	for i = 1,table.getn(tbBag) do
		if tbBag[i].order == PACKUP_ORDER_ASC then
			iStart = 1
			iEnd = GetContainerNumSlots(tbBag[i].bagID)
			iStep = 1
		else
			iStart = GetContainerNumSlots(tbBag[i].bagID)
			iEnd = 1
			iStep = -1
		end
		for slotID = iStart, iEnd, iStep do
			itemID = PU_GetContainerItemID(tbBag[i].bagID,slotID)
			PU_BagSlot[index] = {
					bagID = tbBag[i].bagID,
					slotID = slotID,
					itemID = itemID
				}
			index = index + 1
		end
	end
end

local function PU_DetectItem(sBagType, itemID)
	local item = {itemID = itemID}
	local i, j, dk
	for i = 1, table.getn(PU_BagSpec[sBagType]) do
		dk = PU_DetectKey(item,PU_BagSpec[sBagType][i])
		if dk.result == false then
			return false
		end
	end
	return true
end

local function PU_GetItems(sBagType,tbBag)
	PU_Items = {}
	local itemID,itemQuantity
	local index = 1
	local i
	for i = 1, table.getn(tbBag) do
		for slotID = 1, GetContainerNumSlots(tbBag[i].bagID) do
			itemID = PU_GetContainerItemID(tbBag[i].bagID,slotID)
			if itemID ~= nil and PU_DetectItem(sBagType,itemID) then
				_, itemQuantity, _, _, _ = GetContainerItemInfo(tbBag[i].bagID,slotID)
				PU_Items[index] = {
						bagID = tbBag[i].bagID,
						slotID = slotID,
						itemID = itemID,
						itemQuantity = itemQuantity
					}
				index = index + 1
			end
		end
	end
end

local function PU_PrepareData()
	-- UI Code Start
	local iStepPos = PU_StepCountAll - table.getn(PU_BagAllArea)
	PackUpBarAllStatusBarSpark:SetPoint("CENTER", "PackUpBarAllStatusBar", "LEFT", iStepPos/PU_StepCountAll*PackUpBarAllStatusBar:GetWidth(),0)
	PackUpBarAllStatusBar:SetValue(iStepPos)
	PackUpBarAllText:SetText(string.format(PACKUP_MSG_PACKUP_ALLPERCENT, iStepPos/PU_StepCountAll*100))
	-- UI Code End
	if table.getn(PU_BagAllArea) == 0 then
		return false;
	end
	local sMsg
	PU_StepBagType = PU_BagAll[PU_BagAllArea[1].iStart].type
	if PU_isDisorder then
		sMsg = PACKUP_MSG_BAG_DISORDER
	else
		sMsg = PACKUP_MSG_BAG_PACKUP
	end
	PU_Msg(string.format(sMsg,PU_StepBagType))

	local i
	local j = 1
	local tbBag = {}
	for i = PU_BagAllArea[1].iStart, PU_BagAllArea[1].iEnd do
		tbBag[j] = {bagID = PU_BagAll[i].bagID, order = PU_BagAll[i].order}
		j = j + 1
	end
	table.remove(PU_BagAllArea,1)
	PU_GetBagSlot(tbBag)
	if PU_StepBagType ~= PACKUP_BAG_NORMAL then
		for i = 1, table.getn(PU_BagNormal) do
			tbBag[j] = PU_BagNormal[i]
			j = j + 1
		end
	end
	PU_GetItems(PU_StepBagType,tbBag)
	local udoKey
	if PU_StepBagType == PACKUP_BAG_NORMAL then
		udoKey = PACKUP_BAG_NORMAL
	elseif type(PACKUP_ORDERGROUP[PU_StepBagType]) == "nil" then
		udoKey = PACKUP_BAG_SPECIAL
	else
		udoKey = PU_StepBagType
	end
	local itemArea = {
			{iStart = 1, iEnd = table.getn(PU_Items)}
		}
	for i = 1, table.getn(PACKUP_ORDERGROUP[udoKey]) do
		itemArea = PU_Sort(PU_Items,itemArea,PACKUP_ORDERGROUP[udoKey][i].key,PACKUP_ORDERGROUP[udoKey][i].order)
	end
	if PU_isDisorder then
		local i,index
		for i = 1, table.getn(PU_Items) do
			index = math.random(table.getn(PU_Items))
			PU_Items[i],PU_Items[index] = PU_Items[index],PU_Items[i]
		end
	end
	if table.getn(PU_Items) > table.getn(PU_BagSlot) then
		table.setn(PU_Items,table.getn(PU_BagSlot))
	end
	-- UI Code Start
	PU_StepCountBag = table.getn(PU_Items)
	PackUpBarBagStatusBar:SetMinMaxValues(1,PU_StepCountBag)
	-- UI Code End
	return true;
end

local function PU_UpdateItemPos(bagSrc,slotSrc,bagDest,slotDest)
	local i
	local iLen = table.getn(PU_Items)
	for i = 1, iLen do
		if PU_Items[i].bagID == bagSrc and PU_Items[i].slotID == slotSrc then
			PU_Items[i].bagID = bagDest
			PU_Items[i].slotID = slotDest
			return
		end
	end
end

local function PU_SwapItem()
	if PU_isPackingUp == false or PU_isDataComplete == false then
		return
	end

	if table.getn(PU_Items) <= 0 then
		PU_Items = nil
		return
	end

	if CursorHasItem() then
		ClearCursor()
		return
	end

	local _, _, lockedSrc = GetContainerItemInfo(PU_Items[1].bagID, PU_Items[1].slotID)
	local _, _, lockedDest = GetContainerItemInfo(PU_BagSlot[1].bagID, PU_BagSlot[1].slotID)
	if lockedSrc or lockedDest then
		return
	end

	if PU_Items[1].bagID ~= PU_BagSlot[1].bagID or PU_Items[1].slotID ~= PU_BagSlot[1].slotID then
		PickupContainerItem(PU_Items[1].bagID, PU_Items[1].slotID)
		if CursorHasItem() then
			PickupContainerItem(PU_BagSlot[1].bagID, PU_BagSlot[1].slotID)
		end
		if(CursorHasItem()) then
			PickupContainerItem(PU_Items[1].bagID, PU_Items[1].slotID)
		end

		local bagSrc = PU_Items[1].bagID
		local slotSrc = PU_Items[1].slotID
		local bagDest = PU_BagSlot[1].bagID
		local slotDest = PU_BagSlot[1].slotID

		PU_UpdateItemPos(bagDest,slotDest,bagSrc, slotSrc)
	end

	table.remove(PU_Items,1)
	table.remove(PU_BagSlot,1)
end

local function PU_Zip_PrepareData()
	-- UI Code Start
	local iStepPos = PU_StepCountAll
	PackUpBarAllStatusBarSpark:SetPoint("CENTER", "PackUpBarAllStatusBar", "LEFT", iStepPos/PU_StepCountAll*PackUpBarAllStatusBar:GetWidth(),0)
	PackUpBarAllStatusBar:SetValue(iStepPos)
	PackUpBarAllText:SetText(PACKUP_MSG_PACKUP_ZIPTITLE)
	-- UI Code End

	PU_StepBagType = PACKUP_BAG_NORMAL
	PU_Msg(PACKUP_MSG_BAG_COMPRESS)

	PU_Items = {}
	local itemID,itemQuantity, itemStackCount
	local index = 1
	local i, slotID
	for i = 1, table.getn(PU_BagAll) do
		for slotID = 1, GetContainerNumSlots(PU_BagAll[i].bagID) do
			itemID = PU_GetContainerItemID(PU_BagAll[i].bagID,slotID)
			itemStackCount = PU_GetItemInfo({itemID = itemID},PACKUP_INFO_STACK).key
			if itemID ~= nil and itemStackCount > 1 then
				_, itemQuantity, _, _, _ = GetContainerItemInfo(PU_BagAll[i].bagID,slotID)
				if itemQuantity < itemStackCount then
					PU_Items[index] = {
							bagID = PU_BagAll[i].bagID,
							slotID = slotID,
							itemID = itemID,
							itemStackCount = itemStackCount,
							itemQuantity = itemQuantity
						}
					index = index + 1
				end
			end
		end
	end
	local itemArea = {
			{iStart = 1, iEnd = table.getn(PU_Items)}
		}
	itemArea = PU_Sort(PU_Items,itemArea,PACKUP_INFO_ID,PACKUP_ORDER_ASC)

	PU_BagSlot = {}
	local j, iCount, k
	local iBS = 0
	for i = 1, table.getn(itemArea) do
		if itemArea[i].iStart < itemArea[i].iEnd then
			itemStackCount = PU_Items[itemArea[i].iStart].itemStackCount
			for j = itemArea[i].iStart, itemArea[i].iEnd do
				iCount = PU_Items[j].itemQuantity
				if iCount > 0 then
					for k = j+1, itemArea[i].iEnd do
						iBS = iBS + 1
						if iCount + PU_Items[k].itemQuantity >= itemStackCount then
							PU_BagSlot[iBS] = {
									iCount = itemStackCount - iCount
									,destBagID = PU_Items[j].bagID
									,destSlotID = PU_Items[j].slotID
									,srcBagID = PU_Items[k].bagID
									,srcSlotID = PU_Items[k].slotID
								}
							PU_Items[k].itemQuantity = PU_Items[k].itemQuantity - PU_BagSlot[iBS].iCount;
							break;
						else
							PU_BagSlot[iBS] = {
									iCount = PU_Items[k].itemQuantity
									,destBagID = PU_Items[j].bagID
									,destSlotID = PU_Items[j].slotID
									,srcBagID = PU_Items[k].bagID
									,srcSlotID = PU_Items[k].slotID
								}
							iCount = iCount + PU_Items[k].itemQuantity
							PU_Items[k].itemQuantity = 0;
						end
					end
				end
			end
		end
	end

	PU_Items = nil
	-- UI Code Start
	PU_StepCountBag = table.getn(PU_BagSlot)
	PackUpBarBagStatusBar:SetMinMaxValues(1,PU_StepCountBag)
	-- UI Code End
end

local function PU_Zip_Compress()
	if PU_isPackingUp == false or PU_isDataComplete == false then
		return
	end

	if table.getn(PU_BagSlot) <= 0 then
		PU_BagSlot = nil
		return
	end

	if CursorHasItem() then
		ClearCursor()
		return
	end

	local _, _, lockedSrc = GetContainerItemInfo(PU_BagSlot[1].srcBagID, PU_BagSlot[1].srcSlotID)
	local _, _, lockedDest = GetContainerItemInfo(PU_BagSlot[1].destBagID, PU_BagSlot[1].destSlotID)
	if lockedSrc or lockedDest then
		return
	end

	PickupContainerItem(PU_BagSlot[1].srcBagID, PU_BagSlot[1].srcSlotID)
	if CursorHasItem() then
		PickupContainerItem(PU_BagSlot[1].destBagID, PU_BagSlot[1].destSlotID)
	end
	if(CursorHasItem()) then
		PickupContainerItem(PU_Items[1].srcBagID, PU_BagSlot[1].srcSlotID)
	end

	table.remove(PU_BagSlot,1)
end

function PU_GetItemInfo(item,sInfo)
	if item == nil or item.itemID == nil then
		return {key = 0, suborder = 1}
	end
	local itemName, itemLink, itemRarity, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture = GetItemInfo(item.itemID)
	if sInfo == PACKUP_INFO_ID then
		return {key = item.itemID, suborder = 1}
	elseif sInfo == PACKUP_INFO_NAME then
		return {key = itemName, suborder = 1}
	elseif sInfo == PACKUP_INFO_LINK then
		return {key = itemLink, suborder = 1}
	elseif sInfo == PACKUP_INFO_RARITY then
		return {key = itemRarity, suborder = 1}
	elseif sInfo == PACKUP_INFO_TYPE then
		return {key = itemType, suborder = 1}
	elseif sInfo == PACKUP_INFO_SUBTYPE then
		return {key = itemSubType, suborder = 1}
	elseif sInfo == PACKUP_INFO_MINILEVEL then
		return {key = itemMinLevel, suborder = 1}
	elseif sInfo == PACKUP_INFO_STACK then
		return {key = itemStackCount, suborder = 1}
	elseif sInfo == PACKUP_INFO_EQUIPLOC then
		return {key = itemEquipLoc, suborder = 1}
	elseif sInfo == PACKUP_INFO_TEXTURE then
		return {key = itemTexture, suborder = 1}
	elseif sInfo == PACKUP_INFO_QUANTITY then
		if item.itemQuantity == nil then
			return {key = 0, suborder = 1}
		else
			return {key = item.itemQuantity, suborder = 1}
		end
	elseif PACKUP_UDO[sInfo] ~= nil then
		local i, dk
		for i = 1, table.getn(PACKUP_UDO[sInfo]) do
			dk = PU_DetectKey(item, PACKUP_UDO[sInfo][i])
			if dk.result == true then
				return {key = PACKUP_UDO[sInfo][i].order, suborder = dk.index}
			end
		end
		return {key = 0, suborder = 1}
	else
		return {key = PACKUP_INFO_UNKONW, suborder = 1}
	end
end

function PU_OnLoad()

	this:RegisterEvent("BANKFRAME_CLOSED");
	this:RegisterEvent("BANKFRAME_OPENED");
	this:RegisterEvent("VARIABLES_LOADED");

	SlashCmdList["PackUpCommand"] = PU_Command
	SLASH_PackUpCommand1 = "/packup"

	PU_Msg(PACKUP_MSG_ONLOAD)
end

function PU_OnEvent(event)
	if event == "VARIABLES_LOADED" then
		PU_Msg(PACKUP_MSG_NOTSUPPORT_LOADVAR)
	elseif event == "BANKFRAME_OPENED" then
		PU_isBankOpened = true
	elseif event == "BANKFRAME_CLOSED" then
		PU_isBankOpened = false
	end
end

function PU_OnUpdate()
	if PU_isPackingUp then
		if PU_isDataComplete then
			if PU_isCompress then
				if PU_BagSlot == nil then
					PU_isPackingUp = false
					PU_isDataComplete = false
					PU_Msg(PACKUP_MSG_COMPLETE)
					if PackUpBar:IsVisible() then
						PackUpBar:Hide();
					end
				else
					-- UI Code Start
					local iStepPos = PU_StepCountBag - table.getn(PU_BagSlot)
					PackUpBarBagStatusBarSpark:SetPoint("CENTER", "PackUpBarBagStatusBar", "LEFT", iStepPos/PU_StepCountBag*PackUpBarBagStatusBar:GetWidth(),0)
					PackUpBarBagStatusBar:SetValue(iStepPos)
					PackUpBarBagText:SetText(string.format(PACKUP_MSG_PACKUP_BAGPERCENT, PU_StepBagType, iStepPos, PU_StepCountBag))
					-- UI Code End
					PU_Zip_Compress()
				end
			else
				if PU_Items == nil then
					if PU_PrepareData() == false then
						PU_isPackingUp = false
						PU_isDataComplete = false
						PU_Msg(PACKUP_MSG_COMPLETE)
						if PackUpBar:IsVisible() then
							PackUpBar:Hide();
						end
					end
				else
					-- UI Code Start
					local iStepPos = PU_StepCountBag - table.getn(PU_Items)
					PackUpBarBagStatusBarSpark:SetPoint("CENTER", "PackUpBarBagStatusBar", "LEFT", iStepPos/PU_StepCountBag*PackUpBarBagStatusBar:GetWidth(),0)
					PackUpBarBagStatusBar:SetValue(iStepPos)
					PackUpBarBagText:SetText(string.format(PACKUP_MSG_PACKUP_BAGPERCENT, PU_StepBagType, iStepPos, PU_StepCountBag))
					-- UI Code End
					PU_SwapItem()
				end
			end
		end
	end
end

function PU_Command(msg)
	if PU_isPackingUp == true or PU_ParseLine(msg) == false then
		return
	end
	-- UI Code Start
	PackUpBarAllStatusBar:SetMinMaxValues(1,10)
	PackUpBarAllStatusBar:SetValue(1)
	PackUpBarBagStatusBarSpark:SetPoint("CENTER", "PackUpBarAllStatusBar", "LEFT", 0,0)
	PackUpBarBagStatusBar:SetMinMaxValues(1,10)
	PackUpBarBagStatusBar:SetValue(1)
	PackUpBarBagStatusBarSpark:SetPoint("CENTER", "PackUpBarBagStatusBar", "LEFT", 0,0)

	if not PackUpBar:IsVisible() then
		PackUpBar:Show();
	end
	-- UI Code End
	PU_isPackingUp = true
	PU_isDataComplete = false
	PU_CreateBagList()
	if PU_isCompress then
		PU_Zip_PrepareData()
	end
	PU_isDataComplete = true
end
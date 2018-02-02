function Debug(text) --debug用函数	
	if(ChatFrame1) then ChatFrame1:AddMessage(text,0,0.8,1.0); end
end
--全局
MassMail_ItemList={}; --邮件物品列表
function MailEnhance_OnEvent()
	if(event=="MAIL_SEND_SUCCESS") then
		MM_CanSendNext = 1;
	end
end

function MassMail_RadioButton_OnClick(index)
	if ( index == 1 ) then
		MassMail_SendMoneyButton:SetChecked(1);
		MassMail_CODButton:SetChecked(nil);
		MassMail_MoneyText:SetText(ME_AMOUNT_TO_SEND);
	else
		MassMail_SendMoneyButton:SetChecked(nil);
		MassMail_CODButton:SetChecked(1);
		MassMail_MoneyText:SetText(ME_COD_AMOUNT);
	end
	PlaySound("igMainMenuOptionCheckBoxOn");
end

function MassMail_MoneyItem_OnClick(index)
	if ( index == 1) then
		MassMail_Send();
	elseif ( index == 2) then
		ME_MassMailFrameMoneyFrame:Show();
		ME_MassMailFrameItemAddFrame:Hide();
		ME_MassMailFrameMoneyMailButton:Hide();
		ME_MassMailFrameItemMailButton:Show();
	elseif ( index == 3) then
		ME_MassMailFrameMoneyFrame:Hide();
		ME_MassMailFrameItemAddFrame:Show();
		ME_MassMailFrameMoneyMailButton:Show();
		ME_MassMailFrameItemMailButton:Hide();
	else
		ME_MassMailFrameSendButton:Disable();
		MassItemList_Clear();
	end
end

local MassMail_OldCFIB_OC = ContainerFrameItemButton_OnClick;

function MassMail_ContainerFrameItemButton_OnClick(btn, ignore)
	if(IsAltKeyDown() and ME_MassMailFrame:IsVisible()) then
			MassMail_OldCFIB_OC(btn, ignore);
	end		
	if ( ItemList_Update(this:GetParent():GetID(), this:GetID()) ) then
		return;
	end
	MassMail_OldCFIB_OC(btn, ignore);
end

ContainerFrameItemButton_OnClick = MassMail_ContainerFrameItemButton_OnClick;

function ItemList_Update(bag,item)
	local num=getn(MassMail_ItemList);
	for i=1,num,1 do
		if(MassMail_ItemList[i]["bag"]==bag and MassMail_ItemList[i]["slot"]==item) then
			return i;
		end
	end
	return nil;
end

--重载PickupContainerItem函数
local ME_Old_PickupContainerItem=PickupContainerItem;

function ME_PickupContainerItem(bag, item)
	if(ItemList_Update(bag,item) and (not IsAltKeyDown() or not ME_MassMailFrameItemAddFrame:IsVisible()))then
		return;
	end
	if ( not CursorHasItem() ) then
		ME_MassMailFrame.bag = bag;
		ME_MassMailFrame.item = item;
	end
	if( IsAltKeyDown() and ME_MassMailFrameItemAddFrame:IsVisible() and not CursorHasItem()) then
	--ALT+左键在列表中添加删除物品
		if(GetSendMailItem()) then 
			ClickSendMailItemButton()
			PutItemInBackpack()			
		end 
		ME_Old_PickupContainerItem(bag, item)
		local texture, count = GetContainerItemInfo(bag, item);
		local canMail = ME_Mail_ItemIsMailable(bag, item);
		if ( canMail ) then
			DEFAULT_CHAT_FRAME:AddMessage(ME_MAIL_CAI .. canMail, 1, 0.5, 0);
			ME_Old_PickupContainerItem(bag, item);
			return;
		end
		local mailtoName=SendMailNameEditBox:GetText();
		local LAD,list_count=MassItemList_Add(bag,item,mailtoName,texture,count,nil,nil);
		if(LAD) then
			ME_Old_PickupContainerItem(bag, item);
		else
			MassItemList_Del(list_count);
			PutItemInBackpack()
			--ME_Old_PickupContainerItem(bag, item);
		end
		return;
	elseif ( IsAltKeyDown() and ME_MassMailFrameMoneyFrame:IsVisible() and not CursorHasItem())	then
	--ALT+左键在钱币邮件框体内添加付费取信物品
		if(GetSendMailItem()) then 
			ClickSendMailItemButton()
			PutItemInBackpack()			
		end 
		ME_Old_PickupContainerItem(bag, item)
		local texture, count = GetContainerItemInfo(bag, item);
		local canMail = ME_Mail_ItemIsMailable(bag, item);
		if ( canMail ) then
			DEFAULT_CHAT_FRAME:AddMessage(ME_MAIL_CAI .. canMail, 1, 0.5, 0);
			ME_Old_PickupContainerItem(bag, item);
			return;
		end
	elseif ( IsAltKeyDown() and (not ME_MassMailFrame:IsVisible()) and SendMailFrame:IsVisible() and not CursorHasItem() ) then
		ME_Old_PickupContainerItem(bag, item);
		ClickSendMailItemButton();
		return;
	elseif ( IsAltKeyDown() and TradeFrame:IsVisible() and not CursorHasItem() ) then
		for i = 1, 6, 1 do
			if ( not GetTradePlayerItemLink(i) ) then
				ME_Old_PickupContainerItem(bag, item);
				ClickTradeButton(i);
				return;
			end
		end
	elseif ( IsAltKeyDown() and not CursorHasItem() and ( not TradeFrame or not TradeFrame:IsVisible() ) and ( not AuctionFrame or not AuctionFrame:IsVisible() ) and UnitExists("target") and CheckInteractDistance("target", 2) and UnitIsFriend("player", "target") and UnitIsPlayer("target") ) then
		InitiateTrade("target");
		ME_MassMail_AddItem = { bag, item, UnitName("target"), 2 };
		for i = 1, NUM_CONTAINER_FRAMES, 1 do
			if ( getglobal("ContainerFrame" .. i):IsVisible() ) then
				ContainerFrame_Update(getglobal("ContainerFrame" .. i));
			end
		end
		return;
	end
	ME_Old_PickupContainerItem(bag, item);
end
PickupContainerItem=ME_PickupContainerItem;

--重载ContainerFrame_Update函数

local ME_Old_ContainerFrame_Update = ContainerFrame_Update;

function ME_Mail_ContainerFrame_Update(frame)
	ME_Old_ContainerFrame_Update(frame);
	local id = frame:GetID();
	if ( ME_MassMailFrame:IsVisible() ) then
		local i;
		local num=getn(MassMail_ItemList);
		for i=1,num,1 do
			if ( MassMail_ItemList[i]["ItemLink"]) then
				if ( MassMail_ItemList[i]["bag"] == frame:GetID() ) then
					SetItemButtonDesaturated(getglobal(frame:GetName() .. "Item" .. (frame.size-MassMail_ItemList[i]["slot"])+1), 1, 0.5, 0.5, 0.5);
				end
			end
		end
	end	
end

ContainerFrame_Update = ME_Mail_ContainerFrame_Update;

function MassMail_ItemAddFrame_OnClick(frame)
	if ( not frame ) then frame = this; end
	if ( CursorHasItem() ) then
		local bag = ME_MassMailFrame.bag;
		local item = ME_MassMailFrame.item;
		if ( not bag or not item ) then return; end
		local canMail = ME_Mail_ItemIsMailable(bag, item);
		if ( canMail ) then
			DEFAULT_CHAT_FRAME:AddMessage(ME_MAIL_CAI .. canMail, 1, 0.5, 0);
			ME_Old_PickupContainerItem(bag, item);
			return;
		end
		local texture, count = GetContainerItemInfo(bag, item);
		ME_Old_PickupContainerItem(bag, item);
		Debug(bag);
		local mailtoName=SendMailNameEditBox:GetText();
		MassItemList_Add(bag,item,mailtoName,texture,count,nil,nil);		
	end
	if(GetSendMailItem()) then 
		ClickSendMailItemButton()
		PutItemInBackpack()			
	end
	for i = 1, NUM_CONTAINER_FRAMES, 1 do
		if ( getglobal("ContainerFrame" .. i):IsVisible() ) then
			ContainerFrame_Update(getglobal("ContainerFrame" .. i));
		end
	end	
end

function ME_Mail_MoneyFrame_OnClick(frame)
	if( not frame) then frame = this; end
	if( CursorHasItem() ) then 
		local bag = ME_MassMailFrame.bag;
		local item = ME_MassMailFrame.item;
		if ( not bag or not item ) then return; end
		if ( canMail ) then
			DEFAULT_CHAT_FRAME:AddMessage(ME_MAIL_CAI.. canMail, 1, 0.5, 0);
			ME_Old_PickupContainerItem(bag, item);
			return;
		end
	end	
end

function ME_Mail_ItemIsMailable(bag, item)
	-- Make sure tooltip is cleared
	for i = 1, 29, 1 do
		getglobal("MailEnhance_TooltipTextLeft" .. i):SetText("");
	end
	MailEnhance_Tooltip:SetBagItem(bag, item);
	for i = 1, MailEnhance_Tooltip:NumLines(), 1 do
		local text = getglobal("MailEnhance_TooltipTextLeft" .. i):GetText();
		if ( text == ITEM_SOULBOUND ) then
			return ME_MAIL_Soulbound;
		elseif ( text == ITEM_BIND_QUEST ) then
			return ME_MAIL_Quest;
		elseif ( text == ITEM_CONJURED ) then
			return ME_MAIL_Conjured;
		end
	end
	return nil;
end

function MassItemList_Add(bag,item,mailtoName,texture,count,money,cod) --添加物品到发送列表
	local itemLink=GetContainerItemLink(bag,item);	
	local ItemNode={["ItemLink"]=itemLink,["name"]=mailtoName,["bag"]=bag,["slot"]=item,["texture"]=texture,["count"]=count,["money"]=money,["cod"]=cod};
	local num=getn(MassMail_ItemList);
	if	(num==0) then
		tinsert(MassMail_ItemList,ItemNode);
		ItemList_Panel_Update();
		return true,1;
	end
	local i=0;
	for i,num in ipairs(MassMail_ItemList) do
		if( MassMail_ItemList[i]["ItemLink"]==itemLink and MassMail_ItemList[i]["bag"]==bag and MassMail_ItemList[i]["slot"]==item and MassMail_ItemList[i]["texture"]==texture and MassMail_ItemList[i]["count"]==count and MassMail_ItemList[i]["money"]==money and MassMail_ItemList[i]["cod"]==cod) then
			return false,i;		
		end
	end
	tinsert(MassMail_ItemList,ItemNode);
	num=getn(MassMail_ItemList);
	MoneyFrame_Update("SendMailCostMoneyFrame", GetSendMailPrice()*num);
	ItemList_Panel_Update();
	return true,num;		
end

function MassItemList_Del(ListID)--删除列表中的物品
	local num;
	if(ListID) then
		tremove (MassMail_ItemList,ListID);
	else	
		tremove (MassMail_ItemList);
	end	
	num=getn(MassMail_ItemList);
	if(num>0) then
		MoneyFrame_Update("SendMailCostMoneyFrame", GetSendMailPrice()*num);
	else
		MoneyFrame_Update("SendMailCostMoneyFrame", GetSendMailPrice());
	end
	for i = 1, NUM_CONTAINER_FRAMES, 1 do
		if ( getglobal("ContainerFrame" .. i):IsVisible() ) then
			ContainerFrame_Update(getglobal("ContainerFrame" .. i));
		end
	end
	ItemList_Panel_Update();
	return true;
end

function MassItemList_Clear()--清除邮件列表
	local num=getn(MassMail_ItemList);
	local i;
	for i=1,num,1 do
		tremove (MassMail_ItemList);			
	end
	for i=1,12,1 do
		getglobal("ItemList_PanleNode"..i):Hide();
	end
	num=getn(MassMail_ItemList);
	MoneyFrame_Update("SendMailCostMoneyFrame", GetSendMailPrice()*(num+1));
	num=getn(MassMail_ItemList);
	for i = 1, NUM_CONTAINER_FRAMES, 1 do
		if ( getglobal("ContainerFrame" .. i):IsVisible() ) then
			ContainerFrame_Update(getglobal("ContainerFrame" .. i));
		end
	end
	MassMail_RadioButton_OnClick(1);
	MassMail_CODButton:Disable();
	MassMail_CODButtonText:SetTextColor(GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b);
	--SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
end

function MassMail_SendPrepare()--发送前预处理
	local num=getn(MassMail_ItemList);
	for i=1,num,1 do
		if(i==1 and (not MassMail_ItemList[i]["name"] or MassMail_ItemList[i]["name"]=="") ) then
			MassMail_ItemList[i]["name"]=SendMailNameEditBox:GetText();
		elseif(not MassMail_ItemList[i]["name"] or MassMail_ItemList[i]["name"]=="" ) then
			MassMail_ItemList[i]["name"]=MassMail_ItemList[i-1]["name"];
		end				
	end
	ItemList_Panel_Update();
end

function MassMail_Send() --发送邮件
	for key,val in MassMail_ItemList do
		if(val.bag and val.slot and not val.cod and not val.money) then
			MassMail_SendItem(val.name,val.bag,val.slot,val.count,key,MailEnhanceFrame.total);
			return;
		elseif(val.bag and val.slot and val.cod and val.money) then
		elseif(not val.bag and not val.slot and not val.cod and val.money) then
		end	
	end
	MailEnhanceFrame:Hide();
	MailEnhanceFrame.total=0;
end

function MassMail_SendProcessQueue(elapsed)
	if ( not MM_CanSendNext ) then
		return;
	end
	this.sendmail = this.sendmail + elapsed;
	if ( this.sendmail > 0.5 ) then
		this.sendmail = 0;
		if ( this.total > 0 ) then
			MassMail_Send();
			MM_CanSendNext = nil;
		end
	end
end

function MassMail_SendItem(name,bag,slot,count,key,num) --物品发送
	ME_Old_PickupContainerItem(bag,slot);
	ClickSendMailItemButton();
	local itemLink = GetSendMailItem();
	if( not name) then
		DEFAULT_CHAT_FRAME:AddMessage("<MailEnhance>" .. MAIL_ERROR, 1, 0, 0);
	else
		local subjectstr = SendMailSubjectEditBox:GetText();
		SendMail(name, subjectstr, nil);		
	end	
	MassItemList_Del(key);
end

function MassMail_SendCOD() --收费邮件发送
end

function MassMail_SendMoney() --发送金钱
end

function MassMail_CanSend(elapsed)
	this.timer=this.timer+elapsed;
	if(this.timer>0.5) then
		this.timer=0;
		if(strlen(SendMailNameEditBox:GetText()) > 0 and getn(MassMail_ItemList)>0) then
			ME_MassMailFrameSendButton:Enable();
		else
			ME_MassMailFrameSendButton:Disable();
		end
	end	
end



function ItemList_Panel_Update() --邮件列表控制滑块 操作函数
	local item_num = getn(MassMail_ItemList);
	--锁定最后一项
	local scroll_value = getglobal("ItemList_PanleScrollFrame"):GetValue();	
	if ( (not scroll_value) or scroll_value < 1 ) then scroll_value = 1; end
	if ( item_num > 12 ) then
		if (scroll_value>=item_num-11) then getglobal("ItemList_PanleScrollFrame"):SetValue(item_num - 11); end
		getglobal("ItemList_PanleScrollFrame"):SetMinMaxValues(1, item_num - 11);
	else
		if (not (scroll_value==1)) then getglobal("ItemList_PanleScrollFrame"):SetValue(1); end
		getglobal("ItemList_PanleScrollFrame"):SetMinMaxValues(1, 1);
	end
	
	local scroll_i;
	if ( item_num > 0 ) then
		for i=1, 12 do
			if (ItemList_PanleScrollFrame.isscroll) then
				scroll_i = scroll_value + i - 1;			
			else
				if ( item_num > 12 ) then
				scroll_i = item_num + i - 12;
				getglobal("ItemList_PanleScrollFrame"):SetValue(item_num - 11);
				else
				scroll_i = i;
				getglobal("ItemList_PanleScrollFrame"):SetValue(1);
				end
			end
			
			if ( scroll_i <= item_num ) then
				local ItemLink=MassMail_ItemList[scroll_i]["ItemLink"];
				local MailToName=MassMail_ItemList[scroll_i]["name"];
				local Texture=MassMail_ItemList[scroll_i]["texture"];
				local Count=MassMail_ItemList[scroll_i]["count"];
				local Money=MassMail_ItemList[scroll_i]["money"];
				local COD=MassMail_ItemList[scroll_i]["cod"];
				if(ItemLink and Count and Money and COD) then
					getglobal("ItemList_PanleNode"..i).logid = scroll_i;
					getglobal("ItemList_PanleNode"..i.."Name"):SetText(ItemLink.."x".."|c00ffffff"..Count.."|r"..MailToName..PAYFOR..Money);
					--getglobal("ItemList_PanleNode"..i.."Name"):SetText(ItemLink.."x"..Count..MailToName..PAYFOR..Money);
					getglobal("ItemList_PanleNode"..i.."IconTexture"):SetTexture(Texture);
					getglobal("ItemList_PanleNode"..i):Show();
				elseif(ItemLink and Count and  not Money and not COD) then
					getglobal("ItemList_PanleNode"..i).logid = scroll_i;
					getglobal("ItemList_PanleNode"..i.."Name"):SetText(ItemLink.."x".."|c00ffffff"..Count.."|r"..ADDRESSEE.."|c00ffffff"..MailToName.."|r");
					--getglobal("ItemList_PanleNode"..i.."Name"):SetText(ItemLink.."x"..Count..ADDRESSEE..MailToName);
					getglobal("ItemList_PanleNode"..i.."IconTexture"):SetTexture(Texture);
					getglobal("ItemList_PanleNode"..i):Show();
				elseif(not ItemLink and not Count and Money and not COD) then
					getglobal("ItemList_PanleNode"..i).logid = scroll_i;
					getglobal("ItemList_PanleNode"..i.."Name"):SetText(Money..ADDRESSEE..MailToName);
					getglobal("ItemList_PanleNode"..i):Show();
				else
					getglobal("ItemList_PanleNode"..i):Hide();
					getglobal("ItemList_PanleNode"..i).logid = nil;
				end
			else
				getglobal("ItemList_PanleNode"..i):Hide();
				getglobal("ItemList_PanleNode"..i).logid = nil;
			end
		end
	else
		for i =1, 12 do
			getglobal("ItemList_PanleNode"..i):Hide();
		end
	end	
end

function ItemNodeButton_Onclick(NodeID) --邮件列表清除按钮操作函数
	MassItemList_Del(getglobal("ItemList_PanleNode"..NodeID).logid)
end

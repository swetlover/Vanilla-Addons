local function ME_LootMSG(msg)
    SELECTED_CHAT_FRAME:AddMessage("ME_MailLoot: "..msg, 0.3, 0.9, 0.85);
end
local LootOn=0;
local LootPrepare={};
local ME_LootREC = {};
local ProcessTime=0;
local HasToken=0;
local TotalWillLoot=0;
local LootCanNext=nil;
local FilterChosenNow=1;
ME_MAILLOOT_DEFAULT_SETTING={
	['CurrentFilter'] = 1,
};

ME_LOOT_DEFAULT_RULES={
	[1]={
		['name'] = ME_LOOT_DEFAULT_RULE_TITLE;
		['from'] = nil,
		['subject'] = nil,
		['takeitem'] = 1,
		['takemoney'] = 1,
		['takecod'] = nil,
		['taketextitem'] = nil,
		['deletempty'] = nil,
		['deletext'] = nil,
		['delread'] = nil,
	},
	[2]={
		['name'] = ME_LOOT_AHITME_RULE_TITLE,
		['from'] = ME_LOOT_KEYWORD_AH,
		['takeitem'] = 1,
	},
	[3]={
		['name'] = ME_LOOT_AHMONEY_RULE_TITLE,
		['from'] = ME_LOOT_KEYWORD_AH,
		['takemoney'] = 1,
	},
	[4]={
		['name'] = ME_LOOT_DELETREAD_RULE_TITLE,
		['deletempty'] = 1,
		['delread'] = 1,
	},
	[5]={
		['name'] = ME_LOOT_DELETTEXT_RULE_TITLE,
		['deletext'] = 1,
		['delread'] = 1,
	},
	[6]={
		['name'] = ME_LOOT_ITEMCOD_RULE_TITLE,
		['from'] = ME_SECURITY_CODFROM;
		['takecod'] = 1,
	},
};
 
function ME_MailLoot_Onload()
	this:RegisterEvent("MAIL_INBOX_UPDATE");
	this:RegisterEvent("MAIL_CLOSED"); 
	this:RegisterEvent("VARIABLES_LOADED"); 
	this:RegisterEvent("UI_ERROR_MESSAGE");
	ME_MailLoot_ResetDefault()	
end

function ME_MailLoot_OnEvent()
	if( event == "MAIL_INBOX_UPDATE" and LootOn==1 ) then
		if(HasToken==TotalWillLoot) then 
            LootOn=0;
        else
            LootCanNext=1;
        end
	elseif	( event == "MAIL_CLOSED" ) then
		LootOn = 0;
        LootCanNext=nil
        LootPrepare={};
		MailEnhance_LootFrame:Hide();
    elseif(event=="UI_ERROR_MESSAGE")  then
        LootOn = 0;
        LootCanNext=nil;
        LootPrepare={};
		MailEnhance_LootFrame:Hide();
	end
end

function ME_MailLoot_ResetDefault()
    local key;
	if (ME_Loot_Filters == nil or getn(ME_Loot_Filters) ==0 or ME_MailLootSetting == nil  ) then
        ME_Loot_Filters={};
        for key=1,getn(ME_LOOT_DEFAULT_RULES),1 do
            tinsert(ME_Loot_Filters,ME_LOOT_DEFAULT_RULES[key]);
        end 
		ME_MailLootSetting = ME_MAILLOOT_DEFAULT_SETTING;
	end
end

function ME_FiltersDropDown()
	UIDropDownMenu_Initialize(this, ME_FiltersDropDown_Initialize, 'MENU');
end


function ME_MailLootDropDown_PushFilter(tkey,tval)
	info = {};
	info.text = tval.name;
	--info.tooltipTitle = tval.name;
	--info.tooltipText = GetFilterTips(tkey);
	info.value = tkey;
	info.func = ME_FiltersDropDown_OnClick;
	UIDropDownMenu_AddButton(info);
end

function ME_FiltersDropDown_OnClick()
	local select_idx = this.value;
	
	if (select_idx == -1) then
		--ShowUIPanel(ME_FiltersConfigFrame);
	else
		ME_MailLootSetting.CurrentFilter = select_idx;
		ME_MailLootSetFiltersText();
	end
end

function ME_MailLootSetFiltersText()
	ME_MailLoot_ResetDefault()	
	if( not ME_Loot_Filters[ME_MailLootSetting.CurrentFilter]) then
		ME_MailLootSetting.CurrentFilter=1;
	end	
	local filterName=ME_Loot_Filters[ME_MailLootSetting.CurrentFilter].name;
	ME_MailLootFiltersText:SetText(format(ME_LOOTFILTERS_TITLES, filterName));
end

function ME_MailLoot_GameTooltip(normalText, r, g, b, newbieText)
	GameTooltip_SetDefaultAnchor(GameTooltip, this);
	if ( normalText ) then
		GameTooltip:SetText(normalText, r, g, b);
		GameTooltip:AddLine(newbieText, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 1);
	else
		GameTooltip:SetText(newbieText, r, g, b, 1, 1);
	end
	GameTooltip:Show();
end

function ME_FiltersDropDown_Initialize()
	info = {};
	info.isTitle = 1;
	info.text = ME_LOOTFILTERS_NAMES;
	info.value = 1;
	info.func = ME_FiltersDropDown_OnClick;
	UIDropDownMenu_AddButton(info);
	
	table.foreachi(ME_Loot_Filters, ME_MailLootDropDown_PushFilter);
end

function ME_MailLootButton_OnMouseDown(button)
	if ( IsAltKeyDown()  and button == "LeftButton" ) then
		ME_MailLootPanleShow()
	elseif( button == "LeftButton" )then
		ME_MailLootStart()
	elseif ( button == "RightButton" ) then
		ToggleDropDownMenu(1, nil, ME_MailLootDropDown, "ME_MailLootFilters", 0, 0);
	end
end

function ME_MailLootPanleShow()
	ME_MailLootFrame:Show();
    ME_FilterButtonSet();
end

function ME_FilterButtonSet()
    local i;
    for i=1,8,1 do
        if(ME_Loot_Filters[i]~=nil) then
            if(ME_Loot_Filters[i].name~=nil) then
                getglobal("NewFilterButton"..i.."Text"):SetText(ME_Loot_Filters[i].name)
            end
            getglobal("NewFilterButton"..i):Show();
        else
            getglobal("NewFilterButton"..i):Hide();
        end        
    end
    ME_FilterButton_Update(FilterChosenNow)
end

function ME_Apply_Setting(Id)
    local name=FilterNameEditBox:GetText();
    local from=FilterFromEditBox:GetText();
    local subject=FilterSubjectEditBox:GetText();
    local takeitem=CheckButtonTakeItemText:GetChecked();
    local takemoney=CheckButtonTakeMoneyText:GetChecked();
    local takecod=CheckButtonTakeCODItemText:GetChecked();
    local taketextitem=CheckButtonTakeTextItemText:GetChecked();
    local deletempty=CheckButtonDeletemptyText:GetChecked();
    local deletext=CheckButtonDelteTextOnlyText:GetChecked();
    local delread=CheckButtonIgnoreUnreadText:GetChecked();
    local Nfilter={};
    if (name~="") then Nfilter.name=name; end
    if (from~="") then Nfilter.from=from; end
    if (subject~="") then Nfilter.subject=subject; end
    if (takeitem) then Nfilter.takeitem=takeitem; end
    if (takemoney) then Nfilter.takemoney=takemoney; end
    if (takecod) then Nfilter.takecod=takecod; end
    if (taketextitem) then Nfilter.taketextitem=taketextitem; end
    if (deletempty) then Nfilter.deletempty=deletempty; end
    if (deletext) then Nfilter.deletext=deletext; end
    if (delread) then Nfilter.delread=delread; end
    tremove(ME_Loot_Filters,Id);
    tinsert(ME_Loot_Filters,Id,Nfilter);
end

function ME_ApplyAll_OnClick()
    ME_Apply_Setting(FilterChosenNow)
    ME_MailLootFrame:Hide();
end

function ME_ResetToDefault_OnClick()
    local key;
    ME_Loot_Filters={};
    for key=1,getn(ME_LOOT_DEFAULT_RULES),1 do
        tinsert(ME_Loot_Filters,ME_LOOT_DEFAULT_RULES[key]);
    end
    FilterChosenNow=1;
    ME_MailLootPanleShow();
end

function ME_CreatNewFilter_OnClick()
    local Nfilter={['name']=ME_LOOT_NEWCUSTOM_TITLE};
    if(getn(ME_Loot_Filters)==8) then
        ME_LootMSG(ME_LOOT_ERROR_CREATNEWFILTER);
        return;
    else    
        tinsert(ME_Loot_Filters,Nfilter);
    end
    FilterChosenNow=getn(ME_Loot_Filters);
    getglobal("NewFilterButton"..getn(ME_Loot_Filters)):Show()
    ME_FilterButton_Update(FilterChosenNow)
end

function ME_ME_DeletFliter_OnClick()
    local num=getn(ME_Loot_Filters)
    if(num>1) then
        getglobal("NewFilterButton"..FilterChosenNow):Hide();
        tremove(ME_Loot_Filters, FilterChosenNow);
        FilterChosenNow=num-1;
        ME_FilterButtonSet();
    else
        ME_LootMSG(ME_LOOT_ERROR_DELETFILTER);
    end
end

function ME_FilterButton_OnClick()
    local Id=this:GetID();
    FilterChosenNow=Id;
    ME_FilterButton_Update(Id)
end

function ME_FilterButton_Update(Id)
    local i;
    for i=1,8,1 do
        if (i==Id) then
            getglobal("NewFilterButton"..i):LockHighlight() 
        else
            getglobal("NewFilterButton"..i):UnlockHighlight()
        end    
    end
    FilterNameEditBox:SetText(ME_Loot_Filters[Id].name)
    if(ME_Loot_Filters[Id].from~=nil) then
        FilterFromEditBox:SetText(ME_Loot_Filters[Id].from);
    else
        FilterFromEditBox:SetText("");
    end
    if(ME_Loot_Filters[Id].subject~=nil) then
        FilterSubjectEditBox:SetText(ME_Loot_Filters[Id].subject);
    else
        FilterSubjectEditBox:SetText("");
    end
    if(ME_Loot_Filters[Id].takeitem~=nil) then
        CheckButtonTakeItemText:SetChecked(1)
    else
        CheckButtonTakeItemText:SetChecked(0)
    end
    if(ME_Loot_Filters[Id].takemoney~=nil) then
        CheckButtonTakeMoneyText:SetChecked(1)
    else
        CheckButtonTakeMoneyText:SetChecked(0)
    end
    if(ME_Loot_Filters[Id].takecod~=nil) then
        CheckButtonTakeCODItemText:SetChecked(1)
    else
        CheckButtonTakeCODItemText:SetChecked(0)
    end
    if(ME_Loot_Filters[Id].taketextitem~=nil) then
        CheckButtonTakeTextItemText:SetChecked(1)
    else
        CheckButtonTakeTextItemText:SetChecked(0)
    end
    if(ME_Loot_Filters[Id].deletempty~=nil) then
        CheckButtonDeletemptyText:SetChecked(1)
    else
        CheckButtonDeletemptyText:SetChecked(0)
    end
    if(ME_Loot_Filters[Id].deletext~=nil) then
        CheckButtonDelteTextOnlyText:SetChecked(1)
    else
        CheckButtonDelteTextOnlyText:SetChecked(0)
    end
    if(ME_Loot_Filters[Id].delread~=nil) then
        CheckButtonIgnoreUnreadText:SetChecked(1)
    else
        CheckButtonIgnoreUnreadText:SetChecked(0)
    end
end

function ME_MailLootStart()
	local totalMailNumber = GetInboxNumItems();
	MailEnhance_LootFrame:Show();
	if (totalMailNumber > 0) then
		LootOn = 1;
        LootCanNext=1;
		ME_LootREC = {};
		ME_Loot_Filter();
        MailEnhance_LootFrame.total=TotalWillLoot;
	end	
end

function ME_Loot_Filter()
    local lootFilter=ME_Loot_Filters[ME_MailLootSetting.CurrentFilter];
	local totalMailNumber = GetInboxNumItems();
    TotalWillLoot=0;
    HasToken=0;
    LootPrepare={};
    local inbox_item_idx;
    for inbox_item_idx = totalMailNumber , 1, -1 do
        local NeedPrepare=0;
        local ME_LootpackageIcon, ME_LootstationeryIcon, ME_Lootsender, ME_Lootsubject, ME_Lootmoney, ME_LootCODAmount, ME_LootdaysLeft, ME_LoothasItem, ME_LootwasRead, ME_LootwasReturned, ME_LoottextCreated, ME_LootcanReply = GetInboxHeaderInfo(inbox_item_idx); 
        local FilterInfo={['idx']=inbox_item_idx,['CFilter']=lootFilter};
        if (( lootFilter.from == nil or ( lootFilter.from ~= nil and strfind(ME_Lootsender, lootFilter.from) ) ) and ( lootFilter.subject == nil or ( lootFilter.subject ~= nil and strfind(ME_Lootsubject, lootFilter.subject) ) ) ) then	
			if (ME_LoothasItem) then
				if (ME_LootCODAmount > 0 ) then
					if (lootFilter.takecod == 1) then
                        if(lootFilter.from~=nil) then
                            local old_LFF=string.gsub(lootFilter.from,"[%s%p]","");
                            lootFilter.from=old_LFF;
                            if(lootFilter.from~="") then
                                NeedPrepare=NeedPrepare+1;
                            else
                                ME_LootMSG(ME_LOOT_ERROR_CODSECURITY_NOFILTER);
                            end
                        else
                            ME_LootMSG(ME_LOOT_ERROR_CODSECURITY_NOFILTER);
                        end        
					end
				elseif( lootFilter.takeitem == 1) then
					NeedPrepare=NeedPrepare+1; 
				end
			end
					
			if (ME_Lootmoney > 0 and lootFilter.takemoney == 1) then
				NeedPrepare=NeedPrepare+1;
			end
					
			if (ME_LoottextCreated == 1 and lootFilter.taketextitem == 1 and isTakeable) then
				NeedPrepare=NeedPrepare+1;
			end
					
			if (lootFilter.deletempty) then
				if  (not ( ME_Lootmoney > 0 or ME_LootCODAmount > 0 or ME_LoothasItem or isTakeable) and ( (lootFilter.delread and ME_LootwasRead) or lootFilter.delread == nil)) then
					local inbox_item, itemTexture, count, quality, canUse = GetInboxItem(inbox_item_idx);
					local bodyText, texture, isTakeable = GetInboxText(inbox_item_idx);
                    if (not  bodyText ) then
                        NeedPrepare=NeedPrepare+1;	
					end
				end
			end
				
			if (lootFilter.deletext) then
				if  (not ( ME_Lootmoney > 0 or ME_LootCODAmount > 0 or ME_LoothasItem ) and ( (lootFilter.delread and ME_LootwasRead)or lootFilter.delread == nil) ) then
					local inbox_item, itemTexture, count, quality, canUse = GetInboxItem(inbox_item_idx);
					local bodyText, texture, isTakeable = GetInboxText(inbox_item_idx);
					if ( bodyText and isTakeable) then
						NeedPrepare=NeedPrepare+1;
					end
				end
			end
            
            if(NeedPrepare>0) then
                tinsert(LootPrepare,FilterInfo);
                TotalWillLoot=TotalWillLoot+1; 
            end    
            
        end
        
    end
end


function ME_Loot_RealLoot()--收信操作函数
    for key,val in LootPrepare do
        if(val) then
           ME_LootMailProcess(key,val.idx,val.CFilter)            
           return;
        end                
    end
    MailEnhance_LootFrame.total=0;
    MailEnhance_LootFrame:Hide();
end


function ME_LootMailProcess(key,inbox_item_idx,lcfilter)
    if(LootOn==0) then
		ME_LootMSG("Stop to loot");
		return;
	end
    local lootFilter=lcfilter;
    if (ME_LootREC[inbox_item_idx] == nil) then
        ME_LootREC[inbox_item_idx] = {};
    end
    local ME_LootpackageIcon, ME_LootstationeryIcon, ME_Lootsender, ME_Lootsubject, ME_Lootmoney, ME_LootCODAmount, ME_LootdaysLeft, ME_LoothasItem, ME_LootwasRead, ME_LootwasReturned, ME_LoottextCreated, ME_LootcanReply = GetInboxHeaderInfo(inbox_item_idx); 
    local inbox_money = "";
    if ( ME_Lootmoney > 0 ) then
        inbox_money	= ME_CountMoney(ME_Lootmoney);
    end
    if (ME_LoothasItem) then
        if (ME_LootCODAmount > 0 ) then
            if (lootFilter.takecod == 1) then                	
                local inbox_item, itemTexture, count, quality, canUse = GetInboxItem(inbox_item_idx);
                local bodyText, texture, isTakeable = GetInboxText(inbox_item_idx);

                if (ME_LootREC[inbox_item_idx]['cod'] == nil) then
                    ME_LootMSG(format(ME_LOOT_COD_MESSAGE, inbox_money, ME_Lootsender, inbox_item, ME_Lootsubject));
                end
                TakeInboxItem(inbox_item_idx);
                ME_LootREC[inbox_item_idx]['cod'] = 1;                
                HasToken=HasToken+1;
                tremove(LootPrepare,key); 
                return true;
            end
        elseif( lootFilter.takeitem == 1) then
            local inbox_item, itemTexture, count, quality, canUse = GetInboxItem(inbox_item_idx);
            local bodyText, texture, isTakeable = GetInboxText(inbox_item_idx);

            if (ME_LootREC[inbox_item_idx]['item'] == nil) then
                ME_LootMSG(format(ME_LOOT_ITEM_MESSAGE, inbox_item,  ME_Lootsender , ME_Lootsubject));
            end
            TakeInboxItem(inbox_item_idx);
            ME_LootREC[inbox_item_idx]['item'] = 1;
            HasToken=HasToken+1;
            tremove(LootPrepare,key); 
            return true;
        end
    end
            
    if (ME_Lootmoney > 0 and lootFilter.takemoney == 1) then
        local inbox_item, itemTexture, count, quality, canUse = GetInboxItem(inbox_item_idx);
        local bodyText, texture, isTakeable = GetInboxText(inbox_item_idx);

        if (ME_LootREC[inbox_item_idx]['money'] == nil) then
            ME_LootMSG(format(ME_LOOT_MONEY_MESSAGE, inbox_money,  ME_Lootsender , ME_Lootsubject));
        end
        TakeInboxMoney(inbox_item_idx);
        ME_LootREC[inbox_item_idx]['money'] = 1;
        HasToken=HasToken+1;
        tremove(LootPrepare,key); 
        return true;
    end
            
    if (ME_LoottextCreated == 1 and lootFilter.taketextitem == 1 and isTakeable) then
        local inbox_item, itemTexture, count, quality, canUse = GetInboxItem(inbox_item_idx);
        local bodyText, texture, isTakeable = GetInboxText(inbox_item_idx);

        if (ME_LootREC[inbox_item_idx]['text'] == nil) then
            ME_LootMSG(format(ME_LOOT_TEXTITEM_MESSAGE, ME_Lootsender , ME_Lootsubject));
        end
        TakeInboxTextItem(inbox_item_idx);
        ME_LootREC[inbox_item_idx]['text'] = 1;
        HasToken=HasToken+1;
        tremove(LootPrepare,key); 
        return true;
    end
            
    if (lootFilter.deletempty) then
        if  (not ( ME_Lootmoney > 0 or ME_LootCODAmount > 0 or ME_LoothasItem or isTakeable) and ( (lootFilter.delread and ME_LootwasRead) or lootFilter.delread == nil)) then
            local inbox_item, itemTexture, count, quality, canUse = GetInboxItem(inbox_item_idx);
            local bodyText, texture, isTakeable = GetInboxText(inbox_item_idx);
            if (not  bodyText ) then
                if (ME_LootREC[inbox_item_idx]['delempty'] == nil) then
                    ME_LootMSG(format(ME_LOOT_DELEMPTY_MESSAGE, ME_Lootsender , ME_Lootsubject));
                end
                DeleteInboxItem(inbox_item_idx);
                ME_LootREC[inbox_item_idx]['delempty'] = 1;
                HasToken=HasToken+1;
                tremove(LootPrepare,key); 
                return true;
            end
        end
    end
        
    if (lootFilter.deletext) then
        if  (not ( ME_Lootmoney > 0 or ME_LootCODAmount > 0 or ME_LoothasItem ) and ( (lootFilter.delread and ME_LootwasRead)or lootFilter.delread == nil) ) then
            local inbox_item, itemTexture, count, quality, canUse = GetInboxItem(inbox_item_idx);
            local bodyText, texture, isTakeable = GetInboxText(inbox_item_idx);
            if ( bodyText and isTakeable) then
                if (ME_LootREC[inbox_item_idx]['deletext'] == nil) then
                    ME_LootMSG(format(ME_LOOT_DELTEXT_MESSAGE, ME_Lootsender , ME_Lootsubject));
                end
                DeleteInboxItem(inbox_item_idx);
                ME_LootREC[inbox_item_idx]['deletext'] = 1;
                HasToken=HasToken+1;
                tremove(LootPrepare,key); 
                return true;
            end    
        end
    end
    return nil;       
end


function ME_LootProcessLoop(elapsed)
	if(LootOn==0 or LootCanNext==nil) then return end
	ProcessTime=ProcessTime+elapsed
	if ( ProcessTime<0.4) then
		ProcessTime=0;
		if (this.total> 0 ) then
			ME_Loot_RealLoot();
			LootCanNext=nil;
		end
	end
	
end


function ME_CountMoney(inmoney)
	local ig = floor(inmoney / 10000) ;
	local is = floor((inmoney - (ig * 10000)) / 100);
	local ic = inmoney - (ig * 10000) - (is * 100);
	local szmoney = "";
	local szbuf = "";
	if (ig > 0 ) then
		szbuf = format( ME_LOOT_GOLD_MARK, ig);
		szmoney = szbuf;
	end
	
	if (is > 0 or ig > 0 ) then
		szbuf = format( ME_LOOT_SILVER_MARK, is);
		szmoney = szmoney..szbuf;
	end
	
	if (ic > 0 ) then
		szbuf = format( ME_LOOT_COPPER_MARK, ic);
		szmoney = szmoney..szbuf;
	end
	
	return szmoney;
end



if ( GetLocale() == "zhTW" ) then
	SLECET_DESCRIB="ALT+左鍵添加到列表中或去除列表中的對應項";
	HELP="ALT+左鍵在列表中添加或刪除物品";
	MONEYMASS="錢幣郵件";
	ME_AMOUNT_TO_SEND="寄送金額:";
	ME_COD_AMOUNT="付款金額:";
	ME_MONEYACCEPT="準備發送";
	CANINSERT="郵件資訊不全,為避免損失不添加到發送列表。";
	ITEMMASS="物品郵件";
	CLEAR="清除列表";
	ADDHELP="將物品拖放到框體內";
	MASSMAIL="批量郵件";
	ME_MAIL_CAI ="無法加入物品,該物品為";
	ME_MAIL_Soulbound ="已綁定.";
	ME_MAIL_Quest ="任務物品.";
	ME_MAIL_Conjured ="魔法製造的物品.";
	PAYFOR=" 收取時付費:";
	ADDRESSEE=" 寄送給：";
	MAIL_ERROR = "發生一個錯誤。這可能是因為延遲，嘗試用普通郵件視窗一個一個發送這些物品，或者是因為發送那些不能被發送的物品。";
	MAIL_ITEMNUM ="物品 %d 總數 %d.";
	
	ME_MAILLOOT_TOOLTIP_TITLE="使用技巧:";
	ME_MAILLOOT_TOOLTIP_TEXT="左鍵點擊按照規則拾取郵箱中的郵件, ALT+左鍵打開拾取規則設置面板, 右鍵選擇郵件拾取規則"
	ME_MAILLOOT_BUTTON = "選擇性拾取";
	ME_LOOTFILTERS_TITLES=" %s";
	ME_LOOTFILTERS_NAMES="可用規則";
	
	ME_LOOT_DEFAULT_RULE_TITLE="默認規則";
	ME_LOOT_AHITME_RULE_TITLE="拍賣行物品";
	ME_LOOT_AHMONEY_RULE_TITLE="拍賣行錢幣";
	ME_LOOT_DELETREAD_RULE_TITLE="刪除已讀空郵件";
	ME_LOOT_DELETTEXT_RULE_TITLE="刪除已讀郵件文本";
	ME_LOOT_ITEMCOD_RULE_TITLE="付費取信";
    ME_LOOT_NEWCUSTOM_TITLE="新規則";
    
    ME_LOOT_ERROR_CREATNEWFILTER="規則總數已達上限不能再創建新規則!";
	ME_LOOT_ERROR_DELETFILTER="默認規則不可刪除!";
    
	ME_LOOT_KEYWORD_AH=".*拍賣行"
	
	ME_NEWFILTER="創建規則";
	ME_DELETFLITER="刪除規則";
	ME_APPLYALL="完成";
    ME_RESETTODEFAULT="重置";
	ME_FILTERNAME="規則名：";
	ME_FILTERFROME="發件人過濾："
	ME_FILTERSUBJECT="主題過濾：";
    ME_TAKEITEMTEXT="拾取物品";
    ME_TAKEMONEYTEXT="拾取錢幣";
    ME_TAKECODITEMTEXT="拾取付費郵件";
    ME_TAKETEXTITEMTEXT="拾取文本郵件";
    ME_DELETEMPTYTEXT="刪除空郵件";
	ME_DELETETEXTONLYTEXT="刪除只有文本的郵件";
    ME_IGNOREUNREADTEXT="不處理未讀郵件";
    
	ME_LOOT_GOLD_MARK = "|cffe7cb44%d金|r";
	ME_LOOT_SILVER_MARK = "|cffcbc8cb%d銀|r";
	ME_LOOT_COPPER_MARK = "|cffa45f3e%d銅|r";
	
	
	--ME_LOOT_RETURN_MESSAGE = "MailLoot Returning Mail: |cffffff00Money|r %s 來自|r |cffb6ff9f<%s>|r; Item %s; 主題: |cffaaaa88%s|r";
	ME_LOOT_COD_MESSAGE = "收取付費郵件: |cffffff00Paid|r %s 來自|r |cffb6ff9f<%s>|r; 付費 %s; 主題: |cffaaaa88%s|r";
	ME_LOOT_ITEM_MESSAGE = "收取物品: |cff00ff00[%s]|r 來自 |cffb6ff9f<%s>|r; 主題: |cffaaaa88%s|r";
	ME_LOOT_MONEY_MESSAGE = "收取錢幣: %s 來自 |cffb6ff9f<%s>|r; 主題: |cffaaaa88%s|r";
	ME_LOOT_TEXTITEM_MESSAGE = "收取文本郵件: 來自 |cffb6ff9f<%s>|r; 主題: |cffaaaa88%s|r";
	ME_LOOT_DELEMPTY_MESSAGE = "|cffff0000刪除空郵件: 來自 |cffb6ff9f<%s>|r; 主題: |cffaaaa88%s|r";
	ME_LOOT_DELTEXT_MESSAGE = "|cffff0000刪除只有文本的郵件:|r 來自 |cffb6ff9f<%s>|r; 主題: |cffaaaa88%s|r";
    ME_LOOT_FINISH_MESSAGE="|cffffff00 完成掃描沒有需要收取的郵件。|r";

end

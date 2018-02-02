if ( GetLocale() == "zhCN" ) then
	SLECET_DESCRIB="ALT+左键添加到列表中或去除列表中的对应项";
	HELP="ALT+左键在列表中添加或删除物品";
	MONEYMASS="钱币邮件";
	ME_AMOUNT_TO_SEND="寄送金额:";
	ME_COD_AMOUNT="付款金额:";
	ME_MONEYACCEPT="准备发送";
	CANINSERT="邮件信息不全,为避免损失不添加到发送列表。";
	ITEMMASS="物品邮件";
	CLEAR="清除列表";
	ADDHELP="将物品拖放到框体内";
	MASSMAIL="批量邮件";
	ME_MAIL_CAI ="无法加入物品,该物品为";
	ME_MAIL_Soulbound ="已绑定.";
	ME_MAIL_Quest ="任务物品.";
	ME_MAIL_Conjured ="魔法制造的物品.";
	PAYFOR=" 收取时付费:";
	ADDRESSEE=" 寄送给：";
	MAIL_ERROR = "发生一个错误。这可能是因为延迟，尝试用普通邮件窗口一个一个发送这些物品，或者是因为发送那些不能被发送的物品。";
	MAIL_ITEMNUM ="物品 %d 总数 %d.";
	
	ME_MAILLOOT_TOOLTIP_TITLE="使用技巧:";
	ME_MAILLOOT_TOOLTIP_TEXT="左键点击按照规则拾取邮箱中的邮件, ALT+左键打开拾取规则设置面板, 右键选择邮件拾取规则"
	ME_MAILLOOT_BUTTON = "选择性拾取";
	ME_LOOTFILTERS_TITLES=" %s";
	ME_LOOTFILTERS_NAMES="可用规则";
	
	ME_LOOT_DEFAULT_RULE_TITLE="默认规则";
	ME_LOOT_AHITME_RULE_TITLE="拍卖行物品";
	ME_LOOT_AHMONEY_RULE_TITLE="拍卖行钱币";
	ME_LOOT_DELETREAD_RULE_TITLE="删除已读空邮件";
	ME_LOOT_DELETTEXT_RULE_TITLE="删除已读邮件文本";
	ME_LOOT_ITEMCOD_RULE_TITLE="付费取信";
    ME_LOOT_NEWCUSTOM_TITLE="新规则";
    
    ME_LOOT_ERROR_CREATNEWFILTER="规则总数已达上限不能再创建新规则!";
	ME_LOOT_ERROR_DELETFILTER="默认规则不可删除!";
    ME_LOOT_ERROR_CODSECURITY_NOFILTER="|cffff0000未定义受信任发件人名单|r";
    --ME_LOOT_ERROR_CODSECURITY_
    
	ME_LOOT_KEYWORD_AH=".*拍卖行"
	
	ME_NEWFILTER="创建规则";
	ME_DELETFLITER="删除规则";
	ME_APPLYALL="完成";
    ME_RESETTODEFAULT="重置";
	ME_FILTERNAME="规则名：";
	ME_FILTERFROME="发件人过滤："
	ME_FILTERSUBJECT="主题过滤：";
    ME_TAKEITEMTEXT="拾取物品";
    ME_TAKEMONEYTEXT="拾取钱币";
    ME_TAKECODITEMTEXT="拾取付费邮件";
    ME_TAKETEXTITEMTEXT="拾取文本邮件";
    ME_DELETEMPTYTEXT="删除空邮件";
	ME_DELETETEXTONLYTEXT="删除只有文本的邮件";
    ME_IGNOREUNREADTEXT="不处理未读邮件";
    
	ME_LOOT_GOLD_MARK = "|cffe7cb44%d金|r";
	ME_LOOT_SILVER_MARK = "|cffcbc8cb%d银|r";
	ME_LOOT_COPPER_MARK = "|cffa45f3e%d铜|r";
	
	
	--ME_LOOT_RETURN_MESSAGE = "MailLoot Returning Mail: |cffffff00Money|r %s 来自|r |cffb6ff9f<%s>|r; Item %s; 主题: |cffaaaa88%s|r";
	ME_LOOT_COD_MESSAGE = "收取付费邮件: |cffffff00Paid|r %s 来自|r |cffb6ff9f<%s>|r; 付费 %s; 主题: |cffaaaa88%s|r";
	ME_LOOT_ITEM_MESSAGE = "收取物品: |cff00ff00[%s]|r 来自 |cffb6ff9f<%s>|r; 主题: |cffaaaa88%s|r";
	ME_LOOT_MONEY_MESSAGE = "收取钱币: %s 来自 |cffb6ff9f<%s>|r; 主题: |cffaaaa88%s|r";
	ME_LOOT_TEXTITEM_MESSAGE = "收取文本邮件: 来自 |cffb6ff9f<%s>|r; 主题: |cffaaaa88%s|r";
	ME_LOOT_DELEMPTY_MESSAGE = "|cffff0000删除空邮件: 来自 |cffb6ff9f<%s>|r; 主题: |cffaaaa88%s|r";
	ME_LOOT_DELTEXT_MESSAGE = "|cffff0000删除只有文本的邮件:|r 来自 |cffb6ff9f<%s>|r; 主题: |cffaaaa88%s|r";
    ME_LOOT_FINISH_MESSAGE="|cffffff00 完成扫描没有需要收取的邮件。|r";
end




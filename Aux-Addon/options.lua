AUX_ENABLE_ALT = true
AUX_OPEN_FIRST = false
AUX_INSTANT_BUYOUT = false

AUX_AUCTION_DURATION = 'long'

local BoolToString, BoolToNum, NumToBool

function Aux_ShowDescriptionFrame()
	AuxDescriptionFrame:Show()
	
	AuxDescriptionHTML:SetText("<html><body>"
			.."<h1>What is Aux?</h1><br/>"
			.."<p>"
			.."Aux adds two tabs to the traditional auction house layout, Aux Sell and  Aux Buy, which make selling and buying respectively a much more streamlined experience by automating a lot of the annoying little tasks involved in managing your auctions and providing you with much better information to base decisions on."
			.."</p><br/><h1>Aux Sell</h1><br/><p>"
			.."The Aux Sell panel gives you pricing suggestions based on existing auctions (undercutting by 1 copper) when you put an item in the auction slot. Aux will cache search results so that you don't have to wait several seconds to minutes between auctions. If you need to update the information there's a refresh button. You can further select a specific entry from the list to base the pricing suggestion on if you don't like its default choice."
			.."</p><br/><h1>Aux Buy</h1><br/><p>"
			.."The Aux Buy panel makes a multi-page search for you and lists all items with the most relevant information sorted by unit price. From that list you can select all the auctions you want to buy and after your confirmation Aux then makes another multi-page search, picking up all the selected auctions in the process. At the end you're presented with a report about what has been purchased."
			.."</p>"
			.."</body></html>")
			
	AuxDescriptionHTML:SetSpacing(3)
	
	AuxAuthorText:SetText("Authors: "..AuxAuthors)
end

-----------------------------------------

function Aux_ShowOptionsFrame()

	AuxOptionsFrame:Show()
	AuxOptionsFrame:SetBackdropColor(0,0,0,100)
	
	AuxConfigFrameTitle:SetText("Aux 设置 "..UnitName("player"))

	AuxExplanation:SetText("Aux 是款拍卖行增强插件，这款是无UI版本.")


	AuxVersionText:SetText("版本: "..AuxVersion)
	
	AuxOption_Enable_Alt:SetChecked(AUX_ENABLE_ALT)
	AuxOption_Open_First:SetChecked(AUX_OPEN_FIRST)
	AuxOption_Instant_Buyout:SetChecked(AUX_INSTANT_BUYOUT)
end

-----------------------------------------

function AuxOptionsSave()

	AUX_ENABLE_ALT = AuxOption_Enable_Alt:GetChecked()
	AUX_OPEN_FIRST = AuxOption_Open_First:GetChecked()
	AUX_INSTANT_BUYOUT = AuxOption_Instant_Buyout:GetChecked()
	
end

-----------------------------------------

function Aux_ShowTooltip_EnableAlt()

	GameTooltip:SetOwner(this, "ANCHOR_BOTTOM")
	GameTooltip:SetText("开启 ALT 快捷方式", 0.9, 1.0, 1.0)
	GameTooltip:AddLine(", 按住Alt键点击一个物品在您的袋子将切换到AH,将项目放置在卖区，并提出价格.", 0.5, 0.5, 1.0, 1)
	GameTooltip:Show()

end

-----------------------------------------

function Aux_ShowTooltip_OpenFirst()

	GameTooltip:SetOwner(this, "ANCHOR_BOTTOM")
	GameTooltip:SetText("自动打开AH卖页面", 0.9, 1.0, 1.0)
	GameTooltip:AddLine("如果选中此选项, 当你打开AH的时候自动跳到卖的页面.", 0.5, 0.5, 1.0, 1)
	GameTooltip:Show()

end

-----------------------------------------

function Aux_ShowTooltip_InstantBuyout()

	GameTooltip:SetOwner(this, "ANCHOR_BOTTOM")
	GameTooltip:SetText("启用右键即时买断", 0.9, 1.0, 1.0)
	GameTooltip:AddLine("如果选中此选项, 右键点击拍卖在浏览标签将立即购买它.", 0.5, 0.5, 1.0, 1)
	GameTooltip:Show()

end

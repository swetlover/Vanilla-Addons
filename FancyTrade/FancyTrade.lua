	-- Event handler.
CreateFrame("Frame", "FANCYTRADE_FRAME");
FANCYTRADE_FRAME:SetScript("OnEvent", function()
	if (arg1 == "FancyTrade") then
		FancyTrade_UseContainerItem = UseContainerItem
		function UseContainerItem(bag,slot,onself)
			if (TradeFrame) then
				if (TradeFrame:IsVisible()) then
					PickupContainerItem(bag,slot)
					slot2 = TradeFrame_GetAvailableSlot()
					if slot2 then
						ClickTradeButton(slot2)
					end
					return
				end
			end
			FancyTrade_UseContainerItem(bag,slot,onself)
		end
	end
end);
FANCYTRADE_FRAME:RegisterEvent("ADDON_LOADED")
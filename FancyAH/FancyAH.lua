-- Event handler.
CreateFrame("Frame", "FANCYAH_FRAME");
FANCYAH_FRAME:SetScript("OnEvent", function()
	if (arg1 == "FancyAH") then
		FancyAH_UseContainerItem = UseContainerItem
		function UseContainerItem(bag,slot,onself)
			if (AuctionFrame) then
				if (AuctionFrame:IsVisible()) then
					PickupContainerItem(bag,slot)
					ClickAuctionSellItemButton()
					return
				end
			end
			FancyAH_UseContainerItem(bag,slot,onself)
		end
	end
end);
FANCYAH_FRAME:RegisterEvent("ADDON_LOADED")
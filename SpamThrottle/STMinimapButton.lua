function SpamThrottle_OnClick(arg1)
	if( arg1 and arg1 == "RightButton" and IsShiftKeyDown() ) then
		if( SpamThrottle_Config.MinimapButtonAtt ) then
			local xpos,ypos = GetCursorPosition();
			local scale = SpamThrottle_MinimapButtonFrame:GetEffectiveScale()
			
			SpamThrottle_Config.MinimapButtonAtt = false;
			SpamThrottle_Config.ButtonPosX = xpos/scale
			SpamThrottle_Config.ButtonPosY = ypos/scale
			
			SpamThrottle_SetButtonPosition();
		else
			SpamThrottle_ResetPosition();
		end
	elseif( arg1 and arg1 == "LeftButton" and not IsShiftKeyDown() ) then
		SpamThrottleConfigFrame:Show();
	else
		
	end
end

function SpamThrottle_DragStart()
	if (IsShiftKeyDown()) then
		GameTooltip:Hide();
		SpamThrottle_DragFlag = 1;
		if( SpamThrottle_Config.MinimapButtonAtt ) then
			
		else
			local _,_,_,xpos,ypos = this:GetPoint();
			this.orig = {xpos, ypos};
			this:StartMoving();
			_,_,_,xpos,ypos = this:GetPoint();
			this.start = {xpos, ypos};
			
		end
	else
		SpamThrottle_DragFlag = 0;
	end 
	
end

function SpamThrottle_DragStop()
	if SpamThrottle_DragFlag == 1 then 
		local _,_,_,xpos,ypos = this:GetPoint();
		
		if( SpamThrottle_Config.MinimapButtonAtt ) then
			SpamThrottle_Config.ButtonPosX = xpos
			SpamThrottle_Config.ButtonPosY = ypos
		else
			this:StopMovingOrSizing();
			xpos = this.orig[1] + (xpos - this.start[1])
			ypos = this.orig[2] + (ypos - this.start[2])
			SpamThrottle_Config.ButtonPosX = xpos
			SpamThrottle_Config.ButtonPosY = ypos
		end
		SpamThrottle_DragFlag = 0;
	end
end

function SpamThrottle_OnUpdate(elapsed)
	if( SpamThrottle_DragFlag == 1 and SpamThrottle_Config.MinimapButtonAtt ) then
		local xpos,ypos = GetCursorPosition();
		local xmin,ymin,xm,ym = Minimap:GetLeft(), Minimap:GetBottom(), Minimap:GetRight(), Minimap:GetTop();
		local scale = Minimap:GetEffectiveScale();
		local xdelta, ydelta = (xm - xmin)/2*scale, (ym - ymin) /2 * scale;
		
		xpos = xmin*scale-xpos+xdelta;
		ypos = ypos-ymin*scale-ydelta;

		local angle = math.deg(math.atan2(ypos,xpos));
		
		local	x,y =0,0;
		if (Squeenix or (simpleMinimap_Skins and simpleMinimap_Skins:GetShape() == "square")
		    or (pfUI and pfUI_config["disabled"]["minimap"] ~= "1")) then
			x = math.max(-xdelta, math.min((xdelta*1.5) * cos(angle), xdelta))
			y = math.max(-ydelta, math.min((ydelta*1.5) * sin(angle), ydelta))
		else
			x= cos(angle)*xdelta
			y= sin(angle)*ydelta
		end
		local sc= SpamThrottle_MinimapButtonFrame:GetEffectiveScale()
		SpamThrottle_MinimapButtonFrame:SetPoint("TOPLEFT", Minimap, "TOPLEFT", (xdelta-x)/sc -17 , (y-ydelta)/sc +17);
	end
end

function SpamThrottle_ResetPosition()
	SpamThrottle_Config.ButtonPosX = Default_SpamThrottle_Config.ButtonPosX
	SpamThrottle_Config.ButtonPosY = Default_SpamThrottle_Config.ButtonPosY
	SpamThrottle_Config.MinimapButtonAtt = Default_SpamThrottle_Config.MinimapButtonAtt
	SpamThrottle_SetButtonPosition();
end

function SpamThrottle_SetButtonPosition()
	if (not SpamThrottle_Config) then return; end
	if SpamThrottle_Config.STMinimapButton then
		SpamThrottle_MinimapButtonFrame:Show();
	else
		SpamThrottle_MinimapButtonFrame:Hide();
	end
	if( SpamThrottle_Config.MinimapButtonAtt ) then
		SpamThrottle_MinimapButtonFrame:ClearAllPoints();
		SpamThrottle_MinimapButtonFrame:SetPoint("TOPLEFT", Minimap, "TOPLEFT", SpamThrottle_Config.ButtonPosX, SpamThrottle_Config.ButtonPosY);
	else
		SpamThrottle_MinimapButtonFrame:ClearAllPoints();
		SpamThrottle_MinimapButtonFrame:SetPoint("CENTER", UIParent, "BOTTOMLEFT", SpamThrottle_Config.ButtonPosX, SpamThrottle_Config.ButtonPosY);
	end
end

function SpamThrottle_ToggleMinibutton(checked)
	if checked then
		SpamThrottle_MinimapButtonFrame:Show();
		SpamThrottle_Config.STMinimapButton = true;
	else
		SpamThrottle_MinimapButtonFrame:Hide();
		SpamThrottle_Config.STMinimapButton = false;
	end
end
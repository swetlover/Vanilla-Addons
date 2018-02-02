----------------------------------------------------------------------------
---------------- Based on CastParty3 AddOn
----------------------------------------------------------------------------

function slibMinimapButton_OnLoad()
	this.IsDragging = false;
	this:RegisterForClicks("LeftButtonUp");
	this:RegisterForDrag("RightButton");
	this:SetFrameLevel(this:GetFrameLevel() + 1);
end

function slibMinimapButton_OnEnter()
	GameTooltip:SetOwner(this,"ANCHOR_LEFT");
	GameTooltip:SetText("插件命令控制台\n右键移动图标");
end

function slibMinimapButton_OnLeave()
	GameTooltip:Hide();
end

function slibMinimapButton_OnMouseDown()
	Slib_MinimapBtn_Icon:SetTexCoord(0,1,0,1);
	
	-- Remember where the cursor was in case the user drags
	local vCursorX, vCursorY = GetCursorPosition();
	vCursorX = vCursorX / this:GetEffectiveScale();
	vCursorY = vCursorY / this:GetEffectiveScale();
	Slib_MinimapBtn.CursorStartX = vCursorX;
	Slib_MinimapBtn.CursorStartY = vCursorY;
	local vCenterX,vCenterY = Slib_MinimapBtn:GetCenter();
	local vMinimapCenterX, vMinimapCenterY = Minimap:GetCenter();
	Slib_MinimapBtn.CenterStartX = vCenterX - vMinimapCenterX;
	Slib_MinimapBtn.CenterStartY = vCenterY - vMinimapCenterY;
end

function slibMinimapButton_OnMouseUp()
	Slib_MinimapBtn_Icon:SetTexCoord(.075,.925,.075,.925);
end

function slibMinimapButton_DragStart()
	this:LockHighlight();
	
	Slib_MinimapBtn:ClearAllPoints();
	this.IsDragging = true;
end

function slibMinimapButton_DragEnd()
	this:UnlockHighlight();
	Slib_MinimapBtn_Icon:SetTexCoord(.075,.925,.075,.925)

	this.IsDragging = false;
end

function slibMinimapButton_OnClick()
	slibUIShow();
	Slib_MinimapBtn_Icon:SetTexCoord(.075,.925,.075,.925);
end

function slibMinimapButton_UpdateDragPosition()
	-- Hacked up from Outfitter on curse! I know they didn't invent this concept, but, they are the only
	-- ones i could find who do it!
	
	-- Remember where the cursor was in case the user drags
	local vCursorX, vCursorY = GetCursorPosition();

	vCursorX = vCursorX / this:GetEffectiveScale();
	vCursorY = vCursorY / this:GetEffectiveScale();

	local vCursorDeltaX = vCursorX - Slib_MinimapBtn.CursorStartX;
	local vCursorDeltaY = vCursorY - Slib_MinimapBtn.CursorStartY;

	local vCenterX = Slib_MinimapBtn.CenterStartX + vCursorDeltaX;
	local vCenterY = Slib_MinimapBtn.CenterStartY + vCursorDeltaY;

	-- Calculate the angle
	local vAngle = math.atan2(vCenterX, vCenterY);

	-- Set the new position
	slibMinimapButton_SetPositionAngle(vAngle);
	
	SlashLibSaved["minimapIconAngle"] = vAngle;
end

function slibMinimapButton_SetPositionAngle(pAngle)
	local vAngle = pAngle;
	local vRadius = 80;
	vCenterX = math.sin(vAngle) * vRadius;
	vCenterY = math.cos(vAngle) * vRadius;
	Slib_MinimapBtn:SetPoint("CENTER","Minimap","CENTER",vCenterX - 1,vCenterY - 1);
end
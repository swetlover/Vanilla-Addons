function HasBuff(unit, texturename)
  local id = 1;
  while (UnitBuff(unit, id)) do
    local buffTexture = UnitBuff(unit, id);
    if (string.find(buffTexture, texturename)) then
      return true;
    end
    id = id + 1;
  end
  return nil;
end

function BSAlert_OnLoad()
  -- hook into events
  this:RegisterEvent("PLAYER_REGEN_ENABLED");
  this:RegisterEvent("PLAYER_REGEN_DISABLED");
  this:RegisterEvent("PLAYER_AURAS_CHANGED");

  -- initialize combat tracker
  BSAlert_combat = nil;

  -- define the border as "backdrop"
  local backdrop = {
    edgeFile = "Interface\\AddOns\\BSAlert\\border", edgeSize = 64,
    insets = {left = 64, right = 64, top = 64, bottom = 64},
  }

  -- build the frame
  BSAlert = CreateFrame("Frame")
  BSAlert:SetFrameStrata("BACKGROUND")
  BSAlert:SetWidth(GetScreenWidth() * UIParent:GetEffectiveScale())
  BSAlert:SetHeight(GetScreenHeight() * UIParent:GetEffectiveScale())
  BSAlert:SetBackdrop(backdrop)
  BSAlert:SetPoint("CENTER",0,0)
  BSAlert:Hide()
end

function BSAlert_OnEvent(event)
  if     (event == "PLAYER_REGEN_DISABLED") then BSAlert_combat = true;
  elseif (event == "PLAYER_REGEN_ENABLED")  then BSAlert_combat = nil;
  end

  if BSAlert_combat and (not HasBuff("player", "Ability_Warrior_BattleShout")) then
    BSAlert:Show();
  else
    BSAlert:Hide();
  end
end

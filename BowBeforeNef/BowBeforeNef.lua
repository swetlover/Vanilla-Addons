BowBeforeNefTimer = 0;
BowBeforeNefSlot = nil;

function BowBeforeNef_OnLoad(event)
  BowBeforeNefTimer = 0;
  BowBeforeNefSlot = nil;
  this:RegisterEvent("CHAT_MSG_MONSTER_EMOTE");
  this:RegisterEvent("CHAT_MSG_MONSTER_YELL");
end
	
function BowBeforeNef_OnEvent()

  if (event == "CHAT_MSG_MONSTER_EMOTE" or event == "CHAT_MSG_MONSTER_YELL") then
    local classcall = false;

    -- Shamans
    if (string.find(arg1, "Shamans, show me")) then --萨满祭司，
      classcall = true;
    -- Druids
    elseif (string.find(arg1, "Druids and your silly")) then --德鲁伊和你们愚蠢
      classcall = true;
    -- Priests
    elseif (string.find(arg1, "Priests! If you're going to keep")) then --牧师！如果你要
      classcall = true;
    -- Warriors
    elseif (string.find(arg1, "Warriors, I know you can hit harder")) then --战士，我知道你
      classcall = true;
    -- Rogue
    elseif (string.find(arg1, "Rogues? Stop hiding")) then --盗贼？不要躲了
      classcall = true;
    -- Warlocks
    elseif (string.find(arg1, "Warlocks, you shouldn't be playing")) then --术士，不要随便
      classcall = true;
    -- Paladins
    elseif (string.find(arg1, "Paladins")) then --圣骑士……
      classcall = true;
    -- Hunters
    elseif (string.find(arg1, "Hunters and your annoying")) then --猎人和他们那些讨厌
      classcall = true;
    -- Mages
    elseif (string.find(arg1, "Mages too?")) then --你也是法师
      classcall = true;
    end

    if (classcall == false) then
      return;
    end

    DEFAULT_CHAT_FRAME:AddMessage("职业召唤");

    if (BowBeforeNefSlot ~= nil) then
      BowBeforeNef_Equip();
    end
    
    BowBeforeNefTimer = 28;

  end
end

function BowBeforeNef_Equip()
  DEFAULT_CHAT_FRAME:AddMessage("装备");
  if (BowBeforeNefSlot == nil) then
    return;
  end

  local slotID = GetInventorySlotInfo("RangedSlot");
  if (slotID == nil) then
    DEFAULT_CHAT_FRAME:AddMessage("没有背包空间");
    BowBeforeNefSlot = nil;
    return;
  end

  local link = GetInventoryItemLink("player", slotID);
  if (link ~= nil) then
    DEFAULT_CHAT_FRAME:AddMessage("不是空的: " ..  link);
    BowBeforeNefSlot = nil;
    return;
  end

DEFAULT_CHAT_FRAME:AddMessage("换装: " .. BowBeforeNefSlot .. " " .. slotID);

  PickupContainerItem(0, BowBeforeNefSlot);
  PickupInventoryItem(slotID);
  if (CursorHasItem()) then
    DEFAULT_CHAT_FRAME:AddMessage("换装失败");
    PickupContainerItem(0, BowBeforeNefSlot);
  end

  BowBeforeNefSlot = nil;

end

function BowBeforeNef_Unequip()

  DEFAULT_CHAT_FRAME:AddMessage("卸下");

  local slotID = GetInventorySlotInfo("RangedSlot");
  if (slotID == nil) then
    return;
  end

  local link = GetInventoryItemLink("player", slotID);
  if (link == nil) then
    return;
  end

  -- Now we know a bow is equipped, find a free slot in the backpack

  local j = 1;
  local emptyslot = nil;
  for j=1, GetContainerNumSlots(0) do
    local linktext = GetContainerItemLink(0, j);
    if (linktext == nil) then
      emptyslot = j;
      break;
    end
  end

  if (emptyslot == nil) then
    return;
  end

  PickupInventoryItem(slotID);
  PickupContainerItem(0, emptyslot);

  BowBeforeNefSlot = emptyslot;
  
end

function BowBeforeNef_OnUpdate(elapsed)
  if (BowBeforeNefTimer > 0) then
    if (BowBeforeNefTimer > elapsed) then
      BowBeforeNefTimer = BowBeforeNefTimer - elapsed;
      return;
    else
      BowBeforeNefTimer = 0;

      BowBeforeNef_Unequip();
    end
  end
end

function BowBeforeNef_Test()
  event = "CHAT_MSG_MONSTER_EMOTE";
  arg1 = "Rogues? Stop hiding";
  BowBeforeNef_OnEvent(event);
end

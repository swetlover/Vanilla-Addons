local questLogCache     = { }
local questTrackedCache = { }

local function ClearQuest(quest)
  pfMap:DeleteNode("PFQUEST", quest)
  questTrackedCache[quest] = nil
end

local function ResetAll()
  questTrackedCache = {}
  pfQuest:Show()
  pfQuest.hadUpdate = true
end

local function QuestNeedsUpdate(questIndex)
  local title, level = GetQuestLogTitle(questIndex)

  if not title then return nil end

  local watched = IsQuestWatched(questIndex)
  local objectives = GetNumQuestLeaderBoards(questIndex)
  local hash = title

  questTrackedCache[title] = questTrackedCache[title] or "init"

  if objectives then
    for i=1, objectives, 1 do
      local text, _, finished = GetQuestLogLeaderBoard(i, questIndex)
      local i, j, itemName, numItems, numNeeded = strfind(text, "(.*)：%s*([%d]+)%s*/%s*([%d]+)")
      if itemName then
        hash = hash .. itemName .. ( finished and "DONE" or "TODO" )
      end
    end
  end

  if questTrackedCache[title] ~= hash then
    questTrackedCache[title] = hash
    return true
  else
    return nil
  end
end

local function UpdateQuestLogID(questIndex, action)
  -- never add nodes in hidden mode
  if pfQuest_config["trackingmethod"] == 4 then return end

  -- specified index
  if questIndex then
    --local title, level = GetQuestLogTitle(questIndex)
    local title, level, _, header, _, complete = GetQuestLogTitle(questIndex)
    if header or not title then return end

    local watched = IsQuestWatched(questIndex)
    if not title then return end

    -- read questtext and objectives
    local oldID = GetQuestLogSelection()
    SelectQuestLogEntry(questIndex)
    local qtxt, qobj = GetQuestLogQuestText()
    SelectQuestLogEntry(oldID)

    if action == "REMOVE" then
      ClearQuest(title)
      return nil
    elseif action == "ADD" then
      -- skip further checks
    else
      if pfQuest_config["trackingmethod"] == 2 and not watched then
        ClearQuest(title)
        return nil
      end

      if pfQuest_config["trackingmethod"] == 3 then
        ClearQuest(title)
        return nil
      end

      -- abort with available cache when no action was given
      if not QuestNeedsUpdate(questIndex) then
        return nil
      end
    end

    -- hide old nodes and apply changes
    pfMap:DeleteNode("PFQUEST", title)

    -- search matching quests
    local maps, meta = {}, { ["addon"] = "PFQUEST", ["qlogid"] = questIndex }
    local results = pfDatabase:GetQuestIDs(questIndex)
    for _, id in results do
      maps = pfDatabase:SearchQuestID(id, meta, maps)
    end

    -- If no quest was found in the database, fallback to manual questlog-parsing
    if table.getn(results) == 0 then
      message("FALLBACK: 任务日志扫描中")
      local objectives = GetNumQuestLeaderBoards(questIndex)
      if objectives then
        for i=1, objectives, 1 do
          local text, type, done = GetQuestLogLeaderBoard(i, meta["qlogid"])

          -- spawn data
          if type == "monster" then
            local i, j, monsterName, objNum, objNeeded = strfind(text, pfUI.api.SanitizePattern(QUEST_MONSTERS_KILLED))
            if objNUm ~= objNeeded or not done then

              for id in pairs(pfDatabase:GetIDByName(monsterName, "units")) do
                meta["texture"] = nil
                maps = pfDatabase:SearchMobID(unit, meta, maps)
              end

              for id in pairs(pfDatabase:GetIDByName(monsterName, "objects")) do
                meta["texture"] = nil
                maps = pfDatabase:SearchMobID(id, meta, maps)
              end
            end
          elseif type == "item" then
            if objNUm ~= objNeeded or not done then
              local i, j, itemName, objNum, objNeeded = strfind(text, pfUI.api.SanitizePattern(QUEST_OBJECTS_FOUND))
              if objNUm == objNeeded or done then
                for id in pairs(pfDatabase:GetIDByName(itemName, "items")) do
                  maps = pfDatabase:SearchItemID(id, meta, maps)
                end
              end
            end
          end
        end
      end
    end

    pfMap:UpdateNodes()

    return maps
  else
    -- check for questlog changes
    local cur = {}
    for id=1, GetNumQuestLogEntries() do
      local title = GetQuestLogTitle(id)
      cur[title] = true
    end

    -- remove already deleted or done quests
    local exists = nil
    for quest in pairs(questLogCache) do
      if not cur[quest] then
        pfQuest_history[quest] = true
        ClearQuest(quest)
      end
    end

    -- trigger update loop
    pfQuest:Show()

    -- update questlog cache
    questLogCache = cur
  end
end

local function AddQuestLogIntegration()
  if pfQuest_config["questlogbuttons"] ==  "0" then return end

  local dockFrame = EQL3_QuestLogDetailScrollChildFrame or ShaguQuest_QuestLogDetailScrollChildFrame or QuestLogDetailScrollChildFrame
  local dockTitle = EQL3_QuestLogDescriptionTitle or ShaguQuest_QuestLogDescriptionTitle or QuestLogDescriptionTitle

  dockTitle:SetHeight(dockTitle:GetHeight() + 30)
  dockTitle:SetJustifyV("BOTTOM")

  pfQuest.buttonShow = pfQuest.buttonShow or CreateFrame("Button", "pfQuestShow", dockFrame, "UIPanelButtonTemplate")
  pfQuest.buttonShow:SetWidth(90)
  pfQuest.buttonShow:SetHeight(23)
  pfQuest.buttonShow:SetText("显示")
  pfQuest.buttonShow:SetPoint("TOP", dockTitle, "TOP", -95, 0)
  pfQuest.buttonShow:SetScript("OnClick", function()
    local maps = UpdateQuestLogID(GetQuestLogSelection(), "ADD")
    if maps then pfMap:ShowMapID(pfDatabase:GetBestMap(maps)) end
  end)

  pfQuest.buttonClean = pfQuest.buttonClean or CreateFrame("Button", "pfQuestClean", dockFrame, "UIPanelButtonTemplate")
  pfQuest.buttonClean:SetWidth(90)
  pfQuest.buttonClean:SetHeight(23)
  pfQuest.buttonClean:SetText("清除")
  pfQuest.buttonClean:SetPoint("TOP", dockTitle, "TOP", 0, 0)
  pfQuest.buttonClean:SetScript("OnClick", function()
    pfMap:DeleteNode("PFQUEST")
    pfMap:UpdateNodes()
  end)

  pfQuest.buttonReset = pfQuest.buttonReset or CreateFrame("Button", "pfQuestHide", dockFrame, "UIPanelButtonTemplate")
  pfQuest.buttonReset:SetWidth(90)
  pfQuest.buttonReset:SetHeight(23)
  pfQuest.buttonReset:SetText("重置")
  pfQuest.buttonReset:SetPoint("TOP", dockTitle, "TOP", 95, 0)
  pfQuest.buttonReset:SetScript("OnClick", function()
    ResetAll()
  end)
end

local function AddWorldMapIntegration()
  if pfQuest_config["worldmapmenu"] ==  "0" then return end

  -- Quest Update Indicator
  pfQuest.mapUpdate = WorldMapButton:CreateFontString(nil, "OVERLAY")
  pfQuest.mapUpdate:SetPoint("BOTTOMLEFT", 10, 10)
  pfQuest.mapUpdate:SetFont(pfUI.font_default, pfUI_config.global.font_size, "OUTLINE")
  pfQuest.mapUpdate:SetTextColor(1, 1, 1)

  pfQuest.mapUpdate:SetJustifyH("LEFT")
  pfQuest.mapUpdate:SetJustifyV("BOTTOM")

  pfQuest.mapUpdate:SetWidth(150)
  pfQuest.mapUpdate:SetHeight(15)
  pfQuest.mapUpdate:Show()

  -- Quest Display Selection
  pfQuest.mapButton = CreateFrame("Frame", "pfQuestMapDropdown", WorldMapButton, "UIDropDownMenuTemplate")
  pfQuest.mapButton:ClearAllPoints()
  pfQuest.mapButton:SetPoint("TOPRIGHT" , 0, -10)
  pfQuest.mapButton:SetScript("OnShow", function()
    pfQuest.mapButton.current = tonumber(pfQuest_config["trackingmethod"])
    pfQuest.mapButton:UpdateMenu()
  end)

  pfQuest.mapButton.point = "TOPLEFT"
  pfQuest.mapButton.relativePoint = "BOTTOMLEFT"

  function pfQuest.mapButton:UpdateMenu()
    local function CreateEntries()
      local info = {}
      info.text = "所有任务"
      info.checked = false
      info.func = function()
        UIDropDownMenu_SetSelectedID(pfQuest.mapButton, this:GetID(), 0)
        pfQuest_config["trackingmethod"] = this:GetID()
        ResetAll()
      end
      UIDropDownMenu_AddButton(info)

      local info = {}
      info.text = "监视的任务"
      info.checked = false
      info.func = function()
        UIDropDownMenu_SetSelectedID(pfQuest.mapButton, this:GetID(), 0)
        pfQuest_config["trackingmethod"] = this:GetID()
        ResetAll()
      end
      UIDropDownMenu_AddButton(info)

      local info = {}
      info.text = "手动选择"
      info.checked = false
      info.func = function()
        UIDropDownMenu_SetSelectedID(pfQuest.mapButton, this:GetID(), 0)
        pfQuest_config["trackingmethod"] = this:GetID()
        ResetAll()
      end
      UIDropDownMenu_AddButton(info)

      local info = {}
      info.text = "隐藏任务"
      info.checked = false
      info.func = function()
        UIDropDownMenu_SetSelectedID(pfQuest.mapButton, this:GetID(), 0)
        pfQuest_config["trackingmethod"] = this:GetID()
        pfMap:DeleteNode("PFQUEST")
        pfMap:UpdateNodes()
      end
      UIDropDownMenu_AddButton(info)
    end

    UIDropDownMenu_Initialize(pfQuest.mapButton, CreateEntries)
    UIDropDownMenu_SetWidth(120, pfQuest.mapButton)
    UIDropDownMenu_SetButtonWidth(125, pfQuest.mapButton)
    UIDropDownMenu_JustifyText("RIGHT", pfQuest.mapButton)
    UIDropDownMenu_SetSelectedID(pfQuest.mapButton, pfQuest.mapButton.current)
  end
end

local pfHookRemoveQuestWatch = RemoveQuestWatch
RemoveQuestWatch = function(questIndex)
  pfQuest:Show()
  pfQuest.hadUpdate = true
  return pfHookRemoveQuestWatch(questIndex)
end

local pfHookAddQuestWatch = AddQuestWatch
AddQuestWatch = function(questIndex)
  pfQuest:Show()
  pfQuest.hadUpdate = true
  return pfHookAddQuestWatch(questIndex)
end

pfQuest = CreateFrame("Frame")
pfQuest:RegisterEvent("QUEST_LOG_UPDATE")
pfQuest:RegisterEvent("QUEST_FINISHED")
pfQuest:RegisterEvent("QUEST_WATCH_UPDATE")
pfQuest:RegisterEvent("PLAYER_LEVEL_UP")
pfQuest:RegisterEvent("ADDON_LOADED")

pfQuest:SetScript("OnEvent", function()
  if event == "ADDON_LOADED" then
    if arg1 == "pfQuest" then
      if tostring(GetAddOnMetadata("pfQuest", "Version")) == "NORELEASE" then
        DEFAULT_CHAT_FRAME:AddMessage("|cff33ffcc警告:|r 你正在使用一个pfQuest的最新测试版本, 可能会导致更高的内存占有率和加载时间. 如果有任何使用上的bug,请用会官方正式版: http://www.60addons.com/topic/665-1")
      end

      AddQuestLogIntegration()
      AddWorldMapIntegration()

      ResetAll()
    else
      return
    end
  else
    -- never update in manual and hidden mode
    if pfQuest_config["trackingmethod"] == 3 then return end
    if pfQuest_config["trackingmethod"] == 4 then return end
    if event == "PLAYER_LEVEL_UP" then
      pfMap:DeleteNode("PFQUEST")
      pfMap:UpdateNodes()

      questTrackedCache = {}
      pfQuest:Show()
    elseif event == "QUEST_FINISHED" then
      UpdateQuestLogID(nil)
    elseif not arg1 or type(arg1) == "number" then
      UpdateQuestLogID(arg1)
    end
  end
end)

pfQuest:SetScript("OnShow", function()
  this.hadUpdate = nil
end)

pfQuest:SetScript("OnUpdate", function()
  if pfQuest_config["trackingmethod"] == 4 then
    this:Hide()
    return
  end

  this.scan = this.scan and this.scan + 1 or 1
  this.smax = GetNumQuestLogEntries()

  if pfQuest.mapUpdate then
    pfQuest.mapUpdate:Show()
    pfQuest.mapUpdate:SetText("任务更新 [ " .. this.scan .. " / " .. this.smax .. " ]")
  end

  if UpdateQuestLogID(this.scan) then
    this.hadUpdate = true
  end

  if this.scan >= this.smax then
    if this.hadUpdate or this.smax == 0 then
      if pfQuest_config["allquestgivers"] == "1" then
        local meta = { ["addon"] = "PFQUEST" }
        pfDatabase:SearchQuests(meta)
      end

      pfMap:UpdateNodes()
    end

    this:Hide()
    this.scan = nil

    if pfQuest.mapUpdate then
      pfQuest.mapUpdate:Hide()
    end
  end
end)

local HookAbandonQuest = AbandonQuest
function AbandonQuest()
  local quest = GetAbandonQuestName()
  questLogCache[quest] = nil
  pfQuest_history[quest] = nil
  questTrackedCache[quest] = "ABANDONED"
  pfMap:DeleteNode("PFQUEST", quest)
  HookAbandonQuest()
end

-- questlink integration
local pfHookQuestLogTitleButton_OnClick = QuestLogTitleButton_OnClick
function QuestLogTitleButton_OnClick(button)
	local questIndex = this:GetID() + FauxScrollFrame_GetOffset(QuestLogListScrollFrame);
  local questName, questLevel = GetQuestLogTitle(questIndex)
	if IsShiftKeyDown() and not this.isHeader then
		if ( ChatFrameEditBox:IsVisible() ) then
      ChatFrameEditBox:Insert("|cffffff00|Hquest:0:" .. questLevel .. ":0:0|h[" .. questName .. "]|h|r")
      QuestLog_SetSelection(questIndex)
      QuestLog_Update();
      return
    end
  end

  pfHookQuestLogTitleButton_OnClick(button)
end

local pfQuestHookSetItemRef = SetItemRef
function SetItemRef(link, text, button)
  local isQuest, _, id    = string.find(link, "quest:(%d+):.*")
  local isQuest2, _, _   = string.find(link, "quest2:.*")
  local _, _, questLevel = string.find(link, "quest:%d+:(%d+)")

  local playerHasQuest = false

  if isQuest or isQuest2 then
    local quests = pfDatabase["quests"]

    ShowUIPanel(ItemRefTooltip)
    ItemRefTooltip:SetOwner(UIParent, "ANCHOR_PRESERVE")

    local hasTitle, _, questTitle = string.find(text, ".*|h%[(.*)%]|h.*")
    if hasTitle then ItemRefTooltip:AddLine(questTitle, 1,1,0) end

    -- scan for questdb entry
    local qname = nil
    for name, tab in pairs(quests) do
      local f, t, questname, _ = strfind(name, "(.*),.*")
      if questname == questTitle then
        qname = name
        if id and tab.id == id then break end
      end
    end

    -- add database entries if existing
    if quests[qname] then
      if quests[qname]["obj"] then
        ItemRefTooltip:AddLine(quests[qname]["obj"], 1,1,1,true)
      end

      if quests[qname]["log"] and quests[qname]["objectives"] then
        ItemRefTooltip:AddLine(" ", 0,0,0)
      end

      if quests[qname]["log"] then
        ItemRefTooltip:AddLine(quests[qname]["log"], .6,1,.9,true)
      end
    end

    -- check questlog for active quest
    for i=1, GetNumQuestLogEntries() do
      if GetQuestLogTitle(i) == questTitle then
        playerHasQuest = true
      end
    end

    if playerHasQuest == false then
      ItemRefTooltip:AddLine("你没有这个任务.", 1, .8, .8)
    end

    -- extract quest level
    if questLevel and questLevel ~= 0 and questLevel ~= "0" then
      local color = GetDifficultyColor(questLevel)
      ItemRefTooltip:AddLine("任务等级 " .. questLevel, color.r, color.g, color.b)
    end

    ItemRefTooltip:Show()
  else
    pfQuestHookSetItemRef(link, text, button)
  end
end

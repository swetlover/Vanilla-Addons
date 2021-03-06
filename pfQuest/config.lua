pfQuest_history = {}
pfQuest_colors = {}
pfQuest_config = {}

-- default config
pfQuest_defconfig = {
  ["trackingmethod"] = 1,
  ["allquestgivers"] = "1",
  ["currentquestgivers"] = "1", -- show quest givers for active quests
  ["showlowlevel"] = "1",
  ["minimapnodes"] = "1", -- hide all minimap entries
  ["questlogbuttons"] = "1", -- shows buttons inside the questlog
  ["worldmapmenu"] = "1", -- shows the dropdown selection in worldmap
  ["showids"] = "0",
  ["worldmaptransp"] = "1.0",
  ["minimaptransp"] = "1.0",
  ["mindropchance"] = "0",
  ["colorbyspawn"] = "1",
}

local function LoadConfig()
  if not pfQuest_config then pfQuest_config = {} end

  for key, val in pairs(pfQuest_defconfig) do
    if not pfQuest_config[key] then
      pfQuest_config[key] = val
    end
  end
end

local function CreateConfigEntry(config, description, type)
  -- basic frame
  local frame = getglobal("pfQuestConfig" .. config) or CreateFrame("Frame", "pfQuestConfig" .. config, pfQuestConfig)
  frame:SetWidth(280)
  frame:SetHeight(25)
  frame:SetPoint("TOP", 0, -pfQuestConfig.vpos)

  -- caption
  frame.caption = frame.caption or frame:CreateFontString("Status", "LOW", "GameFontWhite")
  frame.caption:SetFont(pfUI.font_default, pfUI_config.global.font_size, "OUTLINE")
  frame.caption:SetPoint("LEFT", 20, 0)
  frame.caption:SetJustifyH("LEFT")
  frame.caption:SetText(description)

  -- checkbox
  if type == "checkbox" then
    frame.input = frame.input or CreateFrame("CheckButton", nil, frame, "UICheckButtonTemplate")
    frame.input:SetNormalTexture("")
    frame.input:SetPushedTexture("")
    frame.input:SetHighlightTexture("")
    pfUI.api.CreateBackdrop(frame.input, nil, true)

    frame.input:SetWidth(12)
    frame.input:SetHeight(12)
    frame.input:SetPoint("RIGHT" , -20, 0)

    frame.input.config = config
    if pfQuest_config[config] == "1" then
      frame.input:SetChecked()
    end

    frame.input:SetScript("OnClick", function ()
      if this:GetChecked() then
        pfQuest_config[this.config] = "1"
      else
        pfQuest_config[this.config] = "0"
      end
    end)

  elseif type == "text" then
    -- input field
    frame.input = frame.input or CreateFrame("EditBox", nil, frame)
    frame.input:SetTextColor(.2,1,.8,1)
    frame.input:SetJustifyH("RIGHT")

    frame.input:SetWidth(50)
    frame.input:SetHeight(20)
    frame.input:SetPoint("RIGHT" , -20, 0)
    frame.input:SetFontObject(GameFontNormal)
    frame.input:SetAutoFocus(false)
    frame.input:SetScript("OnEscapePressed", function(self)
      this:ClearFocus()
    end)

    frame.input.config = config
    frame.input:SetText(pfQuest_config[config])

    frame.input:SetScript("OnTextChanged", function(self)
      pfQuest_config[this.config] = this:GetText()
    end)
  end

  pfQuestConfig.vpos = pfQuestConfig.vpos + 30
end

pfQuestConfig = CreateFrame("Frame", "pfQuestConfig", UIParent)
pfQuestConfig:Hide()
pfQuestConfig:SetWidth(280)
pfQuestConfig:SetHeight(385)
pfQuestConfig:SetPoint("CENTER", 0, 0)
pfQuestConfig:SetFrameStrata("TOOLTIP")
pfQuestConfig:SetMovable(true)
pfQuestConfig:EnableMouse(true)
pfQuestConfig.vpos = 45
pfQuestConfig:SetScript("OnMouseDown",function()
  this:StartMoving()
end)

pfQuestConfig:SetScript("OnMouseUp",function()
  this:StopMovingOrSizing()
end)

pfUI.api.CreateBackdrop(pfQuestConfig, nil, true, 0.75)
table.insert(UISpecialFrames, "pfQuestConfig")

pfQuestConfig.title = pfQuestConfig:CreateFontString("Status", "LOW", "GameFontNormal")
pfQuestConfig.title:SetFontObject(GameFontWhite)
pfQuestConfig.title:SetPoint("TOP", pfQuestConfig, "TOP", 0, -8)
pfQuestConfig.title:SetJustifyH("LEFT")
pfQuestConfig.title:SetFont(pfUI.font_default, 14)
pfQuestConfig.title:SetText("|cff33ffccpf|rQuest 配置 - 3.0测试版")

pfQuestConfig.close = CreateFrame("Button", "pfQuestConfigClose", pfQuestConfig)
pfQuestConfig.close:SetPoint("TOPRIGHT", -5, -5)
pfQuestConfig.close:SetHeight(12)
pfQuestConfig.close:SetWidth(12)
pfQuestConfig.close.texture = pfQuestConfig.close:CreateTexture("pfQuestionDialogCloseTex")
pfQuestConfig.close.texture:SetTexture("Interface\\AddOns\\pfQuest\\compat\\close")
pfQuestConfig.close.texture:ClearAllPoints()
pfQuestConfig.close.texture:SetAllPoints(pfQuestConfig.close)
pfQuestConfig.close.texture:SetVertexColor(1,.25,.25,1)
pfUI.api.SkinButton(pfQuestConfig.close, 1, .5, .5)
pfQuestConfig.close:SetScript("OnClick", function()
 this:GetParent():Hide()
end)

pfQuestConfig:RegisterEvent("ADDON_LOADED")
pfQuestConfig:SetScript("OnEvent", function()
  if arg1 == "pfQuest" then
    LoadConfig()

    CreateConfigEntry("allquestgivers",      "显示可接取的任务给予者",     "checkbox")
    CreateConfigEntry("currentquestgivers",  "显示当前任务给予者节点",  "checkbox")
    CreateConfigEntry("showlowlevel",        "显示低等级任务给予者节点", "checkbox")
    CreateConfigEntry("minimapnodes",        "显示小地图节点",             "checkbox")
    CreateConfigEntry("questlogbuttons",     "显示任务日志",          "checkbox")
    CreateConfigEntry("worldmapmenu",        "显示世界地图菜单",             "checkbox")
    CreateConfigEntry("showids",             "显示ID",                       "checkbox")
    CreateConfigEntry("colorbyspawn",        "着色地图节点",       "checkbox")
    CreateConfigEntry("worldmaptransp",      "世界地图节点透明度",     "text")
    CreateConfigEntry("minimaptransp",       "小地图节点透明度",      "text")
    CreateConfigEntry("mindropchance",       "最低掉落率",            "text")
  end
end)

pfQuestConfig.clean = CreateFrame("Button", "pfQuestConfigReload", pfQuestConfig)
pfQuestConfig.clean:SetWidth(260)
pfQuestConfig.clean:SetHeight(30)
pfQuestConfig.clean:SetPoint("BOTTOM", 0, 10)
pfQuestConfig.clean:SetScript("OnClick", function()
  ReloadUI()
end)
pfQuestConfig.clean.text = pfQuestConfig.clean:CreateFontString("Caption", "LOW", "GameFontWhite")
pfQuestConfig.clean.text:SetAllPoints(pfQuestConfig.clean)
pfQuestConfig.clean.text:SetFont(pfUI.font_default, pfUI_config.global.font_size, "OUTLINE")
pfQuestConfig.clean.text:SetText("退出 & 重载UI")
pfUI.api.SkinButton(pfQuestConfig.clean)

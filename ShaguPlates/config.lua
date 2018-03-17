local backdrop = {
  bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", tile = true, tileSize = 32,
  insets = {left = 0, right = 0, top = 0, bottom = 0},
}

local checkbox = {
  ["blueshaman"]    = "开启蓝色萨满职业修正",
  ["clickthrough"]  = "显示鼠标点击",
  ["showdebuffs"]   = "显示Debuffs在目标姓名板",
  ["showcastbar"]   = "显示施法条",
  ["spellname"]     = "显示施法条法术名字",
  ["players"]       = "只显示玩家姓名板",
  ["showhp"]        = "显示血量",
  ["rightclick"]    = "启用右键点击姓名板目标",
  ["enemyclassc"]   = "启用敌对职业颜色",
  ["friendclassc"]  = "启用友方职业颜色",
  ["overlap"]       = "姓名板重叠覆盖",
  ["critters"]      = "隐藏小动物",
}

local text = {
  ["clickthreshold"] = "右键点击阀值",
  ["vpos"]           = "垂直偏移",
  ["raidiconsize"]   = "团队图标大小",
  ["width"]          = "血条宽度",
  ["heighthealth"]   = "血条高度",
  ["heightcast"]     = "施法条高度",
  ["fontsize"]       = "字体大小",
}

-- config
pfConfigCreate = CreateFrame("Frame", nil, UIParent)
pfConfigCreate:RegisterEvent("VARIABLES_LOADED")

function pfConfigCreate:ResetConfig()
  pfNameplates_config = { }
  pfNameplates_config["blueshaman"] = "1"
  pfNameplates_config["clickthrough"] = "0"
  pfNameplates_config["raidiconsize"] = "16"
  pfNameplates_config["showdebuffs"] = "1"
  pfNameplates_config["showcastbar"] = "1"
  pfNameplates_config["spellname"] = "1"
  pfNameplates_config["players"] = "0"
  pfNameplates_config["showhp"] = "1"
  pfNameplates_config["vpos"] = "-10"
  pfNameplates_config["rightclick"] = "1"
  pfNameplates_config["clickthreshold"] = ".5"
  pfNameplates_config["enemyclassc"] = "1"
  pfNameplates_config["friendclassc"] = "1"
  pfNameplates_config["width"] = "120"
  pfNameplates_config["heighthealth"] = "8"
  pfNameplates_config["heightcast"] = "8"
  pfNameplates_config["fontsize"] = "12"
  pfNameplates_config["overlap"] = "1"
  pfNameplates_config["critters"] = "0"
end

pfConfigCreate:SetScript("OnEvent", function()
  if not pfNameplates_config then
    pfConfigCreate:ResetConfig()
  end

  ShaguPlatesConfig:Initialize()

  if pfNameplates_config.blueshaman == "1" then
    RAID_CLASS_COLORS["SHAMAN"] = { r = 0.14, g = 0.35, b = 1.0, colorStr = "ff0070de" }
  end
end)

ShaguPlatesConfig = ShaguPlatesConfig or CreateFrame("Frame", "ShaguPlatesConfig", UIParent)
function ShaguPlatesConfig:Initialize()
  ShaguPlatesConfig:Hide()
  ShaguPlatesConfig:SetBackdrop(backdrop)
  ShaguPlatesConfig:SetBackdropColor(0,0,0,1)
  ShaguPlatesConfig:SetWidth(400)
  ShaguPlatesConfig:SetHeight(640)
  ShaguPlatesConfig:SetPoint("CENTER", 0, 0)
  ShaguPlatesConfig:SetMovable(true)
  ShaguPlatesConfig:EnableMouse(true)
  ShaguPlatesConfig:SetScript("OnMouseDown",function()
    ShaguPlatesConfig:StartMoving()
  end)

  ShaguPlatesConfig:SetScript("OnMouseUp",function()
    ShaguPlatesConfig:StopMovingOrSizing()
  end)

  ShaguPlatesConfig.vpos = 30

  ShaguPlatesConfig.title = CreateFrame("Frame", nil, ShaguPlatesConfig)
  ShaguPlatesConfig.title:SetPoint("TOP", 0, -2);
  ShaguPlatesConfig.title:SetWidth(396);
  ShaguPlatesConfig.title:SetHeight(25);
  ShaguPlatesConfig.title.tex = ShaguPlatesConfig.title:CreateTexture("LOW");
  ShaguPlatesConfig.title.tex:SetAllPoints();
  ShaguPlatesConfig.title.tex:SetTexture(0,0,0,.5);

  ShaguPlatesConfig.caption = ShaguPlatesConfig.caption or ShaguPlatesConfig.title:CreateFontString("Status", "LOW", "GameFontWhite")
  ShaguPlatesConfig.caption:SetPoint("TOP", 0, -5)
  ShaguPlatesConfig.caption:SetJustifyH("CENTER")
  ShaguPlatesConfig.caption:SetText("ShaguPlates姓名板")
  ShaguPlatesConfig.caption:SetFont("Fonts\\ARHei.ttf", 14)
  ShaguPlatesConfig.caption:SetTextColor(.2,1,.8,1)

  for config, description in pairs(checkbox) do
    ShaguPlatesConfig:CreateEntry(config, description, "checkbox")
  end

  for config, description in pairs(text) do
    ShaguPlatesConfig:CreateEntry(config, description, "text")
  end

  ShaguPlatesConfig.reload = CreateFrame("Button", nil, ShaguPlatesConfig, "UIPanelButtonTemplate")
  ShaguPlatesConfig.reload:SetWidth(150)
  ShaguPlatesConfig.reload:SetHeight(20)
  ShaguPlatesConfig.reload:SetNormalTexture(nil)
  ShaguPlatesConfig.reload:SetHighlightTexture(nil)
  ShaguPlatesConfig.reload:SetPushedTexture(nil)
  ShaguPlatesConfig.reload:SetDisabledTexture(nil)
  ShaguPlatesConfig.reload:SetBackdrop(backdrop)
  ShaguPlatesConfig.reload:SetBackdropColor(0,0,0,1)
  ShaguPlatesConfig.reload:SetPoint("BOTTOMRIGHT", -10, 10)
  ShaguPlatesConfig.reload:SetText("保存")
  ShaguPlatesConfig.reload:SetScript("OnClick", function()
    ReloadUI()
  end)

  ShaguPlatesConfig.reset = CreateFrame("Button", nil, ShaguPlatesConfig, "UIPanelButtonTemplate")
  ShaguPlatesConfig.reset:SetWidth(150)
  ShaguPlatesConfig.reset:SetHeight(20)
  ShaguPlatesConfig.reset:SetNormalTexture(nil)
  ShaguPlatesConfig.reset:SetHighlightTexture(nil)
  ShaguPlatesConfig.reset:SetPushedTexture(nil)
  ShaguPlatesConfig.reset:SetDisabledTexture(nil)
  ShaguPlatesConfig.reset:SetBackdrop(backdrop)
  ShaguPlatesConfig.reset:SetBackdropColor(0,0,0,1)
  ShaguPlatesConfig.reset:SetPoint("BOTTOMLEFT", 10, 10)
  ShaguPlatesConfig.reset:SetText("复位")
  ShaguPlatesConfig.reset:SetScript("OnClick", function()
    pfNameplates_config = nil
    ReloadUI()
  end)
end

function ShaguPlatesConfig:CreateEntry(config, description, type)
  -- sanity check
  if not pfNameplates_config[config] then
    pfConfigCreate:ResetConfig()
  end

  -- basic frame
  local frame = getglobal("SPC" .. config) or CreateFrame("Frame", "SPC" .. config, ShaguPlatesConfig)
  frame:SetWidth(400)
  frame:SetHeight(25)
  frame:SetPoint("TOP", 0, -ShaguPlatesConfig.vpos)

  -- caption
  frame.caption = frame.caption or frame:CreateFontString("Status", "LOW", "GameFontWhite")
  frame.caption:SetFont("Fonts\\ARHei.ttf", 14)
  frame.caption:SetPoint("LEFT", 20, 0)
  frame.caption:SetJustifyH("LEFT")
  frame.caption:SetText(description)

  -- checkbox
  if type == "checkbox" then
    frame.input = frame.input or CreateFrame("CheckButton", nil, frame, "UICheckButtonTemplate")
    frame.input:SetWidth(24)
    frame.input:SetHeight(24)
    frame.input:SetPoint("RIGHT" , -20, 0)

    frame.input.config = config
    if pfNameplates_config[config] == "1" then
      frame.input:SetChecked()
    end

    frame.input:SetScript("OnClick", function ()
      if this:GetChecked() then
        pfNameplates_config[this.config] = "1"
      else
        pfNameplates_config[this.config] = "0"
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
    frame.input:SetText(pfNameplates_config[config])

    frame.input:SetScript("OnTextChanged", function(self)
      pfNameplates_config[this.config] = this:GetText()
    end)
  end

  ShaguPlatesConfig.vpos = ShaguPlatesConfig.vpos + 30
end

SLASH_SHAGUPLATES1 = '/shaguplates'
SLASH_SHAGUPLATES2 = '/sp'

function SlashCmdList.SHAGUPLATES(msg)
  if ShaguPlatesConfig:IsShown() then
    ShaguPlatesConfig:Hide()
  else
    ShaguPlatesConfig:Show()
  end
end

local Tablet = AceLibrary("Tablet-2.0")
local L = AceLibrary("AceLocale-2.2"):new("Cartographer_MiniMapCoords")
local AceOO = AceLibrary("AceOO-2.0")

L:RegisterTranslations("enUS", function() return {
	["MiniMap Coords"] = true,
	["Show Background"] = true,
	["Show Border"] = true,
	["Reset Position"] = true,
	["Background color"] = true,
	["The color of the background frame behind coordinates"] = true,
	["Text color"] = true,
	["The color of the coordinates"] = true,
	["High precision"] = true,
	["Show high precision coordinates"] = true,
} end)

L:RegisterTranslations("zhCN", function() return {
	["MiniMap Coords"] = "迷你地图坐标",
	["Show Background"] = "显示背景",
	["Show Border"] = "显示边框",
	["Reset Position"] = "复位位置",
	["Background color"] = "背景颜色",
	["The color of the background frame behind coordinates"] = "背景框坐标后面的颜色",
	["Text color"] = "文本颜色",
	["The color of the coordinates"] = "坐标的颜色",
	["High precision"] = "高精度",
	["Show high precision coordinates"] = "显示高精度坐标",
} end)

L:RegisterTranslations("esES", function() return {
	["MiniMap Coords"] = "Coordenadas MiniMapa",
	["Show Background"] = "Mostrar Fondo",
	["Show Border"] = "Mostrar Borde",
	["Reset Position"] = "Reiniciar Posición",
	["Background color"] = "Color de Fondo",
	["The color of the background frame behind coordinates"] = "El color del marco de fondo trás las coordenadas",
	["Text color"] = "Color Texto",
	["The color of the coordinates"] = "El color de las coordenadas",
	["High precision"] = "Precisión Alta",
	["Show high precision coordinates"] = "Muestra coordenadas con alta precisión",
} end)

Cartographer_MiniMapCoords = Cartographer:NewModule("MiniMapCoords", "AceConsole-2.0", "AceEvent-2.0")
local select = select or 
function(index, ...)
  assert(tonumber(index) or index == "#", "Invalid argument #1 to select(). Usage: select(\"#\"|int,...)")
  if index == "#" then return arg.n end
  local sub = { }
  for i = index, arg.n do
    sub[table.getn(sub) + 1] = arg[i]
  end
  return unpack(sub)
end

local Cartographer_MiniMapCoordsFrame

function Cartographer_MiniMapCoords:OnInitialize()
	-- self.name = L["MiniMap Coords"]
	-- self.title = L["MiniMap Coords"]

	self.db = Cartographer:AcquireDBNamespace("MiniMapCoords")
  Cartographer:RegisterDefaults("MiniMapCoords", "profile", {
    showBackground = true,
    showBorder = true,
    point = "BOTTOM",
    relto = "Minimap",
    relpoint = "BOTTOM",
    offsetX = 0,
    offsetY = 0,
    bgR = 0,
    bgG = 0,
    bgB = 0,
    bgA = 1,
    txtR = 1,
    txtG = 0.82,
    txtB = 0,
    txtA = 1,
    txtSize = 1,
    highPrecision = true,
  })
	-- menu options
	local aceopts = {}
	aceopts.toggle = {
		name = Cartographer.L["Active"],
		desc = Cartographer.L["Suspend/resume this module."],
		type  = 'toggle',
		order = -1,
		get   = function() return Cartographer:IsModuleActive(self) end,
		set   = function() Cartographer:ToggleModuleActive(self) end
	}
  aceopts.bBackground = {
    name = L["Show Background"],
    desc = L["Show Background"],
    type = "toggle",
    order = 2,
    get = "GetBackground",
    set = "SetBackground"
  }
  aceopts.bgColor = {
    name = L["Background color"],
    desc = L["The color of the background frame behind coordinates"],
    type = "color",
    order = 3,
    get = "GetBackgroundColor",
    set = "SetBackgroundColor",
    hasAlpha = true,
    disabled = function() return not Cartographer_MiniMapCoords:GetBackground() end
  }
  aceopts.color = {
    name = L["Text color"],
    desc = L["The color of the coordinates"],
    type = "color",
    order = 4,
    get = "GetTextColor",
    set = "SetTextColor",
    hasAlpha = true
  }
  aceopts.bBorder = {
    name = L["Show Border"],
    desc = L["Show Border"],
    type = "toggle",
    order = 5,
    get = "GetBorder",
    set = "SetBorder"
  }
  aceopts.highPrecision = {
    name = L["High precision"],
    desc = L["Show high precision coordinates"],
    type = "toggle",
    order = 6,
    get = "GetHighPrecision",
    set = "SetHighPrecision"
  }
  aceopts.cReset = {
    name = L["Reset Position"],
    desc = L["Reset Position"],
    type = "execute",
    order = 7,
    func = "ResetPosition"
  }
	Cartographer.options.args.MiniMapCoords = {
		name = L["MiniMap Coords"],
		desc = self.notes,
		type = 'group',
		args = aceopts,
		handler = self
	}
  AceLibrary("AceConsole-2.0"):InjectAceOptionsTable(self, Cartographer.options.args.MiniMapCoords)
  if not Cartographer_MiniMapCoordsDB then
    Cartographer_MiniMapCoordsDB = {}
  end
end

function Cartographer_MiniMapCoords:OnEnable()
	if self.frame then
		self.frame:Show()
	else
		self.frame = CreateFrame("Frame", "Cartographer_MiniMapCoordsFrame", UIParent)
		Cartographer_MiniMapCoordsFrame = self.frame

		self.frame:EnableMouse(true)
		self.frame:SetMovable(true)

		local relto = self.db.profile.relto
		if relto == "" then relto = "UIParent" end
		self.frame:SetPoint(self.db.profile.point, relto, self.db.profile.relpoint, self.db.profile.offsetX, self.db.profile.offsetY)

		self.frame:SetWidth(62)
		self.frame:SetHeight(22)
		self.frame:SetBackdrop({
			bgFile = "Interface/TutorialFrame/TutorialFrameBackground",
			edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
			tile = true,
			tileSize = 16,
			edgeSize = 16,
			insets = { left=5, right = 5, top = 5, bottom = 5 }
		})
		self.frame:SetBackdropColor(self.db.profile.bgR, self.db.profile.bgG, self.db.profile.bgB, self.db.profile.bgA)

		self.frame.loc = self.frame:CreateFontString(nil, "OVERLAY")
		self.frame.loc:SetWidth(62)
		self.frame.loc:SetHeight(22)
		self.frame.loc:SetPoint("TOPLEFT",self.frame, "TOPLEFT")
		self.frame.loc:SetJustifyH("CENTER")
		self.frame.loc:SetJustifyV("CENTER")
		self.frame.loc:SetFontObject(GameFontNormalSmall)
		self.frame.loc:SetTextColor(self.db.profile.txtR, self.db.profile.txtG, self.db.profile.txtB, self.db.profile.txtA)

		self.frame:SetScript("OnUpdate", Cartographer_MiniMapCoords_OnUpdate)
		self.frame:SetScript("OnDragStart",
			function()
				self.frame:StartMoving()
			end
		)
		self.frame:SetScript("OnDragStop",
			function()
				self.frame:StopMovingOrSizing()
				self:SavePosition()
			end
		)
		self.frame:RegisterForDrag("RightButton")
	end
	self:SetBackground(self:GetBackground())
	self:SetBorder(self:GetBorder())
end

local formatHighStr, formatLowStr
do
	if string.format("%.1f",1.1) == "1,1" then
		formatHighStr = "%.1f x %.1f"
		formatLowStr = "%.0f x %.0f"
	else
		formatHighStr = "%.1f, %.1f"
		formatLowStr = "%.0f, %.0f"
	end
end

local lastUpdate = 0
function Cartographer_MiniMapCoords_OnUpdate()
  local elapsed = arg1
  if WorldMapButton:IsVisible() then return end
  lastUpdate = lastUpdate+elapsed
  if lastUpdate <= TOOLTIP_UPDATE_TIME then return end
  lastUpdate = 0
	local x,y=GetPlayerMapPosition("player")
	local formatStr = Cartographer_MiniMapCoords.db.profile.highPrecision and formatHighStr or formatLowStr

	if x == 0 or y == 0 or ((IsInInstance() or Cartographer:GetCurrentInstance()) and select(2, IsInInstance()) ~= "pvp") then
		Cartographer_MiniMapCoordsFrame.loc:SetText("---")
	else
		Cartographer_MiniMapCoordsFrame.loc:SetText(string.format(formatStr, (x*100), (y*100)))
	end
end

function Cartographer_MiniMapCoords:GetBackground()
	return self.db.profile.showBackground
end

function Cartographer_MiniMapCoords:SetBackground(value)
	if value == nil then
		value = not self.db.profile.showBackground
	end
	self.db.profile.showBackground = value
	if self.db.profile.showBackground then
		self.frame:SetBackdropColor(1,1,1,1)
	else
		self.frame:SetBackdropColor(0,0,0,0)
	end
end


function Cartographer_MiniMapCoords:GetBorder()
	return self.db.profile.showBorder
end

function Cartographer_MiniMapCoords:SetBorder(value)
	if value == nil then
		value = not self.db.profile.showBorder
	end
	self.db.profile.showBorder = value
	if self.db.profile.showBorder then
		self.frame:SetBackdropBorderColor(1,1,1,1)
	else
		self.frame:SetBackdropBorderColor(0,0,0,0)
	end
end

function Cartographer_MiniMapCoords:OnDisable()
	self:UnregisterAllEvents()
	self.frame:Hide()
end

function Cartographer_MiniMapCoords:SavePosition()
	local point, _, relpoint, xoff, yoff = self.frame:GetPoint(1)
  local parent = self.frame:GetParent()
  local parentName = parent and parent.GetName and parent:GetName() or ""
	self.db.profile.point = point
	self.db.profile.relto = parentName
	self.db.profile.relpoint = relpoint
	self.db.profile.offsetX = xoff
	self.db.profile.offsetY = yoff
end

function Cartographer_MiniMapCoords:ResetPosition()
	self.db.profile.point = "BOTTOM"
	self.db.profile.relto = "Minimap"
	self.db.profile.relpoint = "BOTTOM"
	self.db.profile.offsetX = 0
	self.db.profile.offsetY = 0
	self.frame:SetPoint(self.db.profile.point, self.db.profile.relto, self.db.profile.relpoint, self.db.profile.offsetX, self.db.profile.offsetY)
end

function Cartographer_MiniMapCoords:GetBackgroundColor()
	return self.db.profile.bgR, self.db.profile.bgG, self.db.profile.bgB, self.db.profile.bgA
end

function Cartographer_MiniMapCoords:SetBackgroundColor(r, g, b, a)
	self.db.profile.bgR, self.db.profile.bgG, self.db.profile.bgB, self.db.profile.bgA = r, g, b, a
	self.frame:SetBackdropColor(r, g, b, a)
end

function Cartographer_MiniMapCoords:GetTextColor()
	return self.db.profile.txtR, self.db.profile.txtG, self.db.profile.txtB, self.db.profile.txtA
end

function Cartographer_MiniMapCoords:SetTextColor(r, g, b, a)
	self.db.profile.txtR, self.db.profile.txtG, self.db.profile.txtB, self.db.profile.txtA = r, g, b, a
	self.frame.loc:SetTextColor(r, g, b, a)
end

function Cartographer_MiniMapCoords:GetHighPrecision()
	return self.db.profile.highPrecision
end

function Cartographer_MiniMapCoords:SetHighPrecision(value)
	if value == nil then
		value = not self.db.profile.highPrecision
	end
	self.db.profile.highPrecision = value
end
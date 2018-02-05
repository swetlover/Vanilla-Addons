Automaton_Unshapeshift = Automaton:NewModule("解除形态", "AceEvent-2.0", "AceDebug-2.0")
local module = Automaton_Unshapeshift
local _, class = UnitClass("player")

--
--	NEED TRANSLATIONS for "Flight Form"
--
local L
local locale = GetLocale()
if locale == "esES" then
	L = {
		["Unshapeshift"] = "Cambio de Forma",
		["Automatically unshapeshift when you receive error messages about being shapeshifted"] = "Cancela tu cambio de forma autom\195\161ticamente cuando recibes errores sobre estar en cambio de forma",
		["Shadowform"] = "Shadowform",
		["SpiritWolf"] = "SpiritWolf",
	}
elseif locale == "frFR" then
	L = {
		["Unshapeshift"] = "Unshapeshift",
		["Automatically unshapeshift when you receive error messages about being shapeshifted"] = "Automatically unshapeshift when you receive error messages about being shapeshifted",
	}
elseif locale == "koKR" then
	L = {
		["Unshapeshift"] = "변신",
		["Automatically unshapeshift when you receive error messages about being shapeshifted"] = "변신 상태의 행동 불능 오류시 변신 상태를 해제합니다.",
	}
elseif locale == "deDE" then
	L = {
		["Unshapeshift"] = "Unshapeshift",
		["Automatically unshapeshift when you receive error messages about being shapeshifted"] = "Automatically unshapeshift when you receive error messages about being shapeshifted.",
	}
elseif locale == "zhTW" then
	L = {
		["Unshapeshift"] = "解除形態",
		["Automatically unshapeshift when you receive error messages about being shapeshifted"] = "當收到系統提示'處于某種形態'時自動解除形態",
	}
elseif locale == "zhCN" then
	L = {
		["Automatically unshapeshift when you receive error messages about being shapeshifted"] = "当收到系统提示关于形态错误的信息后，自动解除德鲁伊变形形态、萨满幽魂之狼形态、牧师暗影形态",
	}
end
L = setmetatable(L or {}, { __index = function(self, key) rawset(self, key, key) return key end })

module.description = L["Automatically unshapeshift when you receive error messages about being shapeshifted"]
module.options = {}

function module:OnInitialize()
	self:RegisterOptions(self.options)
end

function module:OnEnable()
	self:RegisterEvent("UI_ERROR_MESSAGE")
end

local messages = {
	[ERR_CANT_INTERACT_SHAPESHIFTED] = true,
	[ERR_NOT_WHILE_SHAPESHIFTED] = true,
	[SPELL_FAILED_NOT_SHAPESHIFT] = true,
	[SPELL_FAILED_ONLY_UNDERWATER] = true,
	[ERR_NO_ITEMS_WHILE_SHAPESHIFTED] = true,
	[SPELL_FAILED_NO_ITEMS_WHILE_SHAPESHIFTED] = true,
	[ERR_MOUNT_SHAPESHIFTED] = true,
}

function module:UI_ERROR_MESSAGE(msg)
	if class == "PRIEST" and msg == messages[ERR_CANT_INTERACT_WHILE_SHAPESHIFTED] then return end
	if messages[msg] then
		self:Unshapeshift()
	end
end

function module:Unshapeshift()
	if class == "DRUID" then
		for i = 1,GetNumShapeshiftForms() do
			local _, name, active = GetShapeshiftFormInfo(i)
			if active then
				CastShapeshiftForm(i)
				break;
			end
		end
	elseif class == "SHAMAN" then
		for i=0,15,1 do
			currBuffTex = GetPlayerBuffTexture(i);
			if (currBuffTex) then
				if string.find(string.lower(currBuffTex), "spell_nature_spiritwolf") then
					CancelPlayerBuff(i);
				end
			end
		end
	elseif class == "PRIEST" then
		for i=0,15,1 do
			currBuffTex = GetPlayerBuffTexture(i);
			if (currBuffTex) then
				if string.find(string.lower(currBuffTex), "spell_shadow_shadowform") then
					CancelPlayerBuff(i);
				end
			end
		end
	end
end
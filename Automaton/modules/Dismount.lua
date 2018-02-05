Automaton_Dismount = Automaton:NewModule("自动下马", "AceEvent-2.0", "AceDebug-2.0")
local semount = AceLibrary("SpecialEvents-Mount-2.0")
local seaura = AceLibrary("SpecialEvents-Aura-2.0")
local module = Automaton_Dismount

local L
local locale = GetLocale()
if locale == "esES" then
	L = {
		["Dismount"] = "Desmontar",
		["Automatically dismount when you receive the 'You are mounted' error"] = "Te desmonta autom\195\161ticamente cuando recibes el error 'Est\195\161s montado'",
	}
elseif locale == "koKR" then
	L = {
		["Dismount"] = "탈것 내림",
		["Automatically dismount when you receive the 'You are mounted' error"] = "'탈것 내리기' 오류시 자동으로 탈것에서 내립니다.",
	}
elseif locale == "zhTW" then
	L = {
		["Dismount"] = "自動下馬",
		["Automatically dismount when you receive the 'You are mounted' error"] = "施放技能或与飞行管理员对话时自动下马",
	}
elseif locale == "zhCN" then
	L = {
		["Automatically dismount when you receive the 'You are mounted' error"] = "施放技能或与飞行管理员对话时自动下马",
	}
end
L = setmetatable(L or {}, { __index = function(self, key) rawset(self, key, key) return key end })

module.description = L["Automatically dismount when you receive the 'You are mounted' error"]
module.options = {}

function module:OnInitialize()
    self.db = Automaton:AcquireDBNamespace("Dismount")
    Automaton:RegisterDefaults("Dismount", "profile", {
		disabled = true,
    })
	Automaton:SetDisabledAsDefault(self, "Dismount")
	self:RegisterOptions(self.options)
end

function module:OnEnable()
	self:RegisterEvent("UI_ERROR_MESSAGE")
	self:RegisterEvent("TAXIMAP_OPENED")
end

--不能下马的事件
local messages = {
	[ERR_TAXIPLAYERALREADYMOUNTED] = true,
	[ERR_ATTACK_MOUNTED] = true,
	[SPELL_FAILED_NOT_MOUNTED] = true,
	[SPELL_FAILED_OUT_OF_RANGE] = true,
	[ERR_OUT_OF_RANGE] = true,
	[ERR_PET_SPELL_OUT_OF_RANGE] = true,
}

--1.12没有Dismount()，自定义下马函数
function Dismount()

	Buffs = { "_mount_", --一般坐骑 
			  "spell_nature_swiftness", --圣骑士职业坐骑 
			  "_qirajicrystal_", --其拉共鸣水晶
			  --------SF特殊坐骑请玩家自行往下添加--------
			  "hunter_pet_turtle", --乌龟坐骑 
			  "warstomp", --斑马坐骑 
			  "bullrush", --幽灵狮鹫
			}
			
	for i=0,15,1 do
		currBuffTex = GetPlayerBuffTexture(i);
        if (currBuffTex) then
            for id, bufftype in pairs(Buffs) do
				if string.find(string.lower(currBuffTex), bufftype) then
					CancelPlayerBuff(i);
				end
            end
        end
    end
end

function module:UI_ERROR_MESSAGE(msg)
	if UnitOnTaxi("player") then return end
	if messages[msg] then Dismount() end
end

function Automaton_Dismount:TAXIMAP_OPENED()
	Dismount()
end
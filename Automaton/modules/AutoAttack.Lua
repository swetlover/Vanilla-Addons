local aura = AceLibrary("SpecialEvents-Aura-2.0")
local BS = AceLibrary("Babble-Spell-2.2")
local semount = AceLibrary("SpecialEvents-Mount-2.0")

local L = AceLibrary("AceLocale-2.2"):new("Automaton_Attack")
Automaton_Attack= Automaton:NewModule("Attack", "AceEvent-2.0", "AceDebug-2.0")

local buffs = {
	[BS["Stealth"]]					= true, -- 隐形
	[BS["Vanish"]]					= true, -- 消失
	[BS["Prowl"]]					= true, -- 隐藏
	[BS["Feign Death"]]				= true, -- 假死
	[BS["Shadowmeld"]]				= true, -- 影盾
	[BS["Food"]]					= true, -- 食品
	[BS["Drink"]]					= true, -- 饮料
	[BS["Enriched Manna Biscuit"]]	= true, --可口的魔法点心
	[BS["First Aid"]]				= true, -- 急救
}

local debuffs = {
	[BS["Gouge"]]				 = true, --凿击
	[BS["Sap"]]					 = true, --闷棍
	[BS["Seduction"]]			 = true, --诱惑
	[BS["Polymorph"]]			 = true, -- 变形术
	[BS["Polymorph: Turtle"]]	 = true, -- 变形术：龟
	[BS["Polymorph: Pig"]]		 = true, -- 变形术：猪 
	[BS["Tame Beast"]]			 = true, -- 驯服野兽
	[BS["Scare Beast"]]			 = true, -- 恐吓野兽
	[BS["Sleep"]]				 = true, -- 催眠术
	[BS["Hibernate"]]			 = true, -- 休眠
	[BS["Fear"]]				 = true, -- 恐惧
	[BS["Mind Control"]]		 = true, -- 精神控制
	[BS["Blind"]]				 = true, -- 失明
	[BS["Scatter Shot"]]		 = true, -- 驱散射击
	[BS["Enslave Demon"]]		 = true, -- 奴役恶魔
	[BS["Shackle Undead"]]		 = true, -- 束缚亡灵
	[BS["Reckless Charge"]]		 = true, -- 无畏冲锋
	[BS["Freezing Trap Effect"]] = true, -- 冰冻陷阱影响
	[BS["Intimidating Shout"]]	 = true, -- 破胆怒吼
	[BS["Cheap Shot"]]			 = true, -- 偷袭
}

L:RegisterTranslations("enUS", function() return {
	["Attack"] = true,
	["Automatically attack."] = true,
} end)

L:RegisterTranslations("zhCN", function() return {
	["Attack"] = "自动攻击",
	["Automatically attack."] = "在玩家施放技能后/被攻击后自动攻击目标，在目标存在某些可能被打断的状态下则取消自动攻击",
} end)

Automaton.options.args.Attack = {
	type = 'toggle',
	name = L["Attack"],
	desc = L["Automatically attack."],
	get = function() return Automaton:IsModuleActive("Attack") end,
	set = function(v) Automaton:ToggleModuleActive("Attack", v) end,
}

function Automaton_Attack:OnEnable()
	self:RegisterEvent("PLAYER_TARGET_CHANGED")--转换目标事件
	self:RegisterEvent("PLAYER_ENTER_COMBAT")
	self:RegisterEvent("PLAYER_LEAVE_COMBAT")
	self:RegisterEvent("PLAYER_REGEN_ENABLED")
	self:RegisterEvent("PLAYER_REGEN_DISABLED")
	self:RegisterEvent("START_AUTOREPEAT_SPELL")
	self:RegisterEvent("STOP_AUTOREPEAT_SPELL")
	
	self:RegisterEvent("SpecialEvents_AuraTargetChanged")
	self:RegisterEvent("SpecialEvents_PlayerBuffGained")
	self:RegisterEvent("SpecialEvents_PlayerBuffLost")
	self:RegisterEvent("SpecialEvents_UnitDebuffGained")
	self:RegisterEvent("SpecialEvents_UnitDebuffLost")
end

function Automaton_Attack:PLAYER_TARGET_CHANGED()
	if self:PlayerHasSpecialBuff() or self:TargetIsCrowdControlled() or not UnitCanAttack("player", "target") then
		self.selfImposedCombat = false
		self.attacking = false
		self:StopAttacking()
	elseif UnitIsTapped("player") then
		self.selfImposedCombat = true
	end
end

function Automaton_Attack:PLAYER_ENTER_COMBAT()
	if not self.inCombat and UnitCanAttack("player", "target") then
		self.selfImposedCombat = true
	end
	self.attacking = false
end

function Automaton_Attack:PLAYER_LEAVE_COMBAT()
	self.selfImposedCombat = false
	self:StopAttacking()
end

function Automaton_Attack:PLAYER_REGEN_ENABLED()
	self.inCombat = false
	self.selfImposedCombat = false
	self:StopAttacking()
end

function Automaton_Attack:PLAYER_REGEN_DISABLED()
	self.selfImposedCombat = false
	self.inCombat = true
	self:Check()
end

function Automaton_Attack:START_AUTOREPEAT_SPELL()
	self.autoRepeating = true
	self:StopAttacking()
end

function Automaton_Attack:STOP_AUTOREPEAT_SPELL()
	self.autoRepeating = false
	self:Check()
end

function Automaton_Attack:SpecialEvents_AuraTargetChanged()
	self:Check()
end

function Automaton_Attack:SpecialEvents_PlayerBuffGained(buff)
	if buffs[buff] then
		self:StopAttacking()
	end
end

function Automaton_Attack:SpecialEvents_PlayerBuffLost(buff)
	if buffs[buff] then
		self:Check()
	end
end

function Automaton_Attack:SpecialEvents_UnitDebuffGained(unitID, debuff)
	if unitID == "target" and debuffs[debuff] then
		self:StopAttacking()
	end
end

function Automaton_Attack:SpecialEvents_UnitDebuffLost(unitID, debuff)
	if unitID == "target" and debuffs[debuff] then
		self:Check()
	end
end

function Automaton_Attack:Check()
	local mount = semount:PlayerMounted()
	if (not self.inCombat and not self.selfImposedCombat) or self.autoRepeating or not UnitExists("target") or UnitIsUnit("target", "player") or UnitIsDeadOrGhost("target") or not UnitCanAttack("player", "target") or UnitIsFriend("player", "target") or self:PlayerHasSpecialBuff() or self:TargetIsCrowdControlled() or mount then
		self:StopAttacking()
	else
		self:StartAttacking()
	end
end

function Automaton_Attack:StopAttacking()
	if self.attacking then
		AttackTarget()
	end
end

function Automaton_Attack:StartAttacking()
	if not self.attacking then
		AttackTarget()
	end
end

function Automaton_Attack:PlayerHasSpecialBuff()
	for buff in pairs(buffs) do
		if aura:UnitHasBuff("player", buff) then
			return true
		end
	end
	return false
end

function Automaton_Attack:TargetIsCrowdControlled()
	for debuff in pairs(debuffs) do
		if aura:UnitHasDebuff("target", debuff) then
			return true
		end
	end
	return false
end
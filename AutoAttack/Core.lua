local aura = AceLibrary("SpecialEvents-Aura-2.0")

local buffs = {
	["潜行"] = true,
	["消失"] = true,
	["潜行"] = true,
	["假死"] = true,
	["影遁"] = true,
	["进食"] = true,
	["喝水"] = true,
	["可口的魔法点心"] = true,
	["急救"] = true,
	["白马"] = true,
	["棕马"] = true,
	["黑马"] = true,
	["褐色马"] = true,
	["杂色马"] = true,
	["栗色马"] = true,
	["骸骨战马"] = true,
	["召唤军马"] = true,
	["召唤战马"] = true,
	["迅捷白马"] = true,
	["迅捷棕马"] = true,
	["骷髅马"] = true,
	["迅捷褐色马"] = true,
	["召唤地狱战马"] = true,
	["红色骸骨军马"] = true,
	["蓝色骸骨军马"] = true,
	["棕色骸骨军马"] = true,
	["绿色骸骨战马"] = true,
	["黑色骷髅战马"] = true,
	["红色骷髅战马"] = true,
	["召唤恐惧战马"] = true,
	["紫色骷髅战马"] = true,
	["灰色科多兽"] = true,
	["棕色科多兽"] = true,
	["绿色科多兽"] = true,
	["蓝色科多兽"] = true,
	["黑色作战科多兽"] = true,
	["迅捷白色科多兽"] = true,
	["迅捷灰色科多兽"] = true,
	["迅捷棕色科多兽"] = true,
	["绿色迅猛龙"] = true,
	["白色迅猛龙"] = true,
	["青色迅猛龙"] = true,
	["黑色迅猛龙 "] = true,
	["紫色迅猛龙"] = true,
    ["红色迅猛龙"] = true,
	["黑色作战迅猛龙"] = true,
	["迅捷蓝色迅猛龙"] = true,
	["迅捷绿色迅猛龙"] = true,
	["迅捷橙色迅猛龙"] = true,
	["拉扎什迅猛龙"] = true,
	["灰山羊"] = true,
	["黑山羊"] = true,
	["青山羊"] = true,
	["白山羊"] = true,
	["棕山羊"] = true,
	["霜山羊"] = true,
	["迅捷棕山羊"] = true,
	["迅捷灰山羊"] = true,
	["迅捷白山羊"] = true,
	["红色机械陆行鸟"] = true,
	["蓝色机械陆行鸟"] = true,
	["白色机械陆行鸟"] = true,
	["绿色机械陆行鸟"] = true,
	["钢质机械陆行鸟"] = true,
	["紫色机械陆行鸟"] = true,
	["迅捷绿色机械陆行鸟"] = true,
	["迅捷白色机械陆行鸟"] = true,
	["迅捷黄色机械陆行鸟"] = true,
	["黑色作战机械陆行鸟"] = true,
	["夜刃豹"] = true,
	["霜刃豹"] = true,
	["条纹霜刃豹"] = true,
	["斑点霜刃豹"] = true,
	["条纹夜刃豹"] = true,
	["冬泉霜刃豹"] = true,
	["迅捷雾刃豹"] = true,
	["迅捷晨刃豹"] = true,
	["迅捷霜刃豹"] = true,
	["迅捷雷刃豹"] = true,
	["迅捷晨刃豹"] = true,
	["灰狼"] = true,
	["黑狼"] = true,
	["赤狼"] = true,
	["棕狼"] = true,
	["冬狼"] = true,
	["迅捷森林狼"] = true,
	["迅捷灰狼"] = true,
	["迅捷棕狼"] = true,
	["黑色战狼"] = true,
	["迅捷祖利安猛虎"] = true,
	["召唤黑色其拉作战坦克"] = true,
	["召唤蓝色其拉作战坦克"] = true,
	["召唤红色其拉作战坦克"] = true,
    ["召唤黄色其拉作战坦克"] = true,
    ["召唤绿色其拉作战坦克"] = true,


}

local debuffs = {
	["凿击"] = true,
	["闷棍"] = true,
	["诱惑"] = true,
	["变形术"] = true,
	["驯服野兽"] = true,
	["恐吓野兽"] = true,
	["催眠术"] = true,
	["休眠"] = true,
	["恐惧术"] = true,
	["精神控制"] = true,
	["致盲"] = true,
	["驱散射击"] = true,
	["奴役恶魔"] = true,
	["束缚亡灵"] = true,
	["无畏冲锋"] = true,
	["冰冻陷阱效果"] = true,
	["破胆怒吼"] = true,
	["偷袭"] = true,
}

AutoAttack = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0")

function AutoAttack:OnEnable()
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

function AutoAttack:PLAYER_ENTER_COMBAT()
	if not self.inCombat then
		self.selfImposedCombat = true
	end

	self.attacking = true
end

function AutoAttack:PLAYER_LEAVE_COMBAT()
	self.attacking = false
	self.selfImposedCombat = false
end

function AutoAttack:PLAYER_REGEN_ENABLED()
	self.inCombat = false
	self.selfImposedCombat = false
	self:StopAttacking()
end

function AutoAttack:PLAYER_REGEN_DISABLED()
	self.selfImposedCombat = false
	self.inCombat = true
	self:Check()
end

function AutoAttack:START_AUTOREPEAT_SPELL()
	self.autoRepeating = true
	self:StopAttacking()
end

function AutoAttack:STOP_AUTOREPEAT_SPELL()
	self.autoRepeating = false
	self:Check()
end

function AutoAttack:SpecialEvents_AuraTargetChanged()
	self:Check()
end

function AutoAttack:SpecialEvents_PlayerBuffGained(buff)
	if buffs[buff] then
		self:StopAttacking()
	end
end

function AutoAttack:SpecialEvents_PlayerBuffLost(buff)
	if buffs[buff] then
		self:Check()
	end
end

function AutoAttack:SpecialEvents_UnitDebuffGained(unitID, debuff)
	if unitID == "target" and debuffs[debuff] then
		self:StopAttacking()
	end
end

function AutoAttack:SpecialEvents_UnitDebuffLost(unitID, debuff)
	if unitID == "target" and debuffs[debuff] then
		self:Check()
	end
end


function AutoAttack:Check()
	if (not self.inCombat and not self.selfImposedCombat) or self.autoRepeating or not UnitExists("target") or UnitIsUnit("target", "player") or UnitIsDeadOrGhost("target") or not UnitCanAttack("player", "target") or UnitIsFriend("player", "target") or self:PlayerHasSpecialBuff() or self:TargetIsCrowdControlled() then
		self:StopAttacking()
	else
		self:StartAttacking()
	end
end

function AutoAttack:StopAttacking()
	if self.attacking then
		AttackTarget()
	end
end

function AutoAttack:StartAttacking()
	if not self.attacking then
		AttackTarget()
	end
end

function AutoAttack:PlayerHasSpecialBuff()
	for buff in pairs(buffs) do
		if aura:UnitHasBuff("player", buff) then
			return true
		end
	end

	return false
end

function AutoAttack:TargetIsCrowdControlled()
	for debuff in pairs(debuffs) do
		if aura:UnitHasDebuff("target", debuff) then
			return true
		end
	end

	return false
end
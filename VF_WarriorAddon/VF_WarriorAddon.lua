--VF_WarriorAddon
--Written by Dilatazu @ EmeraldDream @ www.EmeraldDream.com / www.wow-one.com

VF_WA_Version = "1.0";

function VF_WA_OnLoad()
	--this:RegisterEvent("CHAT_MSG_SPELL_SELF_BUFF");
	this:RegisterEvent("CHAT_MSG_SPELL_SELF_DAMAGE");
	this:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS");
	this:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE");
	this:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS");
	this:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS");
	this:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE");
end

g_DebugMode = false;

function VF_WA_DebugPrint(theText)
	if(g_DebugMode == true) then
		DEFAULT_CHAT_FRAME:AddMessage(theText, 1, 1, 0);
	end
end

g_CurrTime = 0;

VF_ShieldWallTime = 15;

function VF_GetBuffCount(unitID, buffIcon)
	for u = 1, 16 do
		local buffIconPath, buffCount = UnitBuff(unitID, u);
		if(buffIconPath) then
			if(strfind(buffIconPath, buffIcon) ~= nil) then
				return buffCount;
			end
		end
	end
	return 0;
end

function VF_WA_OnEvent()
	if(event == "CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS") then
		local _, _, gainWhat = string.find(arg1, "你获得了(.*)的效果。");
		if(gainWhat ~= nil) then
			if(gainWhat == "破釜沉舟") then
				SendChatMessage("我的破釜沉舟激活! 20秒!", "RAID");
				SendChatMessage("我的破釜沉舟激活! 20秒!", "PARTY");
				SendChatMessage("我的破釜沉舟激活! 20秒!", "YELL");
			elseif(gainWhat == "盾墙") then
				SendChatMessage("我的盾墙激活! "..VF_ShieldWallTime.."秒!", "RAID");
				SendChatMessage("我的盾墙激活! "..VF_ShieldWallTime.."秒!", "PARTY");
				SendChatMessage("我的盾墙激活! "..VF_ShieldWallTime.."秒!", "YELL");
			else
				VF_WA_DebugPrint("我获得了 "..gainWhat);
			end
		else
			VF_WA_DebugPrint("UNPARSED1: "..arg1);
		end
	elseif(event == "CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE") then
		--[[local _, _, creature, spellEffect = string.find(arg1, "(.*) is afflicted by (.*).");
		if(creature ~= nil and spellEffect ~= nil) then
			if(spellEffect == "Taunt") then
				g_TauntCastTime = -1;
			elseif(spellEffect == "Challenging Shout") then
				g_ChallengingShoutCastTime = -1;
			elseif(spellEffect == "Mocking Blow") then
				VF_WA_DebugPrint("This message should never be shown!");
			else
				VF_WA_DebugPrint(spellEffect.." on "..creature.." was successful!");
			end
		else
			VF_WA_DebugPrint("UNPARSED2: "..arg1);
		end--]]
	elseif(event == "CHAT_MSG_SPELL_SELF_DAMAGE") then
		local actionStatus = "Hit";
		local _, _, spellEffect, creature, dmg = string.find(arg1, "你的(.*)击中(.*)造成(.*)点伤害。");
		
		if(spellEffect == nil or creature == nil or dmg == nil) then
			_, _, spellEffect, creature, dmg = string.find(arg1, "你的(.*)对(.*)造成(.*)的致命一击伤害。");
			actionStatus = "Crit";
		end
		
		if(spellEffect == nil or creature == nil or dmg == nil) then
			_, _, spellEffect, creature = string.find(arg1, "你的(.*)被(.*)抵抗了。");
			dmg = 0;
			actionStatus = "Resist";
		end
		
		if(spellEffect == nil or creature == nil or dmg == nil) then
			_, _, spellEffect, creature = string.find(arg1, "你的(.*)没有击中(.*)。");
			dmg = 0;
			actionStatus = "Miss";
		end
		
		if(spellEffect == nil or creature == nil or dmg == nil) then
			_, _, spellEffect, creature = string.find(arg1, "你的(.*)被(.*)躲闪过去了。");
			dmg = 0;
			actionStatus = "Dodge";
		end
		
		if(spellEffect == nil or creature == nil or dmg == nil) then
			actionStatus = "Unknown";
		end
		if((actionStatus == "Miss" or actionStatus == "Resist" or actionStatus == "Dodge") and spellEffect == "惩戒痛击") then
			SendChatMessage("惩戒痛击被抵抗!", "RAID");
			SendChatMessage("惩戒痛击被抵抗!", "PARTY");
			SendChatMessage("惩戒痛击被抵抗!", "YELL");
		elseif(actionStatus == "Resist" and spellEffect == "嘲讽") then
			SendChatMessage("嘲讽被抵抗!", "RAID");
			SendChatMessage("嘲讽被抵抗!", "PARTY");
			SendChatMessage("嘲讽被抵抗!", "YELL");
		elseif(actionStatus == "Resist" and spellEffect == "挑战怒吼") then
			SendChatMessage("挑战怒吼被抵抗!", "RAID");
			SendChatMessage("挑战怒吼被抵抗!", "PARTY");
			SendChatMessage("挑战怒吼被抵抗!", "YELL");
		elseif(actionStatus == "Unknown") then
			VF_WA_DebugPrint("UNPARSED3: "..arg1);
		end
	elseif(event == "VF_INSTANT_SUCCESSFULL_SPELLCAST") then
		VF_WA_DebugPrint("瞬发法术: "..arg1);
	else
		if(arg1 == nil) then
			VF_WA_DebugPrint("UNPARSED4: "..event);
		else
			VF_WA_DebugPrint("UNPARSED4: "..event..arg1);
		end
	end
	--AURAADDEDOTHERHARMFUL == %s is afflicted by %s.
end

function VF_WA_OnUpdate()
	g_CurrTime = GetTime();
end

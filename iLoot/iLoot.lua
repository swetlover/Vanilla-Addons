iLoot_Enabled = true

local iLoot_Lib = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0")

function iLoot_Message(msg)
	DEFAULT_CHAT_FRAME:AddMessage(msg)
end

function iLoot_OnLoad()
	--iLoot_Enabled = true
end

function iLoot_showstat()
	if(iLoot_Enabled) then
		iLoot_Message("iloot 已启用 ")
	else
		iLoot_Message("iloot 已禁用")
	end
end

function iLoot_SlashCommandHandler(cmd)
	local pos, cmds = 0, {}
	for st, sp in function() return string.find(cmd, " ", pos, true) end do
		table.insert(cmds, string.sub(cmd, pos, st-1))
		pos = sp + 1
	end
	table.insert(cmds, string.sub(cmd, pos))
	
	if(string.lower(cmds[1]) == "开启") then
		iLoot_Enabled = true
		iLoot_showstat()			
	elseif(string.lower(cmds[1]) == "禁用") then
		iLoot_Enabled = false
		iLoot_showstat()
	elseif(string.lower(cmds[1]) == "stat") then		
		iLoot_showstat()
	elseif(string.lower(cmds[1]) == "") then
		iLoot_Message("iLoot 设置命令\n/iloot 开启 |CFFFFFF00--启用|R\n/iloot 禁用 --|CFFFFFF00禁用")
	else
		iLoot_Message("iLoot 设置命令\n/iloot 开启 |CFFFFFF00--启用|R\n/iloot 禁用 --|CFFFFFF00禁用")
	end
end

SLASH_ILOOT1, SLASH_ILOOT2, SLASH_ILOOT3 = "/iloot", "/iLoot", "/ILoot";
SlashCmdList["ILOOT"] = function(cmd)
	iLoot_SlashCommandHandler(cmd)
end

function iLoot_Lib:OnEnable()	
	iLoot_OnLoad()
	self:RegisterEvent("CHAT_MSG_ADDON")
	iLoot_showstat()
end

function iLoot_Lib:OnDisable()
	self:UnregisterAllEvents()
end

local iloottime = 0
local ilootcount = 0
function iLoot_Lib:CHAT_MSG_ADDON(pre, event, channel, player)		
	if(iLoot_Enabled) then
		if(((event == "LOOT_OPENED") or (pre == "LOOT_OPENED")) and (player)) then			
			for i = 1, GetNumRaidMembers(),1 do
				local name = UnitName("raid"..i)
				local targetname = UnitName("raid"..i.."target")
				local targetdead = (UnitIsDead("raid"..i.."target") == 1)
				local boss = (UnitClassification("raid"..i.."target") == "worldboss")
				if ((name == player) and targetname and targetdead and boss) then 					
					if ((GetTime() - iloottime > 60) or (ilootcount < 3)) then	
						if(GetTime() - iloottime > 60) then
							SendChatMessage("拾取报告: >"..UnitName("raid"..i).."<".."第一个打开了 "..targetname.." 的尸体","RAID")	
							SendChatMessage("拾取报告: >"..UnitName("raid"..i).."<".."第一个打开了 "..targetname.." 的尸体","YELL")
							iloottime = GetTime()
							ilootcount = 0
						end							
						
						--iLoot_Message("|CFFF00000".."> >"..UnitName("raid"..i).."< <".."|R".." 打开了 ".."|CFFFFFF00"..targetname.."|R".." 的尸体 ")
						
						ilootcount = ilootcount + 1						
					end					
					
					--UIErrorsFrame:AddMessage("|CFFF00000".."> >"..UnitName("raid"..i).."< <".."|R".." 打开了 ".."|CFFFFFF00"..targetname.."|R".." 的尸体 ")
					--iLoot_Message("|CFFF00000".."> >"..UnitName("raid"..i).."< <".."|R".." 打开了 ".."|CFFFFFF00"..targetname.."|R".." 的尸体 ")
					
					break
				end
			end
		end
	end
end
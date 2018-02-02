--Stuff for keybinding
BINDING_HEADER_GREATERBUFF="GreaterBuff Mod"
BINDING_NAME_GREATERBUFF="GreaterBuff"
--[[ Variables ]]--
local GreaterBuff_updateInterval = 1
local GREATERBUFF_DURATION = 900
local GB = {};
-- Variable to hold default saved values
local GB_Conf = {};
GB_Conf.blessing = {}
GB_Conf.blessing.default = "Might";
GB_Conf.classes = {"Priest", "Mage", "Druid","Warlock","Hunter","Paladin","Rogue","Warrior"}
GB["target"] = nil;

GreaterBuff = {};

--[[ Function to handle OnLoad ]]--
function GreaterBuff_OnLoad()
	if (string.lower(UnitClass('player')) == string.lower("圣骑士")) then
		tinsert(UISpecialFrames,"GreaterBuffButtons");
		tinsert(UISpecialFrames,"GreaterBuff_Config");
		this:RegisterEvent("VARIABLES_LOADED");
		this:RegisterEvent("PLAYER_ENTERING_WORLD");
		this:RegisterEvent("SPELLCAST_FAILED");
		this:RegisterEvent("BAG_UPDATE");
		this:RegisterEvent("SPELLCAST_STOP");
		GreaterBuff_Out("骑士大祝福助手 加载.  使用 /gb 打开界面.");
		SLASH_GREATERBUFF1 = "/greaterbuff";
		SLASH_GREATERBUFF2 = "/gb";
		SlashCmdList["GREATERBUFF"] = GreaterBuff_SlashCommandHandler;
	end
end

--[[ Function to handle events ]]--
function GreaterBuff_OnEvent(event)
	if (event == "VARIABLES_LOADED") then
		GB["variables_loaded"] = true;
		if (GB["player_entering_world"]) then
			GreaterBuff.Init();
		end
	elseif (event == "PLAYER_ENTERING_WORLD") then
		GB["player_entering_world"] = true;
		if (GB["variables_loaded"]) then
			GreaterBuff.Init();
		end
	elseif (event == "SPELLCAST_FAILED" and GB["casting"]) then
		-- uh oh, recast
		GreaterBuff_Buff(GB["class"],GB["target"]);
	elseif (event == "SPELLCAST_STOP" and GB["casting"]) then
		-- assume we successfully cast
		GB["target"] = "";
		GB["casting"] = nil;
		GreaterBuff_UpdateKings();
		GreaterBuff.CastSuccess()
	elseif (GreaterBuffButtons:IsVisible()) then
		GreaterBuff_UpdateKings();
	end
end

--[[ Function to handle initialization ]]--
function GreaterBuff.Init()
	if (GB_Config == nil) then
		GB_Config = GB_Conf;
	end
	if (string.lower(type(GB_Config.blessing)) == string.lower('string')) then GB_Config.blessing = {} GB_Config.blessing.default = "Config" end
	GB["symbols"] = 0;
	local buffs = {"Might","Light","Wisdom","Kings","Salvation","Sanctuary"};
	for i in buffs do
		local name = "GreaterBuff_Config_" .. buffs[i];
		local button = getglobal(name);
		if (button ~= nil) then 
			button.name = name
			button.parent = button:GetParent()
			button.text = getglobal(name.."_TEXT")
			button.parent.name = button.parent:GetName()
			button:UnlockHighlight(); 
			button:Disable(); 
			if (button) then button:SetText(GREATERBUFF.SHORT[buffs[i]]) end
		end
	end
	if (not GB_Config.classes) then GB_Config.classes = {"Priest", "Mage", "Druid","Warlock","Hunter","Paladin","Rogue","Warrior"} end
	local classes = GB_Config.classes
	for i in classes do
		local name = "GreaterBuffButtons_"..classes[i]
		local button = getglobal(name)
		if (button ~= nil) then
			button.name = name
			button.parent = button:GetParent()
			button.text = getglobal(name.."_TEXT")
			button.class = GREATERBUFF.CLASS[classes[i]]
			button.sclass = GREATERBUFF.SCLASS[classes[i]]
			button.frame = button
			button.parent.name = button.parent:GetName()
			if (button) then button:SetText(button.sclass) end
		end
	end
	GreaterBuff_EnableBuffs();
	GreaterBuff_UpdateBuff();
	GreaterBuff_UpdateKings();
end

function GreaterBuff.OnUpdate(elapsed)
	if (not this.NextUpdate) then this.NextUpdate = 0 end
	local nu = this.NextUpdate - elapsed
	local current_Time = GetTime()
	if (nu <= 0) then
		if (GB["timers"]) then
			for class,table in GB["timers"] do
				if (table["time"] and table["frame"]) then
					local duration = table["time"] - current_Time
					local frame = table["frame"]
					local timeLeft = nil
					local class = table["class"]
					if (duration > 0) then 
						local secs = ''
						local seconds = math.mod(floor(duration),60)
						if (seconds < 10) then secs = '0' end
						local minutes = math.mod(floor(duration/60),60)
						timeLeft = string.format(" %d:%.2d",minutes,seconds)
					else
						timeLeft = ""
						table["time"] = nil
						table["frame"] = nil
						table = nil
						GB["timers"][class] = nil
					end
					if (frame.text) then 
						frame.text:SetText(class.. timeLeft) 
					else 
						frame:SetText(class..timeLeft) 
					end
				end
			end
		end
		--stuff
		this.NextUpdate = GreaterBuff_updateInterval
	else
		this.NextUpdate = nu
	end
end

function GreaterBuff.CastSuccess()
	GB["casting"] = nil
	GB["target"] = ""
	if (not GB["timers"]) then GB["timers"] = {} end
	if (GB["class"]) then 
		local class = GB["class"]
		local button = getglobal("GreaterBuffButtons_"..class) or GB["frame"]
		-- add 900 seconds to the time to get duration stuff
		if (not GB["timers"][class]) then GB["timers"][class] = {} end
		GB["timers"][class]["time"] = GetTime() + GREATERBUFF_DURATION
		GB["timers"][class]["frame"] = button
		GB["timers"][class]["class"] = button.sclass
	end
	GB["class"] = nil
end


function GreaterBuff_EnableBuffs()
	local i = 1
	while true do
		local spellName,spellRank = GetSpellName(i,BOOKTYPE_SPELL);
		if (not spellName) then
			do break end
		end
		-- use spellName here
		if (strfind(spellName,GREATERBUFF.SPELLS.Light)) then
			GreaterBuff_Config_Light:Enable();
		elseif (strfind(spellName,GREATERBUFF.SPELLS.Wisdom)) then
			GreaterBuff_Config_Wisdom:Enable();
		elseif (strfind(spellName,GREATERBUFF.SPELLS.Kings)) then
			GreaterBuff_Config_Kings:Enable();
		elseif (strfind(spellName,GREATERBUFF.SPELLS.Salvation)) then
			GreaterBuff_Config_Salvation:Enable();
		elseif (strfind(spellName,GREATERBUFF.SPELLS.Sanctuary)) then
			GreaterBuff_Config_Sanctuary:Enable();
		elseif (strfind(spellName,GREATERBUFF.SPELLS.Might)) then
			GreaterBuff_Config_Might:Enable();
		end
		i = i+1;
	end
end

function GreaterBuff_UpdateBuff()
 	local name = "GreaterBuff_Config_"..GB_Config.blessing.default;
	local button = getglobal(name);
	if (button ~= nil and button:IsEnabled() == 1) then button:LockHighlight(); end
	GreaterBuffButtons_Config:SetText(GREATERBUFF.SHORT[GB_Config.blessing.default]);
	if (GB["previous_buff"] ~= nil) then
		name = "GreaterBuff_Config_"..GB["previous_buff"];
		local button = getglobal(name);
		if (button ~= nil) then button:UnlockHighlight(); end
	end
end

function GreaterBuff_Toggle()
	if (GreaterBuffButtons:IsVisible()) then
		GreaterBuffButtons:Hide();
	else
		GreaterBuffButtons:Show();
	end
end

--[[ Function to handle slash commands ]]--
function GreaterBuff_SlashCommandHandler(msg)
	GreaterBuff_UpdateKings();
	if (msg == "lock") then
		if (GreaterBuffButtons.isLocked) then
			GreaterBuffButtons.isLocked = nil;
			GreaterBuff_Config.isLocked = nil;
		else
			GreaterBuffButtons.isLocked = true;
			GreaterBuff_Config.isLocked = true;
		end
	elseif (msg == "unlock") then
		GreaterBuffButtons.isLocked = nil;
		GreaterBuff_Config.isLocked = nil;
	elseif (msg == "reset") then
		GreaterBuffButtons:ClearAllPoints()
		GreaterBuffButtons:SetPoint("CENTER","UIParent","CENTER",0,0)
		GreaterBuff_Config:ClearAllPoints()
		GreaterBuff_Config:SetPoint("CENTER","UIParent","CENTER",0,0)
	elseif (msg == "") then
		if (GreaterBuffButtons:IsVisible()) then
			GreaterBuffButtons:Hide();
		else
			GreaterBuffButtons:Show();
		end
	else
		GreaterBuff_Help();
	end
end

--[[ Function to output a help screen ]]--
function GreaterBuff_Help()
	DEFAULT_CHAT_FRAME:AddMessage("GreaterBuff 使在一个RAID中更容易地筛选每个职业.");
	DEFAULT_CHAT_FRAME:AddMessage("你可以通过打字打开界面 /gb 或 /greaterbuff.");
	DEFAULT_CHAT_FRAME:AddMessage("您还可以通过打字锁定窗口 '/gb lock' 和解锁 '/gb lock' 或者 '/gb unlock'.");
end


--[[ Function to handle outputting things to the user ]]--
function GreaterBuff_Out(msg)
--	DEFAULT_CHAT_FRAME:AddMessage(msg);
	UIErrorsFrame:AddMessage(msg, 1.0, 1.0, 0, 1, 10)
end

function GreaterBuff_UpdateKings()
	local kings = GreaterBuff_Kings();
	local text = "印记: "
	text = text .. kings;
	GreaterBuffButtons_Symbols:SetText(text);
end

--[[ Function to handle clicks ]]--
function GreaterBuff_OnClick(arg1)
	if (not this.name) then this.name = this:GetName() end
	if (not this.frame) then this.frame = this end
	if (not this.parent) then this.parent = this:GetParent() end
	if (not this.parent.frame) then this.parent.frame = this.parent end
	if (not this.parent.name) then this.parent.name = this.parent.frame:GetName() end
	if (not this.text) then this.text = getglobal(this.name.."_Text") end
	--if (not this.text) then this.text.text = this.text:GetText() end
	local name = this.name
	local parent_Name = this.parent.name
	local text = nil
	if (this.text) then 
		text = this.text:GetText() 
	else
		text = this.frame:GetText()
	end
	GreaterBuff_UpdateKings();
	if (parent_Name == "GreaterBuff_Config") then
		local blessing = strsub(name,20);
		if (blessing ~= "Done") then
			GB["previous_buff"] = GB_Config.blessing.default;
			GB_Config.blessing.default = blessing;
			GreaterBuff_UpdateBuff();
			GreaterBuff_Out(GREATERBUFF.MISC.updateBuff..blessing);
		elseif (blessing == "Done") then
			GreaterBuff_Config:Hide();
		end
		return
	end
	if (name == parent_Name.."_Config") then
		if (GreaterBuff_Config:IsVisible()) then
			GreaterBuff_Config:Hide();
		else
			GreaterBuff_Config:Show();
		end
	else
		text = this.class
		GB["target"] = ""
		GB["class"] = text
		GB["frame"] = this.frame
		GreaterBuff_Buff(text)
	end
end

function GreaterBuff.DoBuff(target)
	local class, buff
	if (not target) then return false end
	class = UnitClass(target)
	if (GB_Config.blessing[class]) then
		buff = GB_Config.blessing[class]
	else
		buff = GB_Config.blessing.default
	end
	CastSpellByName(GREATERBUFF.SPELLS[buff])
end

function GreaterBuff_Buff(class,badtarget)
	if (GreaterBuff_Kings() == 0) then
		UIErrorsFrame:AddMessage(GREATERBUFF.MISC.no_symbols, 1.0, 0, 0, 1, 10)
		return;
	end;
	local isAttacking = PlayerFrame.inCombat;
	local targeting = nil;
	if (UnitExists("target")) then targeting = true; end
	if (SpellIsTargeting() and GB["casting"]) then
		SpellStopTargeting();
		SpellStopCasting();
	end
	-- so you can't cast while sitting
	DoEmote("stand");
	GB["casting"] = true;
	if (GB["class"] == nil) then GB["class"] = class; end
	if (GB["class"] ~= class) then
		GB["class"] = class;
		GB["target"] = "";
	end
	--DEFAULT_CHAT_FRAME:AddMessage("Checking: "..class)
	if (strlower(class) == strlower(UnitClass("player"))) then
		TargetUnit("player");
		GreaterBuff.DoBuff("player")
		if (targeting) then
			TargetLastTarget();
			if (isAttacking) then AttackTarget() end
		else
			ClearTarget();
		end
		return
	end
	if (GetNumRaidMembers() > 0) then
		local name,rclass
		for i = 1, GetNumRaidMembers(), 1 do
			rclass = UnitClass("raid"..i);
			if (strlower(rclass) == strlower(class)) then
				name = UnitName("raid"..i);
				if ((GB["target"] ~= nil and strfind(GB["target"],name) == nil) or GB["target"] == nil) then
						if (GB["target"]) then 
							GB["target"] = GB["target"].." "..name;
						else
							GB["target"] = name;
						end
						if ((UnitIsDead("raid"..i) == nil) and UnitIsVisible("raid"..i) and CheckInteractDistance("raid"..i,4)) then
							TargetUnit("raid"..i);
							GreaterBuff.DoBuff("raid"..i)
							if (targeting) then
								TargetLastTarget();
								if (isAttacking) then AttackTarget() end
							else
								ClearTarget();
							end
							return
						end
				end
			end
		end
	elseif (GetNumPartyMembers() > 0) then
		local name,rclass
		for i = 1, GetNumPartyMembers(), 1 do
			rclass = UnitClass("party"..i);
			if (strlower(rclass) == strlower(class)) then
				name = UnitName("party"..i);
				if ((GB["target"] ~= nil and strfind(GB["target"],name) == nil) or GB["target"] == nil) then
					if (GB["target"]) then 
						GB["target"] = GB["target"].." "..name;
					else
						GB["target"] = name;
					end
					if (UnitIsDead("party"..i) == nil) then
						TargetUnit("party"..i);
						GreaterBuff.DoBuff("party"..i)
						if (targeting) then
							TargetLastTarget();
							if (isAttacking) then AttackTarget() end
						else
							ClearTarget();
						end
						return
					end
				end
			end
		end
	end
	GreaterBuff_Out(GREATERBUFF.MISC.noUnits);
	GB["casting"] = nil
	GB["target"] = ""
	GB["class"] = ""
	GB["frame"] = nil
	SpellStopTargeting();
	SpellStopCasting();
end

function GreaterBuff_Kings()
	local count = 0;
  for bag=0,4 do
    for slot=1,GetContainerNumSlots(bag) do
      if (GetContainerItemLink(bag,slot)) then
        if (string.find(GetContainerItemLink(bag,slot), GREATERBUFF.MISC.symbols)) then
		local texture, itemCount, locked, quality, readable = GetContainerItemInfo(bag,slot);
		count = count + itemCount;
        end
      end
    end
  end
  return count;
end	

local OUTGOING = 1
local INCOMING = -1
local CRIT = 2
local NONCRIT = -2

local BS = AceLibrary("Babble-Spell-2.3")
local L = AceLibrary("AceLocale-2.2"):new("EavesDrop")
local sort_table;
local display_type = OUTGOING;
local display_sub_type = "hit";

----------------------
-- append date and time to event
local function geteventtime(arg1)
	return string.format('|cffffffff%s|r\n%s', date('%x %I:%M:%S'), arg1 or '');
end

----------------------
-- track highest stats
function EavesDrop:SetDisplay(type, sub_type)
	display_type = type;
  display_sub_type = sub_type;
  --reset sorted table
  sort_table = nil;
  FauxScrollFrame_SetOffset(EavesDropHistoryScrollBar,0);
  EavesDrop:ScrollBar_Update()
end

----------------------
-- track highest stats
function EavesDrop:TrackStat(type, info)
	-- if its not enabled
	if self.db.profile["HISTORY"] == false then
		return false;
	end
	
	local key, critkey;
	--set key
	if (type == OUTGOING) or (info.type == "heal") then
		key = info.skill;
	else
		key = info.element or ParserLib_MELEE;
	end
	--fix parselib keys to be strings
	if key == ParserLib_MELEE then key = MELEE_ATTACK end;
	if key == ParserLib_DAMAGESHIELD then key = CHAT_MSG_SPELL_DAMAGESHIELDS_ON_SELF end;
	--set crit type
	if (info.isCrit) then
		critkey = CRIT;
	else
		critkey = NONCRIT;
	end
	
	--check if type exists
	if (self.db.char.Stats[type][info.type] == nil) then
		self.db.char.Stats[type][info.type] = {};
	end
	--check if skill/key exists
	if (self.db.char.Stats[type][info.type][key] == nil) then
		self.db.char.Stats[type][info.type][key] = {
			[CRIT] = {},
			[NONCRIT] = {},
		}
		--reset sorted table
		sort_table = nil;
	end
	--see if its a higher event
	if ((self.db.char.Stats[type][info.type][key][critkey].amount == nil) or (info.amount > self.db.char.Stats[type][info.type][key][critkey].amount)) then
		self.db.char.Stats[type][info.type][key][critkey].amount = info.amount;
		self.db.char.Stats[type][info.type][key][critkey].time = geteventtime(arg1);
		self:ScrollBar_Update()
		return true;
	end
	return false;
end

----------------------
-- update scroll bar settings
function EavesDrop:ScrollBar_Update()
	local i,j,k, idx, skill, hit, crit, row, key, value, texture, texturestr, tip1,tip2
	local offset = FauxScrollFrame_GetOffset(EavesDropHistoryScrollBar)
	--get table size, getn doesn't work cause not an array
	local size = 0;
	local current_table = EavesDrop.db.char.Stats[display_type][display_sub_type];
	--if not sorted, sort now
	if (sort_table == nil) then
		sort_table = {};
		if current_table then
			table.foreach(current_table, function (k) table.insert (sort_table, k) end );
		end;
		table.sort(sort_table);
	end
	size = getn(sort_table);
	--get update
	FauxScrollFrame_Update(EavesDropHistoryScrollBar, size, 10, 16)
	--loop thru each display item
	for i=1,10 do
		row = getglobal("EavesDropHistoryEvent"..i)
		texture = getglobal("EavesDropHistoryEvent"..i.."_Texture")
		skill = getglobal("EavesDropHistoryEvent"..i.."_Skill")
		hit = getglobal("EavesDropHistoryEvent"..i.."_Hit")
		crit = getglobal("EavesDropHistoryEvent"..i.."_Crit")
		idx = offset+i
		if idx<=size then
			k,key = next(sort_table)
			for j=2,idx do
				k,key = next(sort_table, k)
			end
			texturestr = BS:GetSpellIcon(key);
			texture:SetTexture(texturestr);
			texture:SetTexCoord(.1,.9,.1,.9);
			skill:SetText(key);
			hit:SetText(current_table[key][NONCRIT].amount);
			crit:SetText(current_table[key][CRIT].amount);
			tip1 = current_table[key][NONCRIT].time or "";
			tip2 = current_table[key][CRIT].time or "";
			row.tooltipText = tip1.."\n\n"..tip2;
			row:Show()
		else
			row:Hide()
		end
	end  
end

----------------------
-- Reset all history
function EavesDrop:ResetHistory()    
  self.db.char.Stats = {[OUTGOING] = {},[INCOMING] = {}}
  self:SetDisplay(OUTGOING, "hit");
end

----------------------
-- Setup history UI
function EavesDrop:SetupHistory()    
	--Labels
	EavesDropHistoryFrameSkillText:SetText(L["Skill"]);
	EavesDropHistoryFrameAmountCritText:SetText(L["Crit"]);
	EavesDropHistoryFrameAmountNormalText:SetText(L["Normal"]);
	r,g,b,a = self.db.profile["LABELC"].r, self.db.profile["LABELC"].g, self.db.profile["LABELC"].b, self.db.profile["LABELC"].a
	EavesDropHistoryFrameSkillText:SetTextColor(r,g,b,a);
 	EavesDropHistoryFrameAmountCritText:SetTextColor(r,g,b,a);
 	EavesDropHistoryFrameAmountNormalText:SetTextColor(r,g,b,a);
	--Buttons
	EavesDropHistoryFrameOutgoingHit.tooltipText = L["OutgoingDamage"];
	EavesDropHistoryFrameOutgoingHeal.tooltipText = L["OutgoingHeals"];
	EavesDropHistoryFrameIncomingHit.tooltipText = L["IncomingDamge"];
	EavesDropHistoryFrameIncomingHeal.tooltipText = L["IncomingHeals"];
	EavesDropHistoryButton.tooltipText = L["History"];
	EavesDropHistoryFrameResetText:SetText(L["Reset"]);
	--Frame
	local r,g,b,a = self.db.profile["FRAME"].r, self.db.profile["FRAME"].g, self.db.profile["FRAME"].b, self.db.profile["FRAME"].a
	EavesDropHistoryFrame:SetBackdropColor(r, g, b, a);
	EavesDropHistoryTopBar:SetGradientAlpha("VERTICAL", r*.1, g*.1, b*.1, 0, r*.2, g*.2, b*.2, a);
	EavesDropHistoryBottomBar:SetGradientAlpha("VERTICAL", r*.2, g*.2, b*.2, a, r*.1, g*.1, b*.1, 0);
	r,g,b,a = self.db.profile["BORDER"].r, self.db.profile["BORDER"].g, self.db.profile["BORDER"].b, self.db.profile["BORDER"].a
	EavesDropHistoryFrame:SetBackdropBorderColor(r, g, b, a);
	
end
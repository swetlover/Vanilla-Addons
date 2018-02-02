
-----------------------------------------
----MAIN LOCALIZATIONS
-----------------------------------------
MER_priest = "牧师";
MER_rogue = "盗贼";
MER_warrior = "战士";
MER_warlock = "术士";
MER_mage = "法师";
MER_hunter = "猎人";
MER_druid = "德鲁伊";
MER_shaman = "萨满祭司";
MER_paladin = "圣骑士";
MER_unknown = UNKNOWN;

MER_cloth = "布甲";
MER_leather = "皮甲";
MER_mail = "锁甲";
MER_plate = "板甲";
MER_classes = "所有职业";

	---For dkptable
	DKPT_priest = MER_priest;
	DKPT_rogue = MER_rogue;
	DKPT_warrior = MER_warrior;
	DKPT_warlock = MER_warlock;
	DKPT_mage = MER_mage;
	DKPT_hunter = MER_hunter;
	DKPT_druid = MER_druid;
	DKPT_shaman = MER_shaman;
	DKPT_paladin = MER_paladin;
	DKPT_unknown = MER_unknown;

	
-----------------------------
----MER FUNCTIONS
----------------------------
if ( not MER or MER.Version < 1 ) then

MER = {};
MER.Version = 1;

MER.Local = {};
MER.Local.Classes = {
	[MER_unknown] 	= { class = MER_unknown, r = 0.8, g = 0.8, b = 0.8 },
	[MER_hunter] 	= { class = MER_hunter, r = 0.67, g = 0.83, b = 0.45 },
	[MER_warlock] 	= { class = MER_warlock, r = 0.58, g = 0.51, b = 0.79 },
	[MER_priest] 	= { class = MER_priest, r = 1.0, g = 1.0, b = 1.0 },
	[MER_paladin] 	= { class = MER_paladin, r = 0.96, g = 0.55, b = 0.73 },
	[MER_mage] 		= { class = MER_mage, r = 0.41, g = 0.8, b = 0.94 },
	[MER_rogue] 	= { class = MER_rogue, r = 1.0, g = 0.96, b = 0.41 },
	[MER_druid] 	= { class = MER_druid, r = 1.0, g = 0.49, b = 0.04 },
	[MER_shaman] 	= { class = MER_shaman, r = 0.96, g = 0.55, b = 0.73 },
	[MER_warrior] 	= { class = MER_warrior, r = 0.78, g = 0.61, b = 0.43 },
};

----------------------------------------
----- Functions
----------------------------------------
MER.Functions = {};

function MER.DEBUG(msg, frame, r, g, b)
	msg = msg or "DEBUG ERROR";
	if ( r and g and b ) then
		(frame or DEFAULT_CHAT_FRAME):AddMessage("|cfffeba33<MER>|r ".. msg, r, g, b, 1);
	else
		(frame or DEFAULT_CHAT_FRAME):AddMessage("|cfffeba33<MER>|r ".. msg, 1, 0.85, 0, 1);
	end
end

function MER.Functions.ToggleAddon(frame, eventList, on)
	if ( not getglobal(frame) ) then return end
	if ( on ) then
		for k, v in ipairs(eventList) do
			getglobal(frame):RegisterEvent(v);
		end
	else
		for k, v in ipairs(eventList) do
			getglobal(frame):UnregisterEvent(v);
		end
	end
end

function MER.Functions.ToggleFrame(frame)
	if ( not getglobal(frame) ) then return end	
	if ( getglobal(frame):IsVisible() ) then
		getglobal(frame):Hide();
	else
		getglobal(frame):Show();
	end
end

function MER.Functions.GetTime()
	local total = time();
	local now = date("*t", total);
	return floor(total/60), MER.Functions.FixZero(now.month), MER.Functions.FixZero(now.day), now.year, MER.Functions.FixZero(now.hour), MER.Functions.FixZero(now.min), MER.Functions.FixZero(now.sec);
end

function MER.Functions.GetGameTime()
	local hour, minute = GetGameTime();
	local total = hour * 60 + minute;
	return total, hour, minute;
end

function MER.Functions.GetTimer(tdate)
	if ( not tdate ) then return end
	local tmp = date("*t", time());
	local _, _, mon, day, year, hour, minu, sec = strfind(tdate, "(%d+)/(%d+)/(%d+) (%d+):(%d+):(%d+)");	
	if ( strlen(year) == 2 ) then
		tmp.year = tonumber("20" .. year);
	else
		tmp.year = tonumber(year);
	end
	tmp.month = tonumber(mon);
	tmp.day = tonumber(day);
	tmp.hour = tonumber(hour);
	tmp.min = tonumber(minu);
	tmp.sec = tonumber(sec);	
	return floor(time(tmp)/60);
end

function MER.Functions.ConvertString(val)
	val = gsub(val, "%%%d%$", "%%"); 
	val = gsub(val, "%%s", "(.+)");
	val = gsub(val, "%%d", "(%%d+)");
	return val;
end

function MER.Functions.UCFirst(val)
	val = gsub(val,"^%s*","");
	if ( strfind(val, "^%a") ) then
		val = strupper(strsub(val,1,1))..strsub(strlower(val),2,-1);
	end	
	return val;
end

function MER.Functions.GetTargetName(name)
	return name or UnitName("target") or "";
end

function MER.Functions.ColorValue(val)
	if not val then
		return "";
	elseif ( tonumber(val) > 0 ) then
		return "|cff3fff3f" .. val .. "|r";
	elseif ( tonumber(val) < 0 ) then
		return "|cffff3f3f" .. val .. "|r";
	else 
		return "|cffafafaf" .. val .. "|r";
	end
end

function MER.Functions.ColorHex(color, g, b)
	if ( not color ) then
		return "ffffff";
	elseif ( color.r ) then
		return format("%2x%2x%2x", color.r*255, color.g*255, color.b*255);
	else
		return format("%2x%2x%2x", color*255, g*255, b*255);
	end
end

function MER.Functions.CloneTab(t) 
	local new = {};  
	local i, v = next(t, nil);  
	while i do
		if ( type(v)=="table" ) then 
			v = MER.Functions.CloneTab(v);
		end
		new[i] = v;
		i, v = next(t, i);
	end
	return new;
end

function MER.Functions.FixZero(num)
	if ( num < 10 ) then
		return "0" .. num;
	else
		return num;
	end
end

function MER.Functions.MinimapButton(frame, val)
	if ( not getglobal(frame) ) then return end
	if ( val == 0 ) then
		getglobal(frame):Hide();
		return
	end
	getglobal(frame):Show();
	getglobal(frame):SetPoint("TOPLEFT", "Minimap", "TOPLEFT", 55 - (84 * cos(val)), (84 * sin(val)) - 55);
end

end
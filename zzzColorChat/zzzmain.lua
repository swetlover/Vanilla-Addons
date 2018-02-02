function zzzmain_OnLoad()
	SlashCmdList["CCENTER"] = zzzmain_SlashCommandHandler;
	SLASH_CCENTER1 = "/cchat";
	zprint(" 欢迎使用神奇的聊天字体颜色变色")
	zprint(" ")
	zprint(" 使用 /cchat <color> 更改聊天颜色")
	zprint(" 例如 /cchat red")
	zprint(" 使用 /cchat normal 恢复正常聊天 (如果你想链接物品)")
	zprint(" ^ 插件开关 /cchat disable /cchat off ^")
	zprint(" 可用的颜色: ")
	zprint(" - red blue green yellow white")
	zprint(" - pink gold purple teal")
	zprint(" ")
	zprint(" 使用 /cchat help 再次插件这个信息.")
end

function cchelp()
	zprint(" /cchat help 功能")
	zprint(" ")
	zprint(" 使用 /cchat <color> 更改聊天颜色")
	zprint(" 例如 /cchat red")
	zprint(" 使用 /cchat off   禁用着色.(如果你想链接物品)")
	zprint(" 可用的颜色: ")
	zprint(" - red blue green yellow white pink gold purple teal")
	zprint(" ")
end

local ccenabled = false
local ccfunc = SendChatMessage

-- --------------------------------------------------------------
-- colors explained: c = prefix XX alpha XX red XX green XX blue
--           RED     c          FF       FF     00       00
-- HEX STUFF
-- --------------------------------------------------------------

local cRed =    "cFFFF0000"
local cGreen =  "cFF00FF00"
local cBlue =   "cFF0000FF"
local cYellow = "cFFFFFF00"
local cBrown =  "cFFA5552A"
local cWhite =  "cFFFFFFFF"
local cPink =   "cFFFF29F3"
local cGold =   "cFFFFD700"
local cPurple = "cFF800080"
local cTeal =   "cFF008080"
local cYellow2 ="cFFFDFDA0"
local cBlue2 =  "cFF78B6FD"
local cRed2 =   "cFFA10B0B"

local curcolor = cRed


function zprint(txt)
	DEFAULT_CHAT_FRAME:AddMessage(txt,0.5,1,0.7);
end

local function zSplit(pString, pPattern)
	pString = (pString .. pPattern)
	local Table = {}
	local fpat = "(.-)" .. pPattern
	local last_end = 1
	local s, e, cap = strfind(pString, fpat, 1)
	while s do
		if s ~= 1 or cap ~= "" then
			table.insert(Table,cap)
		end
		last_end = e+1
		s, e, cap = strfind(pString, fpat, last_end)
	end
	if last_end <= strlen(pString) then
		cap = strfind(pString, last_end)
		table.insert(Table, cap)
	end
	return Table
end

function zzzmain_SlashCommandHandler(msg)

		local result = zSplit(msg," ")
		zprint("cchat 命令: "..msg)

		if (msg == "help" or result[1] == "help" or result[1] == nil or result[2] ~= nil) then
			cchelp()
		elseif (result[1] == "normal" or result[1] == "disable" or result[1] == "off") then
			ccdisable()
		elseif (result[1] == "red") then
			setccolor(cRed)
		elseif (result[1] == "green") then
			setccolor(cGreen)
		elseif (result[1] == "blue") then
			setccolor(cBlue)
		elseif (result[1] == "yellow") then
			setccolor(cYellow)
		elseif (result[1] == "brown") then
			setccolor(cBrown)
		elseif (result[1] == "white") then
			setccolor(cWhite)
		elseif (result[1] == "pink") then
			setccolor(cPink)
		elseif (result[1] == "gold") then
			setccolor(cGold)
		elseif (result[1] == "purple") then
			setccolor(cPurple)
		elseif (result[1] == "teal") then
			setccolor(cTeal)
		elseif (result[1] == "yellow2") then
			setccolor(cYellow2)
		elseif (result[1] == "blue2") then
			setccolor(cBlue2)
		elseif (result[1] == "red2") then
			setccolor(cRed2)
		end

end

function ccenable()
	ccenabled = true
end

function setccolor(res)
	curcolor = res
	zprint("启用聊天变色.. 使用 /cchat disable 或者 /cchat off 回归正常")
	zprint("警告：着色时不能链接物品. 一定要禁用它.")
	ccenable()
end

function SendChatMessage(msg,type,lang,chan)
	if ccenabled == true then
		ccfunc("\124" ..curcolor.. "\124Hitem:19:0:0:0:0:0 :0: \124h" ..msg.. "\124h\124r",type,lang,chan)
	else
		ccfunc(msg,type,lang,chan)
	end
end

function ccdisable()
	ccenabled = false
end
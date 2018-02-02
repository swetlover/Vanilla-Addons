--
-- $Id: BugGrabber.lua 6441 2006-08-01 09:38:54Z fritti $
--

-- Localization
local USAGE = "Usage: /buggrabber <index>."
local ERROR_INDEX = "The provided index must be a number."
local ERROR_UNKNOWN_INDEX = "The index %d does not exist in the load error table."
local STARTUP_ERRORS = "There were %d startup errors:"
local STARTUP_ERRORS_MANY = "There were %d startup errors, please use /buggrabber <number> to print them."
local UNIQUE_CAPTURE = "BugGrabber captured a unique error:\n%s\n---"
local ADDON_CALL_PROTECTED = "[%s] AddOn '%s' tried to call the protected function '%s'."
local ADDON_CALL_PROTECTED_MATCH = "^%[(.*)%] (AddOn '.*' tried to call the protected function '.*'.)$"

if GetLocale() == "koKR" then
	USAGE = "사용법: /buggrabber <색인값(숫자)>."
	ERROR_INDEX = "색인값은 숫자이어야 합니다."
	ERROR_UNKNOWN_INDEX = "불러온 오류목록에 %d번째 오류는 존재하지 않습니다."
	STARTUP_ERRORS = "%d개의 시작시 오류가 발생:"
	STARTUP_ERRORS_MANY = "%d개의 시작시 오류가 발생했습니다, /buggrabber <숫자>를 사용해서 해당 오류를 볼 수 있습니다."
	UNIQUE_CAPTURE = "벌레잡이가 발견한 오류:\n%s\n---"
end

if GetLocale() == "deDE" then
	USAGE = "Benutzung: /buggrabber <index>."
	ERROR_INDEX = "Der zur Verfügung gestellte Index muß eine Zahl sein."
	ERROR_UNKNOWN_INDEX = "Der Index %d existiert nicht in der geladenen Fehlerliste."
	STARTUP_ERRORS = "Es gab %d Errors beim starten:"
	STARTUP_ERRORS_MANY = "Es gab %d Errors beim starten, verwende bitte /buggrabber <nummer>, um sie zu aufzulisten."
	UNIQUE_CAPTURE = "BugGrabber hat einen einzigartigen error aufgezeichnet:\n%s\n---"
end

if GetLocale() == "zhCN" then
	USAGE = "Benutzung: /buggrabber <index>."
	ERROR_INDEX = "输入的<index>必须是一个数字."
	ERROR_UNKNOWN_INDEX = "The index %d 在已加载错误表中不存在."
	STARTUP_ERRORS = "共有 %d 启动错误:"
	STARTUP_ERRORS_MANY = "共有 %d 启动错误, 请输入 /buggrabber <nummer>, 来显示它们."
	UNIQUE_CAPTURE = "BugGrabber 记录了一个唯一的错误:\n%s\n---"
end

-- Create our event registering frame
local f = CreateFrame("Frame", "BugGrabber")

local string_gmatch = string.gmatch or string.gfind

-- State variables
BugGrabber.loaded = false
BugGrabber.loadErrors = {}
BugGrabber.bugsackErrors = {}
BugGrabber.errors = {}

-- Our persistent error database
BugGrabberDB = {}
BugGrabberDB.session = 0
BugGrabberDB.save = true
BugGrabberDB.limit = 100
BugGrabberDB.errors = {}

-- Determine the proper DB and return it
function BugGrabber.GetDB()
	if not BugGrabber.loaded then
		return BugGrabber.loadErrors
	end
	if not BugGrabberDB.save then
		return BugGrabber.errors
	end
	return BugGrabberDB.errors
end

-- Error handler
function BugGrabber.GrabError(_, err)
	-- Get the full backtrace
	err = err .. "\n" .. debugstack(4)

	-- Normalize the full paths into last directory component and filename.
	local errmsg = ""
	local looping = false
	for trace in string_gmatch(err, "(.-)\n") do
		local match, found, path, file, line, msg
		found = false

		-- First detect an endless loop so as to abort it below
		if string.find(trace, "BugGrabber") then
			looping = true
		end

		-- "path\to\file.lua:linenum:message"
		if not found then
			match, _, path, file, line, msg = string.find(trace, "^.-([^\\]+\\)([^\\]-)(:%d+):(.*)$")
			if match then
				found = true
			end
		end

		-- "[string \"path\\to\\file.lua:<foo>\":linenum:message"
		if not found then
			match, _, path, file, line, msg = string.find(trace, "^%[string \".-([^\\]+\\)([^\\]-)\"%](:%d+):(.*)$")
			if match then
				found = true
			end
		end

		-- "[string \"FOO\":linenum:message"
		if not found then
			match, _, file, line, msg = string.find(trace, "^%[string (\".-\")%](:%d+):(.*)$")
			if match then
				found = true
				path = '<string>:'
			end
		end

		-- "[C]:message"
		if not found then
			match, _, msg = string.find(trace, "^%[C%]:(.*)$")
			if match then
				found = true
				path = '<in C code>'
				file = ''
				line = ''
			end
		end

		-- ADDON_ACTION_BLOCKED
		if not found then
			match, _, file, msg = string.find(trace, ADDON_CALL_PROTECTED_MATCH)
			if match then
				found = true
				path = '<event>'
				file = 'ADDON_ACTION_BLOCKED'
				line = ''
			end
		end

		-- Anything else
		if not found then
			path = '<unknown>'
			file = ''
			line = ''
			msg = line
		end

		-- Add it to the formatted error
		errmsg = errmsg .. path .. file .. line .. ":" .. msg .. "\n"
	end

	-- Now store the error
	BugGrabber.SaveError(errmsg)
end

function BugGrabber.SaveError(message)
	-- Start with the date, time and session
	local oe = {}
	oe.message = message .. "\n  ---"
	oe.session = BugGrabberDB.session
	oe.time = date("%Y/%m/%d %H:%M:%S")
	oe.counter = 1

	-- WoW crashes when strings > 983 characters are stored in the
	-- SavedVariables file, so make sure we don't exceed that limit.
	-- For lack of a better thing to do, just truncate the error :-/
	if string.len(oe.message) > 980 then
		oe.message = string.sub(oe.message, 1, 980)
	end

	local added = false

	-- Insert the error into the correct database if it's not there already.
	-- If it is, just increment the counter.
	local found = false
	local db = BugGrabber.GetDB()
	for i, err in ipairs(db) do
		if err.message == oe.message and err.session == oe.session then
			-- This error already exists in the current session, just increment
			-- the counter on it.
			if not err.counter or type(err.counter) ~= "number" then
				err.counter = 1
			end
			err.counter = err.counter + 1

			-- Update the current error for the event firing later.
			oe.counter = err.counter
			oe.time = err.time
			found = true
			break
		end
	end

	-- If the error was not found in the current session, append it to the
	-- database.
	if not found then
		table.insert(db, oe)
		added = true
	end

	-- Also insert it into the temporary capture database that we maintain
	-- to silence loading errors while we wait for BugSack to load
	if BugGrabber.bugsackErrors and type(BugGrabber.bugsackErrors) == "table" then
		found = false
		for i, err in ipairs(BugGrabber.bugsackErrors) do
			if err.message == oe.message and err.session == oe.session then
				if not err.counter or type(err.counter) ~= "number" then
					err.counter = 1
				end
				err.counter = err.counter + 1
				found = true
				break
			end
		end
		if not found then
			table.insert(BugGrabber.bugsackErrors, oe)
			added = true
		end
	end

	-- Save only the last <limit> errors (otherwise the SV gets too big)
	if table.getn(db) > BugGrabberDB.limit then
		table.remove(db, 1)
	end

	-- Now trigger an event if someone's listening. If not, just print
	-- it to the chat frame so it doesn't get lost.
	if not looping and not BugGrabber.bugsackErrors and
	  AceLibrary and AceLibrary:HasInstance("AceEvent-2.0") and
	  AceLibrary("AceEvent-2.0"):IsEventRegistered("BugGrabber_BugGrabbed") then
		if added then
			AceLibrary("AceEvent-2.0"):TriggerEvent("BugGrabber_BugGrabbed", oe)
		else
			AceLibrary("AceEvent-2.0"):TriggerEvent("BugGrabber_BugGrabbedAgain", oe)
		end
	elseif not looping and not BugGrabber.bugsackErrors and added then
		DEFAULT_CHAT_FRAME:AddMessage(string.format(UNIQUE_CAPTURE, oe.message))
	end
end

-- Event handlers
function BugGrabber.AddonLoaded()
	BugGrabber.loaded = true

	-- Persist defaults and make sure we have sane SavedVariables
	if not BugGrabberDB or type(BugGrabberDB) ~= "table" then
		BugGrabberDB = {}
	end
	if not BugGrabberDB.session or type(BugGrabberDB.session) ~= "number" then
		BugGrabberDB.session = 0
	end
	if not BugGrabberDB.errors or type(BugGrabberDB.errors) ~= "table" then
		BugGrabberDB.errors = {}
	end
	if not BugGrabberDB.limit or type(BugGrabberDB.limit) ~= "number" then
		BugGrabberDB.limit = 100
	end
	if BugGrabberDB.save == nil or type(BugGrabberDB.save) ~= "boolean" then
		BugGrabberDB.save = true
	end

	-- From now on we can persist errors. Create a new session.
	BugGrabberDB.session = BugGrabberDB.session + 1

	-- Determine the correct database
	local db = BugGrabber.GetDB()

	-- Cut down on the nr of errors if it is over 100
	while table.getn(db) + table.getn(BugGrabber.loadErrors) > BugGrabberDB.limit do
		table.remove(db, 1)
	end

	-- Save the errors that occurred while our variables were loading
	-- in the correct database.
	for _,err in pairs(BugGrabber.loadErrors) do
		err.session = BugGrabberDB.session
		table.insert(db, err)
	end

	-- Now do away with the temporary database
	BugGrabber.loadErrors = nil
end

local temporaryList = nil
function BugGrabber.PrintLoadError(index)
	if not index or tostring(index) == "" then
		DEFAULT_CHAT_FRAME:AddMessage(USAGE)
		return
	end
	if not tonumber(index) then
		DEFAULT_CHAT_FRAME:AddMessage(ERROR_INDEX)
		return
	end
	index = tonumber(index)
	if not temporaryList or not temporaryList[index] then
		DEFAULT_CHAT_FRAME:AddMessage(string.format(ERROR_UNKNOWN_INDEX, index))
		return
	end
	local err = temporaryList[index]
	if not err or not type(err) == "table" or not err.message or not type(err.message) == "string" then return end
	DEFAULT_CHAT_FRAME:AddMessage(tostring(index) .. ". " .. err.message)
end

function BugGrabber.PlayerLogin()
	-- On player login, check to see whether we had load time errors and
	-- display them in the chat frame if we can't find BugSack. We cheat
	-- by letting BugSack reset BugGrabber.bugsackErrors so we can just
	-- check that.
	local err = BugGrabber.bugsackErrors
	if err and type(err) == "table" and table.getn(err) > 0 then
		local num = table.getn(err)
		local _G = getfenv(0)
		if num > 4 and type(_G.SlashCmdList) == "table" and type(_G) == "table" then
			DEFAULT_CHAT_FRAME:AddMessage(string.format(STARTUP_ERRORS_MANY, num))
			local name = "BUGGRABBERCMD"
			local counter = 0
			repeat
				name = "BUGGRABBERCMD"..tostring(counter)
				counter = counter + 1
			until not _G.SlashCmdList[name] and not _G["SLASH_"..name.."1"]
			_G.SlashCmdList[name] = BugGrabber.PrintLoadError
			_G["SLASH_"..name.."1"] = "/buggrabber"

			temporaryList = {}
			for _, v in ipairs(err) do
				table.insert(temporaryList, v)
			end
		else
			DEFAULT_CHAT_FRAME:AddMessage(string.format(STARTUP_ERRORS, num))
			for k,e in ipairs(err) do
				DEFAULT_CHAT_FRAME:AddMessage(tostring(k) .. ". " .. e.message)
			end
		end
	end

	-- No need to wait for BugSack to load anymore
	BugGrabber.bugsackErrors = nil
end

function BugGrabber.OnEvent()
	if event == "ADDON_LOADED" and arg1 == "!BugGrabber" then
		BugGrabber.AddonLoaded()
	elseif event == "PLAYER_LOGIN" then
		BugGrabber.PlayerLogin()
	elseif event == "ADDON_ACTION_BLOCKED" or event == "ADDON_ACTION_FORBIDDEN" then
		BugGrabber.GrabError(nil, string.format(ADDON_CALL_PROTECTED, event, arg1, arg2))
	end
end

-- Simple setters/getters for settings, meant to be accessed by BugSack
function BugGrabber.GetSave()
	return BugGrabberDB.save
end

function BugGrabber.ToggleSave()
	BugGrabberDB.save = not BugGrabberDB.save
	if BugGrabberDB.save then
		BugGrabberDB.errors = BugGrabber.errors
		BugGrabber.errors = {}
	else
		BugGrabber.errors = BugGrabberDB.errors
		BugGrabberDB.errors = {}
	end
end

function BugGrabber.GetLimit()
	return BugGrabberDB.limit
end

function BugGrabber.SetLimit(l)
	if not l or type(l) ~= "number" or l < 10 or l > 100 then
		return false
	end

	BugGrabberDB.limit = math.floor(l)

	local db = BugGrabber.GetDB()
	while table.getn(db) > l do
		table.remove(db, 1)
	end
	return true
end

-- Save the old handlers in case someone wants to restore them
BugGrabber.oldset = ScriptErrors_Message.SetText
BugGrabber.oldshow = ScriptErrors.Show

-- Set up the new handlers
ScriptErrors_Message.SetText = BugGrabber.GrabError
ScriptErrors.Show = function() end

-- Now register for our needed events
f:RegisterEvent("ADDON_LOADED")
f:RegisterEvent("PLAYER_LOGIN")
f:RegisterEvent("ADDON_ACTION_BLOCKED")
f:RegisterEvent("ADDON_ACTION_FORBIDDEN")
f:SetScript("OnEvent", BugGrabber.OnEvent)

-- vim:set ts=4:

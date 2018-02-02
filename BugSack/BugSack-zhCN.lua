local L = AceLibrary("AceLocale-2.2"):new("BugSack")

L:RegisterTranslations("zhCN", function()
	return {
		-- Bindings
		["Show Current Error"] = "显示当前错误",
		["Show Session Errors"] = "显示本次连接错误",

		-- Command descriptions
		["Show sack"] = "显示BugSack",
		["Show errors in the sack."] = "在BugSack窗口中显示错误信息。",
		["Current error"] = "当前错误",
		["Show the current error."] = "显示当前错误。",
		["Current session"] = "本次连接",
		["Show errors from the current session."] = "显示本次连接错误。",
		["Previous session"] = "上次连接",
		["Show errors from the previous session."] = "显示上次连接错误。",
		["By session number"] = "连接编号",
		["Show errors by session number."] = "显示指定编号连接错误。",
		["All errors"] = "所有错误",
		["Show all errors."] = "显示所有错误。",

		["List errors"] = "列出错误",
		["List errors to the chat frame."] = "在聊天窗口中列出错误。",
		["List the current error."] = "列出当前错误",
		["List errors from the current session."] = "列出本次连接错误",
		["List errors from the previous session."] = "列出上次连接错误",
		["List errors by session number."] = "列出指定编号连接错误",
		["List all errors."] = "列出所有错误",

		["Auto popup"] = "自动弹出",
		["Toggle auto BugSack frame popup."] = "遇到错误自动弹出BugSack窗口。",
		["Chatframe output"] = "聊天窗口警报",
		["Print a warning to the chat frame when an error occurs."] = "遇到错误自动在聊天窗口显示一条警报。",
		["Errors to chatframe"] = "聊天窗口详细显示",
		["Print the full error message to the chat frame instead of just a warning."] = "遇到错误自动在聊天窗口输出错误信息。",
		["Mute"] = "静音",
		["Toggle an audible warning everytime an error occurs."] = "遇到错误时不发出音效。",
		["Save errors"] = "保存错误",
		["Toggle whether to save errors to your SavedVariables\\!BugGrabber.lua file."] = "在SavedVariables\\!BugGrabber.lua文件中保存错误信息。",
		["Limit"] = "错误条数限制",
		["Set the limit on the nr of errors saved."] = "设置保存错误的最大条数。",

		["Generate bug"] = "模拟错误",
		["Generate a fake bug for testing."] = "生成一个假的错误来对BugSack进行测试。",
		["Script bug"] = "脚本错误",
		["Generate a script bug."] = "生成一个脚本错误。",
		["Addon bug"] = "插件错误",
		["Generate an addon bug."] = "生成一个插件错误。",

		["Clear errors"] = "清除错误",
		["Clear out the errors database."] = "清除所有保存的错误。",

		-- Chat messages
		["You have no errors, yay!"] = "未发现错误。",
		["List of errors:"] = "错误列表：",
		["An error has been generated."] = "生成了一条错误",
		["BugSack generated this fake error."] = "BugSack生成了这条假错误。",
		["All errors were wiped."] = "所有错误信息已被清除。",
		["An error has been recorded."] = "一条错误已被纪录。",
		["%d errors have been recorded."] = "%d 个错误已被记录。",

		-- Frame messages,
		[" (... more ...)"] = "(... 更多 ...)",
		["No errors found"] = "发现错误请到http://www.luacn.net/反馈，QQ群:71367796|n",
		["Error %d of %d"] = "错误 %d / %d",
		[" (viewing last error)"] = " (查看最后一条错误)",
		[" (viewing session errors)"] = "   ",
		[" (viewing previous session errors)"] = " (查看上次连接错误)",
		[" (viewing all errors)"] = " (查看所有错误)",
		[" (viewing errors for session %d)"] = " (查看连接# %d 的错误)",

		-- FuBar plugin
		["Click to open the BugSack frame with the last error."] = "点击打开BugSack窗口查看最近的错误。",
	}
end)

if GetLocale() == "zhCN" then
	BugSackNextButton:SetText("下一个")
	BugSackLastButton:SetText("最后")
	BugSackPrevButton:SetText("上一个")
	BugSackFirstButton:SetText("最初")
end

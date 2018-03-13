assert( BigWigs, "BigWigs not found!")

------------------------------
--      Are you local?      --
------------------------------

local L = AceLibrary("AceLocale-2.2"):new("BigWigsKtm")

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	["KTM Options"] = "KTM选项",
	["bwktm"] = "bwktm",
	["Options for KTM"] = "KTM的一些设置",
	["Enable resetting (requires (A) or (L))"] = "启用复位(需要A或L)",
	["Reset KTM for the raid when asked by bossmods."] = "复位团队KTM,当遇到boss时",
} end)


----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsKtm = BigWigs:NewModule(L["KTM Options"])
BigWigsKtm.revision = 20001
BigWigsKtm.defaultDB = {
	enable = false,
}
BigWigsKtm.consoleCmd = L["bwktm"]
BigWigsKtm.consoleOptions = {
	type = "group",
	name = L["KTM Options"],
	desc = L["Options for KTM"],
	args = {
		enable = {
			type = "toggle",
			name = L["Enable resetting (requires (A) or (L))"],
			desc = L["Reset KTM for the raid when asked by bossmods."],
			order = 1,
			get = function() return BigWigsKtm.db.profile.enable end,
			set = function(v) BigWigsKtm.db.profile.enable = v end,
		},
	}
}

------------------------------
--      Utility 	        --
------------------------------

function BigWigsKtm:KTM_Reset()
	if self.db.profile.enable then
		klhtm.net.clearraidthreat()
	end
end
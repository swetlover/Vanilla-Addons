--Version--------------------------------------------------
RANGECOLOR_VERSION = "v1.9";
RANGECOLOR_RELEASE = "14 October 2005";

--English--------------------------------------------------
if (GetLocale() == "zhCN") then

	-- Bindings	
	BINDING_HEADER_RANGECOLORHEADER = "距离颜色";
	BINDING_NAME_RANGECOLOR = "距离颜色选项菜单.";
	BINDING_CATEGORY_RANGECOLORHEADER = "interface";
	
	-- Options
	RANGECOLOROPTIONS_COLORWATCH1 = {name = "OutOfRange_Icon", text = "图标", tooltipText = "当超出距离时改变的图标颜色"};
	RANGECOLOROPTIONS_COLORWATCH2 = {name = "OutOfRange_Border", text = "边框", tooltipText = "当超出距离时改变的边框颜色"};
	RANGECOLOROPTIONS_COLORWATCH3 = {name = "OutOfRange_Hotkey", text = "热键", tooltipText = "当超出距离时改变的热键颜色"};
	RANGECOLOROPTIONS_COLORWATCH4 = {name = "NoMana_Icon", text = "图标", tooltipText = "当法力值不够时改变的图标颜色"};
	RANGECOLOROPTIONS_COLORWATCH5 = {name = "NoMana_Border", text = "边框", tooltipText = "当法力值不够时改变的边框颜色"};
	RANGECOLOROPTIONS_COLORWATCH6 = {name = "NoMana_Hotkey", text = "热键", tooltipText = "当法力值不够时改变的热键颜色"};
	RANGECOLOROPTIONS_COLORWATCH7 = {name = "NotUsable_Icon", text = "图标", tooltipText = "当不能使用时改变的图标颜色"};
	RANGECOLOROPTIONS_COLORWATCH8 = {name = "NotUsable_Border", text = "边框", tooltipText = "当不能使用时改变的边框颜色"};
	RANGECOLOROPTIONS_COLORWATCH9 = {name = "NotUsable_Hotkey", text = "热键", tooltipText = "当不能使用时改变的热键颜色"};
	RANGECOLOROPTIONS_COLORWATCH10 = {name = "Usable_Icon", text = "图标", tooltipText = "当可以使用时改变的图标颜色"};
	RANGECOLOROPTIONS_COLORWATCH11 = {name = "Usable_Border", text = "边框", tooltipText = "当可以使用时改变的边框颜色"};
	RANGECOLOROPTIONS_COLORWATCH12 = {name = "Usable_Hotkey", text = "热键", tooltipText = "当可以使用时改变的热键颜色"};
	RANGECOLOROPTIONS_SLIDER1 = { name="显示类型", minText="热键", maxText="图标", tooltipText = "Shade the hotkey, the icon, or both"};
	RANGECOLOROPTIONS_CHECK1 = { name = "过滤", tooltipText = "显示 'Shift' 为 'S', 'Alt', 'Ctrl', 等等相同."};
	RANGECOLOROPTIONS_CHECK2 = { name = "缩略", tooltipText = "显示 'S-1' 为 'S1', 过滤必须激活."};
	RANGECOLOROPTIONS_RESETTOOLTIPTEXT = "这将重置所有选项的初始值."
	
	-- myAddons Help
	RangeColorHelp = {};
	RangeColorHelp[1] = "|cff00ff00距离颜色 帮助|r\n\n使用 |cffffff00/rangecolor|r 或 |cffffff00/rc|r 打开选项菜单.\n\n使用 |cffff3300复位|r 重置设置.";
end

--German---------------------------------------------------
if (GetLocale() == "deDE") then

	-- translated by timcn
	
	-- Bindings	
	BINDING_HEADER_RANGECOLORHEADER = "Reichweitenfarbe";
	BINDING_NAME_RANGECOLOR = "\195\150ffnet das Reichweitenfarben-Men\195\188";
	BINDING_CATEGORY_RANGECOLORHEADER = "interface";
	
	-- Options
	RANGECOLOROPTIONS_COLORWATCH1 = {name = "OutOfRange_Icon", text = "Icon", tooltipText = "\195\132ndert die Farbe des Icons wenn das Ziel au\195\159er Reichweite ist"};
	RANGECOLOROPTIONS_COLORWATCH2 = {name = "OutOfRange_Border", text = "Rand", tooltipText = "\195\132ndert die Farbe des Randes wenn das Ziel au\195\159er Reichweite ist"};
	RANGECOLOROPTIONS_COLORWATCH3 = {name = "OutOfRange_Hotkey", text = "Tastenk\195\188rzel", tooltipText = "\195\132ndert die Farbe des Tastenk\195\188rzels wenn das Ziel au\195\159er Reichweite ist"};
	RANGECOLOROPTIONS_COLORWATCH4 = {name = "NoMana_Icon", text = "Icon", tooltipText = "\195\132ndert die Farbe des Icons wenn zu wenig Mana vorhanden ist"};
	RANGECOLOROPTIONS_COLORWATCH5 = {name = "NoMana_Border", text = "Rand", tooltipText = "\195\132ndert die Farbe des Randes wenn zu wenig Mana vorhanden ist"};
	RANGECOLOROPTIONS_COLORWATCH6 = {name = "NoMana_Hotkey", text = "Tastenk\195\188rzel", tooltipText = "\195\132ndert die Farbe des Tastenk\195\188rzels wenn zu wenig Mana vorhanden ist"};
	RANGECOLOROPTIONS_COLORWATCH7 = {name = "NotUsable_Icon", text = "Icon", tooltipText = "\195\132ndert die Farbe des Icons wenn es nicht benutzbar ist"};
	RANGECOLOROPTIONS_COLORWATCH8 = {name = "NotUsable_Border", text = "Rand", tooltipText = "\195\132ndert die Farbe des Randes wenn es nicht benutzbar ist"};
	RANGECOLOROPTIONS_COLORWATCH9 = {name = "NotUsable_Hotkey", text = "Tastenk\195\188rzel", tooltipText = "\195\132ndert die Farbe des Tastenk\195\188rzels wenn es nicht benutzbar ist"};
	RANGECOLOROPTIONS_COLORWATCH10 = {name = "Usable_Icon", text = "Icon", tooltipText = "\195\132ndert die Farbe des Icons wenn es bereit ist"};
	RANGECOLOROPTIONS_COLORWATCH11 = {name = "Usable_Border", text = "Rand", tooltipText = "\195\132ndert die Farbe des Randes wenn es bereit ist"};
	RANGECOLOROPTIONS_COLORWATCH12 = {name = "Usable_Hotkey", text = "Tastenk\195\188rzel", tooltipText = "\195\132ndert die Farbe des Tastenk\195\188rzels wenn es bereit ist"};
	RANGECOLOROPTIONS_SLIDER1 = { name="Display", minText="Tastenk\195\188rzel", maxText="Icon", tooltipText = "Schattierung des Tastenk\195\188rzels, des Icons oder beider"};
	RANGECOLOROPTIONS_CHECK1 = { name = "Filter", tooltipText = "Show 'Shift' as 'S', same for 'Alt', 'Ctrl', etc."};
	RANGECOLOROPTIONS_CHECK2 = { name = "Dash", tooltipText = "Show 'S-1' as 'S1', Filter must be activated."};
	RANGECOLOROPTIONS_RESETTOOLTIPTEXT = "This will reset all the options to an initial value."
	
		-- myAddons Help
	RangeColorHelp = {};
	RangeColorHelp[1] = "|cff00ff00RangeColor Help|r\n\nType |cffffff00/rangecolor|r or |cffffff00/rc|r to open the options menu.\n\nUse the |cffff3300Reset|r button in the options menu to load the deafult options or to solve any errors.";
end

--French---------------------------------------------------
if (GetLocale() == "frFR") then

	-- translated by Feu
	
	-- Bindings	
	BINDING_HEADER_RANGECOLORHEADER = "Range Color";
	BINDING_NAME_RANGECOLOR = "Menu d'options de Range Color.";
	BINDING_CATEGORY_RANGECOLORHEADER = "interface";
	
	-- Options
	RANGECOLOROPTIONS_COLORWATCH1 = {name = "OutOfRange_Icon", text = "Icon", tooltipText = "Change la couleur de l'ic\195\180ne quand hors de port\195\169e"};
	RANGECOLOROPTIONS_COLORWATCH2 = {name = "OutOfRange_Border", text = "边框", tooltipText = "Change la couleur de la bordure quand hors de port\195\169e"};
	RANGECOLOROPTIONS_COLORWATCH3 = {name = "OutOfRange_Hotkey", text = "热键", tooltipText = "Change la couleur du raccourci quand hors de port\195\169e"};
	RANGECOLOROPTIONS_COLORWATCH4 = {name = "NoMana_Icon", text = "Icon", tooltipText = "Change la couleur de l'ic\195\180ne quand plus de mana"};
	RANGECOLOROPTIONS_COLORWATCH5 = {name = "NoMana_Border", text = "边框", tooltipText = "Change la couleur de la bordure quand plus de mana"};
	RANGECOLOROPTIONS_COLORWATCH6 = {name = "NoMana_Hotkey", text = "热键", tooltipText = "Change la couleur du raccourci quand plus de mana"};
	RANGECOLOROPTIONS_COLORWATCH7 = {name = "NotUsable_Icon", text = "Icon", tooltipText = "Change la couleur de l'ic\195\180ne quand non utilisable"};
	RANGECOLOROPTIONS_COLORWATCH8 = {name = "NotUsable_Border", text = "边框", tooltipText = "Change la couleur de la bordure quand non utilisable"};
	RANGECOLOROPTIONS_COLORWATCH9 = {name = "NotUsable_Hotkey", text = "热键", tooltipText = "Change la couleur du raccourci quand non utilisable"};
	RANGECOLOROPTIONS_COLORWATCH10 = {name = "Usable_Icon", text = "Icon", tooltipText = "Change la couleur de l'ic\195\180ne quand pr\195\180t"};
	RANGECOLOROPTIONS_COLORWATCH11 = {name = "Usable_Border", text = "边框", tooltipText = "Change la couleur de la bordure quand pr\195\170t"};
	RANGECOLOROPTIONS_COLORWATCH12 = {name = "Usable_Hotkey", text = "热键", tooltipText = "Change la couleur du raccourci quand pr\195\170t"};
	RANGECOLOROPTIONS_SLIDER1 = { name="Display", minText="热键", maxText="Icon", tooltipText = "Assombrir le raccourci, l'ic\195\180, ou les deux"};
	RANGECOLOROPTIONS_CHECK1 = { name = "Filter", tooltipText = "Affiche 'S' au lieu de 'Shift', de m\195\170me pour 'Alt', 'Ctrl', etc."};
	RANGECOLOROPTIONS_CHECK2 = { name = "Dash", tooltipText = "Affiche 'S1' au lieu de 'S-1'. Le filtre doit \195\170tre activ\195\169."};
	RANGECOLOROPTIONS_RESETTOOLTIPTEXT = "This will reset all the options to an initial value."
	
		-- myAddons Help
	RangeColorHelp = {};
	RangeColorHelp[1] = "|cff00ff00RangeColor Help|r\n\nType |cffffff00/rangecolor|r or |cffffff00/rc|r to open the options menu.\n\nUse the |cffff3300Reset|r button in the options menu to load the deafult options or to solve any errors.";
end
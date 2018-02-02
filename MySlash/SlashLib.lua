------------------------------------- VARIABLES ---------------------------------------
SLIB_NOM = "插件命令控制台";
SLIB_VERS = "SlashLib";

------------- valeurs par defaut
SlashLibSaved = {};
SlashLibSaved["showMinimapIcon"] = true;
SlashLibSaved["minimapIconAngle"] = -1.56;
SlashLibSaved["closeRun"] = true;

SlashLibSavedData = {};
SlashLibSavedData[1] = {"初始设置","/run print(\"已为您调整TAB的范围为50\")\n/run print(\"已调整战斗取值的范围为150\")\n/run print(\"已设置最大的视野为50\")\n/console SET targetNearestDistance \"50\"\n/console SET targetNearestDistanceRadius \"50\"\n/console SET CombatLogRangePartyPet \"150\"\n/console SET CombatLogRangeFriendlyPlayers \"150\"\n/console SET CombatLogRangeFriendlyPlayersPets \"150\"\n/console SET CombatLogRangeHostilePlayers \"150\"\n/console SET CombatLogRangeHostilePlayersPets \"150\"\n/console SET CombatLogRangeCreature \"150\"\n/console SET CombatLogRangeParty \"150\"\n/console SET CombatDeathLogRange \"150\"\n/console SET screenshotQuality 10\n/script SetCVar(\"cameraDistanceMax\", 50)",1};
SlashLibSavedData[2] = {"加入频道","/run print(\"加入World/China频道\")\n/join World\n/join China",1};
SlashLibSavedData[3] = {"离开频道","/run print(\"离开World/China频道\")\n/leave World\n/leave China",1};
SlashLibSavedData[4] = {"屏蔽频道","/run print(\"屏蔽加入/离开频道\")\n/script ChatFrame_RemoveMessageGroup(ChatFrame1, \"CHANNEL\")",1};
SlashLibSavedData[5] = {"重置副本","/run print(\"重置所有副本\")\n/script ResetInstances()",1};
SlashLibSavedData[6] = {"密语法师吃喝","/run print(\"密语法师要吃喝\")\n/script if UnitClass(\"target\")==\"法师\" then SendChatMessage(\"Can I have some water and bread?thx!\",\"whisper\",GetDefaultLanguage(\"target\"),UnitName(\"target\"));if IsAltKeyDown() then InitiateTrade(\"target\");end;end;",1};
SlashLibSavedData[7] = {"取消拯救祝福","/run print(\"取消拯救祝福\")\n/script local i,a=1;while UnitBuff(\"player\",i) do if string.find(UnitBuff(\"player\",i),\"Spell_Holy_GreaterBlessingofSalvation\") then a=i;break;end;i=i+1;end;if a then CancelPlayerBuff(a-1);end",1};
SlashLibSavedData[8] = {"倒数5秒","/run print(\"倒数5秒\")\n/in 1 /raid 开始倒数！\n/in 2 /raid 5\n/in 3 /raid 4\n/in 4 /raid 3\n/in 5 /raid 2\n/in 6 /raid 1\n/in 7 /raid 倒数结束！",1};
SlashLibSavedData[9] = {"网格界面","/run print(\"已打网格界面align\")\n/align",1};
SlashLibSavedData[10] = {"自动邀请开启","/run print(\"自动邀请已开启，输入/ai查看更多命令。\")\n/ai on",1};
SlashLibSavedData[11] = {"自动邀请关闭","/run print(\"自动邀请已关闭，输入/ai查看更多命令。\")\n/ai off",1};
SlashLibSavedData[12] = {"DKP记录系统","/run print(\"请访问DKP记录网站:http://www.eryuhaian.com/dkp上传工会DKP分数\")\n/rt\n/rt options/o",1};
SlashLibSavedData[13] = {"分配助手开启","/run print(\"已开启分配助手MasterLute\")\n/masterlute enable",1};
SlashLibSavedData[14] = {"分配助手关闭","/run print(\"已关闭分配助手MasterLute\")\n/masterlute disable",1};
SlashLibSavedData[15] = {"战斗信息增强","/run print(\"已打开战斗信息增强MSBT设置界面\")\n/msbt",1};
SlashLibSavedData[16] = {"聊天增强","/run print(\"已打开聊天增强chatmod设置界面\")\n/chatmod",1};
SlashLibSavedData[17] = {"飞行助手","/run print(\"已打开飞行助手flightmap设置界面\")\n/flightmap",1};
SlashLibSavedData[18] = {"调试插件","/run print(\"调试插件\")\n/console reloadui",1};
--SlashLibSavedData[2] = {"附魔助手","/run print(\"已为您打开附魔助手\")\n/enchantrix load always",1};
--SlashLibSavedData[3] = {"配方助手","/adspace",1};
--SlashLibSavedData[4] = {"网格界面","/align",1};
--SlashLibSavedData[5] = {"Zbar动作条","/zbar",1};
--SlashLibSavedData[6] = {"飞行助手","/flightmap",1};
--SlashLibSavedData[7] = {"自动跳过闲谈","/run print(\"关闭/打开自动闲谈\")\n/chatmod autogossipskip",1};
--SlashLibSavedData[8] = {"费伍德水果","/fwg\n/fwg config\n/fwg map",1};
--SlashLibSavedData[9] = {"(玩家)战斗指示器","/run print(\"已为您打开战斗指示器（玩家）\")\n/sct",1};
--SlashLibSavedData[10] = {"(目标)战斗指示器","/run print(\"已为您打开战斗指示器（目标）\")\n/dex",1};
--SlashLibSavedData[11] = {"坦克助手","/tb",1};
--SlashLibSavedData[12] = {"猎人守护助手","/ad options",1};
--SlashLibSavedData[13] = {"自动射击计时","/run print(\"您还可以输入/zcastbar move来移动计时条\")\n/zcastbar auto",1};
--SlashLibSavedData[14] = {"猎人瞄准射击计时","/run print(\"您还可以输入/zcastbar move来移动计时条\")\n/zcastbar aimed",1};
--SlashLibSavedData[15] = {"猎人智能脱装备","/run print(\"慎用！在脱离战斗时自动脱去装备，shift+ctrl+alt+左键移动图标\")\n/zstrip display",1};
--SlashLibSavedData[16] = {"小队通知","/script TeamNotice:Show();\n/script TeamNoticeEB:Show();",1};
--SlashLibSavedData[17] = {"自动邀请开启","/run print(\"默认超过5人时转换为团队，您可以通过/ai part转换为5人小队模式，输入/ai查看更多命令。\")\n/ai on",1};
--SlashLibSavedData[18] = {"自动邀请关闭","/ai off",1};
--SlashLibSavedData[19] = {"DKP记录系统","/run print(\"请访问DKP记录网站:http://www.eryuhaian.com/dkp上传工会DKP分数\")\n/rt\n/rt options/o",1};
--SlashLibSavedData[20] = {"战场计时条","/avbarstest",1};
--SlashLibSavedData[21] = {"战场迷你地图","/run print(\"弹出战场迷你地图\")\n/chatmod AutoBGMap",1};
--SlashLibSavedData[22] = {"加入频道","/run print(\"加入World/China频道\")\n/join World\n/join China",1};
--SlashLibSavedData[23] = {"离开频道","/run print(\"离开World/China频道\")\n/leave World\n/leave China",1};
--SlashLibSavedData[24] = {"重置副本","/run print(\"重置所有副本\")\n/script ResetInstances()",1};
--SlashLibSavedData[25] = {"调试插件","/run print(\"调试插件\")\n/console reloadui",1};
--SlashLibSavedData[26] = {"倒数开怪","/run print(\"倒数10秒开怪\")\n/pull 10",1};
--SlashLibSavedData[27] = {"新建计时","/run print(\"新建一个X秒的DBM计时条\")\n/DBM timer 10 测试",1};
--SlashLibSavedData[28] = {"广播计时","/run print(\"广播一个X秒的DBM计时条\")\n/DBM broadcast timer 10 测试",1};
--SlashLibSavedData[29] = {"屏蔽频道","/run print(\"屏蔽加入/离开频道\")\n/script ChatFrame_RemoveMessageGroup(ChatFrame1, \"CHANNEL\")",1};



-------------
TABLEVISBTNS = {};
SLIBLIGNE = {};
SLIBSCROLLHEIGHT = 28; -- hauteur ligne
SLIBVISLINE = 14; -- nombre de lignes visibles dans la main UI -- nombre de lignes visibles : SLIBVISLINE * SLIBSCROLLHEIGHT = hauteur ScrollFrame et aussi nombre de boutons-lignes
SLIBVISLINELIST = 28; -- nombre de lignes visibles dans la liste des slash-cmds
SLIBLISTALLCMDS = {};
local SEPLIGNE = "\n";
local enTest = false;

---------------------------------------------------------------------------------------
-------------------------- CHARGEMENT / COMMANDES /BINDINGS ---------------------------
function slibChargement()
	SlashCmdList["SLIBSHOWUI"] = slibUIShow;
		SLASH_SLIBSHOWUI1 = "/slashlib";
		SLASH_SLIBSHOWUI2 = "/cj";

	SlashCmdList["SLIBDOBTN"] = slibDoNomBtn;
		SLASH_SLIBDOBTN1 = "/slashlibdo";
		SLASH_SLIBDOBTN2 = "/slashlibexe";
		SLASH_SLIBDOBTN3 = "/slibdo";
		SLASH_SLIBDOBTN4 = "/slibexe";

	SlashCmdList["SLIBSHOWICON"] = slibMinimapIconShowSwitch;
		SLASH_SLIBSHOWICON1 = "/slashlibshowicon";
		SLASH_SLIBSHOWICON2 = "/slibshow";
		SLASH_SLIBSHOWICON3 = "/slibshowicon";
		SLASH_SLIBSHOWICON4 = "/slibicon";

	SlashCmdList["SLIBRESET"] = slibResetAll;
		SLASH_SLIBRESET1 = "/slibrao";
		SLASH_SLIBRESET2 = "/slashlibreset";

	SlashCmdList["SLIBHELP"] = slibHelpVers;
		SLASH_SLIBHELP1 = "/slashlibhelp";

	SlashCmdList["SLIBDEBUG"] = slibDebugOnOff;
		SLASH_SLIBDEBUG1 = "/slibdebug";

	SlashCmdList["SLIB_TEST"] = slibTest;
		SLASH_SLIB_TEST1 = "/slibx";

	-------------- bindings
	BINDING_HEADER_SLASHLIB = SLIB_NOM;
	BINDING_NAME_SLIBshow = "显示控制台";

	-------------- suite
	slibLigneInit();
	if (SlashLibSaved["showMinimapIcon"]) then slibMinimapIconShow(); end;
	echo(SLIB_NOM.." "..SLIB_VERS.." 已载入 - 输入 /cj 查阅更多的帮助信息.","blue");
end

---------------------------------------------------------------------------------------
------------------------------------------ UI -----------------------------------------
function slibMinimapIconShowSwitch()
	if (forcerVisible or Slib_MinimapBtn:IsVisible()) then
		SlashLibSaved["showMinimapIcon"] = false;
		Slib_MinimapBtn:Hide();
	else
		slibMinimapIconShow();
	end;
end

function slibMinimapIconShow()
	SlashLibSaved["showMinimapIcon"] = true;
	Slib_MinimapBtn:ClearAllPoints();
	slibMinimapButton_SetPositionAngle(SlashLibSaved["minimapIconAngle"]);
	Slib_MinimapBtn:Show();
end

function slibUIShow()
	if (SlibFrame:IsVisible()) then
		slibUIClose();
	else
		slibUIClose(); -- menage
		SlibFrame:Show(); -- ne pas intervertir avec la ligne suivante !
		slibScrollerUpdate(); -- ne pas intervertir avec la ligne precedente !
	end;
end

function slibScrollerUpdate()
	TABLEVISBTNS = {};
	local line; -- 1 through SLIBVISLINE
	local linePlusOffset; -- an index into our data calculated from the scroll offset
	local nbreLiMax = getn(SlashLibSavedData); -- nombre de lignes
	FauxScrollFrame_Update(SlibFrameScroller,nbreLiMax,SLIBVISLINE,SLIBSCROLLHEIGHT);
	if (enTest) then echo(SLIB_NOM.."---Scroll at "..FauxScrollFrame_GetOffset(SlibFrameScroller)); end;
	for line = 1,SLIBVISLINE,1 do
		linePlusOffset = line + FauxScrollFrame_GetOffset(SlibFrameScroller);
		if (linePlusOffset <= nbreLiMax) then
			TABLEVISBTNS[line] = SlashLibSavedData[linePlusOffset];
			TABLEVISBTNS[line][4] = linePlusOffset;
			getglobal("SlibFrameLine_"..line.."_BtnTitre_TxtTitre"):SetText(TABLEVISBTNS[line][1]);
			getglobal("SlibFrameLine_"..line.."_BtnCmd_Tex"):SetTexture(0.3,0.3,0.3,0.4);
			local genre = TABLEVISBTNS[line][3];
			if (genre == 2) then -- emote
				getglobal("SlibFrameLine_"..line.."_BtnTitre_TxtTitre"):SetTextColor(0.4,0.7,0.9);
			elseif (genre == 3) then -- macro
				getglobal("SlibFrameLine_"..line.."_BtnTitre_TxtTitre"):SetTextColor(0.9,0.4,0.4);
			else
				getglobal("SlibFrameLine_"..line.."_BtnTitre_TxtTitre"):SetTextColor(0.9,0.9,0.4);
			end;
			getglobal("SlibFrameLine_"..line.."_BtnCmd_TxtCmd"):SetText(string.gsub(SlashLibSavedData[linePlusOffset][2],SEPLIGNE,"..."));
			getglobal("SlibFrameLine_"..line):Show();
		else
			getglobal("SlibFrameLine_"..line):Hide();
		end;
	end;
	SlibFrameScroller:Show(); -- ???
end

function slibUIDo(nomBouton)
	slibGetLibLigne(nomBouton);
	if (SLIBLIGNE["cmd"] ~= "") then
		if (SlashLibSaved["closeRun"]) then SlibFrame:Hide(); end;
		slibDoSlashCmd(SLIBLIGNE["cmd"]);
	else
		echo(SLIB_NOM..": 错误 - 命令 #"..SLIBLIGNE["numLi"].." 不存在!","red");
	end;
end

function slibUINew()
	slibUIEditResetTex();
	SlibNameDef:SetText("");
	SlibCmdDef:SetText("");
	slibUIEditAllumeRadios(1); -- genre "slash-cmd" par defaut
	slibLigneInit();
	placementMainFrame("TOP",180); -- 180 = hauteur frame edit
	SlibEditFrame:Show();
	SlibNameDef:SetFocus();
end

function slibUIClose()
	SlibListCmdsFrame:Hide();
	SlibEditFrame:Hide();
	SlibNameDef:SetText("");
	SlibCmdDef:SetText("");
	SlibFrame:Hide();
end

function slibUIEdit(nomBouton)
	slibGetLibLigne(nomBouton);
	if (SLIBLIGNE["numLi"] > 0) then
		slibUIEditResetTex();
		getglobal("SlibFrameLine_"..SLIBLIGNE["numLi"].."_BtnCmd_Tex"):SetTexture(1,1,0,0.9);
		SlibNameDef:SetText(SLIBLIGNE["nom"]);
		SlibCmdDef:SetText(SLIBLIGNE["cmd"]);
		slibUIEditAllumeRadios(SLIBLIGNE["genre"]);
		placementMainFrame("TOP",180); -- 180 = hauteur frame edit
		SlibEditFrame:Show();
		SlibNameDef:SetFocus();
	end;
end

function slibUIEditResetTex()
	for i = 1,SLIBVISLINE,1 do
		getglobal("SlibFrameLine_"..i.."_BtnCmd_Tex"):SetTexture(0.3,0.3,0.3,0.4);
	end;
end

function slibUIEditSave()
	local nom = SlibNameDef:GetText();
	if (nom ~= "") then
		local commande = SlibCmdDef:GetText();
		local novoLigne = {nom,commande,slibUIEditGetNumRadio()};
		if (SLIBLIGNE["numLi"] == 0) then -- new
			if (enTest) then echo(SLIB_NOM.."----保存新命令行="..SLIBLIGNE["numLi"].."---NumRad="..slibUIEditGetNumRadio().."."); end;
			table.insert(SlashLibSavedData,novoLigne);
		else
			if (enTest) then echo(SLIB_NOM.."----保存编辑命令行="..SLIBLIGNE["numLi"].."---NumRad="..slibUIEditGetNumRadio().."."); end;
			SlashLibSavedData[SLIBLIGNE["numLiOr"]] = novoLigne;
		end;
		---------
		SlashLibSavedData = sortTable(SlashLibSavedData,1,"A","A");
		---------
		slibScrollerUpdate();
		slibUIEditResetTex();
		SlibListCmdsFrame:Hide();
		SlibEditFrame:Hide();
	else
		echo(SLIB_NOM..": 键入个名字，定义为这个新的命令行!","red");
	end;
end

function slibUIEditDelete(nomBouton)
	if (nomBouton ~= nil and nomBouton ~= "") then -- si appel depuis l'UI principale (clic liste)
		slibGetLibLigne(nomBouton);
	end;
	if (SLIBLIGNE["numLi"] > 0) then -- appel normal : btn "delete" UI edition
		if (enTest) then echo(SLIB_NOM..":编辑删除---SLIB[numLi]="..SLIBLIGNE["numLi"].."---SLIB[numLiOr]="..SLIBLIGNE["numLiOr"].."---"); end;
		table.remove(SlashLibSavedData,SLIBLIGNE["numLiOr"]);
		slibScrollerUpdate();
		SlibEditFrame:Hide();
	else
		echo(SLIB_NOM..": 空的不能删除!","red");
	end;
end

function slibUIEditCancel()
	SlibListCmdsFrame:Hide();
	SlibEditFrame:Hide();
	SlibNameDef:SetText("");
	SlibCmdDef:SetText("");
	slibUIEditResetTex();
	slibLigneInit(); -- secu
end

function slibUIEditAllumeRadios(numBtn)
	SlibRadBtn1:SetChecked(0);
	SlibRadBtn2:SetChecked(0);
	SlibRadBtn3:SetChecked(0);
	if (numBtn ~= nil and numBtn ~= "") then
		local nbre = strToNumber(numBtn);
		if (nbre > 1 and nbre <= 3) then
			getglobal("SlibRadBtn"..numBtn):SetChecked(1);
		else
			SlibRadBtn1:SetChecked(1);
		end;
	else
		echo(SLIB_NOM..": 错误 - 无效按钮!","red");
	end;
end

function slibUIEditGetNumRadio()
	local i;
	for i = 1,3,1 do
		if (getglobal("SlibRadBtn"..i):GetChecked() == 1) then return i; end;
	end;
	return 1; -- defaut
end

function slibUIEditListShow()
	if (SlibListCmdsFrame:IsVisible()) then
		SlibListCmdsFrame:Hide();
	else
		listeAllSlashCmd(); -- remplissage SLIBLISTALLCMDS
		placementMainFrame("LEFT",196);-- 216 = largeur frame liste cmds
		SlibListCmdsFrame:Show(); -- ne pas intervertir avec la ligne suivante !
		slibScrollerListUpdate(); -- ne pas intervertir avec la ligne precedente !
	end;
end

function slibScrollerListUpdate()
	local line; -- 1 through nbreLiVis
	local linePlusOffset; -- an index into our data calculated from the scroll offset
	local nbreLiMax = getn(SLIBLISTALLCMDS); -- nombre de lignes
	FauxScrollFrame_Update(SlibListFrameScroller,nbreLiMax,SLIBVISLINELIST,SLIBSCROLLHEIGHT);
	if (enTest) then echo(SLIB_NOM.."---Scroll at "..FauxScrollFrame_GetOffset(SlibListFrameScroller)); end;
	for line = 1,SLIBVISLINELIST,1 do
		linePlusOffset = line + FauxScrollFrame_GetOffset(SlibListFrameScroller);
		if (linePlusOffset <= nbreLiMax) then
			getglobal("SlibListLigneBtn_"..line.."_Texte"):SetText(SLIBLISTALLCMDS[linePlusOffset]);
			getglobal("SlibListLigneBtn_"..line):Show();
		else
			getglobal("SlibListLigneBtn_"..line):Hide();
		end;
	end;
	SlibListFrameScroller:Show(); -- ???
end

function slibUIEditListClick(txtBouton)
	if (txtBouton ~= nil) then
		if (string.sub(txtBouton,1,1) == "/") then
			if (IsControlKeyDown()) then -- DO (TEST)
				SlibCmdDef:SetText(SlibCmdDef:GetText()..txtBouton);
			else -- AJOUT EDIT
				slibDoSlashCmd(txtBouton);
			end;
		else
			echo(SLIB_NOM..": 错误 - "..txtBouton.." 不是个有效命令行!","red");
		end;
	else
		echo(SLIB_NOM..": 错误 - 无效命令行(NIL)!","red");
	end;
end

---------------------------------------------------------------------------------------
------------------------------------ FCNS INTERNES ------------------------------------
function slibDoNomBtn(arg)
	if (arg ~= nil and arg ~= "") then
		local trouvePas = true;
		local nomSlash = string.upper(string.gsub(string.gsub(arg,"\"",""),"\'",""));
		for i = 1,getn(SlashLibSavedData),1 do
			if (string.upper(SlashLibSavedData[i][1]) == nomSlash) then
				trouvePas = false;
				slibDoSlashCmd(SlashLibSavedData[i][2]);
				break;
			end;
		end;
		if (trouvePas) then echo(SLIB_NOM..": 错误 - 无法找到脚本 "..nilSiNul(nomSlash).."!","red"); end;
	else
		echo(SLIB_NOM..": 错误 - 参数不能为空!","red");
	end;
end

function slibResetAll()
	SlashLibSaved = {};
	SlashLibSaved["showMinimapIcon"] = true;
	SlashLibSaved["minimapIconAngle"] = -1.23;
	SlashLibSaved["closeRun"] = true;

	SlibFrame:ClearAllPoints();
	SlibFrame:SetPoint("CENTER","UIParent","CENTER",0,100);
	slibMinimapIconShow();
	slibUIClose();
	slibUIShow();
	echo(SLIB_NOM..": 选项重置为默认值.","green");
end

function slibLigneInit()
	SLIBLIGNE = {};
	SLIBLIGNE["numLi"] = 0;
	SLIBLIGNE["nom"] = "";
	SLIBLIGNE["cmd"] = "";
	SLIBLIGNE["genre"] = 1; -- genre : 1 = slash-cmd, 2 = Emote et 3 = Macro
	SLIBLIGNE["numLiOr"] = 0;
end

function slibGetLibLigne(nomBouton)
	if (nomBouton ~= nil) then
		local numBtn = strToNumber(extractValeur(nomBouton,"_"));
		if (enTest) then echo(SLIB_NOM..":GETLIBLIGNE---BtnName="..nomBouton.."---LineNumber="..numBtn.."---"); end;
		if (numBtn > 0 and numBtn <= getn(TABLEVISBTNS)) then
			SLIBLIGNE["numLi"] = numBtn;
			SLIBLIGNE["nom"] = TABLEVISBTNS[numBtn][1];
			SLIBLIGNE["cmd"] = TABLEVISBTNS[numBtn][2];
			SLIBLIGNE["genre"] = TABLEVISBTNS[numBtn][3];
			SLIBLIGNE["numLiOr"] = TABLEVISBTNS[numBtn][4];
		else
			slibLigneInit();
			echo(SLIB_NOM..": 错误 - 无法找到 #"..nilSiNul(numBtn).."!","red");
		end;
	else
		slibLigneInit();
		echo(SLIB_NOM..": 错误 - 空行!","red");
	end;
end

function slibDoSlashCmd(chaineCmd)
	local chaine = chaineCmd..SEPLIGNE;
	local pos1,pos2,chaineTemp;
	local i = 1;
	while string.find(chaine,SEPLIGNE,1,true) ~= nil do
		pos1,pos2 = string.find(chaine,SEPLIGNE,1,true);
		chaineTemp = string.sub(chaine,1,pos1 - 1);
		if (enTest) then echo(SLIB_NOM.."---执行字串 "..i..":"..chaineTemp.."---"); end;
		-------- envoi ligne de commande
		if (string.sub(chaineTemp,1,1) == "/") then
			DEFAULT_CHAT_FRAME.editBox:SetText(chaineTemp);
			ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox,0);
		else
			echo(SLIB_NOM..": 错误 - "..chaineTemp.." 不是有效命令!","red");
		end;
		--------
		chaine = string.sub(chaine,pos2 + 1);
		i = i + 1;
		if (i > 50) then return; end; -- secu
	end;
end

function XXXXXXXXXXXXXXXXXXXXXslibDoSlashCmd(chaineCmd)
	local commande = strupper(chaineCmd);
	for index, value in SlashCmdList do
		local i = 1;
		local cmdString = TEXT(getglobal("SLASH_"..index..i));
		while ( cmdString ) do
			cmdString = strupper(cmdString);
			if ( cmdString == commande ) then
				value(commande);
				return;
			end
			i = i + 1;
			cmdString = TEXT(getglobal("SLASH_"..index..i));
		end
	end
	echo(SLIB_NOM..": 错误 - 未知命令 "..nilSiNul(chaineCmd)..".","red");
end

function listeAllSlashCmd()
	SLIBLISTALLCMDS = {};
	local prevCommande = "";
	for index,value in pairs(SlashCmdList) do -- SlashCmdList = table Blizzard des slash-cmds
		local i = 1;
		local cmdString = TEXT(getglobal("SLASH_"..index..i));
		while (cmdString) do
			if (cmdString ~= prevCommande) then
				table.insert(SLIBLISTALLCMDS,cmdString);
				prevCommande = cmdString;
			end;
			i = i + 1;
			cmdString = TEXT(getglobal("SLASH_"..index..i));
		end;
	end;
	table.sort(SLIBLISTALLCMDS);
end

function slibHelpVers()
	echo(SLIB_NOM.." 版本 "..SLIB_VERS..".","blue");
	slibSlashListe();
end

function slibDebugOnOff()
	enTest = not enTest;
	echo(SLIB_NOM..": 除错 "..booleanToSr(enTest)..".","green");
end

function slibTest(arg)
	local chaine;
	if (SlashLibSavedData ~= nil and SlashLibSavedData ~= "" or getn(SlashLibSavedData) < 1) then
		for i = 1,getn(SlashLibSavedData),1 do
			chaine = nilSiNul(SlashLibSavedData[i][2]);	echo("保存数据:"..i.."---"..nilSiNul(SlashLibSavedData[i][1]).."---"..string.sub(string.gsub(chaine,SEPLIGNE,"..."),1,10).."---"..nilSiNul(SlashLibSavedData[i][3]).."---","green");
		end;
	else
		echo("保存数据: 为零或空!!!","red");
	end;
end

---------------------------------------------------------------------------------------
-------------------------------------- LIBRAIRIE --------------------------------------
function sortTable(tableOr,cle,sens,genre)
	local tableTemp = {};
	for i in ipairs(tableOr)do
		table.insert(tableTemp,i);
	end;
	if (sens == nil) then sens = "A"; end;
	sens = string.upper(string.sub(sens,1,1));
	if (genre == nil) then genre = "N"; end;
	genre = string.upper(string.sub(genre,1,1));
	if (sens == "D") then
		if (genre == "A") then
			table.sort(tableTemp, function(a,b) return string.lower(tableOr[a][cle]) > string.lower(tableOr[b][cle]) end);
		else -- numerique par defaut
			table.sort(tableTemp, function(a,b) return tableOr[a][cle] > tableOr[b][cle] end);
		end;
	else -- ascendant par defaut
		if (genre == "A") then
			table.sort(tableTemp, function(a,b) return string.lower(tableOr[a][cle]) < string.lower(tableOr[b][cle]) end);
		else -- numerique par defaut
			table.sort(tableTemp, function(a,b) return tableOr[a][cle] < tableOr[b][cle] end);
		end;
	end;
	for i in ipairs(tableTemp)do
		tableTemp[i] = tableOr[tableTemp[i]];
	end
	return tableTemp;
end

function extractValeur(chaine,sep)
	-- renvoit la portion de la chaine passee situee entre les 2 premiers sep (ou vide si sep n'est pas trouve)
	if (chaine ~= nil and sep ~= nil) then
		local pos = string.find(chaine,"_",1,true);
		if (pos ~= nil) then
			local chaineTemp = string.sub(chaine,pos + 1);
			pos = string.find(chaineTemp,"_",1,true);
			if (pos ~= nil) then
				return (string.sub(chaineTemp,1,pos - 1));
			else
				return chaineTemp;
			end;
		else
			return "";
		end;
	else
		return nil;
	end;
end

function strToNumber(chaine)
	local valeur = tonumber(string.gsub(string.gsub(chaine,"\"",""),"\'",""),10);
	if (valeur == nil) then valeur = 0; end;
	return valeur;
end

function booleanToSr(valeur)
	if (valeur) then return "true"; else return "false"; end;
end

function booleanToBin(valeur)
	return (valeur == 1);
end

function videSiNul(valeur)
	if (valeur == nil) then return ""; else return valeur; end;
end

function nilSiNul(valeur)
	if (valeur == nil) then return "NIL"; else return valeur; end;
end

function placementMainFrame(sens,distance)
	--***
end

function XXXXXXXXXXXXXXXXplacementMainFrame(sens,distance) -- fais planter wow ? ***
	local largeurMainFrame,hauteurMainFrame = 352,384;
	local margeH,margeB,margeG,margeD = 10,50,10,10;
	local point,relativeTo,relativePoint,xOfs,yOfs = SlibFrame:GetPoint();

	if (string.upper(sens) == "TOP") then
		local ecran = GetScreenHeight();
		if ((ecran - (hauteurMainFrame + abs(yOfs))) < (distance + margeB)) then
			SlibFrame:ClearAllPoints();
			SlibFrame:SetPoint("TOPLEFT","UIParent","TOPLEFT",xOfs,(ecran - distance) - ecran);
		end;
	elseif (string.upper(sens) == "BOTTOM") then
		local ecran = GetScreenHeight();
		if (abs(yOfs) < (distance + margeH)) then
			SlibFrame:ClearAllPoints();
			SlibFrame:SetPoint("TOPLEFT","UIParent","TOPLEFT",xOfs,distance + margeH);
		end;
	elseif (string.upper(sens) == "LEFT") then
		local ecran = GetScreenWidth();
		if ((ecran - (largeurMainFrame + abs(xOfs))) < (distance + margeD)) then
			SlibFrame:ClearAllPoints();
			SlibFrame:SetPoint("TOPLEFT","UIParent","TOPLEFT",ecran - (largeurMainFrame + distance + margeD),yOfs);
		end;
	elseif (string.upper(sens) == "RIGHT") then
		local ecran = GetScreenWidth();
		if (abs(yOfs) < (distance + margeG)) then
			SlibFrame:ClearAllPoints();
			SlibFrame:SetPoint("TOPLEFT","UIParent","TOPLEFT",distance + margeG,yOfs);
		end;
	end;
end

function echo(chaine,nomCouleur)
	local coulr,coulg,coulb = 1,1,1 ; -- couleurs
	if (nomCouleur == "red") then
		coulr,coulg,coulb = 1,0,0;
	elseif (nomCouleur == "green") then
		coulr,coulg,coulb = 0,1,0;
	elseif (nomCouleur == "blue") then
		coulr,coulg,coulb = 0.5,0.5,0.8;
	elseif (nomCouleur == "orange") then
		coulr,coulg,coulb = 0.8,0.3,0.1;
	elseif (nomCouleur == "yellow") then
		coulr,coulg,coulb = 0.9,0.9,0.1;
	elseif (nomCouleur == "grey" or nomCouleur == "gray") then
		coulr,coulg,coulb = 0.6,0.6,0.6;
	end;
	if (DEFAULT_CHAT_FRAME) then DEFAULT_CHAT_FRAME:AddMessage(chaine,coulr,coulg,coulb); end;
end

---------------------------------------------------------------------------------------
------------------------------------- AIDE ONLINE -------------------------------------
function slibSlashListe()
	local i;
	local aideOnline =  {};
	aideOnline[1] = "/cj: 显示命令行";
	aideOnline[2] = "/slashlibshowicon: 显示或隐藏小地图按钮";
	echo("------------------------","grey");
	for i = 1,getn(aideOnline),1 do
		echo("   "..aideOnline[i].."\n","grey");
	end;
	echo("------------------------","grey");
end

---------------------------------------------------------------------------------------
------------------------------------- 其他辅助项 ---------------------------------------
print = function(m) DEFAULT_CHAT_FRAME:AddMessage(m) end
--SlashLib_CONFIG = {} 
---------------------------------------------------------------------------------------
-------------------------------------- 网格界面 ----------------------------------------
SLASH_EA1 = "/align"

local f

SlashCmdList["EA"] = function()
	if f then
		f:Hide()
		f = nil		
	else
		f = CreateFrame('Frame', nil, UIParent) 
		f:SetAllPoints(UIParent)
		local w = GetScreenWidth() / 64
		local h = GetScreenHeight() / 36
		for i = 0, 64 do
			local t = f:CreateTexture(nil, 'BACKGROUND')
			if i == 32 then
				t:SetTexture(1, 0, 0, 0.5)
			else
				t:SetTexture(0, 0, 0, 0.5)
			end
			t:SetPoint('TOPLEFT', f, 'TOPLEFT', i * w - 1, 0)
			t:SetPoint('BOTTOMRIGHT', f, 'BOTTOMLEFT', i * w + 1, 0)
		end
		for i = 0, 36 do
			local t = f:CreateTexture(nil, 'BACKGROUND')
			if i == 18 then
				t:SetTexture(1, 0, 0, 0.5)
			else
				t:SetTexture(0, 0, 0, 0.5)
			end
			t:SetPoint('TOPLEFT', f, 'TOPLEFT', 0, -i * h + 1)
			t:SetPoint('BOTTOMRIGHT', f, 'TOPRIGHT', 0, -i * h - 1)
		end	
	end
end
---------------------------------------------------------------------------------------
---------------------------------- 暴雪界面默认设置 ------------------------------------
--默认设置了视频、声音、界面的选项
--[[SHOW_PARTY_PETS = "0"
QUEST_FADING_DISABLE = "1"
AUTO_QUEST_WATCH = "0"
SHOW_BUFF_DURATIONS = "1"
SHOW_TARGET_OF_TARGET = "1"
slibDoSlashCmd("/console SET frillDensity \"32\"")
slibDoSlashCmd("/console SET farclip \"777\"")
slibDoSlashCmd("/console SET mouseSpeed \"1.5\"")
slibDoSlashCmd("/console SET DesktopGamma \"1\"")
slibDoSlashCmd("/console SET Gamma \"1.000000\"")
slibDoSlashCmd("/console SET MusicVolume \"1\"")
slibDoSlashCmd("/console SET ffxDeath \"0\"")
slibDoSlashCmd("/console SET cameraSmoothStyle \"0\"")
slibDoSlashCmd("/console SET SoundZoneMusicNoDelay \"1\"")
slibDoSlashCmd("/console SET AmbienceVolume \"1\"")
slibDoSlashCmd("/console SET statusBarText \"1\"")
slibDoSlashCmd("/console SET minimapZoom \"0\"")
slibDoSlashCmd("/console SET uiScale \"1\"")
slibDoSlashCmd("/console SET UnitNameOwn \"1\"")
slibDoSlashCmd("/console SET UnitNameNPC \"1\"")
]]
---------------------------------------------------------------------------------------
-------------------------------- onebag+packupbutton ----------------------------------
function packup_OnClick()
	if IsShiftKeyDown() then
	    slibDoSlashCmd("/packup zip")
	elseif IsControlKeyDown() then
		slibDoSlashCmd("/packup bank")
	elseif IsAltKeyDown() then
		slibDoSlashCmd("/ovs")
	else
	    slibDoSlashCmd("/packup bag")
	end
end
---------------------------------------------------------------------------------------
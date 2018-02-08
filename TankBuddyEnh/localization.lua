--
-- Localization file for Tank Buddy v3.0
--

-- English
-- by Artun Subasi and Kolthor
-- last changed: January 11th, 2007

TB_version = "v3.0";

TB_GUI_EnableTankBuddyEnh = "启用坦克助手";
TB_GUI_Raid = "团队";
TB_GUI_Party = "队伍";
TB_GUI_Alone = "单人";
TB_GUI_AnnouncementChannel = "通告频道";
TB_GUI_AnnouncementTexts = "通告文本";
TB_GUI_SetCustomChannel = "设置自定义频道";
TB_GUI_EnterChannelName = "输入频道名称或号码:";
TB_GUI_Close = "关闭";
TB_GUI_Help = "帮助";
TB_GUI_Test = "测试";
TB_GUI_Copy = "复制";
TB_GUI_Paste = "粘贴";
TB_GUI_General = "一般";
TB_GUI_Taunt = "嘲讽";
TB_GUI_MB = "惩戒痛击";
TB_GUI_LS = "破釜沉舟";
TB_GUI_SW = "盾墙";
TB_GUI_LG = "生命宝石";
TB_GUI_PM = "拳击";
TB_GUI_SB = "盾击";
TB_GUI_CS = "挑战怒吼";
TB_GUI_CSP = "法术反制";
TB_GUI_SB_MISSED = "盾击没有击中";
TB_GUI_KC_MISSED = "脚踢没有击中";
TB_GUI_PM_MISSED = "拳击没有击中";
TB_GUI_Growl = "低吼";
TB_GUI_CR = "挑战咆哮";
TB_GUI_KC = "脚踢";
TB_GUI_PL = "变形术";
TB_GUI_BN = "放逐术";
TB_GUI_EnterNewText = {
	[TB_GUI_SB] = "进入新的通告文本 盾击",
	[TB_GUI_PM] = "进入新的通告文本 拳击",
	[TB_GUI_CSP] = "进入新的通告文本 抵抗法术反制",
	[TB_GUI_KC] = "进入新的通告文本 脚踢",
	[TB_GUI_PL] = "进入新的通告文本 抵抗变形术",
	[TB_GUI_BN] = "进入新的通告文本 抵抗放逐术",
	[TB_GUI_Taunt] = "进入新的通告文本 抵抗嘲讽:",
	[TB_GUI_MB] = "进入新的通告文本 惩戒痛击失败:",
	[TB_GUI_LS] = "进入新的通告文本 使用破釜沉舟:",
	[TB_GUI_SW] = "进入新的通告文本 使用盾墙:",
	[TB_GUI_LG] = "进入新的通告文本 使用生命宝石:",
	[TB_GUI_CS] = "进入新的通告文本 使用挑战怒吼:",
	[TB_GUI_Growl] = "进入新的通告文本 低吼低吼:",
	[TB_GUI_CR] = "进入新的通告文本 使用挑战咆哮:"
}
TB_GUI_EnterNewMBRecoveryText = "进入新的通告文本 恢复嘲讽:";
TB_GUI_RemoveBuffs = "移除 Buff";
TB_GUI_RemoveBuffsAlways = "全部移除:";
TB_GUI_DisableInBG = "禁用在战场";
TB_GUI_RemoveBuffsDefensive = "只在防御姿态才移除:";
TB_GUI_RemoveBuffsBear = "只在熊形态才移除:";
TB_GUI_EnableMBRecovery = "开启补救嘲讽失败的信息";

TB_GUI_IntroText = "感谢你使用坦克助手, 原名Taunt Buddy.\nTaunt Buddy最初是Artun Subasi创造的, 但他停止更新, 来自Doomhammer EU kolthor接管.\n\n右边有很多标签, 根据你的职业.每个选项都有发布消息的选项, 以及在特定情况下宣布的频道."
TB_GUI_HelpText = "Buff 去除:\n移除无用的BUFF, 有两种选择; 总是, 只有在防御姿态/熊形态.\n坦克助手将寻找包含任何文本指定的buff, 用逗号分隔 (,). 注！您不需要输入buff的整个名称, 只是部分。例子: \"智慧, 精神\" 将寻找任何有这个词的buff,并移除它们。这将匹配 \"奥术智慧\" 和 \"精神祷言\", 也会删除卷轴的智力和精神buff和任何其他BUFF，有 \"智慧\" 或 \"精神\" 在他的名字里.\n\n标签:\n复选框控件的左边通道发送公告消息, 如果你在团队中. 中间一列, 如果你在队伍里, 最右边的列, 如果你一个人.\n可以用自定义 \"自定义\", 将出现一个窗口，您可以在自定义频道中输入, 按频道名称或号码. 指定多个频道, 用一个空格分开.\n当你选择了一些频道, 你能点击 \"复制\"-按钮复制您的选择, 然后单击另一个选项卡, 和点击 \"粘贴\"-按钮使用相同的选择.\n注！这将覆盖任何自定义通道.\n你可以指定一个消息在编辑框的底部, 并使用下面列出的变量.\n如果你选择 \"使失败的嘲讽恢复公告\" 在嘲讽标签, 您可以输入消息，以宣布在事件中. 注！这只会工作到嘲讽不再冷却, 而且，只有当你当前的目标与抗拒嘲讽的名称和级别相同.\n\n变数:\n嘲讽, 低吼和惩戒痛击:\n$tn: 目标名字 (等同于 %t)\n$tl: 目标等级\n$tt: 目标类型 (人型, 野兽, 恶魔 等等.)\n$ttn: 目标的目标名字\n$ttl: 目标的目标等级\n$ttt: 目标的目标类型\n\n盾墙, 挑战怒吼, 挑战咆哮, 破釜沉舟和生命宝石:\n$sec: 秒的持续时间\n\n破釜沉舟和生命宝石:\n$hp: 获得的点数量的能力.";

TB_GUI_Channel_Ctraid = "CTRaid";
TB_GUI_Channel_RaidWarning = "团队警报";
TB_GUI_Channel_Raid = "团队";
TB_GUI_Channel_Guild = "公会";
TB_GUI_Channel_Party = "队伍";
TB_GUI_Channel_Yell = "大喊";
TB_GUI_Channel_Say = "说";
TB_GUI_Channel_Custom = "自定义";

TB_defaultText = {
	[TB_GUI_Taunt] = "- 我的嘲讽被抵抗 $tn! -";
	[TB_GUI_PL] = "- 我的变形术被抵抗 $tn! -";
	[TB_GUI_MB] = "- 我的惩戒痛击失败 $tn! -";
	[TB_GUI_CSP] = "抵抗法术反制";
	[TB_GUI_BN] = "抵制放逐术";
	[TB_GUI_PM] = "拳击 对 $tn";
	[TB_GUI_SB] = "盾击 对 $tn";
	[TB_GUI_KC] = "脚踢 对 $tn";
	[TB_GUI_LS] = "- 我激活了破釜沉舟! 在 $sec 秒后我会失去 $hpHP! -";
	[TB_GUI_SW] = "- 我激活了盾墙!将降低 75% 伤害 $sec 秒! -";
	[TB_GUI_LG] = "- 我激活了生命宝石! 在 $sec 秒后我会失去 $hpHP! -";
	[TB_GUI_CS] = "- 我激活了挑战怒吼! 我需要更多的治疗 $sec 秒! -";
	[TB_GUI_Growl] = "- 我的咆哮被抵抗 $tn! -";
	[TB_GUI_CR] = "- 我激活了挑战咆哮! 我需要更多的治疗 $sec 秒! -";
}
TB_defaultText_r = "- 我的惩戒痛击命中抵抗我嘲讽的怪物! -";

TB_tauntLine = "你的嘲讽被(.+)抵抗了";
TB_growlLine = "你的低吼被(.+)抵抗了";
TB_PLLine = "你的变形术被(.+)抵抗了。";
TB_CSPLine = "你的法术反制被(.+)抵抗了。";
TB_PLPLine = "你的变形术：猪被(.+)抵抗了。";
TB_PLTLine = "你的变形术：龟被(.+)抵抗了。";
TB_BNLine = "你的放逐术被(.+)抵抗了。";
TB_mbHitLine = "你的惩戒痛击(.*)(.+)造成(.+)";
TB_kcHitLine = "你的脚踢击中(.*)(.+)造成(.+)";
TB_pmHitLine = "你的拳击击中(.*)(.+)造成(.+)";
TB_sbHitLine = "你的盾击击中(.*)(.+)造成(.+)";
TB_mb = "(.*)惩戒痛击(.*)";
TB_pm = "(.*)拳击(.*)";
TB_sb = "(.*)盾击(.*)";
TB_kc = "(.*)脚踢(.*)";
TB_ls = "你获得了破釜沉舟的效果。";
TB_sw = "你获得了盾墙的效果。";
TB_lg = "你获得了生命赐福的效果。";
TB_cs = "挑战怒吼";
TB_cr = "挑战咆哮";
TB_salvation = "拯救祝福";
TB_intellect = "奥术";
TB_wisdom = "智慧祝福";

TB_output_buffremoved = " removed, matched "; --As in ["Greater Blessing of Salvation" removed, matched "Salvation"]
TB_output_startup = " 加载. 使用 /TB 设置.";
TB_output_alreadyOff = "坦克助手已被禁用.";
TB_output_alreadyOn = "坦克助手已被启用";
TB_output_off = "坦克助手关.";
TB_output_on = "坦克助手开.";

TB_cmd_on = "on";
TB_cmd_off = "off";

-- French Translation
-- by Dab, Drek'Thar EU (French server)
-- last changed: January 16th, 2007
if (GetLocale() == "frFR") then -- French
	TB_GUI_EnableTankBuddyEnh = "Tank Buddy On";
	TB_GUI_Raid = "Raid";
	TB_GUI_Party = "Groupe";
	TB_GUI_Alone = "Seul";
	TB_GUI_AnnouncementChannel = "Channel d'annonces";
	TB_GUI_AnnouncementTexts = "Texte d'annonces";
	TB_GUI_SetCustomChannel = "Choisir un channel personnalis\195\169";
	TB_GUI_EnterChannelName = "Entrez le nom ou le num\195\169ro du channel :";
	TB_GUI_Close = "Fermer";
	TB_GUI_Help = "Aide";
	TB_GUI_Test = "Test";
	TB_GUI_Copy = "Copier";
	TB_GUI_Paste = "Coller";
	TB_GUI_General = "G\195\169n\195\169ral";
	TB_GUI_Taunt = "Provocation";
	TB_GUI_MB = "Coup railleur";
	TB_GUI_LS = "Dernier rempart";
	TB_GUI_SW = "Mur protecteur";
	TB_GUI_LG = "Gemme donneuse de vie";
	TB_GUI_CS = "Cri de d\195\169fi";
	TB_GUI_Growl = "Grondement";
	TB_GUI_CR = "Rugissement provocateur";
	TB_GUI_PM = "Vol\195\169e de coups";
	TB_GUI_SB = "Coup de bouclier";
	TB_GUI_CSP = "Contresort";
	TB_GUI_SB_MISSED = "Coup de bouclier manqu\195\169";
	TB_GUI_KC_MISSED = "Coup de pied manqu\195\169";
	TB_GUI_PM_MISSED = "Vol\195\169e de coups manqu\195\169e";
	TB_GUI_KC = "Coup de pied";
	TB_GUI_PL = "Métamorphose";
	TB_GUI_BN = "Bannir";
	TB_GUI_EnterNewText = {
		[TB_GUI_SB] = "Enter new annoucement text for shield bash",
		[TB_GUI_PM] = "Enter new announcement text for pummel",
		[TB_GUI_CSP] = "Enter new announcement text for resisted counterspell",
		[TB_GUI_KC] = "Enter new announcement text for kicks",
		[TB_GUI_PL] = "Enter new announcement text for resisted polymorphs",
		[TB_GUI_BN] = "Enter new announcement text for resisted banishes",
		[TB_GUI_Taunt] = "Annonce personnalis\195\169e pour les 'r\195\169siste' \195\160 la provocation:",
		[TB_GUI_MB] = "Annonce personnalis\195\169e pour Coup Railleur \195\169chou\195\169:",
		[TB_GUI_LS] = "Annonce personnalis\195\169e pour Dernier Rempart:",
		[TB_GUI_SW] = "Annonce personnalis\195\169e pour Mur Protecteur:",
		[TB_GUI_LG] = "Annonce personnalis\195\169e pour Gemme donneuse de vie:",
		[TB_GUI_CS] = "Annonce personnalis\195\169e pour Cri de d\195\169fi:",
		[TB_GUI_Growl] = "Annonce personnalis\195\169e pour les 'r\195\169siste' au Grondement:",
		[TB_GUI_CR] = "Annonce personnalis\195\169e pour Rugissement provocateur:"
	}
	TB_GUI_EnterNewMBRecoveryText = "Entrez un nouveau texte d'annonce pour les provocations rat\195\169es mais r\195\169cup\195\169r\195\169es:";
	TB_GUI_RemoveBuffs = "Enleveur de buffs";
	TB_GUI_RemoveBuffsAlways = "Toujours enlever les buffs contenant:";
	TB_GUI_DisableInBG = "D\195\169sactiver sur les champs de bataille";
	TB_GUI_RemoveBuffsDefensive = "Seulement en posture d\195\169fensive";
	TB_GUI_RemoveBuffsBear = "Seulement en forme d'ours";
	TB_GUI_EnableMBRecovery = "Activer les annonces en cas de r\195\169cup\195\169ration apr\195\168s une provocation \195\169chou\195\169e";

	TB_GUI_IntroText = "Merci d'utiliser Tank Buddy, aussi connu comme Taunt Buddy. Taunt Buddy a ete cree par Artun Subasi, mais depuis qu'il a arrete le developpement, Kolthor de Doomhammer EU a pris la suite.\n\nA droite, vous avez un certain nombre d'onglets, selon votre classe. Chaque onglet contient des options pour les messages d'annonces, les channels d'annonces..."
	TB_GUI_HelpText = "Enleveur de buffs:\nPour enlever les buffs dont vous ne voulez pas, il y a deux options; Toujours, ou seulement en posture defensive/forme d'ours.\nTank Buddy va scanner les buffs contenant le texte que vous avez precise. Pour surveiller plusieurs buffs, separez les par une virgule (,). Note! Vous n'avez pas besoin de taper le nom entier du buff, une partie suffit. Exemple: \"Intelligence, Esprit\" verifiera tous les buffs contenant les mots \"Intelligence\" ou \"Esprit\", et les enlevera. Cela va reperer \"Intelligence des arcanes\" et \"Priere d'Esprit\", mais aussi les parchemins d'Intelligence et d'Esprit et tous les autres buffs qui contiennent les mots \"Intelligence\" ou \"Esprit\".\n\nOnglets:\nLa colonne la plus a gauche controle quels channels utiliser pour envoyer les messages si vous etes en raid, la colonne du milieu si vous etes en groupe et la colonne la plus a droite si vous etes seul.\nSi vous cochez une des cases \"Personnalise\", une fenêtre s'ouvrira ou vous pourrez entrer soit le(s) nom(s) du(des) channel(s), soit son(ses) numero(s). Pour utiliser plusieurs channels, separez les par un espace.\nSi vous avez selectionne plusieurs channels, vous pouvez cliquer sur le bouton \"Copier\" et ensuite cliquer sur le bouton \"Coller\" dans autre onglet pour utiliser les memes channels.\nRemarque! Cela remplacera tous les channels personnalises que vous aviez entres par ceux que vous venez de copier.\nVous pouvez entrez un message personnalise dans la boite d'edition en bas de chaque menu, et utiliser les variables listees plus bas.\nSi vous choisissez l'option \"Activer les annonces en cas de recuperation apres une provocation echouee\" dans l'onglet Provocation, vous pouvez entrer un message personnalise au cas ou un coup railleur a fonctionne apres une provocation resistee. Remarque ! Cela ne fonctionnera que si la recuperation de votre Provocation est incomplete et aussi si votre cible porte le meme nom et a le meme niveau que celle qui a resiste a votre provocation.\n\nVariables:\nProvocation, Grondement et Coup railleur:\n$tn: Nom de la Cible (Equivalent \195\160  %t).\n$tl: Niveau de la cible.\n$tt: Type de la cible (Humanoide, Bete, Demon etc.).\n$ttn: Nom de la cible de la cible.\n$ttl: Niveau de la cible de la cible.\n$ttt: Type de la cible de la cible.\n\nMur Protecteur, Cri de defi, Rugissement Provocateur, Dernier Rempart et Gemme donneuse de vie:\n$sec: Duree de la technique en secondes.\n\nDernier Rempart et Gemme donneuse de vie:\n$hp: Montant de points gagnes avec la technique.";

	TB_GUI_Channel_Ctraid = "CTRaid";
	TB_GUI_Channel_RaidWarning = "Avertissement Raid";
	TB_GUI_Channel_Raid = "Raid";
	TB_GUI_Channel_Guild = "Guilde";
	TB_GUI_Channel_Party = "Groupe";
	TB_GUI_Channel_Yell = "Cri";
	TB_GUI_Channel_Say = "Dire";
	TB_GUI_Channel_Custom = "Personnalise";

	TB_defaultText = {
		[TB_GUI_Taunt] = "- $tn a r\195\169sist\195\169 \195\160 ma provocation ! -";
		[TB_GUI_PL] = "- My polymorph has been resisted by $tn! -";
		[TB_GUI_CSP] = "Resisted counterspell";
		[TB_GUI_BN] = "Resisted Banish";
		[TB_GUI_PM] = "Pummel on $tn";
		[TB_GUI_SB] = "Shield Bash on $tn";
		[TB_GUI_KC] = "Kick on $tn";
		[TB_GUI_MB] = "- Mon coup railleur a \195\169chou\195\169 contre  $tn -";
		[TB_GUI_LS] = "- J'ai activ\195\169 Dernier Rempart ! Dans $sec secondes, je perds $hp PV! -";
		[TB_GUI_SW] = "- J'ai activ\195\169 Mur Protecteur pour $sec secondes! R\195\169duction des d\195\169gats de 75% -";
		[TB_GUI_LG] = "- J'ai activ\195\169 la Gemme donneuse de vie ! Dans $sec secondes, je perds $hp PV! -";
		[TB_GUI_CS] = "- J'ai activ\195\169 cri de d\195\169fi ! Mass heal sur moi pendant $sec secondes! -";
		[TB_GUI_Growl] = "- $tn a r\195\169sist\195\169 \195\160 mon grondement ! -";
		[TB_GUI_CR] = "- J'ai activ\195\169 rugissement provocateur ! Mass heal sur moi pendant $sec secondes! -";
	}
	TB_defaultText_r = "- Ma provocation a \195\169chou\195\169e mais mon coup railleur a fonctionn\195\169! Pas de panique -";


	TB_tauntLine = "Vous utilisez Provocation, mais (.+)";
	TB_growlLine = "Vous utilisez Grondement, mais (.+)";
	TB_PLLine = "Vous utilisez Métamorphose, mais (.)+)";
	TB_CSPLine = "Vous utilisez Contresort, mais (.)+)";
	TB_PLPLine = "Vous utilisez Métamorphose: cochon, mais (.)+)";
	TB_PLTine = "Vous utilisez Métamorphose: tortue, mais (.)+)";
	TB_BNLine = "Vous utilisez Bannir, mais (.)+)";
	TB_mbHitLine = "Votre Coup railleur (.+) points (.+)";
	TB_kcHitLine = "Votre Coup de pied (.+) points (.+)";
	TB_pmHitLine = "Votre Vol\195\169e de coups (.+) points (.+)";
	TB_sbHitLine = "Votre Coup de bouclier (.+) points (.+)";
	TB_mb = "(.*)Coup railleur(.*)";
	TB_pm = "(.*)Vol\195\169e de coups(.*)";
	TB_kc = "(.*)Coup de pied(.*)";
	TB_sb = "(.*)Coup de bouclier(.*)";
	TB_ls = "Vous gagnez Dernier rempart.";
	TB_sw = "Vous gagnez Mur protecteur.";
	TB_lg = "Vous gagnez Don de vie.";
	TB_cs = "Cri de d\195\169fi";
	TB_cr = "Rugissement provocateur";
	TB_salvation = "B\195\169n\195\169diction de salut";
	TB_intellect = "Intelligence";
	TB_wisdom = "Sagesse";

	TB_output_buffremoved = " enlev\195\169e, puisqu'il contient ";
	TB_output_startup = " charg\195\169. Tapez /TB pour les options.";
	TB_output_alreadyOff = "Tank Buddy est d\195\169j\195\160 arr\195\170t\195\169.";
	TB_output_alreadyOn = "Tank Buddy est d\195\169j\195\160 en marche.";
	TB_output_off = "Tank Buddy off.";
	TB_output_on = "Tank Buddy on.";

	TB_cmd_on = "on";
	TB_cmd_off = "off";

-- German Translation
-- by StarDust, Lorni and Nelson from Malfurion EU
-- last changed: January 14th, 2007
-- NB! Partial translation only!
elseif (GetLocale() == "deDE") then -- German
	TB_GUI_EnableTankBuddyEnh = "Tank Buddy aktivieren";
	TB_GUI_Raid = "Schlachtzug";
	TB_GUI_Party = "Gruppe";
	TB_GUI_Alone = "Allein";
	TB_GUI_AnnouncementChannel = "Nachrichtenkanal";
	TB_GUI_AnnouncementTexts = "Benachrichtigungstext";
	TB_GUI_SetCustomChannel = "Eigener Kanal";
	TB_GUI_EnterChannelName = "Kanalname oder Nummer angeben:";
	TB_GUI_Close = "Schlie\195\159en";
	TB_GUI_Help = "Hilfe";
	TB_GUI_Test = "Testen";
	TB_GUI_Copy = "Kopieren";
	TB_GUI_Paste = "Einfügen";
	TB_GUI_General = "Allgemein";
	TB_GUI_Taunt = "Spott";
	TB_GUI_MB = "Spöttischer Schlag";
	TB_GUI_LS = "Letztes Gefecht";
	TB_GUI_SW = "Schildwall";
	TB_GUI_LG = "Lebensspendender Edelstein";
	TB_GUI_CS = "Herausforderungsruf";
	TB_GUI_Growl = "Knurren";
	TB_GUI_CR = "Herausforderndes Gebrüll";
	TB_GUI_EnterNewText = {
		[TB_GUI_Taunt] = "Neuer Text wenn Spott wiederstanden wird:",
		[TB_GUI_MB] = "Neuer Text wenn Spöttischer Schlag verfehlt:",
		[TB_GUI_LS] = "Neuer Text wenn Letztes Gefecht aktiviert wird:",
		[TB_GUI_SW] = "Neuer Text wenn Schildwall aktiviert wird:",
		[TB_GUI_LG] = "Neuer Text für Benutzung von Lebensspendender Edelstein:",
		[TB_GUI_CS] = "Neuer Text wenn Herausforderndes Gebrüll aktiviert wird:",
		[TB_GUI_Growl] = "Neuer Text wenn Knurren wiederstanden wird:",
		[TB_GUI_CR] = "Neuer Text wenn Herausforderndes Gebrüll aktiviert wird:"
	}
	TB_GUI_EnterNewMBRecoveryText = "Neuer Text für Wiederherstellung von verfehltem Spott:";
	TB_GUI_RemoveBuffs = "Buff Entfernung";
	TB_GUI_RemoveBuffsAlways = "Entferne Buffs die folgendes beinhalten:";
	TB_GUI_DisableInBG = "Deaktiviert in Schlachtfeldern";
	TB_GUI_RemoveBuffsDefensive = "Nur in Verteidigungshaltung";
	TB_GUI_RemoveBuffsBear = "Nur in Bärform";
	TB_GUI_EnableMBRecovery = "Ankündigung für Wiederherstellung von verfehltem Spott";

	TB_GUI_IntroText = "Danke für die Benutzung von Tank Buddy, ehemals bekannt als Taunt Buddy.\nTaunt Buddy wurde ursprünglich von Artun Subasientwickelt, aber seit er die Entwicklung eingestellt hat, übernahm Kolthor von Doomhammer EU.\n\nAuf der rechten Seite sind eine Anzahl von Tabs, abhängig von deiner Klasse. Jedes Tab hat Optionen für Ankündigungsnachrichten und Kanäle in die benachrichtigt werden soll unter bestimmten Bedingungen."
	TB_GUI_HelpText = "Buff Entfernung:\nUm unerwünschte Buffs zu entfernen gibt es zwei Möglichkeiten: Immer, oder nur in Verteidigungshaltung / Bärform.\nTank Buddy wird nach Buffs suchen, die den angegebenen Text enthalten. Um nach mehreren Buffs zu suchen, einfach die Suchworte mit Komma (,) trennen. Hinweis: Du musst nicht den gesamten Buff-Text eingeben, ein Teilstück reicht. Beispiel: \"Intelligenz, Weisheit\" wird nach allen Buffs suchen, die das Wort \"Intelligenz\" oder \"Weisheit\" beinhalten und diese entfernen. Dies trifft auf \"Arkane Intelligenz\" zu und auf \"Gebet der Weisheit\" , aber auch auf Rollen der Intelligenz und Weisheits Buffs und alle anderen Buffs, die \"Intelligenz\" oder \"Weisheit\" in ihrem Namen haben.\n\nTabs:\nDie ganz linke Spalte der Auswahlkästen bestimmt in welche Kanäle benachrichtigt wird, wenn du in einem Raid bist. Die mittlere wenn du in einer Gruppe bist und die ganz rechte wenn du allein unterwegs bist.\nWenn du ein \"Eigener\"-kästchen anwählst wird ein Fenster aufgehen in dem du einen oder mehrere Kanäle eingeben kannst, entweder als Kanalname oder mit der Nummer. Trenne die Kanäle mit einem Leerzeichen.\nWenn du ein paar Kanäle ausgewählt hast, kannst du sie mit dem \"Kopieren\"-Knopf kopieren, dann einen anderen Tab auswählen und mit dem \"Einfügen\"-Knopf die gleiche Wahl wieder einfügen.\nAchtung! Dies wird alle vorherigen Eingaben mit den kopierten Kanälen überschreiben.\nDu kannst in der Box unten eine Nachricht eingeben und dabei folgende Variablen verwenden:\n\nSpott, Knurren and Herausforderndes Gebrüll:\n$tn: Target Name (dasselbe wie %t)\n$tl: TargetLevel\n$tt: Ziel Typ (Humanoid, Tier, Dämon etc.)\n$ttn: Target's Target Name\n$ttl: Target's Target Level\n$ttt: Target's Target Typ\n\nSchildwall, Herausforderungsruf, Herausforderndes Gebrüll, Letztes Gefecht und Lebensspendender Edelstein:\n$sec: Dauer der Fähigkeit in Sekunden\n\nLetztes Gefecht Lebensspendender Edelstein:\n$hp: Anzahl der zusätzlichen Lebenspunkte durch diese Fähigkeit";
  
	TB_GUI_Channel_Ctraid = "CTRaid";
	TB_GUI_Channel_RaidWarning = "Schlachtzugswarnung";
	TB_GUI_Channel_Raid = "Schlachtzug";
	TB_GUI_Channel_Guild = "Gilde";
	TB_GUI_Channel_Party = "Gruppe";
	TB_GUI_Channel_Yell = "Schreien";
	TB_GUI_Channel_Say = "Sagen";
	TB_GUI_Channel_Custom = "Eigener";

	TB_defaultText = {
		[TB_GUI_Taunt] = "- Mein Spott wurde von $tn widerstanden -";
		[TB_GUI_MB] = "- Mein Spöttischer Schlag hat $tn verfehlt -";
		[TB_GUI_LS] = "- Auf ins letzte Gefecht! In $sec Sekunden verliere ich $hpHP! -";
		[TB_GUI_SW] = "- Schildwall ist raus, ich bekomme nur 75% Schaden für $sec Sekunden! -";
		[TB_GUI_LG] = "- Ich habe Lebensspendender Edelstein aktiviert! In $sec Sekunden verliere ich $hpHP! -";
		[TB_GUI_CS] = "- Herausforderungsruf ist raus! Ich brauche Heilung für die nächsten $sec Sekunden! -";
		[TB_GUI_Growl] = "- Mein Knurren wurde von $tn widerstanden -";
		[TB_GUI_CR] = "- Herrausforderndes Gebrüll ist raus! Ich brauche Heilung für die nächsten $sec Sekunden! -";
	}
	TB_defaultText_r = "- Mein Spöttischer Schlag hat meinen widerstandenen Spott wieder hergestellt! -";

	TB_tauntLine = "Ihr habt es mit Spott versucht, aber (%w+) hat widerstanden.";
	TB_growlLine = "Ihr habt es mit Knurren versucht, aber (%w+) hat widerstanden.";
	TB_mbHitLine = "Spöttischer Schlag von Euch trifft (.+) für (.+) Schaden";
	TB_mb = "(.*)Spöttischer Schlag(.*)";
	TB_ls = "Ihr bekommt 'Letztes Gefecht'.";
	TB_sw = "Ihr bekommt 'Schildwall'.";
	TB_lg = "You gain Gift of Life."; --Need translation IMPORTANT! MUST be exactly as it says in the combat log!
	TB_cs = "Herausforderungsruf";
	TB_cr = "Herausforderndes Gebrüll";
	TB_salvation = "Segen der Rettung";
	TB_intellect = "Intelligenz";
	TB_wisdom = "Weisheit";

	
	
	
	TB_output_buffremoved = " removed, matched "; --As in ["Greater Blessing of Salvation" removed, matched "Salvation"]
	TB_output_startup = " geladen. Gib /TB Help ein um eine Hilfe anzuzeigen.";
	TB_output_alreadyOff = "Tank Buddy ist bereits deaktiviert.";
	TB_output_alreadyOn = "Tank Buddy ist bereits aktiviert.";
	TB_output_off = "Tank Buddy ist aktiv.";
	TB_output_on = "Tank Buddy ist nicht aktiv.";

	TB_cmd_on = "an";
	TB_cmd_off = "aus";

elseif (GetLocale() == "koKR") then -- Korean

elseif (GetLocale() == "zhCN") then -- Chinese (simplified)

-- Chinese Traditional Translation (繁體中文化)
-- by 鬼霧峰 Paradise of Nameless - Enix
-- last changed: Match 24th, 2007
elseif (GetLocale() == "zhTW") then -- Chinese (traditional)

	TB_GUI_EnableTankBuddyEnh = "開啟坦克助手";
	TB_GUI_Raid = "團隊時";
	TB_GUI_Party = "隊伍時";
	TB_GUI_Alone = "單獨時";
	TB_GUI_AnnouncementChannel = "訊息發送頻道";
	TB_GUI_AnnouncementTexts = "發送訊息設定";
	TB_GUI_SetCustomChannel = "設定自訂頻道";
	TB_GUI_EnterChannelName = "輸入自訂頻道名稱或號碼:";
	TB_GUI_Close = "關閉";
	TB_GUI_Help = "求助";
	TB_GUI_Test = "測試";
	TB_GUI_Copy = "複製";
	TB_GUI_Paste = "貼上";
	TB_GUI_General = "一般";
	TB_GUI_Taunt = "嘲諷";
	TB_GUI_MB = "懲戒痛擊";
	TB_GUI_LS = "破釜沉舟";
	TB_GUI_SW = "盾牆";
	TB_GUI_LG = "生命寶石";
	TB_GUI_CS = "挑戰怒吼";
	TB_GUI_Growl = "低吼";
	TB_GUI_CR = "挑戰咆哮";
	TB_GUI_EnterNewText = {
			[TB_GUI_Taunt] = "輸入嘲諷被抵抗後所要發送的文字訊息:",
			[TB_GUI_MB] = "輸入懲戒痛擊失敗後所要發送的文字訊息:",
			[TB_GUI_LS] = "輸入使用破釜沉舟時所要發送的文字訊息:",
			[TB_GUI_SW] = "輸入使用盾牆時所要發送的文字訊息:",
			[TB_GUI_LG] = "輸入使用生命寶石時所要發送的文字訊息:",
			[TB_GUI_CS] = "輸入使用挑戰怒吼時所要發送的文字訊息:",
			[TB_GUI_Growl] = "輸入低吼被抵抗後所要發送的文字訊息:",
			[TB_GUI_CR] = "輸入使用挑戰咆哮時所要發送的文字訊息:"
	}
	TB_GUI_EnterNewMBRecoveryText = "輸入補救嘲諷失敗時所要發送的文字訊息:";
	TB_GUI_RemoveBuffs = "移除 Buff";
	TB_GUI_RemoveBuffsAlways = "全部移除:";
	TB_GUI_DisableInBG = "戰場內停止使用";
	TB_GUI_RemoveBuffsDefensive = "只有在防禦姿態時才移除:";
	TB_GUI_RemoveBuffsBear = "只有在熊形態時才移除";
	TB_GUI_EnableMBRecovery = "開啟補救嘲諷失敗的訊息";

	TB_GUI_IntroText = "感謝使用 Tank Buddy, 以前稱之為 Taunt Buddy.\nTaunt Buddy 原本是 Artun Subasi 製作, 不過已經停止發開了, 現在由 Doomhammer EU 的 Kolthor 接手.\n\n右側的頁面數量取決於你的職業. 每個頁面都有發送訊息跟頻道的選項."
	TB_GUI_HelpText = "移除 Buff:\n移除你不需要的 Buffs, 分為二個選項; 全部移除, 或是在防禦姿態/熊型態下才移除.\nTank Buddy 會比對 Buff 設定列中的文字進行移除. 要設定多種 Buff 只要加上 (,) 即可. 注意! 可以不輸入該法術的全部名稱, 只要有關鍵字即可. 例如: \"祕法, 禱言\" 就會將名稱中有 \"祕法\" 或 \"禱言\" 的 Buff 移除掉. 像是 \"祕法光輝\" 和 \"神聖禱言\" 因為裡面有 \"祕法\" 或 \"禱言\" 二字.\n\n頁面:\n<團隊時>下方選項讓你選擇在 Raid 期間要在哪個頻道中發送訊息. <隊伍時>下方的選項則是當你在隊伍期間, <單獨時>則是你在 Solo 期間用的.\n如果你選擇\"自訂\"選項, 會出現一個視窗讓你輸入要發送訊息的頻道, 可以用頻道名稱或是號碼. 如果要發送多個頻道, 請在每個頻道中間加個空格.\n當你選擇了某些發送頻道後, 你可以按下\"複製\", 將你目前的設定複製, 然後選取別的頁面, 按下\"貼上\", 即可將上一頁面的設定複製過來.\n注意！這樣做會讓你原本自訂的頻道名稱被覆蓋.\n你可以在下方的編輯列輸入自訂的訊息, 並在訊息內使用下方的可用參數.\n如果你在嘲諷頁面勾選 \"輸入補救嘲諷失敗時所要發送的文字訊息\" , 你可以在嘲諷失敗時立即使用懲戒痛擊並且成功後所要發送的訊息. 注意! 這項功能只會在嘲諷仍在冷卻時作用, 並且當前的目標必需跟抵抗你嘲諷的怪物同名同等級.\n\n可用參數:\n嘲諷, 低吼, 懲戒痛擊:\n$tn: 目標名稱 (相同於 %t)\n$tl: 目標等級\n$tt: 目標種類 (人型生物, 動物, 惡魔等)\n$ttn: 目標的目標名稱\n$ttl: 目標的目標等級\n$ttt: 目標的目標種類\n\n盾牆, 挑戰怒吼, 挑戰咆哮, 破釜沉舟, 生命寶石:\n$sec: 技能持續時間(秒)\n\n破釜沉舟, 生命寶石:\n$hp: 使用技能後所獲得的生命值.";

	TB_GUI_Channel_Ctraid = "CTRaid團隊助手";
	TB_GUI_Channel_RaidWarning = "團隊警告";
	TB_GUI_Channel_Raid = "團隊";
	TB_GUI_Channel_Guild = "公會";
	TB_GUI_Channel_Party = "隊伍";
	TB_GUI_Channel_Yell = "大喊";
	TB_GUI_Channel_Say = "說";
	TB_GUI_Channel_Custom = "自訂";

	TB_defaultText = {
		[TB_GUI_Taunt] = "- 我的嘲諷被 $tn 抵抗了 -";
		[TB_GUI_MB] = "- 我的懲戒痛擊被 $tn 抵抗了 -";
		[TB_GUI_LS] = "- 我開啟了破釜沉舟！在 $sec 秒後我會降低並損失 $hp HP！ -";
		[TB_GUI_SW] = "- 我開啟了盾牆！在 $sec 秒內所有傷害值會降低 75%！ -";
		[TB_GUI_LG] = "- 我開啟了生命寶石！在 $sec 秒後我會降低 $hp HP 最大值！ -";
		[TB_GUI_CS] = "- 我使用了挑戰怒吼！在 $sec 秒內我需要大量的補血！ -";
		[TB_GUI_Growl] = "- 我的低吼被 $tn 抵抗了-";
		[TB_GUI_CR] = "- 我使用了挑戰咆哮！在 $sec 秒內我需要大量的補血！ -";
	}
	TB_defaultText_r = "- 我的懲戒痛擊命中抵抗我嘲諷的怪物 -";

	TB_tauntLine = "你的嘲諷被(.+)抵抗了";
	TB_growlLine = "你的低吼被(.+)抵抗了";
	TB_mbHitLine = "你的懲戒痛擊(.*)(.+)造成(.+)";
	TB_mb = "(.*)懲戒痛擊(.*)";
	TB_ls = "你獲得了破釜沉舟";
	TB_sw = "你獲淂了盾牆";
	TB_lg = "你獲得了生命賜福";
	TB_cs = "挑戰怒吼";
	TB_cr = "挑戰咆哮";
	TB_salvation = "拯救祝福"; 
	TB_intellect = "祕法"; 
	TB_wisdom = "智慧祝福";

	TB_output_buffremoved = " removed, matched "; --As in ["Greater Blessing of Salvation" removed, matched "Salvation"] Note: leave a space before and after, as in the english one.
	TB_output_startup = " 已載入. 請輸入 /TB 開啟設定選單.";
	TB_output_alreadyOff = "坦克助手已經關閉.";
	TB_output_alreadyOn = "坦克助手已經開啟.";
	TB_output_off = "坦克助手關閉.";
	TB_output_on = "坦克助手開啟.";

	TB_cmd_on = "on";
	TB_cmd_off = "off";

elseif (GetLocale() == "ruRU") then -- Russian (UI AddOn) -??

elseif (GetLocale() == "esES") then -- Spanish
end
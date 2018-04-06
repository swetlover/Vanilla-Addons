--
-- Language File for ClassMasterLoot v1.10
--
-- by Nitram @ DE-Azshara
--

CML_LOOTTITLE = "队长拾取大师";
CML_ENABLE = "<队长拾取大师> 现在启用!";
CML_DISABLE = "<队长拾取大师> 现在禁用! - 现在重载,请等待!!!";
CML_ISDISABLED = "<队长拾取大师> 目前是禁用.如果你想使用,输入 /cml on";
CML_MSGON = "<队长拾取大师> 随机Roll点信息开!";
CML_MSGOFF = "<队长拾取大师> 随机Roll点信息关!";
CML_RESETTED = "<队长拾取大师> 现在复位到默认的";
CML_ASKON = "<队长拾取大师> 拾取确认询问现在启用!";
CML_ASKOFF = "<队长拾取大师> 拾取确认询问现在禁用!";
CML_LOADED = "<队长拾取大师> 顺利加载 !!";
CML_RANDOMLOOT = "<队长拾取大师> Roll点 %d -> 胜利者是 %s";
CML_QUICKLOOT_ADDED = "玩家 '%s' 现在可以作为一个快速拾取按钮";
CML_QUICKLOOT_REMOVED = "删除快速拾取按钮";
CML_HELP1 = "<队长拾取大师> 帮助:";
CML_HELP2 = "/cml help          - 显示这个对话";
CML_HELP3 = "/cml on            - 启用插件";
CML_HELP4 = "/cml off           - 禁用插件并使用暴雪默认框架";
CML_HELP5 = "/cml msgon         - 启用队伍/团队聊天框里的随机roll点信息";
CML_HELP6 = "/cml msgoff        - 禁用队伍/团队聊天框里的随机roll点信息";
CML_HELP7 = "/cml ask           - 开启/禁用确认拾取框";
CML_HELP8 = "/cml reset         - 重置所有设置到默认";
CML_HELP9 = "/cml add <user>    - 添加一个成员到快速拾取";
CML_HELP10 = "/cml accept <X-Y>  - 只接受Roll点在 X 到 Y (也就是说 /random 1-100 - X=1 & Y=100)";
CML_HELP11 = "/cml showrolls     - 在聊天框显示一个ROLL点列表";
CML_HELP12 = "/cml clearrolls    - 清除聊天框的ROLL点列表";
CML_HELP13 = "/cml timeout <x>   - 超时至多少秒的rolls点信息会被忽略";
CML_HELP14 = "你可以使用 /cml 或者 /classmasterloot 打开插件信息";

-- Roll System
CML_ROLL_SEARCHPATTERN = "(.+)掷出(%d+)（(%d+)-(%d+)）";		  	 -- Testname rolls 20 (1-100)
CML_ROLL_DROPDOWNMENU = "最佳(%d)个Roll点";
CML_ROLL_ANOUNCE_MESSAGE = "%s Roll点奖励开始,请大家输入 /random %d-%d ,或者/roll 进行roll点";
CML_ROLL_ACCEPT_ERROR = "非法格式, 情书用 '/cml accept 1-100' 或类似的东西";
CML_ROLL_ACCEPT_UPDATE = "<队长拾取大师> 只接受roll在 %d 到 %d";
CML_ROLL_TABLE_CLEAR = "<队长拾取大师> 重置roll点列表";
CML_ROLL_TABLE_HEADER = "最佳Roll点(点数 - 名字)";

-- BidBot System
CML_BIDBOT_DROPDOWNMENU = "BidBot 竞拍";
CML_BIDBOT_ON = "<队长拾取大师> La Vendetta BidBod 支持启用!";
CML_BIDBOT_OFF = "<队长拾取大师> La Vendetta BidBod 支持禁用!";


CML_Classes = {
    Druid = "德鲁伊",
    Hunter = "猎人",
    Mage = "法师",
    Paladin = "圣骑士",
    Priest = "牧师",
    Rogue = "盗贼",
    Shaman = "萨满祭司",
    Warlock = "术士",
    Warrior = "战士",

    Unknown = "未知",
    Random = "随机成员",
    Self = "自我拾取",
}

--
-- Locale for German Clients (deDE)
-- 
if (GetLocale() == "deDE") then

    CML_LOOTTITLE = "Itemverteilung";
    CML_ENABLE = "<ClassMasterLoot> wurde nun Aktiviert!";
    CML_DISABLE = "<ClassMasterLoot> wurde nun Deaktiviert!";
    CML_ISDISABLED = "<ClassMasterLoot> ist aktuell Deaktiviert. Bitte verwenden Sie /cml on um das Addon zu Aktivieren.";
    CML_MSGON = "<ClassMasterLoot> Mitteilungen bei Zufallszuweisungen sind nun AN!";
    CML_MSGOFF = "<ClassMasterLoot> Mitteilungen bei Zufallszuweisungen sind nun AUS!";
    CML_ASKON = "<ClassMasterLoot> Frage vor Lootzuweisung ist nun AN!";
    CML_ASKOFF = "<ClassMasterLoot> Frage vor Lootzuweisung ist nun AUS!";
    CML_RESETTED = "<ClassMasterLoot> wurde auf die Standardeinstellung zur\195\188ckgesetzt";
    CML_LOADED = "CML <Class Master Looter> erfolgreich geladen !!";
    CML_RANDOMLOOT = "<ClassMasterLoot> W\195\188rfelt %d -> der Gewinner lautet %s";
    CML_QUICKLOOT_ADDED = "Der Spieler '%s' ist nun als quickloot Knopf verf\195\188gbar.";
    CML_QUICKLOOT_REMOVED = "Der quickloot Knopf ist nichtmehr vorhanden";
    CML_HELP1 = "<ClassMasterLoot> Hilfe:";
    CML_HELP2 = "/cml help          - Zeigt diese Hilfe an";
    CML_HELP3 = "/cml on            - Aktiviert die Klassenbasierenden Lootfenster";
    CML_HELP4 = "/cml off           - Deaktiviert das Addon und verwendet die Standard Lootfenster";
    CML_HELP5 = "/cml msgon         - Aktiviert Party/Raidchat Mitteilungen beim Zufallszuweisen";
    CML_HELP6 = "/cml msgoff        - Deaktiviert Party/Raidchat Mitteilungen beim Zufallszuweisen";
    CML_HELP7 = "/cml ask           - Fr\195\164gt bei vor der Zuweisung des Gegenstands";
    CML_HELP8 = "/cml reset         - Setzt alle Einstellungen auf Standard zur\195\188ck";
    CML_HELP9 = "/cml add <user>    - F\195\188gt einen Spieler dem Schnellloot hinzu ";
    CML_HELP10 = "/cml accept <X-Y>  - Akzeptiert nur W\195\188rfelergebnisse zwischen X und Y (z.B. 1-100)";
    CML_HELP11 = "/cml showrolls     - Zeigt die W\195\188rfelergebnisse im Chat an";
    CML_HELP12 = "/cml clearrolls    - Löscht die Liste der W\195\188rfelergebnisse";
    CML_HELP13 = "/cml timeout <x>   - Timeout in Sekunden bis /rolls Ignoriert werden";
    CML_HELP14 = "Es steht /cml oder /classmasterloot zur Verf\195\188gung.";

    -- Roll System
    CML_ROLL_SEARCHPATTERN = "(.+) w\195\188rfelt. Ergebnis: (%d+) %((%d+)%-(%d+)%)";
    -- Testname würfelt. Ergebnis: 20 (1-100)
    CML_ROLL_DROPDOWNMENU = "Besten (%d) W\195\188rfler";
    CML_ROLL_ANOUNCE_MESSAGE = "Bitte w\195\188rfelt jetzt um %s via /roll %d-%d";
    CML_ROLL_ACCEPT_ERROR = "Falsches Format, bitte verwende '/cml accept 1-100 oder \195\164hnliches";
    CML_ROLL_ACCEPT_UPDATE = "<ClassMasterLoot> akzeptiert nun W\195\188rfel Ergebnisse zwischen %d und %d";
    CML_ROLL_TABLE_CLEAR = "<ClassMasterLoot> leert nun die W\195\188rfel Ergebniss Liste";
    CML_ROLL_TABLE_HEADER = "W\195\188rfelergebnisse (Ergebnis - Name)";

    CML_Classes = {
        Druid = "Druide",
        Hunter = "J\195\164ger",
        Mage = "Magier",
        Paladin = "Paladin",
        Priest = "Priester",
        Rogue = "Schurke",
        Shaman = "Schamane",
        Warlock = "Hexenmeister",
        Warrior = "Krieger",

        Unknown = "Unbekannt",
        Random = "Zufall",
        Self = "Selbst zuweisen",
    }

end

--
-- Locale for French Clients (frFR)      -- Thanks to Feu via Curse-Gaming.com
-- 
if (GetLocale() == "frFR") then

    -- Lines beginning with -- are unknown by the Mod Author and comes in English (FR is currently not fully working)

    CML_LOOTTITLE = "Ma\195\174tre du butin";
    CML_ENABLE = "<ClassMasterLoot> est maintenant activ\195\169 !";
    CML_DISABLE = "<ClassMasterLoot> est maintenant d\195\169sactiv\195\169 !";
    -- CML_ISDISABLED			= "";
    CML_MSGON = "<ClassMasterLoot> - Messages lors des randoms : ON !";
    CML_MSGOFF = "<ClassMasterLoot> - Messages lors des randoms : OFF !";
    CML_RESETTED = "<ClassMasterLoot> est maintenant r\195\169initialis\195\169 par d\195\169faut ";
    CML_ASKON = "<ClassMasterLoot> - Confirmation du butin est maintenant activ\195\169 !";
    CML_ASKOFF = "<ClassMasterLoot> - Confirmation du butin est maintenant d\195\169sactiv\195\169 !";
    CML_LOADED = "CML <Class Master Looter> charg\195\169 avec succ\195\168s !";
    CML_RANDOMLOOT = "<ClassMasterLoot> Rolls %d -> Le gagnant est %s";
    CML_QUICKLOOT_ADDED = "Le joueur '%s' est maintenant disponible en bouton Quickloot";
    CML_QUICKLOOT_REMOVED = "Bouton Quick Loot retir\195\169";
    CML_HELP1 = "<ClassMasterLoot> - Aide :";
    CML_HELP2 = "/cml help         - Affiche ce message";
    CML_HELP3 = "/cml on           - Active le syst\195\168me par classe";
    CML_HELP4 = "/cml off          - D\195\169sactive le syst\195\168me par classe et utilise le syst\195\168me de Blizzard par d\195\169faut";
    CML_HELP5 = "/cml msgon        - Active les messages de Groupe/Raid lors des randoms";
    CML_HELP6 = "/cml msgoff       - D\195\169sactive les messages de Groupe/Raid lors des randoms";
    CML_HELP7 = "/cml ask          - Demande confirmation lors de l'attribution du loot";
    CML_HELP8 = "/cml reset        - R\195\169initialise tous les param\195\168tres par d\195\169faut";
    CML_HELP9 = "/cml add <user>   - Ajoute un membre \195\160 Quickloot";
    CML_HELP10 = "/cml accept <X-Y> - Accepte seulement les rolls entre X et Y (c\195\160d /random 1-100 - X=1 & Y=100)";
    CML_HELP11 = "/cml showrolls    - Affiche la liste des rolls sur le chat";
    CML_HELP12 = "/cml clearrolls   - Efface la liste des rolls";
    CML_HELP13 = "/cml timeout <x>   - Timeout in Sec until /rolls got ignored";
    CML_HELP14 = "Vous pouvez utiliser /cml ou /classmasterloot pour configurer";

    -- Roll System
    CML_ROLL_SEARCHPATTERN = "(.+) obtient un (%d+) %((%d+)%-(%d+)%)";
    -- Testname obtient un 20 (1-100)
    CML_ROLL_DROPDOWNMENU = "Top(%d) des rolls";
    CML_ROLL_ANOUNCE_MESSAGE = "Veuillez roller maintenant pour %s avec la commande /random %d-%d";
    CML_ROLL_ACCEPT_ERROR = "Format ill\195\169gal, veuillez utiliser '/cml accept 1-100' ou quelque chose de similaire";
    CML_ROLL_ACCEPT_UPDATE = "ClassMasterLoot accepte maintenant uniquement les rolls entre %d et %d";
    CML_ROLL_TABLE_CLEAR = "ClassMasterLoot r\195\169initialise la table de rolls";
    CML_ROLL_TABLE_HEADER = "Top des rolls (Score - Nom)";

    CML_Classes = {
        Druid = "Druide",
        Hunter = "Chasseur",
        Mage = "Mage",
        Paladin = "Paladin",
        Priest = "Pr\195\170tre",
        Rogue = "Voleur",
        Shaman = "Chaman",
        Warlock = "D\195\169moniste",
        Warrior = "Guerrier",

        Unknown = "Inconnu",
        Random = "Random",
        Self = "Soi-m\195\170me",
    }
end



--
-- This function is need because the DE Client uses the EN Names in the Color Table
-- There is no need to change anything in the Function
--
function CML_ReturnToEnglish(class)
    if (class == CML_Classes.Druid) then
        return "DRUID";
    elseif (class == CML_Classes.Hunter) then
        return "HUNTER";
    elseif (class == CML_Classes.Mage) then
        return "MAGE";
    elseif (class == CML_Classes.Paladin) then
        return "PALADIN";
    elseif (class == CML_Classes.Priest) then
        return "PRIEST";
    elseif (class == CML_Classes.Rogue) then
        return "ROGUE";
    elseif (class == CML_Classes.Shaman) then
        return "SHAMAN";
    elseif (class == CML_Classes.Warlock) then
        return "WARLOCK";
    elseif (class == CML_Classes.Warrior) then
        return "WARRIOR";
    end
end



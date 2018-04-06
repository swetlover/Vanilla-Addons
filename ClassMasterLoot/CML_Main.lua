--
-- Class Loot Master - by Nitram from DE-Azshara
--
-- Release Version v1.10
--
-- Info:
--
--   This Addon is fully written by Nitram@DE-Azshara.
--   It removes the Original Masterloot Dropdown Menu
--   ordered by Groups and Resort it ordered by Class.
--   It also extended the Lootlist to a Random button
--   witch simply gives the Item to a Random Member and
--   a give to You button. This Button give the Item to
--   yourself. It's decreases a lot of Work from the
--   Lootmasters to simplify this function.
--
--   It's tested on the EN Client and shall work on DE and FR too.
--
-- Commands:
--
--   /cml or /classmasterloot
--
--   /cml on		- Enable Addon
--   /cml off		- Disable Addon
--   /cml msgon		- Message on give to Random
--   /cml msgoff	- Don't Message on give to Random
--   /cml ask		- Ask bevor give loot to Player
--   /cml reset		- Reset to defaults
--   /cml add <user>    - Adds a User to Quickloot
--   /cml accept <X-Y>  - Only Accept Rolls between X and Y (means /random 1-100 - X=1 & Y=100)
--   /cml showrolls     - Displays a Roll List to the LootMaster
--   /cml clearrolls    - Clears the List of Rolls
--   /cml timeout <x>   - Timeout in Sec until /rolls got ignored
--
-- Todo:
--
--   Add Configuration Dialog
--   More wishes from users
--   To Random in Party's
--
-- History:
--
--   v1.00: first Release.
--   v1.01: Updated: Partymode has no Update and now got
--                   Random and Self Target
--          Bugfix:  Debugmessage removed
--   v1.02: Updated: Added Slashcommand to Enable or Disable
--   v1.03: Bugfix:  Selftarget gives to Randomtarget, now to self
--   v1.04: Updated: Added new Slashhandler and SlashHelp
--                   Added new Reset Function to Slashhandler
--                   Added Message on Randomgiveloot (roll x -> winner xxx)
--   v1.05: Bugfix:  Fixed problem with getting colors on non EN Clients
--          Updated: Added "/cml ask" to confirm Loot's (all Colors)
--                   Added new GiveLoot to get own Dialog Level working
--   v1.06: Bugfix:  Fixed Error Message bug with Unknown Units (if Client can't get Unit Class)
--          Updated: Added Feature to get a "quickloot" button for a Unit
--                   Added Rolling System (Ordered by Roll)
--                   Many small changes and improvement's
--                   New Slashcommands for the new Functions
--                   Add full FR Translation (Thanks to Feu via Curse-Gaming)
--                   Rewrote the "Give to Random" Function
--   v1.07: Bugfix:  Fixed Text Message in Dialog from Roll System (noncritical, only Textbug)
--   v1.08: Bugfix:  Fixed Roll System Day/Time Information (switched Day and Month)
--                   Fixed Problem where the Dropdown Menu not closed automaticaly (noncritical)
--   v1.09: Bugfix:  Done Changes for WoW Patch v1.11 to prevent Lootbugs
--   v1.10: Bugfix:  Fixed 2 bugs and generated warning instead of errors, thanks to Namia from Azshara
--          Updated: Toc to get loaded and not outdated :)
--          Added:   Added La Vendetta BidBot Support via /cml bidbot on|off - its not documented and only beta
--
-- Thanks to:
--   Feu via Curse-Gaming.com for the FR Translation
--

function CML_OnLoad()
    tinsert(UISpecialFrames, "ClassLootMaster");

    SLASH_CLASSMASTERLOOT1 = "/classmasterloot";
    SLASH_CLASSMASTERLOOT2 = "/cml";
    SlashCmdList["CLASSMASTERLOOT"] = function(msg)
        CML_SlashCommand(msg);
    end

    this:RegisterEvent("VARIABLES_LOADED");
end

function CML_SlashCommand(msg)
    local _, _, command, args = string.find(msg, "(%w+)%s?(.*)");
    if (command) then
        command = strlower(command);
    end

    if (command == "on") then
        CML_Vars.Enabled = true;
        CML_Hook();
        CML_Text(CML_ENABLE, true);

    elseif (command == "off") then
        CML_Vars.Enabled = false;
        CloseLoot();
        CML_HideDropDownMenu();
        CML_Text(CML_DISABLE, true);
        ReloadUI();
        -- To unload all Hooked Stuff   // got many problems so this fixed all, sorry

    elseif (command == "msgon") then
        CML_Vars.PostRandom = true;
        CML_Text(CML_MSGON, true);

    elseif (command == "msgoff") then
        CML_Vars.PostRandom = false;
        CML_Text(CML_MSGOFF, true);

    elseif (command == "bidbod") then
        if (args ~= nil and args == "on") then
            CML_Vars.BidBodSupport = true;
            CML_Text(CML_BIDBOT_ON, true);
        else
            CML_Vars.BidBodSupport = false;
            CML_Text(CML_BIDBOT_OFF, true);
        end

    elseif (command == "ask") then
        if (CML_Vars.Ask) then
            CML_Vars.Ask = false;
            CML_Text(CML_ASKOFF, true);
        else
            CML_Vars.Ask = true;
            CML_Text(CML_ASKON, true);
        end

    elseif (command == "add" and not(args == nil)) then
        CML_Vars.Quickloot = args;
        if (CML_Vars.Quickloot == "") then
            CML_Text(CML_QUICKLOOT_REMOVED, true);
        else
            CML_Text(string.format(CML_QUICKLOOT_ADDED, args), true);
        end

    elseif (command == "accept" and not(args == nil)) then
        local _, _, min_roll, max_roll = string.find(args, "(%d+)-(%d+)");
        if (not(min_roll == nil) and not(max_roll == nil)) then
            CML_Vars.Roll_Min = tonumber(min_roll);
            CML_Vars.Roll_Max = tonumber(max_roll);

            CML_Text(string.format(CML_ROLL_ACCEPT_UPDATE, CML_Vars.Roll_Min, CML_Vars.Roll_Max), true);
        else
            CML_Text(CML_ROLL_ACCEPT_ERROR, true);
        end

    elseif (command == "showrolls") then
        if (not(args == nil)) then
            CML_ShowRollTable(args);
        else
            CML_ShowRollTable();
        end

    elseif (command == "clearrolls") then
        CML_Vars.Rolls = { };
        CML_Vars.RollStartTime = time();
        CML_Text(CML_ROLL_TABLE_CLEAR, true);

    elseif (command == "debug") then
        if (CML_Vars.Debug) then
            CML_Vars.Debug = false;
            CML_Text("Debug Mode Stopped", true);
        else
            CML_Vars.Debug = true;
            CML_Text("Debug Mode Started", true);
        end

    elseif (command == "reset") then
        CML_Reset();
        CML_Text(CML_RESETTED, true);

    else
        -- Output's the Help Lines
        for i = 1, 14 do
            CML_Text(getglobal("CML_HELP" .. i), true);
        end
    end

end

function CML_Reset()
    CML_Vars = { };
    CML_Vars.Version = 1.10;
    -- Version Number for Auto reset
    CML_Vars.Enabled = true;
    -- default enabled
    CML_Vars.Debug = false;
    -- default disabled
    CML_Vars.PostRandom = true;
    -- default enabled 	-- Message on Randomloot
    CML_Vars.Ask = false;
    -- default disabled
    CML_Vars.Quickloot = "";
    -- Playername for Quickloot
    CML_Vars.ShowRolls = 5;
    -- only show Top 5 Rolls
    CML_Vars.RollStartTime = 0;
    -- Starttime since Anouncement
    CML_Vars.RollTimeout = 60;
    -- Only Accept Rolls within X Sec
    CML_Vars.Rolls = { };
    -- empty Array for Roll's
    CML_Vars.Roll_Min = 1;
    -- Default 1
    CML_Vars.Roll_Max = 100;
    -- Default 100

    CML_Vars.BidBodSupport = false;
    -- LV BidBod Support
    CML_Vars.BidBodExpr = "%[BidBot%]: (%d+). (%w+) hat (%d+) DKP geboten.";
    -- Expression to Target Result from
    CML_Vars.BidBodStartString = "!bid %s";
    -- String to start Bids
    CML_Vars.BidBodBids = { };
    -- empty Array for Bids
end

function CML_Text(message, showallways)
    if (message ~= nil) then
        if (showallways == true) then
            DEFAULT_CHAT_FRAME:AddMessage(message);
        elseif (CML_Vars.Debug == true) then
            DEFAULT_CHAT_FRAME:AddMessage("[DEBUG] " .. message);
        end
    end
end

function CML_InitDropDown()

    if (CML_Vars.Enabled == false) then
        -- Addon is OFF - Open the Default Menu
        CML_Text("Now run original DropDown handler!");
        CML_ORGGROUPLOOTDROPDOWN();
        return true;
    end

    if (GetNumRaidMembers() > 0) then
        -- in Raidgroup
        local raidmembers = { };
        local maxrolls = 0;
        local notinquickloot = true;
        local quicklootid = 0;

        for i = 1, 40 do
            local candidate = GetMasterLootCandidate(i);
            if (candidate) then
                local id = CML_GetIDbyName(candidate);
                if (id) then
                    local classx = UnitClass(id);
                    raidmembers[classx] = raidmembers[classx] or { }
                    table.insert(raidmembers[classx], i);
                else
                    raidmembers[CML_Classes.Unknown] = raidmembers[CML_Classes.Unknown] or { }
                    table.insert(raidmembers[CML_Classes.Unknown], i);
                end

                -- Check the QuickLoot Button
                if (candidate == CML_Vars.Quickloot) then
                    notinquickloot = false;
                    quicklootid = i;
                end
            end
        end




        if (UIDROPDOWNMENU_MENU_LEVEL == 2) then
            -- Layer 2 in List

            if (UIDROPDOWNMENU_MENU_VALUE == "ROLLLIST") then
                -- Build the Roll Menue

                maxrolls = table.getn(CML_Vars.Rolls);
                -- only show TopX Rolls
                if (maxrolls > CML_Vars.ShowRolls) then
                    maxrolls = CML_Vars.ShowRolls;
                end

                for x = 1, maxrolls do
                    for i = 1, 40 do
                        if (GetMasterLootCandidate(i) == CML_Vars.Rolls[x].name) then

                            local info = { }
                            local infoname = UnitClass(CML_GetIDbyName(GetMasterLootCandidate(i)));
                            if (infoname == nil) then
                                CML_Text("[DEBUG]: GetMasterLootCandidate(" .. i .. ") == " .. GetMasterLootCandidate(i), true);

                                CML_Text("[DEBUG]: UnitClass(xxx) == "
                                .. tostring(UnitClass(CML_GetIDbyName(GetMasterLootCandidate(i)))), true);

                                infoname = "Unknown(got nil)";
                                info.disabled = 1;
                            end
                            info.text = CML_Vars.Rolls[x].roll .. " - "
                            .. GetMasterLootCandidate(i) .. " - "
                            .. date("%H:%M:%S %d.%m.%y", CML_Vars.Rolls[x].time)
                            .. " - " .. infoname;
                            info.value = i;
                            info.notCheckable = 1;
                            info.func = CML_GiveItTo;
                            UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL);
                        end
                    end
                end

                -- BidBod List
            elseif (UIDROPDOWNMENU_MENU_VALUE == "BIDLIST" and CML_Vars.BidBodSupport == true) then
                for x = 1, table.getn(CML_Vars.BidBodBids), 1 do
                    for i = 1, 40 do
                        if (GetMasterLootCandidate(i) == CML_Vars.BidBodBids[x].name) then

                            local info = { }
                            local infoname = UnitClass(CML_GetIDbyName(GetMasterLootCandidate(i)));
                            if (infoname == nil) then
                                CML_Text("[DEBUG]: GetMasterLootCandidate(" .. i .. ") == " .. GetMasterLootCandidate(i), true);

                                CML_Text("[DEBUG]: UnitClass(xxx) == "
                                .. tostring(UnitClass(CML_GetIDbyName(GetMasterLootCandidate(i)))), true);

                                infoname = "Unknown(got nil)";
                                -- 							info.disabled = 1;
                            end
                            info.text = GetMasterLootCandidate(i) .. " - "
                            .. CML_Vars.BidBodBids[x].bid .. " DKP - "
                            .. date("%H:%M:%S %y.%m.%d", CML_Vars.BidBodBids[x].time) .. " - "
                            .. infoname;
                            info.value = i;
                            info.notCheckable = 1;
                            info.func = CML_GiveItTo;
                            UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL);
                        end
                    end
                end

                -- Normal List
            else
                -- Normal ClassLoot Level2
                if (raidmembers[UIDROPDOWNMENU_MENU_VALUE] == nil) then return false; end
                -- I don't know why, but otherwise for is bugged

                for i, cindex in raidmembers[UIDROPDOWNMENU_MENU_VALUE] do
                    local info = { }
                    info.text = GetMasterLootCandidate(cindex);
                    info.value = cindex;
                    info.notCheckable = 1;
                    info.func = CML_GiveItTo;
                    UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL);
                end
            end

        elseif (UIDROPDOWNMENU_MENU_LEVEL == 1) then
            -- Layer 1 on List

            UIDropDownMenu_AddButton {
                text = CML_LOOTTITLE,
                notCheckable = 1,
                isTitle = 1,
            }
            -- Add Roll Menu
            UIDropDownMenu_AddButton {
                text = string.format(CML_ROLL_DROPDOWNMENU,CML_Vars.ShowRolls),
                value = "ROLLLIST",
                hasArrow = 1,
                func = CML_AnnounceRoll,
            }

            if (CML_Vars.BidBodSupport) then
                UIDropDownMenu_AddButton {
                    text = CML_BIDBOT_DROPDOWNMENU,
                    value = "BIDLIST",
                    hasArrow = 1,
                    func = CML_AnnounceBidBot,
                }
            end

            -- Add Random Button
            UIDropDownMenu_AddButton {
                text = CML_Classes.Random,
                func = CML_GiveToRandomTarget,
            }

            -- Add Self Button
            UIDropDownMenu_AddButton {
                text = CML_Classes.Self,
                func = CML_GiveToSelf,
            }

            -- Check Quickloot Button
            if (notinquickloot == false) then
                UIDropDownMenu_AddButton {
                    text = "快速拾取人: " .. CML_Vars.Quickloot,
                    value = quicklootid,
                    func = CML_GiveItTo,
                }
            end

            local unknown = raidmembers[CML_Classes.Unknown];
            raidmembers[CML_Classes.Unknown] = nil;

            local classes = { }
            for class in raidmembers do
                table.insert(classes, class);
            end

            table.sort(classes)

            for i = 1, table.getn(classes) do

                local class = classes[i];
                local c = RAID_CLASS_COLORS[CML_ReturnToEnglish(class)];

                UIDropDownMenu_AddButton {
                    text = class,
                    hasArrow = 1,
                    notCheckable = 1,
                    value = class,
                    textR = c.r,
                    textG = c.g,
                    textB = c.b,
                }

            end

            if (unknown) then
                UIDropDownMenu_AddButton { }
                UIDropDownMenu_AddButton {
                    text = CML_Classes.Unknown,
                    hasArrow = 1,
                    noCheckable = 1,
                    value = CML_Classes.Unknown,
                    textR = 153,
                    textG = 153,
                    textB = 153,
                }
            end
        end
    else
        -- In a party

        for i = 1, MAX_PARTY_MEMBERS + 1, 1 do
            candidate = GetMasterLootCandidate(i);
            if (candidate) then
                -- Add candidate button
                info = { };
                info.text = candidate;
                info.textHeight = 12;
                info.value = i;
                info.notCheckable = 1;
                info.func = CML_GiveItTo;
                UIDropDownMenu_AddButton(info);
            end
        end

        --[[		-- removed because this function only works in Raids
		UIDropDownMenu_AddButton{
			text = CML_Classes.Random,
			func = CML_GiveToRandomTarget,
		}

		UIDropDownMenu_AddButton{
			text = CML_Classes.Self,
			func = CML_GiveToSelf,
		}
]]
    end
end

function CML_AnnounceRoll()
    if (GetLootSlotLink(LootFrame.selectedSlot) == nil) then
        -- Error - but why?
        CML_Text("Sorry got an Error, LootFrame.selectedSlot is not setted, please leave the lootframe and try again", true);
        return false;
    end

    local msg = "";
    CML_Vars.Rolls = { };
    -- Reset Roll Table
    CML_Vars.RollStartTime = time();
    msg = string.format(CML_ROLL_ANOUNCE_MESSAGE, GetLootSlotLink(LootFrame.selectedSlot), CML_Vars.Roll_Min, CML_Vars.Roll_Max);

    SendChatMessage(msg, CML_GetGroupType());
end

function CML_AnnounceBidBot()
    if (GetLootSlotLink(LootFrame.selectedSlot) == nil) then
        -- Error - but why?
        CML_Text("Sorry got an Error, LootFrame.selectedSlot is not setted, please leave the lootframe and try again", true);
        return false;
    end
    CML_Vars.BidBodBids = { };
    SendChatMessage(string.format(CML_Vars.BidBodStartString, GetLootSlotLink(LootFrame.selectedSlot)), "GUILD");
end

function CML_GetIDbyName(name)
    for i = 1, GetNumRaidMembers() do
        if (UnitName("raid" .. i) == name) then
            return "raid" .. i;
        end
    end
end

function CML_GiveMasterLootFunction(slot, index)
    CML_ORGGIVEMASTERLOOT(slot, index);
    CML_HideDropDownMenu();
end
	
function CML_HideDropDownMenu()
    for i = 1, UIDROPDOWNMENU_MAXLEVELS do
        getglobal("DropDownList" .. i):Hide();
    end
end

function CML_GetSelfID()
    return CML_GetRaidID(UnitName("player"));
end
-- ClassMasterLoot\\CML_Main.lua:496: attempt to compare number with nil
function CML_GiveItTo()
    if (CML_Vars.Ask or LootFrame.selectedQuality >= MASTER_LOOT_THREHOLD) then
        local dialog = StaticPopup_Show("CONFIRM_LOOT_DISTRIBUTION",
        ITEM_QUALITY_COLORS[LootFrame.selectedQuality].hex .. LootFrame.selectedItemName .. FONT_COLOR_CODE_CLOSE,
        GetMasterLootCandidate(this.value));
        if (dialog) then
            dialog.data = this.value;
        end
    else
        GiveMasterLoot(LootFrame.selectedSlot, this.value);
    end
end

function CML_GiveToSelf()
    local myplayerid = 0;
    for i = 1, 40 do
        if (GetMasterLootCandidate(i) == UnitName("player")) then
            myplayerid = i;
        end
    end
    if (myplayerid > 0) then

        if (CML_Vars.Ask or LootFrame.selectedQuality >= MASTER_LOOT_THREHOLD) then
            -- we want to work with the right Dialog
            LootFrame.value = myplayerid;
            LootFrame.text = GetMasterLootCandidate(myplayerid);

            local dialog = StaticPopup_Show("CONFIRM_LOOT_DISTRIBUTION",
            ITEM_QUALITY_COLORS[LootFrame.selectedQuality].hex .. LootFrame.selectedItemName .. FONT_COLOR_CODE_CLOSE,
            LootFrame.text);
            if (dialog) then
                dialog.data = LootFrame.value;
            end
        else
            GiveMasterLoot(LootFrame.selectedSlot, myplayerid);
        end
    else
        CML_Text("[ERROR] Can't get your LootID! (use /cml off)", true);
    end
end

function CML_GiveToRandomTarget()
    -- only works in Raids
    local list_players = { }
    local candidate = "";
    local winner = 0;
    local raidmembers = GetNumRaidMembers();
    local donotloopuntilworldexplode = time();

    for i = 1, raidmembers do
        list_players[i] = { };
        list_players[i]["rid"] = "raid" .. i;
        list_players[i]["name"] = UnitName(list_players[i]["rid"]);
        list_players[i]["lootid"] = 0;

        -- Debug
        CML_Text("--------------------------");
        CML_Text("Loot Name: " .. list_players[i]["rid"]);
        CML_Text("Loot R-ID: " .. list_players[i]["name"]);

        if (string.len(list_players[i]["name"]) > 0) then
            for x = 1, raidmembers do
                candidate = GetMasterLootCandidate(x);
                if (candidate == list_players[i]["name"]) then
                    list_players[i]["lootid"] = x;
                    -- Debug
                    CML_Text("Loot L-ID: " .. x);
                end
            end
        end
        -- Debug
        CML_Text("--------------------------");
    end

    winner = math.random(1, raidmembers);

    while (list_players[winner]["lootid"] == 0) do
        -- This Loop is need because a Player can't be on the LootTable
        CML_Text("Sorry, Roll gives '" .. winner .. "' but '" .. list_players[winner]["name"] .. "' is not at the LootTable", true);

        winner = math.random(1, raidmembers);

        if (donotloopuntilworldexplode >(time() -2)) then
            CML_Text("[CRIT_ERROR] while .. do -> loop don't end", true);
            return false;
        end
    end

    if (CML_Vars.PostRandom == true) then
        -- Show Roll Messages?
        SendChatMessage(string.format(CML_RANDOMLOOT, winner, GetMasterLootCandidate(list_players[winner]["lootid"])), CML_GetGroupType());
    end

    if (CML_Vars.Ask or(LootFrame.selectedQuality ~= nil and LootFrame.selectedQuality >= MASTER_LOOT_THREHOLD)) then
        -- we want to work with the right Dialog
        LootFrame.value = list_players[winner]["lootid"];
        LootFrame.text = GetMasterLootCandidate(list_players[winner]["lootid"]);

        local dialog = StaticPopup_Show("CONFIRM_LOOT_DISTRIBUTION",
        ITEM_QUALITY_COLORS[LootFrame.selectedQuality].hex .. LootFrame.selectedItemName .. FONT_COLOR_CODE_CLOSE,
        LootFrame.text);
        if (dialog) then
            dialog.data = LootFrame.value;
        end
    else
        GiveMasterLoot(LootFrame.selectedSlot, list_players[winner]["lootid"]);
    end
end

function CML_Hook()
    CloseLoot();
    -- First Close a opened LootFrame
    CML_HideDropDownMenu();
    -- Second Close all Dropdown Menues

    -- Hook the Loot Dropdown Menue
    if (CML_ORGGROUPLOOTDROPDOWN == nil) then
        -- Only need if not the first time
        CML_ORGGROUPLOOTDROPDOWN = GroupLootDropDown_Initialize;
        -- Save old Lootmenu
    end
    -- GroupLootDropDown_Initialize = CML_InitDropDown;						-- Init own Lootmenu
    UIDropDownMenu_Initialize(GroupLootDropDown, CML_InitDropDown, "MENU");
    -- Init own Dropdown on Loot

    -- Hook the GiveMasterLoot Function
    if (CML_ORGGIVEMASTERLOOT == nil) then
        -- Only need if not the first time
        CML_ORGGIVEMASTERLOOT = GiveMasterLoot;
    end
    GiveMasterLoot = CML_GiveMasterLootFunction;
end

function CML_OnEvent(event)
    if (event == "VARIABLES_LOADED") then
        -- hmm PLAYER_LOGIN seems to be better

        if (CML_Vars == nil or CML_Vars.Version == nil or not(CML_Vars.Version == 1.10)) then
            CML_Reset();
        end

        if (CML_Vars.Enabled) then
            -- If addon is not enabled, we don't need to Hook the Functions
            CML_Hook();
            -- Hooking Functions
        else
            CML_Text(CML_ISDISABLED);
            -- Information that the Addon is Disabled
        end

        DEFAULT_CHAT_FRAME:AddMessage(CML_LOADED);

        -- Added /roll Support
        this:RegisterEvent("CHAT_MSG_SYSTEM");

        -- Added !bidbod Support for La Vendetta
        this:RegisterEvent("CHAT_MSG_GUILD");
    end


    if (event == "CHAT_MSG_SYSTEM") then
        -- All /rolls comes there
        if (time() <=(CML_Vars.RollStartTime + CML_Vars.RollTimeout)) then
            -- wan't lesser CPU Usage?
            local _, _, player, roll, min_roll, max_roll = string.find(arg1, CML_ROLL_SEARCHPATTERN);
            if (player) then
                if (tonumber(min_roll) == CML_Vars.Roll_Min and tonumber(max_roll) == CML_Vars.Roll_Max) then
                    if (not(CML_CheckRoll(player))) then
                        CML_SetRoll(player, roll);

                    end
                end
            end
        else
            CML_Text("Ignoring Message on CHAT_MSG_SYSTEM, outtimed");
        end
    end

    if (event == "CHAT_MSG_GUILD" and CML_Vars.BidBodSupport == true and arg1 ~= nil) then
        local _, _, tid, tname, tdkp = string.find(arg1, CML_Vars.BidBodExpr);

        if (tid ~= nil and tname ~= nil and tdkp ~= nil) then
            local TheRoll = { };
            TheRoll["name"] = tname;
            TheRoll["bid"] = tonumber(tdkp);
            TheRoll["time"] = time();

            table.insert(CML_Vars.BidBodBids, TheRoll);
        end
    end

end

function CML_ShowRollTable()
    -- prints out the Roll Result Table
    local msg = "";
    local maxrolls = table.getn(CML_Vars.Rolls);
    -- only show TopX Rolls
    if (maxrolls > CML_Vars.ShowRolls) then
        maxrolls = CML_Vars.ShowRolls;
    end

    SendChatMessage(CML_ROLL_TABLE_HEADER, CML_GetGroupType());

    for i = 1, table.getn(CML_Vars.Rolls) do
        msg = CML_Vars.Rolls[i].roll .. " - " .. CML_Vars.Rolls[i].name;

        SendChatMessage(msg, CML_GetGroupType());
    end
end

function CML_CheckRoll(player)
    -- returns true if player allready rolled
    for i = 1, table.getn(CML_Vars.Rolls) do
        if (not(CML_Vars.Rolls[i] == nil)) then
            if (CML_Vars.Rolls[i].name == player) then
                return true;
            end
            CML_Text("CML_CheckRoll ID: " .. i .. " - " .. CML_Vars.Rolls[i].name .. "(" .. CML_Vars.Rolls[i].roll .. ")");
            -- Debug
        end
    end
    return false;
end

function CML_SetRoll(player, roll)
    -- Insert the Player and Roll in the Rolls Table
    local TheRoll = { };
    TheRoll["name"] = player;
    TheRoll["roll"] = tonumber(roll);
    TheRoll["time"] = time();

    table.insert(CML_Vars.Rolls, TheRoll);
    table.sort(CML_Vars.Rolls, function(elem1, elem2) return elem1.roll > elem2.roll end);
end

function CML_GetGroupType()
    if (GetNumRaidMembers() > 0) then
        -- in Raid?
        return "RAID";
    else
        -- in Party?
        return "PARTY";
    end
end


-- -----
-- Bomb warnings.
--
-- a) The "_Text" variables contain text sent by the server. It must
--    match what the server sends, but it can be a regular expression.
--
-- b) The "_Name" variables contain the name of the bomb (descriptive).
--
-- c) The "_Mob" variables contain the name of the mob (descriptive).
--
-- d) The "_Big" variables contain text shown in large letters in the
--    warning box.  If it is too long it may not fit on the screen
--    depending on what the user's scaling is.
--
-- e) The "_Small" variables contain text shown in small letters in
--    the warning box.
--
-- f) The "_Player" variables contain a regular expression that includes
--    text sent by the server. The regular expression should be capable
--    of capturing the name of the player from the server text.
--
-- g) The "_Test" variables are similar to the "_Player" ones, except
--    that these are intended for use in string.format(). They are used
--    when I test the addon, and should create a text string equal to
--    what the server would send.
-- -----
EkBomb_TEXT_Bomb_Plague_Text = "你受到了瘟疫效果";
EkBomb_TEXT_Bomb_Plague_Name = "瘟疫";
EkBomb_TEXT_Bomb_Plague_Mob = "阿努比萨斯防御者";
EkBomb_TEXT_Bomb_Plague_Big = "快跑!";
EkBomb_TEXT_Bomb_Plague_Small = "你中了瘟疫!";

EkBomb_TEXT_Bomb_Living_Text = "你受到了活化炸弹效果";
EkBomb_TEXT_Bomb_Living_Name = "活化炸弹";
EkBomb_TEXT_Bomb_Living_Mob = "迦顿男爵";
EkBomb_TEXT_Bomb_Living_Big = "快跑!";
EkBomb_TEXT_Bomb_Living_Small = "你中了活化炸弹!";

EkBomb_TEXT_Bomb_Corrupt_Text = "Priests! If you're going to keep healing like that, we might as well make it a little more interesting!";
EkBomb_TEXT_Bomb_Corrupt_Name = "堕落治疗";
EkBomb_TEXT_Bomb_Corrupt_Mob = "奈法利安";
EkBomb_TEXT_Bomb_Corrupt_Big = "停止施法!";
EkBomb_TEXT_Bomb_Corrupt_Small = "点名牧师!堕落治疗!";

EkBomb_TEXT_Bomb_Adrenaline_Text = "你受到了燃烧刺激效果";
EkBomb_TEXT_Bomb_Adrenaline_Name = "燃烧刺激";
EkBomb_TEXT_Bomb_Adrenaline_Mob = "瓦拉斯塔兹";
EkBomb_TEXT_Bomb_Adrenaline_Big = "快跑!";
EkBomb_TEXT_Bomb_Adrenaline_Small = "你中了燃烧刺激!";

EkBomb_TEXT_Bomb_Mandokir_Player = "([^%s]+)! I'm watching you!$";
EkBomb_TEXT_Bomb_Mandokir_Test = "%s! I'm watching you!";
EkBomb_TEXT_Bomb_Mandokir_Name = "威慑凝视";
EkBomb_TEXT_Bomb_Mandokir_Mob = "血领主曼多基尔";
EkBomb_TEXT_Bomb_Mandokir_Big = "停止动作!";
EkBomb_TEXT_Bomb_Mandokir_Small = "你被凝视着!";

EkBomb_TEXT_Bomb_Mutating_Text = "你受到了变异注射效果";
EkBomb_TEXT_Bomb_Mutating_Name = "变异注射";
EkBomb_TEXT_Bomb_Mutating_Mob = "葛罗巴斯";
EkBomb_TEXT_Bomb_Mutating_Big = "快跑!";
EkBomb_TEXT_Bomb_Mutating_Small = "你中了变异注射!";

-- -----
-- Command line commands (use lowercase letters for the commands).
-- -----
EkBomb_TEXT_Command_Help = "help";
EkBomb_TEXT_Command_Reset = "reset";
EkBomb_TEXT_Command_Test = "test";


-- -----
-- Command line help.
-- -----
EkBomb_TEXT_Help_Config = "打开配置窗口.";
EkBomb_TEXT_Help_Help = "显示此命令摘要.";
EkBomb_TEXT_Help_Reset = "重置窗口位置.";
EkBomb_TEXT_Help_Test = "测试警告窗口.";


-- -----
-- Warning window
-- -----

-- Close button
EkBomb_TEXT_Warning_Close = "退出";
EkBomb_TEXT_Warning_Close_Tooltip1 = "退出";
EkBomb_TEXT_Warning_Close_Tooltip2 = "退出插件窗口.";


-- -----
-- Config window
-- -----

-- Title box
EkBomb_TEXT_Config_Drag_Tooltip = "左键拖动\n右键重置";

-- Opacity slider
EkBomb_TEXT_Config_Opacity = "窗口透明度";

-- Scale slider
EkBomb_TEXT_Config_Scale = "窗口的大小";

-- Colors
EkBomb_TEXT_Config_SmallColor = "小文本";
EkBomb_TEXT_Config_LargeColor = "大文本";
EkBomb_TEXT_Config_BackgroundColor = "背景";

-- Color selection window title.
EkBomb_TEXT_Config_SelectColor = "选择颜色";

-- Blink checkbox
EkBomb_TEXT_Config_Flash = "闪烁报警";
EkBomb_TEXT_Config_Flash_Tooltip1 = "闪烁报警";
EkBomb_TEXT_Config_Flash_Tooltip2 = "如果启用, 警告窗口将通过改变亮度周期性闪烁.";

-- Background checkbox
EkBomb_TEXT_Config_Background = "显示背景";
EkBomb_TEXT_Config_Background_Tooltip1 = "显示背景";
EkBomb_TEXT_Config_Background_Tooltip2 = "如果启用, 警告窗口的背景将可见. 如果禁用只是显示警告文字.";

-- Sound checkbox
EkBomb_TEXT_Config_Sound = "播放音效";
EkBomb_TEXT_Config_Sound_Tooltip1 = "播放音效";
EkBomb_TEXT_Config_Sound_Tooltip2 = "如果启用, 当警告窗口出现时将播放一个声音.";

-- Timer checkbox
EkBomb_TEXT_Config_ShowTimer = "显示计时";
EkBomb_TEXT_Config_ShowTimer_Tooltip1 = "显示计时";
EkBomb_TEXT_Config_ShowTimer_Tooltip2 = "如果启用, 警告窗口上的关闭按钮将显示剩余的秒数，直到警告窗口自动关闭为止.";

-- Enable checkbox
EkBomb_TEXT_Config_Enable = "启用警告";
EkBomb_TEXT_Config_Enable_Tooltip1 = "启用警告";
EkBomb_TEXT_Config_Enable_Tooltip2 = "这将启用/禁用警告窗口，而不会更改单个警告.";

-- Individual bomb checkboxes
EkBomb_TEXT_Config_Bomb_Tooltip1 = "启用这个单项警报";
EkBomb_TEXT_Config_Bomb_Tooltip2 = "选中此框以启用此炸弹警告.  清除此框以禁用它.";

-- Test button
EkBomb_TEXT_Config_Test = "测试";
EkBomb_TEXT_Config_Test_Tooltip1 = "测试";
EkBomb_TEXT_Config_Test_Tooltip2 = "测试下一个警告.";

-- Close button
EkBomb_TEXT_Config_Close = "关闭";
EkBomb_TEXT_Config_Close_Tooltip1 = "关闭";
EkBomb_TEXT_Config_Close_Tooltip2 = "关闭这个窗口.";

-- Help message
EkBomb_TEXT_Config_Help = "命令类型列表:";


-- -----
-- Text used in EkCheck window.
-- -----

-- Column headings
EkBomb_TEXT_EkCheck_Enabled = "Enabled";
EkBomb_TEXT_EkCheck_Warnings = "Warnings";
EkBomb_TEXT_EkCheck_Version = "Version";

-- Text shown on a player's line
EkBomb_TEXT_EkCheck_Yes = "Yes";
EkBomb_TEXT_EkCheck_No = "No";

-- Player tooltip
EkBomb_TEXT_EkCheck_Unknown = "未知";
EkBomb_TEXT_EkCheck_Enabled_Warnings = "启用警报";
EkBomb_TEXT_EkCheck_Disabled_Warnings = "禁用警报";


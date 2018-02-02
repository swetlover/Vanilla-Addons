-------------------------------------------------------------------------------------
-- Title: Mik's Scrolling Battle Text Options
-- Author: Mik
-- Maintainer: Athene
-------------------------------------------------------------------------------------

-- Create Options "namespace."
MikSBTOpt = {};


------------------------------
-- Interface messages
------------------------------

MikSBTOpt.MSG_INHERIT_TEXT					= "继承";
MikSBTOpt.MSG_NORMAL_PREVIEW_TEXT				= "正常";
MikSBTOpt.MSG_CRIT_PREVIEW_TEXT				= "暴击";
MikSBTOpt.MSG_CURRENT_PROFILE_TEXT				= "当前配置文件";
MikSBTOpt.MSG_SCROLL_AREA_PREVIEW_TEXT			= "预览信息";


MikSBTOpt.MSG_EVENT_MESSAGE_LABEL_TOOLTIP       = "单击此处编辑在事件发生时将显示什么输出消息.\n\n任何事件代码都将替换为实际数据."
MikSBTOpt.MSG_EVENT_MESSAGE_EDITBOX_TOOLTIP_PREFIX    = "可用的事件代码:\n\n";
MikSBTOpt.MSG_EVENT_COLOR_SWATCH_TOOLTIP        = "允许您选择事件的显示颜色.";
MikSBTOpt.MSG_EVENT_EDIT_FONT_SETTINGS_BUTTON_LABEL   = "编辑字体";
MikSBTOpt.MSG_EVENT_EDIT_FONT_SETTINGS_BUTTON_TOOLTIP   = "编辑事件的字体设置。 如果这些设置设置为继承，那么这些设置从滚动区域继承.";
MikSBTOpt.MSG_EVENT_STICKY_CHECKBOX_TOOLTIP     = "设置是否使用粘性样式显示此事件.";
MikSBTOpt.MSG_EVENT_EDIT_TRIGGER_BUTTON_LABEL     = "编辑触发器";
MikSBTOpt.MSG_EVENT_EDIT_TRIGGER_BUTTON_TOOLTIP     = "编辑事件的触发设置.";
MikSBTOpt.MSG_EVENT_SOUND_BUTTON_TOOLTIP        = "允许您在事件发生时选择要播放的声音.";
MikSBTOpt.MSG_TRIGGER_ENABLE_TOOLTIP        = "设置是否启用触发器."
MikSBTOpt.MSG_TRIGGER_MESSAGE_LABEL_TOOLTIP     = "单击此处可编辑在发生触发时将显示的输出消息."
MikSBTOpt.MSG_TRIGGER_MESSAGE_EDITBOX_TOOLTIP     = "输入要与触发器一起显示的输出消息.";
MikSBTOpt.MSG_TRIGGER_STICKY_CHECKBOX_TOOLTIP     = "设置是否使用粘性样式显示此触发器.";
MikSBTOpt.MSG_TRIGGER_EDIT_FONT_SETTINGS_BUTTON_LABEL   = "编辑字体";
MikSBTOpt.MSG_TRIGGER_EDIT_FONT_SETTINGS_BUTTON_TOOLTIP = "编辑触发器的字体设置.如果这些设置设置为继承，则这些设置从通知滚动区域继承.";
MikSBTOpt.MSG_TRIGGER_EDIT_TRIGGER_SETTINGS_BUTTON_LABEL  = "编辑触发器";
MikSBTOpt.MSG_TRIGGER_EDIT_TRIGGER_SETTINGS_BUTTON_TOOLTIP  = "编辑触发器的设置.";
MikSBTOpt.MSG_TRIGGER_DELETE_TRIGGER_BUTTON_TOOLTIP   = "删除触发器.";
MikSBTOpt.MSG_TRIGGER_APPLICABLE_CLASSES_LABEL      = "适用的触发类:";
MikSBTOpt.MSG_TRIGGER_NEW_TRIGGER_DEFAULT_MESSAGE   = "新触发器：单击此处编辑.";
MikSBTOpt.MSG_SUPPRESSION_ENABLE_TOOLTIP        = "设置是否启用抑制.";
MikSBTOpt.MSG_SUPPRESSION_DELETE_SUPPRESSION_BUTTON_TOOLTIP = "删除抑制.";
MikSBTOpt.MSG_SUPPRESSION_MESSAGE_LABEL_TOOLTIP     = "点击这里编辑要禁止的搜索模式."
MikSBTOpt.MSG_SUPPRESSION_MESSAGE_EDITBOX_TOOLTIP   = "输入要抑制的搜索模式.";
MikSBTOpt.MSG_SUPPRESSION_NEW_SUPPRESSION_DEFAULT_MESSAGE = "新抑制：点击这里编辑.";

-- Class Names.
MikSBTOpt.MSG_CLASS_NAME_DRUID  = "德鲁伊";
MikSBTOpt.MSG_CLASS_NAME_HUNTER = "猎人";
MikSBTOpt.MSG_CLASS_NAME_MAGE   = "法师";
MikSBTOpt.MSG_CLASS_NAME_PALADIN  = "圣骑士";
MikSBTOpt.MSG_CLASS_NAME_PRIEST = "牧师";
MikSBTOpt.MSG_CLASS_NAME_ROGUE  = "盗贼";
MikSBTOpt.MSG_CLASS_NAME_SHAMAN = "萨满祭司";
MikSBTOpt.MSG_CLASS_NAME_WARLOCK  = "术士";
MikSBTOpt.MSG_CLASS_NAME_WARRIOR  = "战士";


------------------------------
-- Interface objects info
------------------------------

MikSBTOpt.TABS = {
 [1] = { Label="一般", Tooltip="显示一般选项."},
 [2] = { Label="承受事件", Tooltip="显示承受区的选项."},
 [3] = { Label="施加事件", Tooltip="显示施加区的选项."},
 [4] = { Label="通知", Tooltip="显示通知区的选项."},
 [5] = { Label="触发器", Tooltip="显示触发系统的选项."},
 [6] = { Label="抑制", Tooltip="显示抑制系统的选项."},
};

MikSBTOpt.DROPDOWNS = {
 ["Tab1FrameProfileDropdown"] = { Label="简介", Tooltip="选择当前配置文件."},
 ["ScrollAreaDropdown"]   = { Label="滚动区", Tooltip="选择要配置的滚动区域."},
 ["TextAlignDropdown"]    = { Label="文本对齐", Tooltip="滚动区域的文本对齐."},
 ["AnimationStyleDropdown"] = { Label="动画样式", Tooltip="滚动区域的动画样式."},
 ["ScrollDirectionDropdown"]  = { Label="滚动方向", Tooltip="滚动区域的滚动方向."},
 ["FontDropdown"]     = { Label="正常字体"},
 ["FontOutlineDropdown"]  = { Label="正常字体轮廓"},
 ["FontCritDropdown"]   = { Label="暴击字体"},
 ["FontOutlineCritDropdown"]  = { Label="暴击字体轮廓"},
 ["TriggerTypeDropdown"]  = { Label="触发器类型", Tooltip="选择触发类型."},
 ["StanceDropdown"]       = { Label="所需的姿态", Tooltip="选择启用此触发器所需的姿态."},
};

MikSBTOpt.CHECKBOXES = {
 ["Tab1FrameDisableCheckbox"]     = { Label="禁用Mik的滚动战斗文本", Tooltip="设置是否禁用MSBT."},
 ["Tab1FrameShowPartialEffectsCheckbox"]  = { Label="显示部分效果", Tooltip="设置是否显示部分抵抗,吸收,招架,等等."},
 ["Tab1FrameShowAllManaGainsCheckbox"]  = { Label="显示所有法术收益", Tooltip="设置是否显示所有法力收益: mp5, drinking, etc. |cffff0000(spammy !)"},
 ["Tab1FrameLowHealthSoundCheckbox"]  = { Label="低生命值声音", Tooltip="设置在生命值过低是否播放声音."},
 ["Tab1FrameLowManaSoundCheckbox"]    = { Label="低法力值声音", Tooltip="设置在法力值过低是否播放声音."},
 ["Tab1FrameUseStickyCritsCheckbox"]  = { Label="显示暴击粘性样式", Tooltip="设置是否使用粘性样式显示暴击."},
 ["Tab1FrameShowOverhealsCheckbox"]   = { Label="显示过量", Tooltip="设置是否显示过量治疗信息."},
 ["Tab1FrameShowGameDamageCheckbox"]  = { Label="显示暴雪伤害", Tooltip="设置是否显示游戏的伤害 在敌人的头上."},
 ["Tab2FrameShowEventsCheckbox"]    = { Label="启用承受事件", Tooltip="设置是否启用承受事件."},
 ["Tab3FrameShowEventsCheckbox"]    = { Label="启用施加事件", Tooltip="设置是否启用施加事件."},
 ["Tab4FrameShowEventsCheckbox"]    = { Label="启用通知事件", Tooltip="设置是否启用通知事件."},
 ["InheritFontSizeCheckbox"]      = { Label="继承字体大小"},
 ["InheritFontSizeCritCheckbox"]    = { Label="继承暴击字体大小"},
};

MikSBTOpt.SLIDERS = {
 ["Tab1FrameAnimationStepSlider"] = { Label="动画速度", Tooltip="播放动画的速度."},
 ["ScrollHeightSlider"]     = { Label="滚动高度", Tooltip="滚动的高度."}, 
 ["FontSizeSlider"]     = { Label="字体大小"},
 ["FontSizeCritSlider"]     = { Label="暴击字体大小"},
 ["ThresholdSlider"]      = { Label="阈值百分比", Tooltip="设置阈值百分比必须通过触发器触发的."},
};

MikSBTOpt.BUTTONS = {
 ["Tab1FrameEditFontSettingsButton"]  = { Label="编辑主字体设置", Tooltip="编辑主字体设置.这些设置将被每个滚动区域及其中的事件继承，除非它们被覆盖."},
 ["Tab1FrameEditBlizzardFontSettingsButton"]  = { Label="编辑游戏伤害字体", Tooltip="编辑暴雪的滚动文字字体设置."},
 ["Tab2FrameEditFontSettingsButton"]  = { Label="编辑承受滚动区字体", Tooltip="编辑承受滚动区域字体设置.这些设置将由承受滚动区域中的每个事件继承，除非它们被覆盖."},
 ["Tab3FrameEditFontSettingsButton"]  = { Label="编辑施加滚动区字体", Tooltip="编辑施加滚动区域字体设置.这些设置将由施加滚动区域中的每个事件继承，除非它们被覆盖."},
 ["Tab4FrameEditFontSettingsButton"]  = { Label="编辑通知滚动区字体", Tooltip="编辑通知滚动区域字体设置.这些设置将由通知滚动区域中的每个事件继承，除非它们被覆盖."},
 ["Tab1FrameLoadProfileButton"]   = { Label="加载配置文件", Tooltip="加载所选配置文件."},
 ["Tab1FrameDeleteProfileButton"]   = { Label="删除配置文件", Tooltip="删除所选配置文件."},
 ["Tab1FrameResetProfileButton"]    = { Label="重置配置文件", Tooltip="将所选配置文件重置为默认设置."},
 ["Tab1FrameCreateProfileButton"]   = { Label="创建配置文件", Tooltip="使用默认设置创建新配置文件."},
 ["Tab2FrameConfigureScrollAreaButton"] = { Label="配置滚动区", Tooltip="允许您配置动画样式,滚动方向,文本对齐,滚动高度和滚动区域的位置."},
 ["PreviewButton"]        = { Label="预览", Tooltip="在所有滚动区域预览测试消息."},
 ["SaveButton"]         = { Label="保存设置", Tooltip="保存滚动区域的新设置."},
 ["CancelButton"]         = { Label="取消", Tooltip="取消更改."},
 ["Tab5FrameAddTriggerButton"]    = { Label="添加新触发器", Tooltip="添加可以配置的新触发器."},
 ["SaveTriggerButton"]        = { Label="保存设置", Tooltip="保存触发器的设置."},
 ["CancelTriggerButton"]      = { Label="取消", Tooltip="取消更改."},
 ["Tab6FrameAddSuppressionButton"]    = { Label="添加新抑制", Tooltip="添加新的抑制."},
};

MikSBTOpt.EDITBOXES = {
 ["Tab1FrameNewProfileNameEditbox"] = { Label="新配置文件名称", Tooltip="允许您输入新配置文件的名称."},
 ["XOffsetEditbox"]     = { Label="X坐标", Tooltip="允许您输入所选滚动框的X偏移."},
 ["YOffsetEditbox"]     = { Label="Y坐标", Tooltip="允许您输入所选滚动框的Y偏移."},
 ["IconNameEditbox"]      = { Label="图标路径", Tooltip="允许您输入要作为图标显示的文件的路径."},
 ["SearchPattern1Editbox"]    = { Label="搜索模式1", Tooltip="允许您输入将导致触发器触发的搜索模式."},
 ["SearchPattern2Editbox"]    = { Label="搜索模式2", Tooltip="允许您输入将导致触发器触发的搜索模式."},
};

MikSBTOpt.FRAMES = {
 ["MSBTScrollAreaMoverIncomingFrame"] = { Tooltip="指示承受滚动区域的锚定列.将此框拖动到所需位置，或使用控制框x和y偏移编辑框."},
 ["MSBTScrollAreaMoverOutgoingFrame"] = { Tooltip="指示施加滚动区域的锚定列.将此框拖动到所需位置，或使用控制框x和y偏移编辑框."},
 ["MSBTScrollAreaMoverNotificationFrame"] = { Tooltip="指示通知滚动区域的锚定列.将此框拖动到所需位置，或使用控制框x和y偏移编辑框."},
}

MikSBTOpt.FONT_SETTINGS_TOOLTIPS = {
 ["Master"] = {
  FontSettingsTitle="Master",
  Font="设置非暴击的主字体.这将被每个滚动区域及其事件继承.",
  FontCrit="设置暴击的主字体.这将被每个滚动区域及其事件继承.",
  Outline="设置非暴击的主字体轮廓.这将被每个滚动区域及其事件继承.",
  OutlineCrit="设置暴击的主字体轮廓.这将被每个滚动区域及其事件继承.",
  FontSize="设置非暴击的主字体大小.这将被每个滚动区域及其事件继承.",
  FontSizeCrit="设置暴击的主字体大小.这将被每个滚动区域及其事件继承.",
 },
 ["ScrollArea"] = {
  Font="设置非暴击的滚动区域字体.这将被滚动区域中的每个事件继承.",
  FontCrit="设置暴击的滚动区域字体.这将被滚动区域中的每个事件继承.",
  Outline="设置非暴击的滚动区域字体轮廓.这将被滚动区域中的每个事件继承.",
  OutlineCrit="设置暴击的滚动区域字体轮廓.这将被滚动区域中的每个事件继承.",
  InheritFontSize="设置是否从主字体设置继承非暴击的字体大小.",
  InheritFontSizeCrit="设置是否从主字体设置继承暴击的字体大小.",
  FontSize="设置非暴击的滚动区域字体大小.这将被滚动区域中的每个事件继承.",
  FontSizeCrit="设置暴击的滚动区域字体大小.这将被滚动区域中的每个事件继承.",
 },
 ["Event"] = {
  Font="设置非暴击的事件字体.",
  FontCrit="设置暴击的事件字体.",
  Outline="设置非暴击的事件字体轮廓.",
  OutlineCrit="设置暴击的事件字体轮廓.",
  InheritFontSize="设置是否从滚动区域字体设置继承非暴击的字体大小.",
  InheritFontSizeCrit="设置是否从滚动区域字体设置继承暴击的字体大小.",
  FontSize="设置非暴击的事件字体大小.",
  FontSizeCrit="设置暴击的事件字体大小.",
 },
 ["Trigger"] = {
  Font="设置触发器字体.",
  Outline="设置触发字体轮廓.",
  InheritFontSize="设置是否从通知滚动区域字体设置继承字体大小.",
  FontSize="设置触发字体大小.",
 },
 ["Blizzard"] = {
  FontSettingsTitle="暴雪",
  Font="设置暴雪默认滚动文本字体.",
 }
}

MikSBTOpt.INCOMING_EVENTS = {
 [1]  = { Label="近战伤害", Tooltips={ShowCheckbox="设置是否显示承受近战伤害.", Editbox="%a - 损失的伤害数值.\n%n - 攻击者名字."}},
 [2]  = { Label="近战未命中", Tooltips={ShowCheckbox="设置是否显示承受近战未命中.", Editbox="%n - 攻击者名字."}},
 [3]  = { Label="近战闪避", Tooltips={ShowCheckbox="设置是否显示承受近战闪避.", Editbox="%n - 攻击者名字."}},
 [4]  = { Label="近战招架", Tooltips={ShowCheckbox="设置是否显示承受近战招架.", Editbox="%n - 攻击者名字."}},
 [5]  = { Label="近战格挡", Tooltips={ShowCheckbox="设置是否显示承受近战格挡.", Editbox="%n - 攻击者名字."}},
 [6]  = { Label="近战吸收", Tooltips={ShowCheckbox="设置是否显示吸收承受近战伤害.", Editbox="%n - 攻击者名字."}},
 [7]  = { Label="近战免疫", Tooltips={ShowCheckbox="设置是否显示承受近战伤害你免疫.", Editbox="%n - 攻击者名字."}},
 [8]  = { Label="能力/技能伤害", Tooltips={ShowCheckbox="设置是否显示承受能力/技能伤害.", Editbox="%a - 损失的伤害数值.\n%n - 攻击者名字.\n%s - 法术或技能名字.\n%t - 损失伤害的类型."}},
 [9]  = { Label="能力/技能DoTs", Tooltips={ShowCheckbox="设置是否显示承受能力/技能DoTs.", Editbox="%a - 损失的伤害数值.\n%n - 攻击者名字.\n%s - 法术或技能名字.\n%t - 损失伤害的类型."}},
 [10] = { Label="技能未命中", Tooltips={ShowCheckbox="设置是否显示承受技能未命中.", Editbox="%n - 攻击者名字.\n%s - 技能的名字."}},
 [11] = { Label="技能闪避", Tooltips={ShowCheckbox="设置是否显示承受技能闪避.", Editbox="%n - 攻击者名字.\n%s - 技能的名字."}},
 [12] = { Label="技能招架", Tooltips={ShowCheckbox="设置是否显示承受技能招架.", Editbox="%n - 攻击者名字.\n%s - 技能的名字."}},
 [13] = { Label="技能格挡", Tooltips={ShowCheckbox="设置是否显示承受技能格挡.", Editbox="%n - 攻击者名字.\n%s - 技能的名字."}},
 [14] = { Label="技能抵抗", Tooltips={ShowCheckbox="设置是否显示承受技能抵抗.", Editbox="%n - 攻击者名字.\n%s - 法术的名字."}},
 [15] = { Label="能力/法术吸收", Tooltips={ShowCheckbox="设置是否显示吸收承受能力/法术伤害.", Editbox="%n - 攻击者名字.\n%s - 法术或技能名字."}},
 [16] = { Label="能力/法术免疫", Tooltips={ShowCheckbox="设置是否显示承受能力/法术免疫.", Editbox="%n - 攻击者名字.\n%s - 法术或技能名字."}},
 [17] = { Label="能力/法术体现", Tooltips={ShowCheckbox="设置是否显示承受能力/法术体现.", Editbox="%n - 攻击者名字.\n%s - 法术或技能名字."}},
 [18] = { Label="治疗", Tooltips={ShowCheckbox="设置是否显示承受治疗.", Editbox="%a - 承受治疗的数值.\n%n - 治疗者的名字.\n%s - 法术的名字."}},
 [19] = { Label="缓慢治疗", Tooltips={ShowCheckbox="设置是否显示承受缓慢治疗.", Editbox="%a - 承受治疗的数值.\n%n - 治疗者的名字.\n%s - 法术的名字."}},
 [20] = { Label="环境的伤害", Tooltips={ShowCheckbox="设置是否显示环境的(下落，溺水，熔岩等...)伤害 .", Editbox="%a - 损失的伤害数值.\n%s - 伤害来源的名字 (坠落, 溺水, 熔岩, 等等...)"}},
 [21] = { Label="宠物近战伤害", Tooltips={ShowCheckbox="设置是否显示承受对你的宠物造成近战伤害.", Editbox="%a - 损失的伤害数值.\n%n - 攻击者名字."}},
 [22] = { Label="宠物近战未命中", Tooltips={ShowCheckbox="设置是否显示承受对你的宠物造成近战未命中.", Editbox="%n - 攻击者名字."}},
 [23] = { Label="宠物近战闪避", Tooltips={ShowCheckbox="设置是否显示承受对你的宠物造成近战闪避.", Editbox="%n - 攻击者名字."}},
 [24] = { Label="宠物近战招架", Tooltips={ShowCheckbox="设置是否显示承受对你的宠物造成近战招架.", Editbox="%n - 攻击者名字."}},
 [25] = { Label="宠物近战格挡", Tooltips={ShowCheckbox="设置是否显示承受对你的宠物造成格挡.", Editbox="%n - 攻击者名字."}},
 [26] = { Label="宠物近战吸收", Tooltips={ShowCheckbox="设置是否显示吸收对你宠物造成的近战伤害.", Editbox="%n - 攻击者名字."}},
 [27] = { Label="宠物近战免疫", Tooltips={ShowCheckbox="设置是否显示免疫对你宠物造成的近战伤害.", Editbox="%n - 攻击者名字."}},
 [28] = { Label="宠物能力/技能伤害", Tooltips={ShowCheckbox="设置是否显示对你宠物造成伤害的能力/技能.", Editbox="%a - 损失的伤害数值.\n%n - 攻击者名字.\n%s - 法术或技能名字.\n%t - 损失伤害的类型."}},
 [29] = { Label="宠物能力/技能DoTs", Tooltips={ShowCheckbox="设置是否显示对你宠物造成伤害的能力/技能dot.", Editbox="%a - 损失的伤害数值.\n%n - 攻击者名字.\n%s - 法术或技能名字.\n%t - 损失伤害的类型."}},
 [30] = { Label="宠物技能未命中", Tooltips={ShowCheckbox="设置是否显示对你宠物造成伤害的技能未命中.", Editbox="%n - 攻击者名字.\n%s - 技能的名字."}},
 [31] = { Label="宠物技能闪避", Tooltips={ShowCheckbox="设置是否显示对你宠物造成伤害的技能闪避.", Editbox="%n - 攻击者名字.\n%s - 技能的名字."}},
 [32] = { Label="宠物技能招架", Tooltips={ShowCheckbox="设置是否显示对你宠物造成伤害的技能招架.", Editbox="%n - 攻击者名字.\n%s - 技能的名字."}},
 [33] = { Label="宠物技能格挡", Tooltips={ShowCheckbox="设置是否显示对你宠物造成伤害的技能格挡.", Editbox="%n - 攻击者名字.\n%s - 技能的名字."}},
 [34] = { Label="宠物技能抵抗", Tooltips={ShowCheckbox="设置是否显示对你宠物造成伤害的技能抵抗.", Editbox="%n - 攻击者名字.\n%s - 法术的名字."}},
 [35] = { Label="宠物能力/法术吸收", Tooltips={ShowCheckbox="设置是否显示吸收对你宠物造成伤害的能力/技能.", Editbox="%n - 攻击者名字.\n%s - 法术或技能名字."}},
 [36] = { Label="宠物能力/法术免疫", Tooltips={ShowCheckbox="设置是否显示免疫对你宠物造成伤害的能力/技能.", Editbox="%n - 攻击者名字.\n%s - 法术或技能名字."}},
 [37] = { Label="宠物治疗", Tooltips={ShowCheckbox="设置是否显示承受对你宠物的治疗.", Editbox="%a - 承受治疗的数值.\n%n - 治疗者的名字.\n%s - 法术的名字."}},
 [38] = { Label="宠物缓慢治疗", Tooltips={ShowCheckbox="设置是否显示承受对你宠物的缓慢治疗.", Editbox="%a - 承受治疗的数值.\n%n - 治疗者的名字.\n%s - 法术的名字."}},
};

MikSBTOpt.OUTGOING_EVENTS = {
 [1]  = { Label="近战伤害", Tooltips={ShowCheckbox="设置是否显示施加近战的伤害.", Editbox="%a - 伤害数值.\n%n - 被攻击单位的名字."}},
 [2]  = { Label="近战未命中", Tooltips={ShowCheckbox="设置是否显示施加近战的未命中.", Editbox="%n - 被攻击单位的名字."}},
 [3]  = { Label="近战闪避", Tooltips={ShowCheckbox="设置是否显示施加近战被闪避.", Editbox="%n - 被攻击单位的名字."}},
 [4]  = { Label="近战招架", Tooltips={ShowCheckbox="设置是否显示施加近战被招架.", Editbox="%n - 被攻击单位的名字."}},
 [5]  = { Label="近战格挡", Tooltips={ShowCheckbox="设置是否显示施加近战被格挡.", Editbox="%n - 被攻击单位的名字."}},
 [6]  = { Label="近战吸收", Tooltips={ShowCheckbox="设置是否显示施加近战被吸收.", Editbox="%n - 被攻击单位的名字."}},
 [7]  = { Label="近战免疫", Tooltips={ShowCheckbox="设置是否显示施加近战被免疫.", Editbox="%n - 被攻击单位的名字."}},
 [8]  = { Label="近战闪避", Tooltips={ShowCheckbox="设置是否显示施加近战被躲避.", Editbox="%n - 被攻击单位的名字."}},
 [9]  = { Label="能力/技能伤害", Tooltips={ShowCheckbox="设置是否显示施加能力/技能伤害.", Editbox="%a - 伤害数值.\n%n - 被攻击单位的名字.\n%s - 法术或技能名字.\n%t - 伤害类型."}},
 [10] = { Label="能力/技能DoTs", Tooltips={ShowCheckbox="设置是否显示施加能力/技能DoTs.", Editbox="%a - 伤害数值.\n%n - 被攻击单位的名字.\n%s - 法术或技能名字.\n%t - 伤害类型."}},
 [11] = { Label="技能未命中", Tooltips={ShowCheckbox="设置是否显示施加技能未命中.", Editbox="%n - 被攻击单位的名字.\n%s - 技能的名字."}},
 [12] = { Label="技能闪避", Tooltips={ShowCheckbox="设置是否显示施加技能被闪避.", Editbox="%n - 被攻击单位的名字.\n%s - 技能的名字."}},
 [13] = { Label="技能招架", Tooltips={ShowCheckbox="设置是否显示施加技能被招架.", Editbox="%n - 被攻击单位的名字.\n%s - 技能的名字."}},
 [14] = { Label="技能格挡", Tooltips={ShowCheckbox="设置是否显示施加技能被格挡.", Editbox="%n - 被攻击单位的名字.\n%s - 技能的名字."}},
 [15] = { Label="技能抵抗", Tooltips={ShowCheckbox="设置是否显示施加技能被抵抗.", Editbox="%n - 被攻击单位的名字.\n%s - 法术的名字."}},
 [16] = { Label="能力/法术吸收", Tooltips={ShowCheckbox="设置是否显示施加能力/法术被吸收.", Editbox="%n - 被攻击单位的名字.\n%s - 法术或技能名字."}},
 [17] = { Label="能力/法术免疫", Tooltips={ShowCheckbox="设置是否显示施加能力/法术被免疫.", Editbox="%n - 被攻击单位的名字.\n%s - 法术或技能名字."}},
 [18] = { Label="能力/法术体现", Tooltips={ShowCheckbox="设置是否显示施加能力/法术被体现.", Editbox="%n - 被攻击单位的名字.\n%s - 法术或技能名字."}},
 [19] = { Label="能力/法术躲避", Tooltips={ShowCheckbox="设置是否显示施加能力/法术被躲避.", Editbox="%n - 被攻击单位的名字.\n%s - 法术或技能名字."}},
 [20] = { Label="治疗", Tooltips={ShowCheckbox="设置是否显示施加的治疗.", Editbox="%a - 治疗数值.\n%n - 被治疗单位的名字.\n%s - 法术的名字."}},
 [21] = { Label="缓慢治疗", Tooltips={ShowCheckbox="设置是否显示施加的缓慢治疗.", Editbox="%a - 治疗数值.\n%n - 被治疗单位的名字.\n%s - 法术的名字."}},
 [22] = { Label="宠物近战伤害", Tooltips={ShowCheckbox="设置是否显示你的宠物施加近战伤害.", Editbox="%a - 伤害数值.\n%n - 被攻击单位的名字."}},
 [23] = { Label="宠物近战未命中", Tooltips={ShowCheckbox="设置是否显示你的宠物施加近战未命中.", Editbox="%n - 被攻击单位的名字."}},
 [24] = { Label="宠物近战闪避", Tooltips={ShowCheckbox="设置是否显示你的宠物施加宠物近战被闪避.", Editbox="%n - 被攻击单位的名字."}},
 [25] = { Label="宠物近战招架", Tooltips={ShowCheckbox="设置是否显示你的宠物施加近战被招架.", Editbox="%n - 被攻击单位的名字."}},
 [26] = { Label="宠物近战格挡", Tooltips={ShowCheckbox="设置是否显示你的宠物施加近战被格挡.", Editbox="%n - 被攻击单位的名字."}},
 [27] = { Label="宠物近战吸收", Tooltips={ShowCheckbox="设置是否显示你的宠物施加近战被吸收.", Editbox="%n - 被攻击单位的名字."}},
 [28] = { Label="宠物近战免疫", Tooltips={ShowCheckbox="设置是否显示你的宠物施加近战被免疫.", Editbox="%n - 被攻击单位的名字."}},
 [29] = { Label="宠物近战躲避", Tooltips={ShowCheckbox="设置是否显示你的宠物施加近战被躲避.", Editbox="%n - 被攻击单位的名字."}},
 [30] = { Label="宠物能力/技能伤害", Tooltips={ShowCheckbox="设置是否显示你的宠物施加能力/技能伤害.", Editbox="%a - 伤害数值.\n%n - 被攻击单位的名字.\n%s - 法术或技能名字.\n%t - 伤害类型."}},
 [31] = { Label="宠物技能未命中", Tooltips={ShowCheckbox="设置是否显示你的宠物施加技能未命中.", Editbox="%n - 被攻击单位的名字.\n%s - 技能的名字."}},
 [32] = { Label="宠物技能闪避", Tooltips={ShowCheckbox="设置是否显示你的宠物施加技能被闪避.", Editbox="%n - 被攻击单位的名字.\n%s - 技能的名字."}},
 [33] = { Label="宠物技能招架", Tooltips={ShowCheckbox="设置是否显示你的宠物施加技能被招架.", Editbox="%n - 被攻击单位的名字.\n%s - 技能的名字."}},
 [34] = { Label="宠物技能格挡", Tooltips={ShowCheckbox="设置是否显示你的宠物施加技能被格挡.", Editbox="%n - 被攻击单位的名字.\n%s - 技能的名字."}},
 [35] = { Label="宠物法术抵抗", Tooltips={ShowCheckbox="设置是否显示你的宠物施加技能被抵抗.", Editbox="%n - 被攻击单位的名字.\n%s - 法术的名字."}},
 [36] = { Label="宠物能力/法术吸收", Tooltips={ShowCheckbox="设置是否显示你的宠物施加能力/法术被吸收.", Editbox="%n - 被攻击单位的名字.\n%s - 法术或技能名字."}},
 [37] = { Label="宠物能力/法术免疫", Tooltips={ShowCheckbox="设置是否显示你的宠物施加能力/法术被免疫.", Editbox="%n - 被攻击单位的名字.\n%s - 法术或技能名字."}},
 [38] = { Label="宠物能力/法术躲闪", Tooltips={ShowCheckbox="设置是否显示你的宠物施加能力/法术被躲闪.", Editbox="%n - 被攻击单位的名字.\n%s - 法术或技能名字."}},
};

MikSBTOpt.NOTIFICATION_EVENTS = {
 [1]  = { Label="Debuffs", Tooltips={ShowCheckbox="设置是否显示你获得的DeBuffs.", Editbox="%s - Debuff的名字."}},
 [2]  = { Label="Buffs", Tooltips={ShowCheckbox="设置是否显示你获得的Buffs.", Editbox="%s - Buff的名字."}},
 [3]  = { Label="物品Buffs", Tooltips={ShowCheckbox="设置是否显示你获得的物品Buffs.", Editbox="%s - 物品buff名字."}},
 [4]  = { Label="Buff消失", Tooltips={ShowCheckbox="设置是否显示Buffs从你身上消失.", Editbox="%s - Buff/Debuff的名字."}},
 [5]  = { Label="进入战斗", Tooltips={ShowCheckbox="设置是否显示你进入战斗状态.", Editbox="无."}},
 [6]  = { Label="脱离战斗", Tooltips={ShowCheckbox="设置是否显示你退出战斗状态.", Editbox="无."}},
 [7]  = { Label="力量增益", Tooltips={ShowCheckbox="设置是否显示当你获得额外法力, 怒气,能量.", Editbox="%a - 能量获得量.\n%s - 能量获得类型 (能量, 怒气, 法力值)."}},
 [8]  = { Label="力量削弱", Tooltips={ShowCheckbox="设置是否显示当你失去额外法力, 怒气,能量.", Editbox="%a - 能量失去量.\n%s - 能量失去类型 (能量, 怒气, 法力值)."}},
 [9]  = { Label="连击点获得", Tooltips={ShowCheckbox="设置是否显示获得连击点数.", Editbox="%a - 你有多少连击点数值."}},
 [10] = { Label="连击点满!", Tooltips={ShowCheckbox="设置是否显示获得全部连击点数.", Editbox="%a - 你有多少连击点数值."}},
 [11] = { Label="荣誉收益", Tooltips={ShowCheckbox="设置是否显示您何时获得荣誉.", Editbox="%a - 你获得多少荣誉数值."}},
 [12] = { Label="声望收益", Tooltips={ShowCheckbox="设置是否显示您何时获得声望.", Editbox="%a - 你获得多少声望数值.\n%s - 阵营名字."}},
 [13] = { Label="声誉损失", Tooltips={ShowCheckbox="设置是否显示您何时失去声望.", Editbox="%a - 你失去多少声望数值.\n%s - 阵营名字."}},
 [14] = { Label="技能增益", Tooltips={ShowCheckbox="设置是否显示您何时获得技能点.", Editbox="%a - 你有多少技能点数值.\n%s - 技能名字."}},
 [15] = { Label="经验收益", Tooltips={ShowCheckbox="设置是否显示何时获得经验点.", Editbox="%a - 你获得多少经验值数值."}},
 [16] = { Label="玩家杀戮", Tooltips={ShowCheckbox="设置是否显示何时对敌方玩家造成致命打击.", Editbox="%s - 击杀单位名字."}},
 [17] = { Label="NPC杀戮", Tooltips={ShowCheckbox="设置是否显示你对NPC造成的打击.", Editbox="%s - 击杀单位名字."}},
};
local F, C, L = unpack(select(2, ...))

if GetLocale() ~= "zhCN" then return end

----------------------------------------------------------------------------------------
--Localization for zhCN client
--Translation: Webskyer
----------------------------------------------------------------------------------------
--/scrpit/globals.lua

ITEM_LEVEL = "|cff00ffff物品等级: %d|r"
ITEM_LEVEL_ALT = "|cff00ffff物品等级: %d (%d)|r"

ITEM_BIND_ON_EQUIP = "装备绑定"
ITEM_BIND_ON_PICKUP = "拾取绑定"
ITEM_BIND_ON_USE = "使用后绑定"
ITEM_CLASSES_ALLOWED = "职业: %s"
ITEM_CONJURED = "召唤"
ITEM_CREATED_BY = "" -- No creator name
ITEM_MOD_ARMOR_PENETRATION_RATING = "护甲穿透等级 +%s"
ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT = "护甲穿透"
ITEM_MOD_ATTACK_POWER = "攻强 +%s"
ITEM_MOD_BLOCK_RATING = "格档率 +%s"
ITEM_MOD_BLOCK_VALUE = "格档值 +%s"
ITEM_MOD_BLOCK_VALUE_SHORT = "格档值"
ITEM_MOD_CRIT_MELEE_RATING = "暴击 (近战) +%s"
ITEM_MOD_CRIT_MELEE_RATING_SHORT = "暴击 (近战)"
ITEM_MOD_CRIT_RANGED_RATING = "暴击 (远程) +%s"
ITEM_MOD_CRIT_RANGED_RATING_SHORT = "暴击 (远程)"
ITEM_MOD_CRIT_RATING = "暴击 +%s"
ITEM_MOD_CRIT_RATING_SHORT = "暴击"
ITEM_MOD_CRIT_SPELL_RATING = "暴击 (法术) +%s"
ITEM_MOD_CRIT_SPELL_RATING_SHORT = "暴击 (法术)"
ITEM_MOD_DAMAGE_PER_SECOND_SHORT = "秒伤"
ITEM_MOD_DEFENSE_SKILL_RATING = "防御率 +%s"
ITEM_MOD_DEFENSE_SKILL_RATING_SHORT = "防御等级"
ITEM_MOD_DODGE_RATING = "躲闪 +%s"
ITEM_MOD_EXPERTISE_RATING = "熟练度 +%s"
ITEM_MOD_FERAL_ATTACK_POWER = "野性 攻强 +%s"
ITEM_MOD_FERAL_ATTACK_POWER_SHORT = "野性 攻强"
ITEM_MOD_HASTE_MELEE_RATING = "急速 (近战) +%s"
ITEM_MOD_HASTE_RANGED_RATING = "急速 (远程) +%s"
ITEM_MOD_HASTE_RATING = "急速 +%s"
ITEM_MOD_HASTE_SPELL_RATING = "急速 (法术) +%s"
ITEM_MOD_HEALTH_REGEN = "%d 回血"
ITEM_MOD_HEALTH_REGEN_SHORT = "回血"
ITEM_MOD_HEALTH_REGENERATION = "%d 回血"
ITEM_MOD_HEALTH_REGENERATION_SHORT = "回血"
ITEM_MOD_HIT_MELEE_RATING = "命中 (近战) +%s"
ITEM_MOD_HIT_RANGED_RATING = "命中 (远程) +%s"
ITEM_MOD_HIT_RATING = "命中 +%s"
ITEM_MOD_HIT_SPELL_RATING = "命中 (法术) +%s"
ITEM_MOD_HIT_TAKEN_RATING = "减伤 +%s"
ITEM_MOD_HIT_TAKEN_RATING_SHORT = "减伤"
ITEM_MOD_HIT_TAKEN_SPELL_RATING = "法术 减伤 +%s"
ITEM_MOD_HIT_TAKEN_SPELL_RATING_SHORT = "减伤 (法术)"
ITEM_MOD_HIT_TAKEN_MELEE_RATING = "近战 减伤 +%s"
ITEM_MOD_HIT_TAKEN_MELEE_RATING_SHORT = "减伤 (近战)"
ITEM_MOD_HIT_TAKEN_RANGED_RATING = "远程 减伤 +%s"
ITEM_MOD_HIT_TAKEN_RANGED_RATING_SHORT = "减伤 (远程)"
ITEM_MOD_MANA_REGENERATION = "+%d 回血"
ITEM_MOD_MANA_REGENERATION_SHORT = "回血"
ITEM_MOD_MASTERY_RATING = "精通 +%s"
ITEM_MOD_MELEE_ATTACK_POWER_SHORT = "攻强 (近战)"
ITEM_MOD_PARRY_RATING = "格档 +%s"
ITEM_MOD_RANGED_ATTACK_POWER = "攻强 (远程) +%s"
ITEM_MOD_RANGED_ATTACK_POWER_SHORT = "攻强 (远程)"
ITEM_MOD_RESILIENCE_RATING = "恢复率 +%s"
ITEM_MOD_RESILIENCE_RATING_SHORT = "恢复"
ITEM_MOD_SPELL_DAMAGE_DONE = "法术 伤害 +%s"
ITEM_MOD_SPELL_HEALING_DONE = "治疗 +%s"
ITEM_MOD_SPELL_POWER = "法术 强度 +%s"
ITEM_MOD_SPELL_PENETRATION = "法术 穿透 +%s"
ITEM_OPENABLE = "可打开!"
ITEM_RANDOM_ENCHANT = "随机 附魔"
ITEM_RESIST_SINGLE = "抵抗: %c%d %s"
ITEM_SIGNABLE = "可签名!"
ITEM_SOCKETABLE = "可镶嵌" -- No gem info line
ITEM_SOCKET_BONUS = "奖励: %s"
ITEM_SOLD_COLON = "已售:"
ITEM_SPELL_CHARGES = "%d 手续费"
ITEM_SPELL_TRIGGER_ONPROC = "已拍卖:"
ITEM_STARTS_QUEST = "开始任务"
ITEM_WRONG_CLASS = "错误类别!"
ITEM_UNSELLABLE = "禁售"
SELL_PRICE = "价格"

ARMOR_TEMPLATE = "防御: %s"
DAMAGE_TEMPLATE = "伤害: %s - %s"
DPS_TEMPLATE = "%s 秒伤"
DURABILITY_TEMPLATE = "耐久度: %d/%d"
SHIELD_BLOCK_TEMPLATE = "格档值: %d"

EMPTY_SOCKET_RED = "红色"
EMPTY_SOCKET_YELLOW = "黄色"
EMPTY_SOCKET_BLUE = "蓝色"
EMPTY_SOCKET_META = "meta"
EMPTY_SOCKET_NO_COLOR = "棱彩"

--[[ Loot mods ]]

LOOT_ITEM = "%s + %s"
LOOT_ITEM_BONUS_ROLL = "%s + %s (bonus)"
LOOT_ITEM_BONUS_ROLL_MULTIPLE = "%s + %sx%d (bonus)"
LOOT_ITEM_BONUS_ROLL_SELF = "+ %s (bonus)"
LOOT_ITEM_BONUS_ROLL_SELF_MULTIPLE = "+ %sx%d (bonus)"
LOOT_ITEM_MULTIPLE = "%s + % sx%d"
LOOT_ITEM_PUSHED = "%s + %s"
LOOT_ITEM_PUSHED_MULTIPLE = "%s + %sx%d"
LOOT_ITEM_SELF = "+ %s"
LOOT_ITEM_SELF_MULTIPLE = "+ %s x%d"
LOOT_ITEM_PUSHED_SELF = "+ %s"
LOOT_ITEM_PUSHED_SELF_MULTIPLE = "+ %s x%d"
LOOT_MONEY = "|cff00a956+|r |cffffffff%s"
YOU_LOOT_MONEY = "|cff00a956+|r |cffffffff%s"
LOOT_MONEY_SPLIT = "|cff00a956+|r |cffffffff%s"
LOOT_ROLL_ALL_PASSED = "|H战利品历史记录:%d|h[Loot]|h: 全放弃 %s"
LOOT_ROLL_PASSED_AUTO = "%s 放弃 %s (自动)"
LOOT_ROLL_PASSED_AUTO_FEMALE = "%s 放弃 %s (自动)"
LOOT_ROLL_PASSED_SELF = "|H战利品历史记录:%d|h[Loot]|h: 放弃 %s"
LOOT_ROLL_PASSED_SELF_AUTO = "|H战利品历史记录:%d|h[Loot]|h: 放弃 %s (自动)"

COPPER_AMOUNT = "%d\124TInterface\\MoneyFrame\\UI-CopperIcon:0:0:2:0\124t"
SILVER_AMOUNT = "%d\124TInterface\\MoneyFrame\\UI-SilverIcon:0:0:2:0\124t"
GOLD_AMOUNT = "%d\124TInterface\\MoneyFrame\\UI-GoldIcon:0:0:2:0\124t"

-- [[ Item quality colours ]]

-- Add quality colour for Poor items
LE_ITEM_QUALITY_COMMON = -1
BAG_ITEM_QUALITY_COLORS[LE_ITEM_QUALITY_POOR] = { r = 0.61, g = 0.61, b = 0.61}
-- Change Common from grey to black
BAG_ITEM_QUALITY_COLORS[LE_ITEM_QUALITY_COMMON] = { r = 0, g = 0, b = 0}
BAG_ITEM_QUALITY_COLORS[1] = { r = 0, g = 0, b = 0}

--[[ Chat mods ]]

ACHIEVEMENT_BROADCAST = "%s 完成 %s!"
BN_INLINE_TOAST_FRIEND_OFFLINE = "\124TInterface\\FriendsFrame\\UI-Toast-ToastIcons.tga:16:16:0:0:128:64:2:29:34:61\124t%s |cffff0000下线了|r."
BN_INLINE_TOAST_FRIEND_ONLINE = "\124TInterface\\FriendsFrame\\UI-Toast-ToastIcons.tga:16:16:0:0:128:64:2:29:34:61\124t%s |cff00ff00上线了|r."
CHAT_BN_WHISPER_GET = "(密语)来自 %s:\32"
CHAT_BN_WHISPER_INFORM_GET = "(密语)说 %s:\32"
CHAT_FLAG_AFK = "[暂离] "
CHAT_FLAG_DND = "[忽扰] "
CHAT_YOU_CHANGED_NOTICE = "|H频道:%d|h[%s]|h"
ERR_FRIEND_OFFLINE_S = "%s |cffff0000下线了|r."
ERR_FRIEND_ONLINE_SS = "|H玩家:%s|h[%s]|h |cff00ff00上线了|r."
ERR_SKILL_UP_SI = "|cffffffff%s|r |cff00adf0%d|r"
FACTION_STANDING_DECREASED = "%s -%d"
FACTION_STANDING_INCREASED = "%s +%d"
FACTION_STANDING_INCREASED_ACH_BONUS = "%s +%d (+%.1f)"
FACTION_STANDING_INCREASED_ACH_PART = "(+%.1f)"
FACTION_STANDING_INCREASED_BONUS = "%s + %d (+%.1f RAF)"
FACTION_STANDING_INCREASED_DOUBLE_BONUS = "%s +%d (+%.1f RAF) (+%.1f)"
FACTION_STANDING_INCREASED_REFER_PART = "(+%.1f RAF)"
FACTION_STANDING_INCREASED_REST_PART = "(+%.1f Rested)"

--[[ Text colours ]]

NORMAL_QUEST_DISPLAY = "|cffffffff%s|r"
TRIVIAL_QUEST_DISPLAY = "|cffffffff%s (低级别)|r"

-- [[ Misc ]]

ERR_AUCTION_SOLD_S = "|cff1eff00%s|r |cffffffff卖.|r"

-- [[scrpit/automation.lua]]
-- scrpit/automation.lua 168 176

L_UNDRESS = "一键换装"
L_AUTO_REPAIR = "修理费: %.1fg (公会)"
L_AUTO_REPAIR_NO = "你的公会不让你使用公会修理."
L_AUTO_REPAIR_1 = "修理费: %.1fg"
L_AUTO_REPAIRS = "修理"
L_AUTO_REPAIRS_YOU = "你没有足够的修理费."
L_AUTO_REPAIRS_GUILD = "公会修理失败. 手动修复,或者自费修理."

--[[ Bank ]] 
-- scrpit/bag.lua 228

L_BUY_NEW_SLOT = "购买新的银行包栏: 点击这里."

--[[ Stats_bar ]] 
-- scrpit/stats.lua 37

L_STATS_FPS = "|r fps   |cffffffff"
L_STATS_MS = "|r ms   |cffffffff"
L_STATS_ADDONS = "插件内存占用" --68
L_STATS_SHOW = "点击 |cffffffff显示时钟." --78

--[[ Mail ]] 
-- scrpit/mail.lua 37

L_MAIL_ITEM = "%d 金, %d 件 物品"

--[[ Minimap ]] 
-- scrpit/minimap.lua 45

L_MINIMAP_MAIL = "\124TInterface\\CURSOR\\CURSORICONSNEW.tga:10:15:0:0:128:256:33:63:38:59\124t邮件"
L_MINIMAP_N = "普通" --232
L_MINIMAP_H = "英雄" --234

--[[ Nameplate ]] 
-- scrpit/nameplates.lua 156

L_NAMEPLATE_B = "首领"

--[[ Tooltip ]] 
-- scrpit/tooltip.lua 217

L_TOOLTIP_MSP = "MSP"
L_TOOLTIP_TYOU = "T: > 你 <" --204

--[[ Unitframes ]] 
-- scrpit/unitframes.lua 190

L_UNITFRAME_OFF = "离线"
L_UNITFRAME_DEAD = "死亡" --192
L_UNITFRAME_GHOST = "幽灵" --194
L_UNITFRAME_PVP = "PVP开启"
L_UNITFRAME_COMBAT = "战斗中" --1138
L_UNITFRAME_RESTING = "休息中" --1141
L_UNITFRAME_YOU = "> 你 <" --1217
L_UNITFRAME_QUEST = "进行中" --1297
L_UNITFRAME_LEADER = "\124TInterface\\GROUPFRAME\\UI-Group-LeaderIcon.tga:16:16:0:0:16:16:0:16:0:16\124t"	--1578
L_UNITFRAME_MASTERLOOTER = "\124TInterface\\GROUPFRAME\\UI-Group-MasterLooter.tga:16:16:0:0:16:16:0:16:0:16\124t"	--1578

--[[ Expbar ]] 
-- scrpit/expbar.lua 133

L_EXPBAR_EXP = "经验:"
L_EXPBAR_CUR = "目前: " --134
L_EXPBAR_REMA = "剩余: " --135 146
L_EXPBAR_REST = "精力充沛: " --137
L_EXPBAR_REPU = "阵营:"	--143
L_EXPBAR_STAN = "声望级别:"	--144
L_EXPBAR_REP = "声望:" --145

--[[ Menubar ]] 
-- scrpit/menubar.lua 193

L_MENUBAR_MICRO_MENU = "微菜单"
L_MENUBAR_CHAT_MENU = "聊天 " --201
L_MENUBAR_DBM_MENU = "切换 DBM" --228
L_MENUBAR_DBM_DISABLED = "FreeUI: |cffffffffDBM 已禁用. Type|r /rl |cfffffffff 重载界面.|r" --232
L_MENUBAR_DBM_ENABLED = "FreeUI: |cffffffffDBM 已启用. Type|r /rl |cffffffff 重载界面.|r" --236
L_MENUBAR_TSM_MENU = "切换 TSM" --228
L_MENUBAR_TSM_DISABLED = "FreeUI: |cffffffffTradeSkillMaster 已禁用. Type|r /rl |cfffffffff 重载界面.|r" --232
L_MENUBAR_TSM_ENABLED = "FreeUI: |cffffffffTradeSkillMaster 已启用. Type|r /rl |cffffffff 重载界面.|r" --236

--[[ Events ]] 
-- scrpit/events.lua 54

L_EVENTS_MAIL = "邮件"
L_EVENTS_MAIL_NEW = "你有新的邮件."

--[[ Slash ]] 
-- scrpit/slash.lua 65

L_SLASH_SELECT = "|cffffffff/freeui|r [dps/healer]|cffffffff: 选择用户界面|r"
L_SLASH_INSTALL = "|cffffffff/freeui|r 安装|cffffffff: 载入安装界面|r" --67
L_SLASH_RESET = "|cffffffff/freeui|r 重置|cffffffff: 清除保存的设置|r" --68

--[[ Rarealert ]] 
-- scrpit/rarealert.lua 17

L_RARE_RARE = "发现 稀有精英!"

--[[ Reset UI Layout ]] 
-- oUF/oUF_MovableFrames.lua 1019

L_POPUP_RESETUI = "你要重置FreeUI界面位置?"
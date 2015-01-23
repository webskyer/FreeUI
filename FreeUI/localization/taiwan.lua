local F, C, L = unpack(select(2, ...))

if GetLocale() ~= "zhTW" then return end

----------------------------------------------------------------------------------------
--Localization for zhTW client
--Translation: Webskyer
----------------------------------------------------------------------------------------
--/scrpit/globals.lua

ITEM_LEVEL = "|cff00ffff物品等級: %d|r"
ITEM_LEVEL_ALT = "|cff00ffff物品等級: %d (%d)|r"

ITEM_BIND_ON_EQUIP = "裝備綁定"
ITEM_BIND_ON_PICKUP = "拾取綁定"
ITEM_BIND_ON_USE = "使用後綁定"
ITEM_CLASSES_ALLOWED = "職業: %s"
ITEM_CONJURED = "召喚"
ITEM_CREATED_BY = "" -- No creator name
ITEM_MOD_ARMOR_PENETRATION_RATING = "護罩穿透等級 +%s"
ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT = "護罩穿透"
ITEM_MOD_ATTACK_POWER = "攻強 +%s"
ITEM_MOD_BLOCK_RATING = "格檔率 +%s"
ITEM_MOD_BLOCK_VALUE = "格檔值 +%s"
ITEM_MOD_BLOCK_VALUE_SHORT = "格檔值"
ITEM_MOD_CRIT_MELEE_RATING = "暴击 (近戰) +%s"
ITEM_MOD_CRIT_MELEE_RATING_SHORT = "暴击 (近戰)"
ITEM_MOD_CRIT_RANGED_RATING = "暴击 (遠程) +%s"
ITEM_MOD_CRIT_RANGED_RATING_SHORT = "暴击 (遠程)"
ITEM_MOD_CRIT_RATING = "暴击 +%s"
ITEM_MOD_CRIT_RATING_SHORT = "暴击"
ITEM_MOD_CRIT_SPELL_RATING = "暴击 (法術) +%s"
ITEM_MOD_CRIT_SPELL_RATING_SHORT = "暴击 (法術)"
ITEM_MOD_DAMAGE_PER_SECOND_SHORT = "秒傷"
ITEM_MOD_DEFENSE_SKILL_RATING = "防御率 +%s"
ITEM_MOD_DEFENSE_SKILL_RATING_SHORT = "防御等級"
ITEM_MOD_DODGE_RATING = "躲閃 +%s"
ITEM_MOD_EXPERTISE_RATING = "熟練度 +%s"
ITEM_MOD_FERAL_ATTACK_POWER = "野性 攻強 +%s"
ITEM_MOD_FERAL_ATTACK_POWER_SHORT = "野性 攻強"
ITEM_MOD_HASTE_MELEE_RATING = "急速 (近戰) +%s"
ITEM_MOD_HASTE_RANGED_RATING = "急速 (遠程) +%s"
ITEM_MOD_HASTE_RATING = "急速 +%s"
ITEM_MOD_HASTE_SPELL_RATING = "急速 (法術) +%s"
ITEM_MOD_HEALTH_REGEN = "%d 回血"
ITEM_MOD_HEALTH_REGEN_SHORT = "回血"
ITEM_MOD_HEALTH_REGENERATION = "%d 回血"
ITEM_MOD_HEALTH_REGENERATION_SHORT = "回血"
ITEM_MOD_HIT_MELEE_RATING = "命中 (近戰) +%s"
ITEM_MOD_HIT_RANGED_RATING = "命中 (遠程) +%s"
ITEM_MOD_HIT_RATING = "命中 +%s"
ITEM_MOD_HIT_SPELL_RATING = "命中 (法術) +%s"
ITEM_MOD_HIT_TAKEN_RATING = "减傷 +%s"
ITEM_MOD_HIT_TAKEN_RATING_SHORT = "减傷"
ITEM_MOD_HIT_TAKEN_SPELL_RATING = "法術 减傷 +%s"
ITEM_MOD_HIT_TAKEN_SPELL_RATING_SHORT = "减傷 (法術)"
ITEM_MOD_HIT_TAKEN_MELEE_RATING = "近戰 减傷 +%s"
ITEM_MOD_HIT_TAKEN_MELEE_RATING_SHORT = "减傷 (近戰)"
ITEM_MOD_HIT_TAKEN_RANGED_RATING = "遠程 减傷 +%s"
ITEM_MOD_HIT_TAKEN_RANGED_RATING_SHORT = "减傷 (遠程)"
ITEM_MOD_MANA_REGENERATION = "+%d 回血"
ITEM_MOD_MANA_REGENERATION_SHORT = "回血"
ITEM_MOD_MASTERY_RATING = "精通 +%s"
ITEM_MOD_MELEE_ATTACK_POWER_SHORT = "攻強 (近戰)"
ITEM_MOD_PARRY_RATING = "格檔 +%s"
ITEM_MOD_RANGED_ATTACK_POWER = "攻強 (遠程) +%s"
ITEM_MOD_RANGED_ATTACK_POWER_SHORT = "攻強 (遠程)"
ITEM_MOD_RESILIENCE_RATING = "恢復率 +%s"
ITEM_MOD_RESILIENCE_RATING_SHORT = "恢復"
ITEM_MOD_SPELL_DAMAGE_DONE = "法術 傷害 +%s"
ITEM_MOD_SPELL_HEALING_DONE = "治療 +%s"
ITEM_MOD_SPELL_POWER = "法術 强度 +%s"
ITEM_MOD_SPELL_PENETRATION = "法術 穿透 +%s"
ITEM_OPENABLE = "可打開!"
ITEM_RANDOM_ENCHANT = "隨機 附魔"
ITEM_RESIST_SINGLE = "抵抗: %c%d %s"
ITEM_SIGNABLE = "可簽名!"
ITEM_SOCKETABLE = "可镶嵌" -- No gem info line
ITEM_SOCKET_BONUS = "獎勵: %s"
ITEM_SOLD_COLON = "已售:"
ITEM_SPELL_CHARGES = "%d 手續費"
ITEM_SPELL_TRIGGER_ONPROC = "已拍賣:"
ITEM_STARTS_QUEST = "開始任务"
ITEM_WRONG_CLASS = "錯誤類別!"
ITEM_UNSELLABLE = "禁售"
SELL_PRICE = "價格"

ARMOR_TEMPLATE = "防禦: %s"
DAMAGE_TEMPLATE = "傷害: %s - %s"
DPS_TEMPLATE = "%s 秒傷"
DURABILITY_TEMPLATE = "耐久度: %d/%d"
SHIELD_BLOCK_TEMPLATE = "格檔值: %d"

EMPTY_SOCKET_RED = "紅色"
EMPTY_SOCKET_YELLOW = "黃色"
EMPTY_SOCKET_BLUE = "藍色"
EMPTY_SOCKET_META = "meta"
EMPTY_SOCKET_NO_COLOR = "棱綵"

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
LOOT_ROLL_ALL_PASSED = "|H戰利品歷史記錄:%d|h[Loot]|h: 全放棄 %s"
LOOT_ROLL_PASSED_AUTO = "%s 放棄 %s (自動)"
LOOT_ROLL_PASSED_AUTO_FEMALE = "%s 放棄 %s (自動)"
LOOT_ROLL_PASSED_SELF = "|H戰利品歷史記錄:%d|h[Loot]|h: 放棄 %s"
LOOT_ROLL_PASSED_SELF_AUTO = "|H戰利品歷史記錄:%d|h[Loot]|h: 放棄 %s (自動)"

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
CHAT_BN_WHISPER_GET = "(密語)來自 %s:\32"
CHAT_BN_WHISPER_INFORM_GET = "(密语)說 %s:\32"
CHAT_FLAG_AFK = "[暫離] "
CHAT_FLAG_DND = "[忽擾] "
CHAT_YOU_CHANGED_NOTICE = "|H頻道:%d|h[%s]|h"
ERR_FRIEND_OFFLINE_S = "%s |cffff0000下線了|r."
ERR_FRIEND_ONLINE_SS = "|H玩家:%s|h[%s]|h |cff00ff00上線了|r."
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
TRIVIAL_QUEST_DISPLAY = "|cffffffff%s (低級別)|r"

-- [[ Misc ]]

ERR_AUCTION_SOLD_S = "|cff1eff00%s|r |cffffffff賣.|r"

-- [[scrpit/automation.lua]]
-- scrpit/automation.lua 168 176

L_UNDRESS = "一鍵換裝"

--[[ Bank ]] 
-- scrpit/bag.lua 228

L_BUY_NEW_SLOT = "购买新的銀行包欄: 點擊這裡."

--[[ Stats_bar ]] 
-- scrpit/stats.lua 37

L_STATS_FPS = "|r 幀   |cffffffff"
L_STATS_MS = "|r 毫秒   |cffffffff"
L_STATS_ADDONS = "插件內存占用" --68
L_STATS_SHOW = "點擊 |cffffffff顯示時鐘." --78

--[[ Mail ]] 
-- scrpit/mail.lua 37

L_MAIL_ITEM = "%d 金, %d 件 物品"

--[[ Minimap ]] 
-- scrpit/minimap.lua 45

L_MINIMAP_MAIL = "郵件"

--[[ Nameplate ]] 
-- scrpit/nameplates.lua 156

L_NAMEPLATE_B = "首領"

--[[ Tooltip ]] 
-- scrpit/tooltip.lua 217

L_TOOLTIP_MSP = "MSP"

--[[ Unitframes ]] 
-- scrpit/unitframes.lua 190

L_UNITFRAME_OFF = "離線"
L_UNITFRAME_DEAD = "死亡" --192
L_UNITFRAME_GHOST = "幽靈" --194
L_UNITFRAME_PVP = "PVP開啟" --696
L_UNITFRAME_COMBAT = "戰鬥中" --1138
L_UNITFRAME_RESTING = "休息中" --1141
L_UNITFRAME_YOU = "> 自己 <" --1217
L_UNITFRAME_QUEST = "進行中" --1297
L_UNITFRAME_LEADER = "指揮"	--1578

--[[ Expbar ]] 
-- scrpit/expbar.lua 133

L_EXPBAR_EXP = "經驗:"
L_EXPBAR_CUR = "目前: " --134
L_EXPBAR_REMA = "剩余: " --135 146
L_EXPBAR_REST = "精力充沛: " --137
L_EXPBAR_REPU = "陣營:"	--143
L_EXPBAR_STAN = "聲望級別:"	--144
L_EXPBAR_REP = "聲望:" --145

--[[ Menubar ]] 
-- scrpit/menubar.lua 193

L_MENUBAR_MICRO_MENU = "微菜單"
L_MENUBAR_CHAT_MENU = "聊天 " --201
L_MENUBAR_DBM_MENU = "切換 DBM" --228
L_MENUBAR_DBM_DISABLED = "FreeUI: |cffffffffDBM 已禁用. Type|r /rl |cfffffffff 重載界面.|r" --232
L_MENUBAR_DBM_ENABLED = "FreeUI: |cffffffffDBM 已啟用. Type|r /rl |cfffffffffor 重載界面.|r" --236

--[[ Events ]] 
-- scrpit/events.lua 54

L_EVENTS_MAIL = "郵件"
L_EVENTS_MAIL_NEW = "你有新的郵件."

--[[ Slash ]] 
-- scrpit/slash.lua 65

L_SLASH_SELECT = "|cffffffff/freeui|r [dps/healer]|cffffffff: 選擇用戶界面|r"
L_SLASH_INSTALL = "|cffffffff/freeui|r 安裝|cffffffff: 載入安裝界面|r" --67
L_SLASH_RESET = "|cffffffff/freeui|r 重置|cffffffff: 清除保存的設置|r" --68
local F, C, L = unpack(select(2, ...))

if GetLocale() ~= "zhTW" then return end

----------------------------------------------------------------------------------------
--Localization for zhTW client
--Translation: Webskyer
----------------------------------------------------------------------------------------
--install.lua

L_INSTALL_SUCCESS = "安裝成功!"
L_INSTALL_COMPLETE = "安裝完成.\n\n請點擊 '安裝完畢' 按鈕,重載界面.\n\n謝謝使用!"
L_INSTALL_FINISH = "安裝完畢"
L_INSTALL_STEP4 = "第 4/4 步"

L_INSTALL_DBM = "3. DBM 首領報警插件"
L_INSTALL_DBM_TEXT = "第三步 應用DBM設置.\n\n這是推薦給任何用戶.\n\n如果妳想應用這些設置,勿必保證DBM插件正在運行."
L_INSTALL_STEP3 = "第 3/4 步"

L_INSTALL_CHAT = "2. 聊天"
L_INSTALL_CHAT_TEXT = "第二步 聊天設置.\n\n如果妳是壹個新用戶,推薦設置此項. 如果妳是老用戶,妳可以跳過這壹步.\n\n請註意,任何自定義聊天頻道都要通過遊戲內聊天設置命令來重新啟用."
L_INSTALL_STEP2 = "第 2/4 步"

L_INSTALL_CORE = "1. FreeUI設置"
L_INSTALL_CORE_TEXT = "這壹步將正確設置 FreeUI插件.\n\n第壹步是基本設置.\n\n這是推薦給任何用戶, 除非妳想只適用於壹個特定的設置.\n\n點擊 '繼續' 應用設置, 或者 點擊 '跳過' 跳過這步設置."
L_INSTALL_STEP1 = "第 1/4 步"
L_INSTALL_SKIP = "跳過"
L_INSTALL_CONTINUE = "繼續"

L_INSTALL_FINISHED = "6. 教程結束"
L_INSTALL_FINISHED_TEXT = "教程到此結束. 妳可在任何時候輸入 |cff00c1ff/freeui install|r.\n\n我建議妳看看通過安裝界面選項定制來滿足妳的要求, 或者使用默認設置馬上開始.\n\n妳現在可以繼續安裝插件."
L_INSTALL_STEP_6 = "第 6/6 步"
L_INSTALL_CLOSE = "關閉"
L_INSTALL_INSTALL = "安裝插件"

L_INSTALL_COMMEND = "5. 命令行"
L_INSTALL_COMMEND_TEXT = "最後, FreeUI 包含壹些有用的命令. 列表如下.\n\n|cff00c1ff/freeui|r FreeUI界面設置 (妳現在可能最想試試這個). |cff00c1ff/en|r and |cff00c1ff/dis|r 用於快速啟用或者禁用插件. |cff00c1ff/rl|r 重載用戶界面.\n\n|cff00c1ff/rc|r 初始化檢查. |cff00c1ff/rolepoll|r or |cff00c1ff/rolecheck|r 初始化角色配置.\n\n|cff00c1ff/gm|r 和GM聊天,打開幫助界面. |cff00c1ff/vol|r 充許妳設置主音量 (0-1)."
L_INSTALL_STEP_5 = "第 5/6 步"

L_INSTALL_FEATURE2 = "4. 插件特點 (2)"
L_INSTALL_FEATURE2_TEXT = "通過在背包界面裏,把鼠標移動到錢上,妳可以查看其它角色有多少錢.\n\n復制聊天框文本,shift+鼠標單擊 第壹個聊天選項卡,聊天框將顯示可移動的光標.\n\n右擊迷妳地圖,改變迷妳地圖追蹤設置.\n\n如果妳有未讀的新郵件,迷妳地圖將顯示  '郵件'.\n\n點擊屏幕底部中間的信息條,將顯示計時器.\n\n通過郵件界面底部的按鈕,可以壹鍵收取物品,金錢.\n\n其余未盡事宜,盡請提問."
L_INSTALL_STEP_4 = "第 4/6 步"

L_INSTALL_FEATURE = "3. 插件特點"
L_INSTALL_FEATURE_TEXT = "有幾個小工具妳可能感興趣.例如,有兩種方式監視Buff; 內嵌的buff tracker,監視Buff;自身Buff提醒,如果戰鬥中缺少Buff會有圖標提示.\n\n妳可以使用任何的文本文件修改工具修改FreeUI目錄下的buff trackers設置文件. 例子已給. Self-buffs 也能設置, 所以沒有後顧之憂.\n\n妳可以使用alt+shift-單擊目標,從下拉菜單選擇壹個圖標,快速標記目標.\n\n移動鼠標到屏幕底部的狀態條上,可以使用微菜單,聊天, 切換 DBM."
L_INSTALL_STEP_3 = "第 3/6 步"

L_INSTALL_UNIT = "2. 單元框架"
L_INSTALL_UNIT_TEXT = "FreeUI包含修改版的oUF.處理所有屏幕上存在的單元框架,增益Buff和減益DeBuff,職業專用元素比如聖能層數監視.\n\n如何妳玩治療,妳希望啟用治療單元框架. Type |cff00c1ff/freeui dps/heal(er)|r 切換界面顯示.\n\n源碼在 FreeUI/scripts/unitframes.lua.如果妳對lua有了解.妳可以自己編輯.\n\n大多數的設置都可以通過遊戲界面設置改變,更加容易使用."
L_INSTALL_STEP_2 = "第 2/6 步"

L_INSTALL_ESSE = "1. 概述"
L_INSTALL_ESSE_TEXT = "好!首先關於這個UI有些重要內容妳要知道.\n\n對於初學者,妳可以通過點擊遊戲界面FreeUI按鈕修改設置,或者輸入 |cff00c1ff/freeui|r.\n\n妳可能更想妳的背包.它非常簡單.\n\n妳的背包都合並在壹個窗口裏.移動光標略高於背包或者銀行窗口的頂部,將顯示包裹窗口,通過單擊任何壹個包裹圖標,妳還可以排序,設置用途.\n\n搜索物品,單擊底部的搜索框.妳可以搜索名稱或者位置;例如 '飾品'將高亮名字中包含'飾品'文字的,以及所有的飾品.\n\n背包整理,點擊右下角的圖標."
L_INSTALL_STEP_1 = "第 1/6 步"

L_INSTALL_HELLO = "歡迎"
L_INSTALL_HELLO_TEXT = "感謝妳選擇使用 FreeUI 插件!\n\稍後,就可能開始使用了. 所有壹切都要正確的設置.別擔心,個人喜好將不會改變.\n\n妳也可以看壹下簡短的教程了解FreeUI的壹些特點,推薦新手觀看.\n\n點擊'教程' 查看教程,或者點擊'安裝'直接安裝."
L_INSTALL_HELLO_TUTO = "教程"
L_INSTALL_HELLO_INST = "安裝"
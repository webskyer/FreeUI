local F, C, L = unpack(select(2, ...))

if GetLocale() ~= "zhCN" then return end

----------------------------------------------------------------------------------------
--Localization for zhCN client
--Translation: Webskyer
----------------------------------------------------------------------------------------
--install.lua

L_INSTALL_SUCCESS = "安装成功!"
L_INSTALL_COMPLETE = "安装完成.\n\n请点击 '安装完毕' 按钮,重载界面.\n\n谢谢使用!"
L_INSTALL_FINISH = "安装完毕"
L_INSTALL_STEP4 = "第 4/4 步"

L_INSTALL_DBM = "3. DBM 首领报警插件"
L_INSTALL_DBM_TEXT = "第三步 应用DBM设置.\n\n这是推荐给任何用户.\n\n如果你想应用这些设置,勿必保证DBM插件正在运行."
L_INSTALL_STEP3 = "第 3/4 步"

L_INSTALL_CHAT = "2. 聊天"
L_INSTALL_CHAT_TEXT = "第二步 聊天设置.\n\n如果你是一个新用户,推荐设置此项. 如果你是老用户,你可以跳过这一步.\n\n请注意,任何自定义聊天频道都要通过游戏内聊天设置命令来重新启用."
L_INSTALL_STEP2 = "第 2/4 步"

L_INSTALL_CORE = "1. FreeUI设置"
L_INSTALL_CORE_TEXT = "这一步将正确设置 FreeUI插件.\n\n第一步是基本设置.\n\n这是推荐给任何用户, 除非你想只适用于一个特定的设置.\n\n点击 '继续' 应用设置, 或者 点击 '跳过' 跳过这步设置."
L_INSTALL_STEP1 = "第 1/4 步"
L_INSTALL_SKIP = "跳过"
L_INSTALL_CONTINUE = "继续"

L_INSTALL_FINISHED = "6. 教程结束"
L_INSTALL_FINISHED_TEXT = "教程到此结束. 你可在任何时候输入 |cff00c1ff/freeui install|r.\n\n我建议你看看通过安装界面选项定制来满足你的要求, 或者使用默认设置马上开始.\n\n你现在可以继续安装插件."
L_INSTALL_STEP_6 = "第 6/6 步"
L_INSTALL_CLOSE = "关闭"
L_INSTALL_INSTALL = "安装插件"

L_INSTALL_COMMEND = "5. 命令行"
L_INSTALL_COMMEND_TEXT = "最后, FreeUI 包含一些有用的命令. 列表如下.\n\n|cff00c1ff/freeui|r FreeUI界面设置 (你现在可能最想试试这个). |cff00c1ff/en|r and |cff00c1ff/dis|r 用于快速启用或者禁用插件. |cff00c1ff/rl|r 重载用户界面.\n\n|cff00c1ff/rc|r 初始化检查. |cff00c1ff/rolepoll|r or |cff00c1ff/rolecheck|r 初始化角色配置.\n\n|cff00c1ff/gm|r 和GM聊天,打开帮助界面. |cff00c1ff/vol|r 充许你设置主音量 (0-1)."
L_INSTALL_STEP_5 = "第 5/6 步"

L_INSTALL_FEATURE2 = "4. 插件特点 (2)"
L_INSTALL_FEATURE2_TEXT = "通过在背包界面里,把鼠标移动到钱上,你可以查看其它角色有多少钱.\n\n复制聊天框文本,shift+鼠标单击 第一个聊天选项卡,聊天框将显示可移动的光标.\n\n右击迷你地图,改变迷你地图追踪设置.\n\n如果你有未读的新邮件,迷你地图将显示  '邮件'.\n\n点击屏幕底部中间的信息条,将显示计时器.\n\n通过邮件界面底部的按钮,可以一键收取物品,金钱.\n\n其余未尽事宜,尽请提问."
L_INSTALL_STEP_4 = "第 4/6 步"

L_INSTALL_FEATURE = "3. 插件特点"
L_INSTALL_FEATURE_TEXT = "有几个小工具你可能感兴趣.例如,有两种方式监视Buff; 内嵌的buff tracker,监视Buff;自身Buff提醒,如果战斗中缺少Buff会有图标提示.\n\n你可以使用任何的文本文件修改工具修改FreeUI目录下的buff trackers设置文件. 例子已给. Self-buffs 也能设置, 所以没有后顾之忧.\n\n你可以使用alt+shift-单击目标,从下拉菜单选择一个图标,快速标记目标.\n\n移动鼠标到屏幕底部的状态条上,可以使用微菜单,聊天, 切换 DBM."
L_INSTALL_STEP_3 = "第 3/6 步"

L_INSTALL_UNIT = "2. 单元框架"
L_INSTALL_UNIT_TEXT = "FreeUI包含修改版的oUF.处理所有屏幕上存在的单元框架,增益Buff和减益DeBuff,职业专用元素比如圣能层数监视.\n\n如何你玩治疗,你希望启用治疗单元框架. Type |cff00c1ff/freeui dps/heal(er)|r 切换界面显示.\n\n源码在 FreeUI/scripts/unitframes.lua.如果你对lua有了解.你可以自己编辑.\n\n大多数的设置都可以通过游戏界面设置改变,更加容易使用."
L_INSTALL_STEP_2 = "第 2/6 步"

L_INSTALL_ESSE = "1. 概述"
L_INSTALL_ESSE_TEXT = "好!首先关于这个UI有些重要内容你要知道.\n\n对于初学者,你可以通过点击游戏界面FreeUI按钮修改设置,或者输入 |cff00c1ff/freeui|r.\n\n你可能更想你的背包.它非常简单.\n\n你的背包都合并在一个窗口里.移动光标略高于背包或者银行窗口的顶部,将显示包裹窗口,通过单击任何一个包裹图标,你还可以排序,设置用途.\n\n搜索物品,单击底部的搜索框.你可以搜索名称或者位置;例如 '饰品'将高亮名字中包含'饰品'文字的,以及所有的饰品.\n\n背包整理,点击右下角的图标."
L_INSTALL_STEP_1 = "第 1/6 步"

L_INSTALL_HELLO = "欢迎"
L_INSTALL_HELLO_TEXT = "感谢你选择使用 FreeUI 插件!\n\稍后,就可能开始使用了. 所有一切都要正确的设置.别担心,个人喜好将不会改变.\n\n你也可以看一下简短的教程了解FreeUI的一些特点,推荐新手观看.\n\n点击'教程' 查看教程,或者点击'安装'直接安装."
L_INSTALL_HELLO_TUTO = "教程"
L_INSTALL_HELLO_INST = "安装"
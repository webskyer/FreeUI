local F, C, L = unpack(select(2, ...))

if GetLocale() ~= "enUS" and GetLocale() ~= "enGB" then return end

----------------------------------------------------------------------------------------
--Localization for enUS and enGB client
----------------------------------------------------------------------------------------
--install.lua

L_INSTALL_SUCCESS = "Success!"
L_INSTALL_COMPLETE = "Installation is complete.\n\nPlease click the 'Finish' button to reload the UI.\n\nEnjoy!"
L_INSTALL_FINISH = "Finish"
L_INSTALL_STEP4 = "4/4"

L_INSTALL_DBM = "3. DBM"
L_INSTALL_DBM_TEXT = "The third and final step applies the DBM settings.\n\nThis step is recommended for any user.\n\nMake sure that DBM is running if you want to apply these settings."
L_INSTALL_STEP3 = "3/4"

L_INSTALL_CHAT = "2. Chat"
L_INSTALL_CHAT_TEXT = "The second step applies the correct chat setup.\n\nIf you are a new user, this step is recommended. If you are an existing user, you may want to skip this step.\n\nPlease be aware that any custom chat channels will need to be re-enabled through the in-game chat settings."
L_INSTALL_STEP2 = "2/4"

L_INSTALL_CORE = "1. Core"
L_INSTALL_CORE_TEXT = "These steps will apply the correct setup for FreeUI.\n\nThe first step applies the essential settings.\n\nThis is recommended for any user, unless you want to apply only a specific part of the settings.\n\nClick 'Continue' to apply the settings, or click 'Skip' if you wish to skip this step."
L_INSTALL_STEP1 = "1/4"
L_INSTALL_SKIP = "Skip"
L_INSTALL_CONTINUE = "Continue"

L_INSTALL_FINISHED = "6. Finished"
L_INSTALL_FINISHED_TEXT = "The tutorial is complete. You can choose to reconsult it at any time by typing |cff00c1ff/freeui install|r.\n\nI suggest you have a look through the options to customize the UI to your needs, or get started straight away if you like the default settings.\n\nYou can now continue to install the UI."
L_INSTALL_STEP_6 = "6/6"
L_INSTALL_CLOSE = "Close"
L_INSTALL_INSTALL = "Install"

L_INSTALL_COMMEND = "5. /Commands"
L_INSTALL_COMMEND_TEXT = "Lastly, FreeUI includes useful slash commands. Below is a list.\n\n|cff00c1ff/freeui|r brings up a list of UI-specific commands (you might want to try this now). |cff00c1ff/en|r and |cff00c1ff/dis|r are used to quickly enable and disable addons. |cff00c1ff/rl|r reloads the UI.\n\n|cff00c1ff/rc|r initiates a ready check. |cff00c1ff/rolepoll|r or |cff00c1ff/rolecheck|r initiates a role check.\n\n|cff00c1ff/gm|r toggles the Help frame. |cff00c1ff/vol|r lets you set the master volume (0-1)."
L_INSTALL_STEP_5 = "5/6"

L_INSTALL_FEATURE2 = "4. Features (2)"
L_INSTALL_FEATURE2_TEXT = "You can see how much money your other characters have by moving your mouse over the money display on the bag frame.\n\nTo copy text from the chat frame, shift-click the first chat tab, which will show when moving the cursor over the chat frame.\n\nTo change minimap tracking options, right-click the minimap.\n\nThe minimap will display a text saying 'Mail' if you have unread mail.\n\nTo show the time manager and stopwatch, click the info text in the middle of the panel at the bottom of the screen.\n\nTo collect mail money and items easily, click the button at the bottom of your inbox.\n\nThe rest should explain itself. If you have any questions, you can always ask."
L_INSTALL_STEP_4 = "4/6"

L_INSTALL_FEATURE = "3. Features"
L_INSTALL_FEATURE_TEXT = "There are a couple of small tools in this UI you might be interested in as well. For example, there are two ways to track buffs; an embedded buff tracker, to monitor buffs; and a self-buff reminder, which will display an icon if the buff is missing while in combat.\n\nYou can set up these buff trackers in the options file in the FreeUI folder, which can be edited with any text editor. Examples are included. Self-buffs are already set up, so no worries.\n\nYou can mark players and NPCs by alt+shift-clicking them in the game world and selecting an icon from the dropdown menu.\n\nMoving the cursor to the bottom of the screen reveals a panel with buttons for toggling the micro menu, chat menu, and DBM."
L_INSTALL_STEP_3 = "3/6"

L_INSTALL_UNIT = "2. Unit frames"
L_INSTALL_UNIT_TEXT = "FreeUI includes an embedded version of oUF. This handles all of the unit frames on the screen, the buffs and debuffs, and the class-specific elements like Holy Power.\n\nIf you play as a healer, you may want to enable healer unit frames. Type |cff00c1ff/freeui dps/heal(er)|r to switch between layouts.\n\nThe source code for the unit frames is located in FreeUI/scripts/unitframes.lua. If you're any good with lua, you can edit them there.\n\nMost of the basics can be changed from the in-game options, to make it easier."
L_INSTALL_STEP_2 = "2/6"

L_INSTALL_ESSE = "1. Essentials"
L_INSTALL_ESSE_TEXT = "Good! First, here are a few things that are important to know about this UI.\n\nFor starters, you can access the options for this UI by clicking the FreeUI button from the game menu, or by typing |cff00c1ff/freeui|r.\n\nYou might want to know about the bags as well. It's pretty simple.\n\nYour bags are merged into an all-in-one window. To show which bags are equipped, move the cursor just above the top of the bag or bank window. You can also configure sorting options for each bag by clicking its gear icon.\n\nTo search, click the search box near the bottom. You can search for item names, or slots; e.g. 'trinket' will highlight both items with 'trinket' in their name as well as all of your trinkets.\n\nTo sort your items, click the button in the bottom right corner."
L_INSTALL_STEP_1 = "1/6"

L_INSTALL_HELLO = "Hello"
L_INSTALL_HELLO_TEXT = "Thank you for choosing FreeUI!\n\nIn just a moment, you can get started. All that's needed is for the correct settings to be applied. Don't worry, none of your personal preferences will be changed.\n\nYou can also take a brief tutorial on some of the features of FreeUI, which is recommended if you're a new user.\n\nPress the 'Tutorial' button to do so now, or press 'Install' to go straight to the setup."
L_INSTALL_HELLO_TUTO = "Tutorial"
L_INSTALL_HELLO_INST = "Install"
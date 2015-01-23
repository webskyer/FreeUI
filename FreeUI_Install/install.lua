local F, C, L = unpack(FreeUI)

local addon = ...

local playerName = UnitName("player")

-- Smooth bars

local smoothing = {}
local function Smooth(self, value)
	local _, max = self:GetMinMaxValues()
	if value == self:GetValue() or (self._max and self._max ~= max) then
		smoothing[self] = nil
		self:SetValue_(value)
	else
		smoothing[self] = value
	end
	self._max = max
end

local function SmoothBar(bar)
	bar.SetValue_ = bar.SetValue
	bar.SetValue = Smooth
end

local smoother, min, max = CreateFrame('Frame'), math.min, math.max
smoother:SetScript('OnUpdate', function()
	local rate = GetFramerate()
	local limit = 30/rate
	for bar, value in pairs(smoothing) do
		local cur = bar:GetValue()
		local new = cur + min((value-cur)/3, max(value-cur, limit))
		if new ~= new then
			-- Mad hax to prevent QNAN.
			new = value
		end
		bar:SetValue_(new)
		if cur == value or abs(new - value) < 2 then
			bar:SetValue_(value)
			smoothing[bar] = nil
		end
	end
end)

-- Create frames

local f = CreateFrame("Frame", "FreeUI_InstallFrame", UIParent)
f:SetSize(400, 400)
f:SetPoint("CENTER")
f:SetFrameStrata("HIGH")
F.CreateBD(f)

local sb = CreateFrame("StatusBar", nil, f)
sb:SetPoint("BOTTOM", f, "BOTTOM", 0, 60)
sb:SetSize(320, 20)
sb:SetStatusBarTexture(C.media.texture)
sb:Hide()
SmoothBar(sb)

local sbd = CreateFrame("Frame", nil, sb)
sbd:SetPoint("TOPLEFT", sb, -1, 1)
sbd:SetPoint("BOTTOMRIGHT", sb, 1, -1)
sbd:SetFrameLevel(sb:GetFrameLevel()-1)
F.CreateBD(sbd, .25)

local header = f:CreateFontString(nil, "OVERLAY")
header:SetFontObject(GameFontHighlightLarge)
header:SetPoint("TOP", f, "TOP", 0, -20)

local body = f:CreateFontString(nil, "OVERLAY")
body:SetFontObject(GameFontHighlight)
body:SetJustifyH("LEFT")
body:SetWidth(f:GetWidth()-40)
body:SetPoint("TOPLEFT", f, "TOPLEFT", 20, -60)

local credits = f:CreateFontString(nil, "OVERLAY")
credits:SetFontObject(GameFontHighlightSmall)
credits:SetText("FreeUI by Lightsword @ Argent Dawn - EU / Haleth on wowinterface.com")
credits:SetPoint("BOTTOM", f, "BOTTOM", 0, 4)

local sbt = sb:CreateFontString(nil, "OVERLAY")
sbt:SetFontObject(GameFontHighlight)
sbt:SetPoint("CENTER", sb)

local option1 = CreateFrame("Button", "FreeUI_Install_Option1", f, "UIPanelButtonTemplate")
option1:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", 20, 20)
option1:SetSize(128, 25)

local option2 = CreateFrame("Button", "FreeUI_Install_Option2", f, "UIPanelButtonTemplate")
option2:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -20, 20)
option2:SetSize(128, 25)

local close = CreateFrame("Button", "FreeUI_Install_CloseButton", f, "UIPanelCloseButton")
close:SetPoint("TOPRIGHT", f, "TOPRIGHT")
close:SetScript("OnClick", function()
	UIFrameFade(f,{
		mode = "OUT",
		timeToFade = 0.5,
		finishedFunc = function(f) f:SetAlpha(1); f:Hide() end,
		finishedArg1 = f,
	})
	DisableAddOn(addon, playerName)
end)

F.Reskin(option1)
F.Reskin(option2)
F.ReskinClose(close)

-- Setup

local scale = min(2, max(.64, 768/string.match(({GetScreenResolutions()})[GetCurrentResolution()], "%d+x(%d+)")))
if scale > 1 then scale = 1 end

local function Setup()
	SetCVar("screenshotQuality", 10)
	SetCVar("cameraDistanceMax", 50)
	SetCVar("cameraDistanceMaxFactor", 3.4)
	SetCVar("nameplateShowFriends", 0)
	SetCVar("nameplateShowEnemies", 1)
	SetCVar("ShowClassColorInNameplate", 1)
	SetCVar("bloatThreat", 0)
	SetCVar("miniWorldMap", 1)
end

local function SetupChat()
	FCF_ResetChatWindows()
	FCF_DockFrame(ChatFrame2)

	ChatFrame1:ClearAllPoints()
	ChatFrame1:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 30, 30)
	if C.resolution > 1 then
		ChatFrame1:SetSize(445, 180)
	else
		ChatFrame1:SetSize(377, 156)
	end
	ChatFrame1:SetUserPlaced(true)

	FCF_SavePositionAndDimensions(ChatFrame1)
	FCF_SetLocked(ChatFrame1, 1)

	local channels = {
		"SAY",
		"EMOTE",
		"YELL",
		"GUILD",
		"OFFICER",
		"GUILD_ACHIEVEMENT",
		"ACHIEVEMENT",
		"WHISPER",
		"PARTY",
		"PARTY_LEADER",
		"INSTANCE_CHAT",
		"INSTANCE_CHAT_LEADER",
		"RAID",
		"RAID_LEADER",
		"RAID_WARNING",
		"BATTLEGROUND",
		"BATTLEGROUND_LEADER",
		"CHANNEL1",
		"CHANNEL2",
		"CHANNEL3",
		"CHANNEL4",
		"CHANNEL5",
		"CHANNEL6",
		"CHANNEL7",
		"CHANNEL8",
		"CHANNEL9",
		"CHANNEL10",
	}

	for _, channel in next, channels do
		ToggleChatColorNamesByClassGroup(true, channel)
	end
end

local function SetupDBM()
	if(DBM_SavedOptions) then table.wipe(DBM_SavedOptions) end
	if not DBT_PersistentOptions then DBT_PersistentOptions = {} end
	if(DBT_PersistentOptions["DBM"]) then table.wipe(DBT_PersistentOptions["DBM"]) end

	DBM_SavedOptions = {
		["WarningIconLeft"] = false,
		["WarningIconRight"] = false,
		["ShowMinimapButton"] = false,
	}

	DBT_PersistentOptions["DBM"] = {
		["EndColorG"] = 1,
		["HugeTimerY"] = -120,
		["HugeBarXOffset"] = 0,
		["Scale"] = 1,
		["HugeBarsEnabled"] = false,
		["EnlargeBarsPercent"] = 0.125,
		["StartColorR"] = 1,
		["HugeWidth"] = 206,
		["BarYOffset"] = 3,
		["IconRight"] = false,
		["IconLeft"] = true,
		["HugeTimerX"] = 0,
		["HugeBarYOffset"] = 0,
		["TimerPoint"] = "CENTER",
		["StartColorG"] = 0,
		["TimerY"] = -157,
		["TimerX"] = -264,
		["EndColorR"] = 0,
		["Width"] = 206,
		["HugeTimerPoint"] = "CENTER",
		["HugeScale"] = 1,
		["FontSize"] = 10,
		["EnlargeBarsTime"] = 8,
		["Height"] = 20,
		["StartColorB"] = 0,
		["BarXOffset"] = 0,
		["EndColorB"] = 0,
	}
end

local step4 = function()
	sb:SetValue(400)
	PlaySoundFile("Sound\\interface\\LevelUp.wav")
	header:SetText(L_INSTALL_SUCCESS)
	body:SetText(L_INSTALL_COMPLETE)
	sbt:SetText(L_INSTALL_STEP4)
	option1:Hide()
	option2:SetText(L_INSTALL_FINISH)

	option2:SetScript("OnClick", function()
		DisableAddOn(addon, playerName)
		ReloadUI()
	end)
end

local step3 = function()
	sb:SetValue(300)
	header:SetText(L_INSTALL_DBM)
	body:SetText(L_INSTALL_DBM_TEXT)
	sbt:SetText(L_INSTALL_STEP3)

	option1:SetScript("OnClick", step4)
	option2:SetScript("OnClick", function()
		SetupDBM()
		step4()
	end)
end

local step2 = function()
	sb:SetValue(200)
	header:SetText(L_INSTALL_CHAT)
	body:SetText(L_INSTALL_CHAT_TEXT)
	sbt:SetText(L_INSTALL_STEP2)

	option1:SetScript("OnClick", step3)
	option2:SetScript("OnClick", function()
		SetupChat()
		step3()
	end)
end

local step1 = function()
	sb:SetMinMaxValues(0, 400)
	sb:Show()
	sb:SetValue(0)
	sb:SetValue(100)
	sb:GetStatusBarTexture():SetGradient("VERTICAL", 0.20, .9, 0.12, 0.36, 1, 0.30)
	header:SetText(L_INSTALL_CORE)
	body:SetText(L_INSTALL_CORE_TEXT)
	sbt:SetText(L_INSTALL_STEP1)

	option1:Show()

	option1:SetText(L_INSTALL_SKIP)
	option2:SetText(L_INSTALL_CONTINUE)

	option1:SetScript("OnClick", step2)
	option2:SetScript("OnClick", function()
		Setup()
		step2()
	end)
end

local tut6 = function()
	sb:SetValue(600)
	header:SetText(L_INSTALL_FINISHED)
	body:SetText(L_INSTALL_FINISHED_TEXT)

	sbt:SetText(L_INSTALL_STEP_6)

	option1:Show()

	option1:SetText(L_INSTALL_CLOSE)
	option2:SetText(L_INSTALL_INSTALL)

	option1:SetScript("OnClick", function()
		UIFrameFade(f,{
			mode = "OUT",
			timeToFade = 0.5,
			finishedFunc = function(f) f:Hide() end,
			finishedArg1 = f,
		})
		DisableAddOn(addon, playerName)
	end)
	option2:SetScript("OnClick", step1)
end

local tut5 = function()
	sb:SetValue(500)
	header:SetText(L_INSTALL_COMMEND)
	body:SetText(L_INSTALL_COMMEND_TEXT)

	sbt:SetText(L_INSTALL_STEP_5)

	option2:SetScript("OnClick", tut6)
end

local tut4 = function()
	sb:SetValue(400)
	header:SetText(L_INSTALL_FEATURE2)
	body:SetText(L_INSTALL_FEATURE2_TEXT)

	sbt:SetText(L_INSTALL_STEP_4)

	option2:SetScript("OnClick", tut5)
end

local tut3 = function()
	sb:SetValue(300)
	header:SetText(L_INSTALL_FEATURE)
	body:SetText(L_INSTALL_FEATURE_TEXT)

	sbt:SetText(L_INSTALL_STEP_3)

	option2:SetScript("OnClick", tut4)
end

local tut2 = function()
	sb:SetValue(200)
	header:SetText(L_INSTALL_UNIT)
	body:SetText(L_INSTALL_UNIT_TEXT)

	sbt:SetText(L_INSTALL_STEP_2)

	option2:SetScript("OnClick", tut3)
end

local tut1 = function()
	sb:SetMinMaxValues(0, 600)
	sb:Show()
	sb:SetValue(100)
	sb:GetStatusBarTexture():SetGradient("VERTICAL", 0, 0.65, .9, .1, .9, 1)
	header:SetText(L_INSTALL_ESSE)
	body:SetText(L_INSTALL_ESSE_TEXT)

	sbt:SetText(L_INSTALL_STEP_1)

	option1:Hide()

	option2:SetText("Next")

	option2:SetScript("OnClick", tut2)
end


header:SetText(L_INSTALL_HELLO)
body:SetText(L_INSTALL_HELLO_TEXT)

option1:SetText(L_INSTALL_HELLO_TUTO)
option2:SetText(L_INSTALL_HELLO_INST)

option1:SetScript("OnClick", tut1)
option2:SetScript("OnClick", step1)
-- rActionBarStyler by Roth, modified.

local F, C, L = unpack(select(2, ...))

if not C.actionbars.enable then return end

--[[ MainMenuBar ]]

local bar1 = CreateFrame("Frame", "FreeUI_MainMenuBar", UIParent, "SecureHandlerStateTemplate")
local bar1_button_width = C.actionbars.MainMenuBarButton_Width
local bar1_button_height = C.actionbars.MainMenuBarButton_Height
local bar1_width = bar1_button_width*12+7
local bar1_height = bar1_button_height
bar1:SetWidth(bar1_width)
bar1:SetHeight(bar1_height)

MainMenuBarArtFrame:SetParent(bar1)
MainMenuBarArtFrame:EnableMouse(false)

MainMenuBar.slideOut.IsPlaying = function() return true end

for i = 1, NUM_ACTIONBAR_BUTTONS do
	local button = _G["ActionButton"..i]
	button:ClearAllPoints()
	button:SetSize(bar1_button_width, bar1_button_height)
	if i == 1 then
		button:SetPoint("BOTTOMLEFT", bar1, "BOTTOMLEFT", 0, 0)
	else
		local previous = _G["ActionButton"..i-1]
		button:SetPoint("LEFT", previous, "RIGHT", 1, 0)
	end
end

RegisterStateDriver(bar1, "visibility", "[petbattle][overridebar][vehicleui][possessbar,@vehicle,exists] hide; show")

--[[ Bottom Left bar ]]

local bar2 = CreateFrame("Frame", "FreeUI_MultiBarBottomLeft", UIParent, "SecureHandlerStateTemplate")
local bar2_button_width = C.actionbars.BottomLeftBarButton_Width
local bar2_button_height = C.actionbars.BottomLeftBarButton_Height
local bar2_width = bar2_button_width*12+7
local bar2_height = bar2_button_height
bar2:SetWidth(bar2_width)
bar2:SetHeight(bar2_height)

MultiBarBottomLeft:SetParent(bar2)
MultiBarBottomLeft:EnableMouse(false)

for i = 1, NUM_ACTIONBAR_BUTTONS do
	local button = _G["MultiBarBottomLeftButton"..i]
	button:ClearAllPoints()
	button:SetSize(bar2_button_width, bar2_button_height)
	if i == 1 then
		button:SetPoint("BOTTOMLEFT", bar2, "BOTTOMLEFT", 0, 0)
	else
		local previous = _G["MultiBarBottomLeftButton"..i-1]
		button:SetPoint("LEFT", previous, "RIGHT", 1, 0)
	end
end

RegisterStateDriver(bar2, "visibility", "[petbattle][vehicleui][overridebar][possessbar,@vehicle,exists] hide; show")

--[[ Bottom Right bar ]]

local bar3 = CreateFrame("Frame", "FreeUI_MultiBarBottomRight", UIParent, "SecureHandlerStateTemplate")
local bar3_button_width = C.actionbars.BottomRightBarButton_Width
local bar3_button_height = C.actionbars.BottomRightBarButton_Height
local bar3_width = bar3_button_width*12+7
local bar3_height = bar3_button_height
bar3:SetWidth(bar3_width)
bar3:SetHeight(bar3_height)

MultiBarBottomRight:SetParent(bar3)
MultiBarBottomRight:EnableMouse(false)

for i= 1, NUM_ACTIONBAR_BUTTONS do
	local button = _G["MultiBarBottomRightButton"..i]
	button:ClearAllPoints()
	button:SetSize(bar3_button_width, bar3_button_height)
	if i == 1 then
		button:SetPoint("BOTTOMLEFT", bar3, "BOTTOMLEFT", 0, 0)
	else
		local previous = _G["MultiBarBottomRightButton"..i-1]
		button:SetPoint("LEFT", previous, "RIGHT", 1, 0)
	end
end

RegisterStateDriver(bar3, "visibility", "[petbattle][vehicleui][overridebar][possessbar,@vehicle,exists] hide; show")

-- [[ Main bar positions ]]

local function positionBars()
	if InCombatLockdown() then return end

	local leftShown, rightShown = MultiBarBottomLeft:IsShown(), MultiBarBottomRight:IsShown()

	if leftShown and rightShown then
		bar1:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 30)
		bar2:SetPoint("BOTTOM", bar1, "TOP", 0, 1)
		bar3:SetPoint("BOTTOM", bar2, "TOP", 0, 1)
	elseif leftShown then
		bar1:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 30)
		bar2:SetPoint("BOTTOM", bar1, "TOP", 0, 1)
	elseif rightShown then
		bar1:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 30)
		bar3:SetPoint("BOTTOM", bar1, "TOP", 0, 1)
	else
		bar1:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 30)
	end
end

hooksecurefunc("MultiActionBar_Update", positionBars)

--[[ Right bar 1 ]]

local bar4 = CreateFrame("Frame", "FreeUI_MultiBarRight", UIParent, "SecureHandlerStateTemplate")
local bar4_button_width = C.actionbars.MultiBarRightButton_Width
local bar4_button_height = C.actionbars.MultiBarRightButton_Height
local bar4_width = bar4_button_width
local bar4_height = bar4_button_height*12+7
bar4:SetHeight(bar4_height)
bar4:SetWidth(bar4_width)
bar4:SetPoint("RIGHT", -30, 0)

MultiBarRight:SetParent(bar4)
MultiBarRight:EnableMouse(false)

for i = 1, NUM_ACTIONBAR_BUTTONS do
	local button = _G["MultiBarRightButton"..i]
	button:ClearAllPoints()
	button:SetSize(bar4_button_width, bar4_button_width)
	if i == 1 then
		button:SetPoint("TOPLEFT", bar4, 0,0)
	else
		local previous = _G["MultiBarRightButton"..i-1]
		button:SetPoint("TOP", previous, "BOTTOM", 0, -1)
	end
end

RegisterStateDriver(bar4, "visibility", "[petbattle][vehicleui][overridebar][possessbar,@vehicle,exists] hide; show")

--[[ Right bar 2 ]]

local bar5 = CreateFrame("Frame", "FreeUI_MultiBarLeft", UIParent, "SecureHandlerStateTemplate")
local bar5_button_width = C.actionbars.MultiBarLeftButton_Width
local bar5_button_height = C.actionbars.MultiBarLeftButton_Height
local bar5_width = bar5_button_width
local bar5_height = bar5_button_height*12+7
bar5:SetHeight(bar5_height)
bar5:SetWidth(bar5_width)
bar5:SetPoint("RIGHT", bar4, "LEFT", -1, 0)

MultiBarLeft:SetParent(bar5)
MultiBarLeft:EnableMouse(false)

for i = 1, NUM_ACTIONBAR_BUTTONS do
	local button = _G["MultiBarLeftButton"..i]
	button:ClearAllPoints()
	button:SetSize(bar5_button_width, bar5_button_height)
	if i == 1 then
		button:SetPoint("TOPLEFT", bar5, 0,0)
	else
		local previous = _G["MultiBarLeftButton"..i-1]
		button:SetPoint("TOP", previous, "BOTTOM", 0, -1)
	end
end

RegisterStateDriver(bar5, "visibility", "[petbattle][vehicleui][overridebar][possessbar,@vehicle,exists] hide; show")

-- [[ Override bar ]]Override 

local numOverride = 7

local override = CreateFrame("Frame", "FreeUI_OverrideBar", UIParent, "SecureHandlerStateTemplate")
local override_button_width = bar1_button_width
local override_button_height = bar1_button_height
local override_width = bar1_button_width*12+7
local override_height = bar1_button_height
override:SetWidth(override_width)
override:SetHeight(override_height)
override:SetPoint("TOP", bar2, "BOTTOM", 0, 1)

OverrideActionBar:SetParent(override)
OverrideActionBar:EnableMouse(false)
OverrideActionBar:SetScript("OnShow", nil)

local leaveButtonPlaced = false

for i = 1, numOverride do
	local bu = _G["OverrideActionBarButton"..i]
	if not bu and not leaveButtonPlaced then
		bu = OverrideActionBar.leaveButton
		leaveButtonPlaced = true
	end
	if not bu then
		break
	end
	bu:ClearAllPoints()
	bu:SetSize(override_button_width, override_button_height)
	if i == 1 then
		bu:SetPoint("BOTTOMLEFT", override, "BOTTOMLEFT")
	else
		local previous = _G["OverrideActionBarButton"..i-1]
		bu:SetPoint("LEFT", previous, "RIGHT", 1, 0)
	end
end

RegisterStateDriver(override, "visibility", "[petbattle] hide; [overridebar][vehicleui][possessbar,@vehicle,exists] show; hide")
RegisterStateDriver(OverrideActionBar, "visibility", "[overridebar][vehicleui][possessbar,@vehicle,exists] show; hide")

-- [[ Hide stuff ]]

local hider = CreateFrame("Frame")
hider:Hide()

local hideFrames = {MainMenuBar, MainMenuBarPageNumber, ActionBarDownButton, ActionBarUpButton, OverrideActionBarExpBar, OverrideActionBarHealthBar, OverrideActionBarPowerBar, OverrideActionBarPitchFrame, CharacterMicroButton, SpellbookMicroButton, TalentMicroButton, AchievementMicroButton, QuestLogMicroButton, GuildMicroButton, PVPMicroButton, LFDMicroButton, CompanionsMicroButton, EJMicroButton, MainMenuMicroButton, HelpMicroButton, StoreMicroButton, MainMenuBarBackpackButton}
for _, frame in pairs(hideFrames) do
	frame:SetParent(hider)
end

StanceBarLeft:SetTexture("")
StanceBarMiddle:SetTexture("")
StanceBarRight:SetTexture("")
SlidingActionBarTexture0:SetTexture("")
SlidingActionBarTexture1:SetTexture("")
PossessBackground1:SetTexture("")
PossessBackground2:SetTexture("")
MainMenuBarTexture0:SetTexture("")
MainMenuBarTexture1:SetTexture("")
MainMenuBarTexture2:SetTexture("")
MainMenuBarTexture3:SetTexture("")
MainMenuBarLeftEndCap:SetTexture("")
MainMenuBarRightEndCap:SetTexture("")

local textureList = {"_BG","EndCapL","EndCapR","_Border","Divider1","Divider2","Divider3","ExitBG","MicroBGL","MicroBGR","_MicroBGMid","ButtonBGL","ButtonBGR","_ButtonBGMid"}

for _, tex in pairs(textureList) do
	OverrideActionBar[tex]:SetAlpha(0)
end

--[[ Pet bar ]]

local numpet = NUM_PET_ACTION_SLOTS

local petbar = CreateFrame("Frame", "FreeUI_PetBar", UIParent, "SecureHandlerStateTemplate")
petbar:SetWidth((27 * numpet) - 1)
petbar:SetHeight(54)
petbar:SetPoint("BOTTOMRIGHT", -29, 2)

PetActionBarFrame:SetParent(petbar)
PetActionBarFrame:SetHeight(0.001)

for i = 1, numpet do
	local button = _G["PetActionButton"..i]
	local cd = _G["PetActionButton"..i.."Cooldown"]

	button:ClearAllPoints()
	button:SetSize(26, 26)

	if i == 1 then
		button:SetPoint("BOTTOMLEFT", petbar, 0,0)
	else
		local previous = _G["PetActionButton"..i-1]
		button:SetPoint("LEFT", previous, "RIGHT", 1, 0)
	end

	cd:SetAllPoints(button)
end

RegisterStateDriver(petbar, "visibility", "[petbattle][overridebar][vehicleui][possessbar,@vehicle,exists] hide; [@pet,exists,nomounted] show; hide")

--[[ Stance/possess bar]]

local stancebar = CreateFrame("Frame", "FreeUI_StanceBar", UIParent, "SecureHandlerStateTemplate")
stancebar:SetHeight(26)
stancebar:SetPoint("BOTTOM", bar1, "TOP", 0, 2)

StanceBarFrame:SetParent(stancebar)
StanceBarFrame:EnableMouse(false)

for i = 1, NUM_STANCE_SLOTS do
	local button = _G["StanceButton"..i]
	button:SetSize(26, 26)
	button:ClearAllPoints()
	if i == 1 then
		button:SetPoint("BOTTOMLEFT", stancebar, 0, 0)
	else
		local previous = _G["StanceButton"..i-1]
		button:SetPoint("LEFT", previous, "RIGHT", 1, 0)
	end
end

PossessBarFrame:SetParent(stancebar)
PossessBarFrame:EnableMouse(false)

for i = 1, NUM_POSSESS_SLOTS do
	local button = _G["PossessButton"..i]
	button:SetSize(26, 26)
	button:ClearAllPoints()
	if i == 1 then
		button:SetPoint("BOTTOMLEFT", stancebar, 0, 0)
	else
		local previous = _G["PossessButton"..i-1]
		button:SetPoint("LEFT", previous, "RIGHT", 1, 0)
	end
end

RegisterStateDriver(stancebar, "visibility", "[petbattle][vehicleui][overridebar][possessbar,@vehicle,exists] hide; show")

local cachedNumForms = 0

local function setStancebarWidth()
	stancebar:SetWidth(cachedNumForms * 27 - 1)
end

local delayedPositioner = CreateFrame("Frame")
delayedPositioner:SetScript("OnEvent", function(self)
	self:UnregisterEvent("PLAYER_REGEN_ENABLED")
	setStancebarWidth()
end)

hooksecurefunc("StanceBar_Update", function()
	local numForms = GetNumShapeshiftForms()

	if cachedNumForms ~= numForms then
		cachedNumForms = numForms

		if not InCombatLockdown() then
			setStancebarWidth()
		else
			delayedPositioner:RegisterEvent("PLAYER_REGEN_ENABLED")
		end
	end
end)

--[[ Right bars on mouseover ]]

if C.actionbars.rightbars_mouseover then
	bar4:EnableMouse(true)
	bar5:EnableMouse(true)

	local function setButtonAlpha(alpha)
		bar4:SetAlpha(alpha)
		bar5:SetAlpha(alpha)

		for i = 1, NUM_ACTIONBAR_BUTTONS do
			local ab1 = _G["MultiBarLeftButton"..i]
			local ab2 = _G["MultiBarRightButton"..i]

			ab1.cooldown:SetSwipeColor(0, 0, 0, 0.8 * alpha)
			ab1.cooldown:SetDrawBling(alpha == 1)
			ab2.cooldown:SetSwipeColor(0, 0, 0, 0.8 * alpha)
			ab2.cooldown:SetDrawBling(alpha == 1)
		end
	end

	local function showButtons()
		setButtonAlpha(1)
	end

	local function hideButtons()
		setButtonAlpha(0)
	end

	for i = 1, NUM_ACTIONBAR_BUTTONS do
		local ab1 = _G["MultiBarLeftButton"..i]
		local ab2 = _G["MultiBarRightButton"..i]

		ab1:HookScript("OnEnter", showButtons)
		ab1:HookScript("OnLeave", hideButtons)
		ab2:HookScript("OnEnter", showButtons)
		ab2:HookScript("OnLeave", hideButtons)
	end

	bar4:HookScript("OnEnter", showButtons)
	bar4:HookScript("OnLeave", hideButtons)
	bar5:HookScript("OnEnter", showButtons)
	bar5:HookScript("OnLeave", hideButtons)
	hideButtons()

	-- dumb fix for cooldown spirals not playing nice with alpha settingss
	F.RegisterEvent("PLAYER_LOGIN", hideButtons)
	F.RegisterEvent("PLAYER_ENTERING_WORLD", hideButtons)

	local function showButtonsFlyout()
		local frame = SpellFlyout:GetParent():GetParent():GetParent()
		if frame and (frame == FreeUI_MultiBarLeft or frame == FreeUI_MultiBarRight) then
			showButtons()
		end
	end

	local function hideButtonsFlyout()
		local frame = SpellFlyout:GetParent():GetParent():GetParent()
		if frame and (frame == FreeUI_MultiBarLeft or frame == FreeUI_MultiBarRight) then
			hideButtons()
		end
	end

	SpellFlyout:HookScript("OnShow", function(self)
		local frame = self:GetParent():GetParent():GetParent()
		if frame and (frame == FreeUI_MultiBarLeft or frame == FreeUI_MultiBarRight) then
			for i = 1, 10 do
				local bu = _G["SpellFlyoutButton"..i]
				if bu and not bu.isHooked then
					bu:HookScript("OnEnter", showButtonsFlyout)
					bu:HookScript("OnLeave", hideButtonsFlyout)
					bu.isHooked = true
				end
			end
		end
	end)

	SpellFlyout:HookScript("OnEnter", showButtonsFlyout)
	SpellFlyout:HookScript("OnLeave", hideButtonsFlyout)
end

--[[ Extra bar ]]

local barextra = CreateFrame("Frame", "FreeUI_ExtraActionBar", UIParent, "SecureHandlerStateTemplate")
barextra:SetSize(39, 39)
barextra:SetPoint("BOTTOM", bar1, "TOP", 0, 30)

ExtraActionBarFrame:SetParent(barextra)
ExtraActionBarFrame:EnableMouse(false)
ExtraActionBarFrame:ClearAllPoints()
ExtraActionBarFrame:SetPoint("CENTER", 0, 0)
ExtraActionBarFrame.ignoreFramePositionManager = true

ExtraActionButton1:SetSize(39, 39)

RegisterStateDriver(barextra, "visibility", "[extrabar] show; hide")

-- [[ Leave vehicle ]]

local leave = CreateFrame("Frame", "FreeUI_LeaveVehicle", UIParent, "SecureHandlerStateTemplate")
leave:SetSize(18, 18)

-- if unit frames are enabled, position is set there
if not C.unitframes.enable then
	leave:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -6, 30)
end

local leaveBu = CreateFrame("Button", nil, leave, "SecureHandlerClickTemplate, SecureHandlerStateTemplate")
leaveBu:SetAllPoints()
leaveBu:RegisterForClicks("AnyUp")
leaveBu:SetScript("OnClick", VehicleExit)

F.CreateBD(leaveBu)

leaveBu.pixels = {}

for i = 1, 10 do
	local tex = leaveBu:CreateTexture()
	tex:SetTexture(1, 1, 1)
	tex:SetSize(1, 1)
	tex:SetPoint("BOTTOMLEFT", 3+i, 3+i)
	tinsert(leaveBu.pixels, tex)
end

for i = 1, 10 do
	local tex = leaveBu:CreateTexture()
	tex:SetTexture(1, 1, 1)
	tex:SetSize(1, 1)
	tex:SetPoint("TOPLEFT", 3+i, -3-i)
	tinsert(leaveBu.pixels, tex)
end

local r, g, b = unpack(C.class)

leaveBu:SetScript("OnEnter", function(self)
	if self:IsEnabled() then
		for _, pixel in pairs(self.pixels) do
			pixel:SetVertexColor(r, g, b)
		end
	end
end)

leaveBu:SetScript("OnLeave", function(self)
	for _, pixel in pairs(self.pixels) do
		pixel:SetVertexColor(1, 1, 1)
	end
end)

RegisterStateDriver(leaveBu, "visibility", "[petbattle][vehicleui][overridebar] hide; [@vehicle,exists][possessbar] show; hide")
RegisterStateDriver(leave, "visibility", "[petbattle][vehicleui][overridebar][possessbar,@vehicle,exists] hide; show")

-- [[ Bags ]]

if not C.bags.enable and not C.actionbars.enable then
	for i = 0, 3 do
		_G["CharacterBag"..i.."Slot"]:SetParent(FreeUIHider)
	end
end
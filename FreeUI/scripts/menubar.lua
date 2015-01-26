local F, C = unpack(select(2, ...))

if not C.menubar.enable then return end

local r, g, b = unpack(C.class)

local barAlpha, buttonAlpha

if C.menubar.buttons_mouseover then
	barAlpha = 0.25
	buttonAlpha = 0
else
	barAlpha = 0.5
	buttonAlpha = 1
end

-- [[ Bar ]]

local bar = CreateFrame("Frame", "FreeUIMenubar", UIParent)
bar:SetFrameStrata("BACKGROUND")
bar:SetPoint("BOTTOMLEFT", -1, -1)
bar:SetPoint("BOTTOMRIGHT", 1, -1)
bar:SetHeight(13)
F.CreateBD(bar, barAlpha)

bar.buttons = {}

local function onEvent(event)
	if event == "PLAYER_REGEN_DISABLED" then
		bar:SetBackdropBorderColor(1, 0, 0)
	else
		bar:SetBackdropBorderColor(0, 0, 0)
	end
end

F.RegisterEvent("PLAYER_REGEN_DISABLED", onEvent)
F.RegisterEvent("PLAYER_REGEN_ENABLED", onEvent)

-- [[ Buttons ]]

if not C.menubar.enableButtons then return end

local POSITION_LEFT, POSITION_MIDDLE, POSITION_RIGHT = 1, 2, 3

local function fadeIn(self, elapsed)
	if barAlpha < .5 then
		barAlpha = barAlpha + elapsed
		buttonAlpha = buttonAlpha + (elapsed * 4)
	else
		barAlpha = .5
		buttonAlpha = 1
		self:SetScript("OnUpdate", nil)
	end

	self:SetBackdropColor(0, 0, 0, barAlpha)

	for _, button in pairs(bar.buttons) do
		button:SetAlpha(buttonAlpha)
	end
end

local function fadeOut(self, elapsed)
	if barAlpha > .25 then
		barAlpha = barAlpha - elapsed
		buttonAlpha = buttonAlpha - (elapsed * 4)
	else
		barAlpha = .25
		buttonAlpha = 0
		self:SetScript("OnUpdate", nil)
	end

	self:SetBackdropColor(0, 0, 0, barAlpha)

	for _, button in pairs(bar.buttons) do
		button:SetAlpha(buttonAlpha)
	end
end

local function showBar()
	bar:SetScript("OnUpdate", fadeIn)
	bar:SetFrameStrata("HIGH")
end
bar.showBar = showBar

local function hideBar()
	bar:SetScript("OnUpdate", fadeOut)
	bar:SetFrameStrata("BACKGROUND")
end
bar.hideBar = hideBar

if C.menubar.buttons_mouseover then
	bar:SetScript("OnEnter", showBar)
	bar:SetScript("OnLeave", hideBar)
end

local function buttonOnEnterNoFade(self)
	self:SetBackdropColor(r, g, b, .4)
end

local function buttonOnLeaveNoFade(self)
	self:SetBackdropColor(0, 0, 0, .1)
end

local function buttonOnEnter(self)
	if C.menubar.buttons_mouseover then
		showBar()
	end

	self:SetBackdropColor(r, g, b, .4)
end

local function buttonOnLeave(self)
	if C.menubar.buttons_mouseover then
		hideBar()
	end

	self:SetBackdropColor(0, 0, 0, .1)
end

local function reanchorButtons()
	local leftOffset, rightOffset = 0, 0

	for i = 1, #bar.buttons do
		local bu = bar.buttons[i]

		if bu:IsShown() then
			if bu.position == POSITION_LEFT then
				bu:SetPoint("LEFT", bar, "LEFT", leftOffset, 0)
				leftOffset = leftOffset + 129
			elseif bu.position == POSITION_RIGHT then
				bu:SetPoint("RIGHT", bar, "RIGHT", rightOffset, 0)
				rightOffset = rightOffset - 129
			else
				bu:SetPoint("CENTER", bar)
			end
		end
	end
end

local function showButton(button)
	button:Show()
	reanchorButtons()
end

local function hideButton(button)
	button:Hide()
	reanchorButtons()
end

local function addButton(text, position, clickFunc)
	local bu = CreateFrame("Button", nil, bar)
	bu:SetPoint("TOP", bar, "TOP")
	bu:SetPoint("BOTTOM", bar, "BOTTOM")
	bu:SetWidth(130)
	F.CreateBD(bu, .1)

	if C.menubar.buttons_mouseover then
		bu:SetAlpha(0)
	end

	local buText = F.CreateFS(bu)
	buText:SetPoint("CENTER")
	buText:SetText(text)
	bu.Text = buText

	bu:SetScript("OnClick", clickFunc)
	bu:SetScript("OnEnter", buttonOnEnter)
	bu:SetScript("OnLeave", buttonOnLeave)

	bu.position = position

	tinsert(bar.buttons, bu)

	reanchorButtons()

	return bu
end

bar.addButton = addButton

F.AddOptionsCallback("menubar", "buttons_mouseover", function()
	if C.menubar.buttons_mouseover then
		bar:SetScript("OnEnter", showBar)
		bar:SetScript("OnLeave", hideBar)
		hideBar()
	else
		bar:SetScript("OnEnter", nil)
		bar:SetScript("OnLeave", nil)
		showBar()
	end
end)

addButton(L_MENUBAR_MICRO_MENU, POSITION_LEFT, function()
	if DropDownList1:IsShown() then
		ToggleFrame(DropDownList1)
	else
		F.MicroMenu()
	end
end)

addButton(L_MENUBAR_CHAT_MENU, POSITION_LEFT, function()
	ChatMenu:ClearAllPoints()
	ChatMenu:SetPoint("BOTTOMLEFT", UIParent, 30, 30)
	ToggleFrame(ChatMenu)
end)

FreeUIStatsButton = addButton("", POSITION_MIDDLE, function()
	TimeManagerClockButton_OnClick(TimeManagerClockButton)
end)

FreeUIStatsButton:SetWidth(200)

local garrisonButton = addButton(GARRISON_LANDING_PAGE_TITLE, POSITION_RIGHT, GarrisonLandingPage_Toggle)
garrisonButton:Hide()

GarrisonLandingPageMinimapButton:SetSize(1, 1)
GarrisonLandingPageMinimapButton:SetAlpha(0)
GarrisonLandingPageMinimapButton:EnableMouse(false)

GarrisonLandingPageMinimapButton:HookScript("OnEvent", function(self, event)
	if event == "GARRISON_SHOW_LANDING_PAGE" and not garrisonButton:IsShown() then
		showButton(garrisonButton)
	elseif event == "GARRISON_HIDE_LANDING_PAGE" then
		hideButton(garrisonButton)
	end
end)

addButton(L_MENUBAR_DBM_MENU, POSITION_RIGHT, function()
	if IsAddOnLoaded("DBM-Core") then
		DisableAddOn("DBM-Core")
		DisableAddOn("DBM-StatusBarTimers")
		DEFAULT_CHAT_FRAME:AddMessage(L_MENUBAR_DBM_DISABLED, r, g, b)
	else
		EnableAddOn("DBM-Core")
		EnableAddOn("DBM-StatusBarTimers")
		DEFAULT_CHAT_FRAME:AddMessage(L_MENUBAR_DBM_ENABLED, r, g, b)
	end
end)

addButton(L_MENUBAR_TSM_MENU, POSITION_RIGHT, function()
	if IsAddOnLoaded("TradeSkillMaster") then
		DisableAddOn("TradeSkillMaster")
		DisableAddOn("TradeSkillMaster_Accounting")
		DisableAddOn("TradeSkillMaster_Additions")
		DisableAddOn("TradeSkillMaster_AuctionDB")
		DisableAddOn("TradeSkillMaster_Auctioning")
		DisableAddOn("TradeSkillMaster_Crafting")
		DisableAddOn("TradeSkillMaster_Destroying")
		DisableAddOn("TradeSkillMaster_ItemTracker")
		DisableAddOn("TradeSkillMaster_Mailing")
		DisableAddOn("TradeSkillMaster_Shopping")
		DisableAddOn("TradeSkillMaster_Warehousing")
		DisableAddOn("TradeSkillMaster_WoWuction")
		DEFAULT_CHAT_FRAME:AddMessage(L_MENUBAR_TSM_DISABLED, r, g, b)
	else
		EnableAddOn("TradeSkillMaster")
		EnableAddOn("TradeSkillMaster_Accounting")
		EnableAddOn("TradeSkillMaster_Additions")
		EnableAddOn("TradeSkillMaster_AuctionDB")
		EnableAddOn("TradeSkillMaster_Auctioning")
		EnableAddOn("TradeSkillMaster_Crafting")
		EnableAddOn("TradeSkillMaster_Destroying")
		EnableAddOn("TradeSkillMaster_ItemTracker")
		EnableAddOn("TradeSkillMaster_Mailing")
		EnableAddOn("TradeSkillMaster_Shopping")
		EnableAddOn("TradeSkillMaster_Warehousing")
		EnableAddOn("TradeSkillMaster_WoWuction")		
		DEFAULT_CHAT_FRAME:AddMessage(L_MENUBAR_TSM_ENABLED, r, g, b)
	end
end)

--[[addButton("Toggle damage meter", POSITION_RIGHT, function()
	if IsAddOnLoaded("alDamageMeter") then
		DisableAddOn("alDamageMeter")
		DEFAULT_CHAT_FRAME:AddMessage("FreeUI: |cffffffffalDamageMeter disabled. Type|r /rl |cfffffffffor the changes to apply.|r", r, g, b)
	else
		EnableAddOn("alDamageMeter")
		LoadAddOn("alDamageMeter")
		if IsAddOnLoaded("alDamageMeter") then
			DEFAULT_CHAT_FRAME:AddMessage("FreeUI: |cffffffffalDamageMeter loaded.|r", r, g, b)
		else
			DEFAULT_CHAT_FRAME:AddMessage("FreeUI: |cffffffffalDamageMeter not found!|r", r, g, b)
		end
	end
end)]]

local specButton = addButton("No specialization", POSITION_RIGHT, function()
	SetActiveSpecGroup(3 - GetActiveSpecGroup())
end)

specButton:RegisterEvent("PLAYER_LOGIN")
specButton:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
specButton:SetScript("OnEvent", function(self)
	if GetNumSpecGroups() >= 2 then
		local currentSpec = GetSpecialization()

		if currentSpec then
			local _, name = GetSpecializationInfo(currentSpec)
			if name then
				self.Text:SetText(format("%d - %s", GetActiveSpecGroup(), name))
				showButton(self)
			end
		end
	else
		hideButton(self)
	end
end)
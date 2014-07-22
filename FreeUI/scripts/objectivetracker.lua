local F, C, L = unpack(select(2, ...))

local ot = ObjectiveTrackerFrame

local function moveTracker()
	local xCoord, yAnchor

	if MultiBarLeft:IsShown() then
		xCoord = -85
	elseif MultiBarRight:IsShown() then
		xCoord = -55
	else
		xCoord = -17
	end

	yAnchor = VehicleSeatIndicator:IsShown() and VehicleSeatIndicator or Minimap

	ot:ClearAllPoints()
	ot:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", xCoord, -160)
	ot:SetPoint("BOTTOM", yAnchor, "TOP", 0, 10)
end

hooksecurefunc(ot, "SetPoint", function(_, _, _, point)
	if point == "BOTTOMRIGHT" then
		moveTracker()
	end
end)

hooksecurefunc(VehicleSeatIndicator, "SetPoint", function(_, _, anchor)
	if anchor ~= Minimap then
		VehicleSeatIndicator:ClearAllPoints()
		VehicleSeatIndicator:SetPoint("BOTTOM", Minimap, "TOP", 0, 20)
	end
end)

local minimizeButton = ot.HeaderMenu.MinimizeButton

F.ReskinExpandOrCollapse(minimizeButton)
minimizeButton:SetSize(15, 15)
minimizeButton:SetPoint("TOPRIGHT", -12, 0)
minimizeButton.plus:Hide()

hooksecurefunc("ObjectiveTracker_Collapse", function()
	minimizeButton.plus:Show()
end)
hooksecurefunc("ObjectiveTracker_Expand", function()
	minimizeButton.plus:Hide()
end)

F.SetFS(ot.BlocksFrame.QuestHeader.Text)
F.SetFS(ot.BlocksFrame.AchievementHeader.Text)
F.SetFS(ot.BlocksFrame.ScenarioHeader.Text)

hooksecurefunc("ObjectiveTracker_AddBlock", function(block)
	if not block.styled then
		F.SetFS(block.HeaderText)

		-- for _, line in block.lines do
			-- F.SetFS(line.Text)
			-- F.SetFS(line.Dext)
			-- line.Text:SetSpacing(2)
		-- end

		block.styled = true
	end
end)

-- local index = 1
-- local itemIndex = 1

-- hooksecurefunc("ObjectiveTracker_Update", function()
	-- local line = _G["WatchFrameLine"..index]
	-- while line do
		-- F.SetFS(line.text)
		-- F.SetFS(line.dash)
		-- line.text:SetSpacing(2)

		-- line.text:ClearAllPoints()
		-- line.text:SetPoint("LEFT", line.dash, "RIGHT", -2, 3)

		-- index = index + 1
		-- line = _G["WatchFrameLine"..index]
	-- end

	-- local bu = _G["WatchFrameItem"..itemIndex]
	-- while bu do
		-- local hotkey = _G["WatchFrameItem"..itemIndex.."HotKey"]

		-- bu:SetNormalTexture("")
		-- bu:SetPushedTexture("")
		-- F.CreateBG(bu)

		-- _G["WatchFrameItem"..itemIndex.."IconTexture"]:SetTexCoord(.08, .92, .08, .92)

		-- hotkey:ClearAllPoints()
		-- hotkey:SetPoint("TOP", bu, -1, 0)
		-- F.SetFS(hotkey)
		-- hotkey:SetJustifyH("CENTER")

		-- itemIndex = itemIndex + 1
		-- bu = _G["WatchFrameItem"..itemIndex]
	-- end
-- end)
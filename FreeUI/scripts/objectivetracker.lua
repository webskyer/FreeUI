local F, C, L = unpack(select(2, ...))

local ot = ObjectiveTrackerFrame
local BlocksFrame = ot.BlocksFrame

-- [[ Positioning ]]

local function moveTracker()
	local xCoord, yAnchor

	if MultiBarLeft:IsShown() then
		xCoord = -84
	elseif MultiBarRight:IsShown() then
		xCoord = -57
	else
		xCoord = -30
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

-- [[ Header ]]

-- Header

F.SetFS(ot.HeaderMenu.Title)

-- Minimize button

local minimizeButton = ot.HeaderMenu.MinimizeButton

F.ReskinExpandOrCollapse(minimizeButton)
minimizeButton:SetSize(15, 15)
minimizeButton.plus:Hide()

hooksecurefunc("ObjectiveTracker_Collapse", function()
	minimizeButton.plus:Show()
end)
hooksecurefunc("ObjectiveTracker_Expand", function()
	minimizeButton.plus:Hide()
end)

-- [[ Blocks and lines ]]

DEFAULT_OBJECTIVE_TRACKER_MODULE.lineSpacing = 6
DEFAULT_OBJECTIVE_TRACKER_MODULE.blockOffsetY = -11

for _, headerName in pairs({"QuestHeader", "AchievementHeader", "ScenarioHeader"}) do
	local header = BlocksFrame[headerName]

	header.Background:Hide()
	F.SetFS(header.Text)
end

hooksecurefunc(DEFAULT_OBJECTIVE_TRACKER_MODULE, "SetBlockHeader", function(_, block)
	if not block.headerStyled then
		F.SetFS(block.HeaderText)
		block.height = block.HeaderText:GetHeight()

		block.headerStyled = true
	end
end)

hooksecurefunc(QUEST_TRACKER_MODULE, "SetBlockHeader", function(_, block)
	if not block.headerStyled then
		F.SetFS(block.HeaderText)
		block.height = block.HeaderText:GetHeight()

		block.headerStyled = true
	end

	local itemButton = block.itemButton

	if itemButton and not itemButton.styled then
		itemButton:SetNormalTexture("")
		itemButton:SetPushedTexture("")

		itemButton.HotKey:ClearAllPoints()
		itemButton.HotKey:SetPoint("TOP", itemButton, -1, 0)
		itemButton.HotKey:SetJustifyH("CENTER")
		F.SetFS(itemButton.HotKey)

		itemButton.icon:SetTexCoord(.08, .92, .08, .92)
		F.CreateBG(itemButton)

		itemButton.styled = true
	end
end)

hooksecurefunc("ObjectiveTracker_AddBlock", function(block)
	-- to adjust for line text possibly taking up more or less lines
	local heightDiff = 0

	if block.lines then
		for _, line in pairs(block.lines) do
			if not line.styled then
				heightDiff = heightDiff - line:GetHeight()

				F.SetFS(line.Text)
				F.SetFS(line.Dash)
				line.Text:SetSpacing(2)

				line:SetHeight(line.Text:GetHeight())

				heightDiff = heightDiff + line:GetHeight()

				line.styled = true
			end
		end
	end

	-- blocks without .HeaderText or .lines seem to always have .height = 0
	if block.height ~= 0 and heightDiff ~= 0 then
		block.height = block.height + heightDiff
		block:SetHeight(block.height)
	end
end)
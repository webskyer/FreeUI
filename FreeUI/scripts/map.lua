-- Map search function by Wildbreath

local F, C, L = unpack(select(2, ...))

local r, g, b = unpack(C.class)

local offset = 1 / WORLDMAP_WINDOWED_SIZE

-- restyle map frame

local BorderFrame = WorldMapFrame.BorderFrame

BorderFrame.Bg:Hide()
select(2, BorderFrame:GetRegions()):Hide()
BorderFrame.portrait:SetTexture()
BorderFrame.portraitFrame:SetTexture()
for i = 5, 7 do
	select(i, BorderFrame:GetRegions()):Hide()
end
BorderFrame.TopTileStreaks:SetTexture("")
for i = 10, 14 do
	select(i, BorderFrame:GetRegions()):Hide()
end
BorderFrame.ButtonFrameEdge:Hide()
BorderFrame.InsetBorderTop:Hide()
BorderFrame.Inset.Bg:Hide()
BorderFrame.Inset:DisableDrawLayer("BORDER")

F.CreateBD(BorderFrame)
F.ReskinClose(BorderFrame.CloseButton)

WorldMapFrameTutorialButton.Ring:Hide()
WorldMapFrameTutorialButton:SetPoint("TOPLEFT", WorldMapFrame, "TOPLEFT", -12, 12)

-- nav bar

WorldMapFrameNavBar:GetRegions():Hide()
WorldMapFrameNavBar:DisableDrawLayer("BORDER")
WorldMapFrameNavBar.overlay:Hide()
WorldMapFrameNavBarHomeButtonLeft:Hide()
F.Reskin(WorldMapFrameNavBar.home)

-- quest frame

F.Reskin(QuestScrollFrame.ViewAll)

-- fix ping

select(2, WorldMapPing.Ping:GetAnimations()):SetScale(1.62, 1.62)

WorldMapPing.Ping:SetScript("OnLoop", function(self, loopState)
	self.loopCount = self.loopCount + 1
	if self.loopCount >= 2 then
		self:Stop()
	end
end)

WorldMapPlayerUpper:EnableMouse(false)
WorldMapPlayerLower:EnableMouse(false)

-- frames

local frame = CreateFrame ("Frame", nil, WorldMapButton)
frame:SetScale(offset)
frame:SetFrameStrata("HIGH")


-- map style function

local SmallerMapSkin = function()
	local fontsize = C.appearance.fontSizeNormal / WORLDMAP_WINDOWED_SIZE

	WorldMapFrame:ClearAllPoints()
	WorldMapFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
	-- WorldMapTitleButton:Show()

	WorldMapLevelDropDown:ClearAllPoints()
	WorldMapLevelDropDown:SetPoint("RIGHT", panel, "RIGHT", 0, -2)
	WorldMapLevelDropDown:SetParent(panel)

	MapBarFrame.Description:SetFont(C.media.font, fontsize, "OUTLINEMONOCHROME")
	MapBarFrame.Description:SetShadowOffset(0, 0)
	MapBarFrame.Title:SetFont(C.media.font, fontsize, "OUTLINEMONOCHROME")
	MapBarFrame.Title:SetShadowOffset(0, 0)

	WorldMapPing:SetSize(64 / offset, 64 / offset)
	WorldMapPing.centerRing:SetSize(32 / offset, 32 / offset)
	WorldMapPing.rotatingRing:SetSize(48 / offset, 48 / offset)
	WorldMapPing.expandingRing:SetSize(32 / offset, 32 / offset)

	WorldMapPlayerLower:SetSize(32 / offset, 32 / offset)
	WorldMapPlayerLower.icon:SetPoint("TOPLEFT", -4, 4)
	WorldMapPlayerLower.icon:SetPoint("BOTTOMRIGHT", 4, -4)

	WorldMapPlayerUpper:SetSize(32 / offset, 32 / offset)
	WorldMapPlayerUpper.icon:SetPoint("TOPLEFT", -4, 4)
	WorldMapPlayerUpper.icon:SetPoint("BOTTOMRIGHT", 4, -4)
end
hooksecurefunc("WorldMap_ToggleSizeDown", function() SmallerMapSkin() end)

-- coordinates

local coords = F.CreateFS(frame)
coords:SetPoint("BOTTOMLEFT", WorldMapDetailFrame, 8, 4)
local cursorcoords = F.CreateFS(frame)
cursorcoords:SetPoint("BOTTOMLEFT", coords, "TOPLEFT", 0, 4)

local freq = C.performance.mapcoords
local last = 0

WorldMapDetailFrame:HookScript("OnUpdate", function(self, elapsed)
	last = last + elapsed
	if last >= freq then
		local x, y = GetPlayerMapPosition("player")
		x = math.floor(100 * x)
		y = math.floor(100 * y)
		if x ~= 0 and y ~= 0 then
			coords:SetText(PLAYER..": "..x..", "..y)
		else
			coords:SetText("")
		end

		local scale = WorldMapDetailFrame:GetEffectiveScale()
		local width = WorldMapDetailFrame:GetWidth()
		local height = WorldMapDetailFrame:GetHeight()
		local centerX, centerY = WorldMapDetailFrame:GetCenter()
		local x, y = GetCursorPosition()
		local adjustedX = (x / scale - (centerX - (width/2))) / width
		local adjustedY = (centerY + (height/2) - y / scale) / height

		if (adjustedX >= 0  and adjustedY >= 0 and adjustedX <= 1 and adjustedY <= 1) then
			adjustedX = math.floor(100 * adjustedX)
			adjustedY = math.floor(100 * adjustedY)
			cursorcoords:SetText(MOUSE_LABEL..": "..adjustedX..", "..adjustedY)
		else
			cursorcoords:SetText(" ")
		end

		last = 0
	end
end)

-- map search

-- local editbox = CreateFrame("EditBox", "MapSearchBox", WorldMapFrame, "SearchBoxTemplate")
-- editbox:SetAutoFocus(false)
-- editbox:SetSize(150, 20)
-- editbox:SetPoint("CENTER", panel)
-- F.SetFS(editbox)
-- editbox:SetShadowOffset(0, 0)
-- editbox:SetParent(panel)

-- editbox.db = {}
-- for i=1, select("#", GetMapContinents()), 1 do
	-- local zonesdb = {}
	-- for j=1, select("#", GetMapZones(i)), 1 do
		-- tinsert(zonesdb, {id=j, name=select(j, GetMapZones(i))})
	-- end
	-- tinsert(editbox.db, {id=i, name=select(i, GetMapContinents()), zones = zonesdb })
-- end

-- editbox:SetScript("OnHide", BagSearch_OnHide)

-- editbox:SetScript("OnTextChanged", function(self)
	-- local searchdata = self:GetText()
	-- if searchdata == "" then return end
	-- for i, v in pairs(self.db) do
		-- if v.name:lower():find(searchdata:lower()) then
			-- SetMapZoom(v.id)
			-- return
		-- end
		-- for j, k in pairs(v.zones) do
			-- if k.name:lower():find(searchdata:lower()) then
				-- SetMapZoom(v.id, k.id)
				-- return
			-- end
		-- end
	-- end
-- end)
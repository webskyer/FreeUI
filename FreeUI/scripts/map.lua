local F, C, L = unpack(select(2, ...))

-- twice is enough
WorldMapPing.Ping:SetScript("OnLoop", function(self, loopState)
	self.loopCount = self.loopCount + 1
	if self.loopCount >= 2 then
		self:Stop()
	end
end)

-- don't need this
WorldMapPlayerUpper:EnableMouse(false)
WorldMapPlayerLower:EnableMouse(false)

-- map style function

local SmallerMapSkin = function()
	local fontsize = C.appearance.fontSizeNormal / WORLDMAP_WINDOWED_SIZE

	WorldMapFrame:ClearAllPoints()
	WorldMapFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)

	MapBarFrame.Description:SetFont(C.media.font, fontsize, "OUTLINEMONOCHROME")
	MapBarFrame.Description:SetShadowOffset(0, 0)
	MapBarFrame.Title:SetFont(C.media.font, fontsize, "OUTLINEMONOCHROME")
	MapBarFrame.Title:SetShadowOffset(0, 0)
end
hooksecurefunc("WorldMap_ToggleSizeDown", function() SmallerMapSkin() end)

-- coordinates

local UIFrame = WorldMapFrame.UIElementsFrame

local coords = F.CreateFS(UIFrame, C.FONT_SIZE_NORMAL, "LEFT")
coords:SetPoint("BOTTOMLEFT", UIFrame, 5, 5)
local cursorcoords = F.CreateFS(UIFrame, C.FONT_SIZE_NORMAL, "LEFT")
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
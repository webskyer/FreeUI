local F, C, L = unpack(select(2, ...))

----------------------------------------------------------------------------------------
--	Chat options
----------------------------------------------------------------------------------------
C["chat"] = {
	["enable"] = true,							-- Enable chat
	["background"] = false,						-- Enable background for chat
	
	-- ["background_alpha"] = 0.7,					-- Background alpha
	-- ["filter"] = true,							-- Removing some systems spam("Player1" won duel "Player2")
	-- ["spam"] = false,							-- Removing some players spam(gold/portals/etc)
	-- ["width"] = 16,								-- Chat width
	-- ["height"] = 135,							-- Chat height
	
	["chat_bar"] = true,						-- Lite Button Bar for switch chat channel
	["chat_bar_mouseover"] = false,				-- Lite Button Bar on mouseover
	
	-- ["time_color"] = {1, 1, 0},					-- Timestamp coloring(http://www.december.com/html/spec/colorcodescompact.html)
	-- ["whisp_sound"] = true,						-- Sound when whisper
	-- ["bubbles"] = true,							-- Skin Blizzard chat bubbles
	-- ["combatlog"] = true,						-- Show CombatLog tab
	-- ["tabs_mouseover"] = true,					-- Chat tabs on mouseover
	-- ["sticky"] = true,							-- Remember last channel
	-- ["damage_meter_spam"] = true,				-- Merge damage meter spam in one line-link
}


if C.chat.enable ~= true or C.chat.chat_bar ~= true then return end
----------------------------------------------------------------------------------------
--	ChatBar(FavChatBar by Favorit)
----------------------------------------------------------------------------------------
local frame = CreateFrame("Frame", "ChatBar", UIParent)
frame:SetSize(16, 135)
-- F.CreateBD(frame)
frame:SetPoint("RIGHT", ChatFrame1, "LEFT",-10,-2)
frame:Show()
if C.chat.chat_bar_mouseover == true then
	frame:SetAlpha(0)
	frame:SetScript("OnEnter", function()
		frame:FadeIn()
	end)
	frame:SetScript("OnLeave", function()
		frame:FadeOut()
	end)
end

local function CreateButton(b, l, r, m)
	b:SetWidth(16)
	b:SetHeight(16)

	local mult = F.mult
	b:SetBackdrop({
		bgFile = C.media.texture, edgeFile = C.media.texture, edgeSize = mult,
		insets = {left = -mult, right = -mult, top = -mult, bottom = -mult}
	})
	b:SetBackdropBorderColor(C.r, C.g, C.b, 1)
	
	b:RegisterForClicks("AnyUp")
	b:SetScript("OnClick", function(self, b)
		if b == "LeftButton" then
			ChatFrame_OpenChat(l, SELECTED_DOCK_FRAME)
		elseif b == "RightButton" then
			ChatFrame_OpenChat(r, SELECTED_DOCK_FRAME)
		elseif m and b == "MiddleButton" then
			ChatFrame_OpenChat(m, SELECTED_DOCK_FRAME)
		end
	end)

	if C.chat.chat_bar_mouseover == true then
		b:SetScript("OnEnter", function()
			frame:FadeIn()
		end)
		b:SetScript("OnLeave", function()
			frame:FadeOut()
		end)
	end

	b.t = b:CreateTexture(nil, "ARTWORK")
	b.t:SetTexture(C.media.texture)
	b.t:SetPoint("TOPLEFT", b, "TOPLEFT", 2, -2)
	b.t:SetPoint("BOTTOMRIGHT", b, "BOTTOMRIGHT", -2, 2)
end

local function CharBarsInit()
	local b1 = CreateFrame("Button", "$parentButton1", frame)
	CreateButton(b1, "/s", "/5 ", "/y")
	b1:SetPoint("TOP", frame, "TOP", 0, 0)
	b1:SetBackdropBorderColor(0.7, 0.33, 0.82, 1)
	b1.t:SetVertexColor(0.8, 0.8, 0.8, 1)


	local b2 = CreateFrame("Button", "$parentButton2", frame)
	CreateButton(b2, "/g", "/o")
	b2:SetPoint("TOP", b1, "BOTTOM", 0, C.chat.background and -4 or -3)
	b2:SetBackdropBorderColor(0, 0.54, 0, 1)
	b2.t:SetVertexColor(0, 0.8, 0, 1)

	local b3 = CreateFrame("Button", "$parentButton3", frame)
	CreateButton(b3, "/p", "/i")
	b3:SetPoint("TOP", b2, "BOTTOM", 0, C.chat.background and -4 or -3)
	b3:SetBackdropBorderColor(0.8, 0.4, 0.1, 1)
	b3.t:SetVertexColor(0.11, 0.5, 0.7, 1)

	local b4 = CreateFrame("Button", "$parentButton4", frame)
	CreateButton(b4, "/ra", "/rw")
	b4:SetPoint("TOP", b3, "BOTTOM", 0, C.chat.background and -4 or -3)
	b4:SetBackdropBorderColor(0.96, 0.2, 0.2, 1)
	b4.t:SetVertexColor(1, 0.3, 0, 1)

	local b5 = CreateFrame("Button", "$parentButton5", frame)
	CreateButton(b5, "/1", "/2")
	b5:SetPoint("TOP", b4, "BOTTOM", 0, C.chat.background and -4 or -3)
	b5:SetBackdropBorderColor(0.7, 0.7, 0, 1)
	b5.t:SetVertexColor(0.93, 0.8, 0.8, 1)

	local b6 = CreateFrame("Button", "$parentButton6", frame)
	CreateButton(b6, "/dbm pull 8", "/8")	---原版	(b6, "/3", "/4")
	b6:SetPoint("TOP", b5, "BOTTOM", 0, C.chat.background and -4 or -3)
	b6:SetBackdropBorderColor(0.5, 1, 0.83, 1)
	b6.t:SetVertexColor(1, 0.75, 0.75, 1)

	local RFrame = CreateFrame("Frame", nil, UIParent) 
	RFrame:SetWidth(16) 
	RFrame:SetHeight(16) 
	RFrame:SetBackdrop({ 
	bgFile = "Interface\\AddOns\\addonskin\\Media\\glowTex", 
	insets = {left = 1,right = 1,top = 1,bottom = 1}, 
	-- edgeFile = "Interface\\Buttons\\WHITE8x8", 
	edgeFile = C.media.texture, 
	edgeSize = 1, 
	})
	RFrame:SetBackdropColor(0, 0, 0, 0) 
	RFrame:SetBackdropBorderColor(255/255, 215/255, 0, 1) 
	RFrame:SetPoint("BOTTOM",ChatBar,"BOTTOM",0,6)

	local roll = CreateFrame("Button", "rollMacro", UIParent, "SecureActionButtonTemplate")
	roll:SetAttribute("*type*", "macro")
	roll:SetAttribute("macrotext", "/roll")
	roll:SetWidth(16);roll:SetHeight(16);roll:SetPoint("CENTER",RFrame,"CENTER",1,0);

	rollText =roll:CreateFontString("ROLLText", "OVERLAY")
	rollText:SetFont(GameTooltipText:GetFont(), 14, "OUTLINE")
	rollText:SetJustifyH("CENTER")
	rollText:SetWidth(16)
	rollText:SetHeight(16)
	rollText:SetText("R")
	rollText:SetPoint("CENTER", 0, 0)
	rollText:SetTextColor(255/255, 215/255, 0)
end 

F.RegisterEvent("PLAYER_ENTERING_WORLD", CharBarsInit)
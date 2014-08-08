local F, C, L = unpack(select(2, ...))

if IsAddOnLoaded("Aurora") then
	print("FreeUI includes an efficient built-in version of Aurora.")
	print("It's highly recommended that you disable Aurora.")
	return
end

local r, g, b = unpack(C.class)
local _, class = UnitClass("player")

C.themes = {}
C.themes["FreeUI"] = {}

local Skin = CreateFrame("Frame", nil, UIParent)
Skin:RegisterEvent("ADDON_LOADED")
Skin:SetScript("OnEvent", function(self, event, addon)
	-- [[ Load modules ]]

	local addonModule = C.themes[addon]
	if addonModule then
		if type(addonModule) == "function" then
			addonModule()
		else
			for _, moduleFunc in pairs(addonModule) do
				moduleFunc()
			end
		end
	end

	if addon == "FreeUI" then

		-- [[ Headers ]]

		local header = {"GameMenuFrame", "InterfaceOptionsFrame", "AudioOptionsFrame", "VideoOptionsFrame", "ChatConfigFrame", "ColorPickerFrame"}
		for i = 1, #header do
		local title = _G[header[i].."Header"]
			if title then
				title:SetTexture("")
				title:ClearAllPoints()
				if title == _G["GameMenuFrameHeader"] then
					title:SetPoint("TOP", GameMenuFrame, 0, 7)
				else
					title:SetPoint("TOP", header[i], 0, 0)
				end
			end
		end

		-- [[ Simple backdrops ]]

		local bds = {"AutoCompleteBox", "TicketStatusFrameButton", "FriendsTooltip", "GearManagerDialogPopup", "RaidInfoFrame", "ScrollOfResurrectionSelectionFrame", "ScrollOfResurrectionFrame", "VoiceChatTalkers", "ReportPlayerNameDialog", "ReportCheatingDialog"}

		for i = 1, #bds do
			local bd = _G[bds[i]]
			if bd then
				F.CreateBD(bd)
			else
				print("FreeUI: "..bds[i].." was not found.")
			end
		end

		local lightbds = {"SecondaryProfession1", "SecondaryProfession2", "SecondaryProfession3", "SecondaryProfession4", "ChatConfigChatSettingsClassColorLegend", "ChatConfigChannelSettingsClassColorLegend", "FriendsFriendsList", "HelpFrameTicketScrollFrame", "HelpFrameGM_ResponseScrollFrame1", "HelpFrameGM_ResponseScrollFrame2", "FriendsFriendsNoteFrame", "AddFriendNoteFrame", "ScrollOfResurrectionSelectionFrameList", "HelpFrameReportBugScrollFrame", "HelpFrameSubmitSuggestionScrollFrame", "ReportPlayerNameDialogCommentFrame", "ReportCheatingDialogCommentFrame"}
		for i = 1, #lightbds do
			local bd = _G[lightbds[i]]
			if bd then
				F.CreateBD(bd, .25)
			else
				print("FreeUI: "..lightbds[i].." was not found.")
			end
		end

		-- [[ Scroll bars ]]

		local scrollbars = {"CharacterStatsPaneScrollBar", "LFDQueueFrameSpecificListScrollFrameScrollBar", "HelpFrameKnowledgebaseScrollFrameScrollBar", "HelpFrameReportBugScrollFrameScrollBar", "HelpFrameSubmitSuggestionScrollFrameScrollBar", "HelpFrameTicketScrollFrameScrollBar", "PaperDollTitlesPaneScrollBar", "PaperDollEquipmentManagerPaneScrollBar", "SendMailScrollFrameScrollBar", "OpenMailScrollFrameScrollBar", "RaidInfoScrollFrameScrollBar", "ChannelRosterScrollFrameScrollBar", "FriendsFriendsScrollFrameScrollBar", "HelpFrameGM_ResponseScrollFrame1ScrollBar", "HelpFrameGM_ResponseScrollFrame2ScrollBar", "HelpFrameKnowledgebaseScrollFrame2ScrollBar", "WhoListScrollFrameScrollBar", "GearManagerDialogPopupScrollFrameScrollBar", "LFDQueueFrameRandomScrollFrameScrollBar", "BCMCopyScrollScrollBar", "ScrollOfResurrectionSelectionFrameListScrollFrameScrollBar"}
		for i = 1, #scrollbars do
			local scrollbar = _G[scrollbars[i]]
			if scrollbar then
				F.ReskinScroll(scrollbar)
			else
				print("FreeUI: "..scrollbars[i].." was not found.")
			end
		end

		-- [[ Dropdowns ]]

		for _, dropdown in pairs({"LFDQueueFrameTypeDropDown", "WhoFrameDropDown", "FriendsFriendsFrameDropDown", "RaidFinderQueueFrameSelectionDropDown", "Advanced_GraphicsAPIDropDown"}) do
			F.ReskinDropDown(_G[dropdown])
		end

		-- [[ Input frames ]]

		for _, input in pairs({"AddFriendNameEditBox", "GearManagerDialogPopupEditBox", "HelpFrameKnowledgebaseSearchBox", "ChannelFrameDaughterFrameChannelName", "ChannelFrameDaughterFrameChannelPassword", "ScrollOfResurrectionSelectionFrameTargetEditBox", "ScrollOfResurrectionFrameNoteFrame", "FriendsFrameBroadcastInput"}) do
			F.ReskinInput(_G[input])
		end

		-- [[ Arrows ]]

		F.ReskinArrow(SpellBookPrevPageButton, "left")
		F.ReskinArrow(SpellBookNextPageButton, "right")
		F.ReskinArrow(InboxPrevPageButton, "left")
		F.ReskinArrow(InboxNextPageButton, "right")
		F.ReskinArrow(MerchantPrevPageButton, "left")
		F.ReskinArrow(MerchantNextPageButton, "right")
		F.ReskinArrow(CharacterFrameExpandButton, "left")
		F.ReskinArrow(TabardCharacterModelRotateLeftButton, "left")
		F.ReskinArrow(TabardCharacterModelRotateRightButton, "right")

		hooksecurefunc("CharacterFrame_Expand", function()
			CharacterFrameExpandButton.tex:SetTexture(C.media.arrowLeft)
		end)

		hooksecurefunc("CharacterFrame_Collapse", function()
			CharacterFrameExpandButton.tex:SetTexture(C.media.arrowRight)
		end)

		-- [[ Radio buttons ]]

		local radiobuttons = {"ReportPlayerNameDialogPlayerNameCheckButton", "ReportPlayerNameDialogGuildNameCheckButton", "SendMailSendMoneyButton", "SendMailCODButton"}
		for i = 1, #radiobuttons do
			local radiobutton = _G[radiobuttons[i]]
			if radiobutton then
				F.ReskinRadio(radiobutton)
			else
				print("FreeUI: "..radiobuttons[i].." was not found.")
			end
		end

		-- [[ Backdrop frames ]]

		F.SetBD(DressUpFrame, 10, -12, -34, 74)
		F.SetBD(HelpFrame)
		F.SetBD(RaidParentFrame)

		local FrameBDs = {"GameMenuFrame", "InterfaceOptionsFrame", "VideoOptionsFrame", "AudioOptionsFrame", "ChatConfigFrame", "StackSplitFrame", "AddFriendFrame", "FriendsFriendsFrame", "ColorPickerFrame", "ReadyCheckFrame", "GuildInviteFrame", "ChannelFrameDaughterFrame"}
		for i = 1, #FrameBDs do
			local FrameBD = _G[FrameBDs[i]]
			F.CreateBD(FrameBD)
		end

		-- Dropdown lists

		hooksecurefunc("UIDropDownMenu_CreateFrames", function(level, index)
			for i = 1, UIDROPDOWNMENU_MAXLEVELS do
				local menu = _G["DropDownList"..i.."MenuBackdrop"]
				local backdrop = _G["DropDownList"..i.."Backdrop"]
				if not backdrop.reskinned then
					F.CreateBD(menu)
					F.CreateBD(backdrop)
					backdrop.reskinned = true
				end
			end
		end)

		local createBackdrop = function(parent, texture)
			local bg = parent:CreateTexture(nil, "BACKGROUND")
			bg:SetTexture(0, 0, 0, .5)
			bg:SetPoint("CENTER", texture)
			bg:SetSize(12, 12)
			parent.bg = bg

			local left = parent:CreateTexture(nil, "BACKGROUND")
			left:SetWidth(1)
			left:SetTexture(0, 0, 0)
			left:SetPoint("TOPLEFT", bg)
			left:SetPoint("BOTTOMLEFT", bg)
			parent.left = left

			local right = parent:CreateTexture(nil, "BACKGROUND")
			right:SetWidth(1)
			right:SetTexture(0, 0, 0)
			right:SetPoint("TOPRIGHT", bg)
			right:SetPoint("BOTTOMRIGHT", bg)
			parent.right = right

			local top = parent:CreateTexture(nil, "BACKGROUND")
			top:SetHeight(1)
			top:SetTexture(0, 0, 0)
			top:SetPoint("TOPLEFT", bg)
			top:SetPoint("TOPRIGHT", bg)
			parent.top = top

			local bottom = parent:CreateTexture(nil, "BACKGROUND")
			bottom:SetHeight(1)
			bottom:SetTexture(0, 0, 0)
			bottom:SetPoint("BOTTOMLEFT", bg)
			bottom:SetPoint("BOTTOMRIGHT", bg)
			parent.bottom = bottom
		end

		local toggleBackdrop = function(bu, show)
			if show then
				bu.bg:Show()
				bu.left:Show()
				bu.right:Show()
				bu.top:Show()
				bu.bottom:Show()
			else
				bu.bg:Hide()
				bu.left:Hide()
				bu.right:Hide()
				bu.top:Hide()
				bu.bottom:Hide()
			end
		end

		hooksecurefunc("ToggleDropDownMenu", function(level, _, dropDownFrame, anchorName)
			if not level then level = 1 end

			local uiScale = UIParent:GetScale()

			local listFrame = _G["DropDownList"..level]

			if level == 1 then
				if not anchorName then
					local xOffset = dropDownFrame.xOffset and dropDownFrame.xOffset or 16
					local yOffset = dropDownFrame.yOffset and dropDownFrame.yOffset or 9
					local point = dropDownFrame.point and dropDownFrame.point or "TOPLEFT"
					local relativeTo = dropDownFrame.relativeTo and dropDownFrame.relativeTo or dropDownFrame
					local relativePoint = dropDownFrame.relativePoint and dropDownFrame.relativePoint or "BOTTOMLEFT"

					listFrame:ClearAllPoints()
					listFrame:SetPoint(point, relativeTo, relativePoint, xOffset, yOffset)

					-- make sure it doesn't go off the screen
					local offLeft = listFrame:GetLeft()/uiScale
					local offRight = (GetScreenWidth() - listFrame:GetRight())/uiScale
					local offTop = (GetScreenHeight() - listFrame:GetTop())/uiScale
					local offBottom = listFrame:GetBottom()/uiScale

					local xAddOffset, yAddOffset = 0, 0
					if offLeft < 0 then
						xAddOffset = -offLeft
					elseif offRight < 0 then
						xAddOffset = offRight
					end

					if offTop < 0 then
						yAddOffset = offTop
					elseif offBottom < 0 then
						yAddOffset = -offBottom
					end
					listFrame:ClearAllPoints()
					listFrame:SetPoint(point, relativeTo, relativePoint, xOffset + xAddOffset, yOffset + yAddOffset)
				elseif anchorName ~= "cursor" then
					-- this part might be a bit unreliable
					local _, _, relPoint, xOff, yOff = listFrame:GetPoint()
					if relPoint == "BOTTOMLEFT" and xOff == 0 and floor(yOff) == 5 then
						listFrame:SetPoint("TOPLEFT", anchorName, "BOTTOMLEFT", 16, 9)
					end
				end
			else
				local point, anchor, relPoint, _, y = listFrame:GetPoint()
				if point:find("RIGHT") then
					listFrame:SetPoint(point, anchor, relPoint, -14, y)
				else
					listFrame:SetPoint(point, anchor, relPoint, 9, y)
				end
			end

			for j = 1, UIDROPDOWNMENU_MAXBUTTONS do
				local bu = _G["DropDownList"..level.."Button"..j]
				local _, _, _, x = bu:GetPoint()
				if bu:IsShown() and x then
					local hl = _G["DropDownList"..level.."Button"..j.."Highlight"]
					local check = _G["DropDownList"..level.."Button"..j.."Check"]

					hl:SetPoint("TOPLEFT", -x + 1, 0)
					hl:SetPoint("BOTTOMRIGHT", listFrame:GetWidth() - bu:GetWidth() - x - 1, 0)

					if not bu.bg then
						createBackdrop(bu, check)
						hl:SetTexture(r, g, b, .2)
						_G["DropDownList"..level.."Button"..j.."UnCheck"]:SetTexture("")

						local arrow = _G["DropDownList"..level.."Button"..j.."ExpandArrow"]
						arrow:SetNormalTexture(C.media.arrowRight)
						arrow:SetSize(8, 8)
					end

					if not bu.notCheckable then
						toggleBackdrop(bu, true)

						-- only reliable way to see if button is radio or or check...
						local _, co = check:GetTexCoord()

						if co == 0 then
							check:SetTexture("Interface\\Buttons\\UI-CheckBox-Check")
							check:SetVertexColor(r, g, b, 1)
							check:SetSize(20, 20)
							check:SetDesaturated(true)
						else
							check:SetTexture(C.media.backdrop)
							check:SetVertexColor(r, g, b, .6)
							check:SetSize(10, 10)
							check:SetDesaturated(false)
						end

						check:SetTexCoord(0, 1, 0, 1)
					else
						toggleBackdrop(bu, false)
					end
				end
			end
		end)

		-- Tab text position

		hooksecurefunc("PanelTemplates_DeselectTab", function(tab)
			_G[tab:GetName().."Text"]:SetPoint("CENTER", tab, "CENTER")
		end)

		hooksecurefunc("PanelTemplates_SelectTab", function(tab)
			_G[tab:GetName().."Text"]:SetPoint("CENTER", tab, "CENTER")
		end)

		-- [[ Custom skins ]]

		-- Pet stuff

		if class == "HUNTER" or class == "MAGE" or class == "DEATHKNIGHT" or class == "WARLOCK" then
			if class == "HUNTER" then
				PetStableBottomInset:DisableDrawLayer("BACKGROUND")
				PetStableBottomInset:DisableDrawLayer("BORDER")
				PetStableLeftInset:DisableDrawLayer("BACKGROUND")
				PetStableLeftInset:DisableDrawLayer("BORDER")
				PetStableModelShadow:Hide()
				PetStableModelRotateLeftButton:Hide()
				PetStableModelRotateRightButton:Hide()
				PetStableFrameModelBg:Hide()
				PetStablePrevPageButtonIcon:SetTexture("")
				PetStableNextPageButtonIcon:SetTexture("")

				F.ReskinPortraitFrame(PetStableFrame, true)
				F.ReskinArrow(PetStablePrevPageButton, "left")
				F.ReskinArrow(PetStableNextPageButton, "right")

				PetStableSelectedPetIcon:SetTexCoord(.08, .92, .08, .92)
				F.CreateBG(PetStableSelectedPetIcon)

				for i = 1, NUM_PET_ACTIVE_SLOTS do
					local bu = _G["PetStableActivePet"..i]

					bu.Background:Hide()
					bu.Border:Hide()

					bu:SetNormalTexture("")
					bu.Checked:SetTexture(C.media.checked)

					_G["PetStableActivePet"..i.."IconTexture"]:SetTexCoord(.08, .92, .08, .92)
					F.CreateBD(bu, .25)
				end

				for i = 1, NUM_PET_STABLE_SLOTS do
					local bu = _G["PetStableStabledPet"..i]
					local bd = CreateFrame("Frame", nil, bu)
					bd:SetPoint("TOPLEFT", -1, 1)
					bd:SetPoint("BOTTOMRIGHT", 1, -1)
					F.CreateBD(bd, .25)
					bu:SetNormalTexture("")
					bu:DisableDrawLayer("BACKGROUND")
					_G["PetStableStabledPet"..i.."IconTexture"]:SetTexCoord(.08, .92, .08, .92)
				end
			end

			hooksecurefunc("PetPaperDollFrame_UpdateIsAvailable", function()
				if not HasPetUI() then
					CharacterFrameTab3:SetPoint("LEFT", CharacterFrameTab2, "LEFT", 0, 0)
				else
					CharacterFrameTab3:SetPoint("LEFT", CharacterFrameTab2, "RIGHT", -15, 0)
				end
			end)

			PetModelFrameRotateLeftButton:Hide()
			PetModelFrameRotateRightButton:Hide()
			PetModelFrameShadowOverlay:Hide()
			PetPaperDollPetModelBg:SetAlpha(0)
		end

		-- Ghost frame

		GhostFrameContentsFrameIcon:SetTexCoord(.08, .92, .08, .92)

		local GhostBD = CreateFrame("Frame", nil, GhostFrameContentsFrame)
		GhostBD:SetPoint("TOPLEFT", GhostFrameContentsFrameIcon, -1, 1)
		GhostBD:SetPoint("BOTTOMRIGHT", GhostFrameContentsFrameIcon, 1, -1)
		F.CreateBD(GhostBD, 0)

		-- Mail frame

		SendMailMoneyInset:DisableDrawLayer("BORDER")
		InboxFrame:GetRegions():Hide()
		SendMailMoneyBg:Hide()
		SendMailMoneyInsetBg:Hide()
		OpenMailFrameIcon:Hide()
		OpenMailHorizontalBarLeft:Hide()
		select(18, MailFrame:GetRegions()):Hide()
		select(25, OpenMailFrame:GetRegions()):Hide()
		for i = 4, 7 do
			select(i, SendMailFrame:GetRegions()):Hide()
		end

		OpenMailLetterButton:SetNormalTexture("")
		OpenMailLetterButton:SetPushedTexture("")
		OpenMailLetterButtonIconTexture:SetTexCoord(.08, .92, .08, .92)

		for i = 1, 2 do
			F.ReskinTab(_G["MailFrameTab"..i])
		end

		local bgmail = CreateFrame("Frame", nil, OpenMailLetterButton)
		bgmail:SetPoint("TOPLEFT", -1, 1)
		bgmail:SetPoint("BOTTOMRIGHT", 1, -1)
		bgmail:SetFrameLevel(OpenMailLetterButton:GetFrameLevel()-1)
		F.CreateBD(bgmail)

		OpenMailMoneyButton:SetNormalTexture("")
		OpenMailMoneyButton:SetPushedTexture("")
		OpenMailMoneyButtonIconTexture:SetTexCoord(.08, .92, .08, .92)

		local bgmoney = CreateFrame("Frame", nil, OpenMailMoneyButton)
		bgmoney:SetPoint("TOPLEFT", -1, 1)
		bgmoney:SetPoint("BOTTOMRIGHT", 1, -1)
		bgmoney:SetFrameLevel(OpenMailMoneyButton:GetFrameLevel()-1)
		F.CreateBD(bgmoney)

		SendMailSubjectEditBox:SetPoint("TOPLEFT", SendMailNameEditBox, "BOTTOMLEFT", 0, -1)

		for i = 1, INBOXITEMS_TO_DISPLAY do
			local it = _G["MailItem"..i]
			local bu = _G["MailItem"..i.."Button"]
			local st = _G["MailItem"..i.."ButtonSlot"]
			local ic = _G["MailItem"..i.."Button".."Icon"]
			local line = select(3, _G["MailItem"..i]:GetRegions())

			local a, b = it:GetRegions()
			a:Hide()
			b:Hide()

			bu:SetCheckedTexture(C.media.checked)

			st:Hide()
			line:Hide()
			ic:SetTexCoord(.08, .92, .08, .92)

			local bg = CreateFrame("Frame", nil, bu)
			bg:SetPoint("TOPLEFT", -1, 1)
			bg:SetPoint("BOTTOMRIGHT", 1, -1)
			bg:SetFrameLevel(bu:GetFrameLevel()-1)
			F.CreateBD(bg, 0)
		end

		for i = 1, ATTACHMENTS_MAX_SEND do
			local bu = _G["SendMailAttachment"..i]
			local border = bu.IconBorder

			bu:GetRegions():Hide()

			border:SetTexture(C.media.backdrop)
			border:SetPoint("TOPLEFT", -1, 1)
			border:SetPoint("BOTTOMRIGHT", 1, -1)
			border:SetDrawLayer("BACKGROUND")

			local bg = CreateFrame("Frame", nil, bu)
			bg:SetPoint("TOPLEFT", -1, 1)
			bg:SetPoint("BOTTOMRIGHT", 1, -1)
			bg:SetFrameLevel(0)
			F.CreateBD(bg, .25)
		end

		-- sigh
		-- we mess with quality colour numbers, so we have to fix this
		hooksecurefunc("SendMailFrame_Update", function()
			for i = 1, ATTACHMENTS_MAX_SEND do
				local bu = _G["SendMailAttachment"..i]

				if bu:GetNormalTexture() == nil and bu.IconBorder:IsShown() then
					bu.IconBorder:Hide()
				end
			end
		end)

		for i = 1, ATTACHMENTS_MAX_RECEIVE do
			local bu = _G["OpenMailAttachmentButton"..i]
			local ic = _G["OpenMailAttachmentButton"..i.."IconTexture"]
			local border = bu.IconBorder

			bu:SetNormalTexture("")
			bu:SetPushedTexture("")
			ic:SetTexCoord(.08, .92, .08, .92)

			border:SetTexture(C.media.backdrop)
			border:SetPoint("TOPLEFT", -1, 1)
			border:SetPoint("BOTTOMRIGHT", 1, -1)
			border:SetDrawLayer("BACKGROUND")

			local bg = CreateFrame("Frame", nil, bu)
			bg:SetPoint("TOPLEFT", -1, 1)
			bg:SetPoint("BOTTOMRIGHT", 1, -1)
			bg:SetFrameLevel(0)
			F.CreateBD(bg, .25)
		end

		hooksecurefunc("SendMailFrame_Update", function()
			for i = 1, ATTACHMENTS_MAX_SEND do
				local button = _G["SendMailAttachment"..i]
				if button:GetNormalTexture() then
					button:GetNormalTexture():SetTexCoord(.08, .92, .08, .92)
				end
			end
		end)

		F.ReskinPortraitFrame(MailFrame, true)
		F.ReskinPortraitFrame(OpenMailFrame, true)
		F.ReskinInput(SendMailNameEditBox, 20)
		F.ReskinInput(SendMailSubjectEditBox)
		F.ReskinInput(SendMailMoneyGold)
		F.ReskinInput(SendMailMoneySilver)
		F.ReskinInput(SendMailMoneyCopper)

		-- Currency frame

		TokenFramePopupCorner:Hide()
		TokenFramePopup:SetPoint("TOPLEFT", TokenFrame, "TOPRIGHT", 1, -28)
		F.CreateBD(TokenFramePopup)
		F.ReskinClose(TokenFramePopupCloseButton)
		F.ReskinCheck(TokenFramePopupInactiveCheckBox)
		F.ReskinCheck(TokenFramePopupBackpackCheckBox)

		local function updateButtons()
			local buttons = TokenFrameContainer.buttons

			if not buttons then return end

			for i = 1, #buttons do
				local bu = buttons[i]

				if not bu.styled then
					bu.highlight:SetPoint("TOPLEFT", 1, 0)
					bu.highlight:SetPoint("BOTTOMRIGHT", -1, 0)
					bu.highlight.SetPoint = F.dummy
					bu.highlight:SetTexture(r, g, b, .2)
					bu.highlight.SetTexture = F.dummy

					bu.expandIcon:SetTexture("")

					local minus = bu:CreateTexture(nil, "OVERLAY")
					minus:SetSize(7, 1)
					minus:SetPoint("LEFT", 8, 0)
					minus:SetTexture(C.media.backdrop)
					minus:SetVertexColor(1, 1, 1)
					minus:Hide()
					bu.minus = minus

					local plus = bu:CreateTexture(nil, "OVERLAY")
					plus:SetSize(1, 7)
					plus:SetPoint("LEFT", 11, 0)
					plus:SetTexture(C.media.backdrop)
					plus:SetVertexColor(1, 1, 1)
					plus:Hide()
					bu.plus = plus

					bu.categoryMiddle:SetAlpha(0)
					bu.categoryLeft:SetAlpha(0)
					bu.categoryRight:SetAlpha(0)

					bu.icon:SetTexCoord(.08, .92, .08, .92)
					bu.bg = F.CreateBG(bu.icon)

					bu.styled = true
				end

				if bu.isHeader then
					bu.bg:Hide()
					bu.minus:Show()
					bu.plus:SetShown(not bu.isExpanded)
				else
					bu.bg:Show()
					bu.plus:Hide()
					bu.minus:Hide()
				end
			end
		end

		TokenFrame:HookScript("OnShow", updateButtons)
		hooksecurefunc("TokenFrame_Update", updateButtons)
		hooksecurefunc(TokenFrameContainer, "update", updateButtons)

		F.ReskinScroll(TokenFrameContainerScrollBar)

		-- Reputation frame

		ReputationDetailCorner:Hide()
		ReputationDetailDivider:Hide()
		ReputationListScrollFrame:GetRegions():Hide()
		select(2, ReputationListScrollFrame:GetRegions()):Hide()

		ReputationDetailFrame:SetPoint("TOPLEFT", ReputationFrame, "TOPRIGHT", 1, -28)

		local function UpdateFactionSkins()
			for i = 1, GetNumFactions() do
				local statusbar = _G["ReputationBar"..i.."ReputationBar"]

				if statusbar then
					statusbar:SetStatusBarTexture(C.media.backdrop)

					if not statusbar.reskinned then
						F.CreateBD(statusbar, .25)
						statusbar.reskinned = true
					end

					_G["ReputationBar"..i.."Background"]:SetTexture(nil)
					_G["ReputationBar"..i.."ReputationBarHighlight1"]:SetTexture(nil)
					_G["ReputationBar"..i.."ReputationBarHighlight2"]:SetTexture(nil)
					_G["ReputationBar"..i.."ReputationBarAtWarHighlight1"]:SetTexture(nil)
					_G["ReputationBar"..i.."ReputationBarAtWarHighlight2"]:SetTexture(nil)
					_G["ReputationBar"..i.."ReputationBarLeftTexture"]:SetTexture(nil)
					_G["ReputationBar"..i.."ReputationBarRightTexture"]:SetTexture(nil)
				end
			end
		end

		ReputationFrame:HookScript("OnShow", UpdateFactionSkins)
		ReputationFrame:HookScript("OnEvent", UpdateFactionSkins)

		for i = 1, NUM_FACTIONS_DISPLAYED do
			local bu = _G["ReputationBar"..i.."ExpandOrCollapseButton"]
			F.ReskinExpandOrCollapse(bu)
		end

		hooksecurefunc("ReputationFrame_Update", function()
			local numFactions = GetNumFactions()
			local factionIndex, factionButton, isCollapsed
			local factionOffset = FauxScrollFrame_GetOffset(ReputationListScrollFrame)

			for i = 1, NUM_FACTIONS_DISPLAYED do
				factionIndex = factionOffset + i
				factionButton = _G["ReputationBar"..i.."ExpandOrCollapseButton"]

				if factionIndex <= numFactions then
					_, _, _, _, _, _, _, _, _, isCollapsed = GetFactionInfo(factionIndex)
					if isCollapsed then
						factionButton.plus:Show()
					else
						factionButton.plus:Hide()
					end
				end
			end
		end)

		F.CreateBD(ReputationDetailFrame)
		F.ReskinClose(ReputationDetailCloseButton)
		F.ReskinCheck(ReputationDetailAtWarCheckBox)
		F.ReskinCheck(ReputationDetailInactiveCheckBox)
		F.ReskinCheck(ReputationDetailMainScreenCheckBox)
		F.ReskinCheck(ReputationDetailLFGBonusReputationCheckBox)
		F.ReskinScroll(ReputationListScrollFrameScrollBar)

		select(3, ReputationDetailFrame:GetRegions()):Hide()

		-- PVE frame

		PVEFrame:DisableDrawLayer("ARTWORK")
		PVEFrameLeftInset:DisableDrawLayer("BORDER")

		PVEFrameBlueBg:Hide()
		PVEFrameLeftInsetBg:Hide()
		PVEFrame.shadows:Hide()
		select(24, PVEFrame:GetRegions()):Hide()
		select(25, PVEFrame:GetRegions()):Hide()

		PVEFrameTab2:SetPoint("LEFT", PVEFrameTab1, "RIGHT", -15, 0)
		PVEFrameTab3:SetPoint("LEFT", PVEFrameTab2, "RIGHT", -15, 0)

		GroupFinderFrameGroupButton1.icon:SetTexture("Interface\\Icons\\INV_Helmet_08")
		GroupFinderFrameGroupButton2.icon:SetTexture("Interface\\Icons\\Icon_Scenarios")
		GroupFinderFrameGroupButton3.icon:SetTexture("Interface\\Icons\\inv_helmet_06")

		for i = 1, 4 do
			local bu = GroupFinderFrame["groupButton"..i]

			bu.ring:Hide()
			bu.bg:SetTexture(C.media.backdrop)
			bu.bg:SetVertexColor(r, g, b, .2)
			bu.bg:SetAllPoints()

			F.Reskin(bu, true)

			bu.icon:SetTexCoord(.08, .92, .08, .92)
			bu.icon:SetPoint("LEFT", bu, "LEFT")
			bu.icon:SetDrawLayer("OVERLAY")
			bu.icon.bg = F.CreateBG(bu.icon)
			bu.icon.bg:SetDrawLayer("ARTWORK")
		end

		hooksecurefunc("GroupFinderFrame_SelectGroupButton", function(index)
			local self = GroupFinderFrame
			for i = 1, 4 do
				local button = self["groupButton"..i]
				if i == index then
					button.bg:Show()
				else
					button.bg:Hide()
				end
			end
		end)

		F.ReskinPortraitFrame(PVEFrame)
		F.ReskinTab(PVEFrameTab1)
		F.ReskinTab(PVEFrameTab2)
		F.ReskinTab(PVEFrameTab3)

		-- LFG frame

		LFGDungeonReadyDialogBackground:Hide()
		LFGDungeonReadyDialogBottomArt:Hide()
		LFGDungeonReadyDialogFiligree:Hide()

		LFGDungeonReadyDialogRoleIconTexture:SetTexture(C.media.roleIcons)
		LFGDungeonReadyDialogRoleIconLeaderIcon:SetTexture(C.media.roleIcons)
		LFGDungeonReadyDialogRoleIconLeaderIcon:SetTexCoord(0, 0.296875, 0.015625, 0.2875)

		local leaderBg = F.CreateBG(LFGDungeonReadyDialogRoleIconLeaderIcon)
		leaderBg:SetDrawLayer("ARTWORK", 2)
		leaderBg:SetPoint("TOPLEFT", LFGDungeonReadyDialogRoleIconLeaderIcon, 2, 0)
		leaderBg:SetPoint("BOTTOMRIGHT", LFGDungeonReadyDialogRoleIconLeaderIcon, -3, 4)

		hooksecurefunc("LFGDungeonReadyPopup_Update", function()
			leaderBg:SetShown(LFGDungeonReadyDialogRoleIconLeaderIcon:IsShown())
		end)

		do
			local left = LFGDungeonReadyDialogRoleIcon:CreateTexture(nil, "OVERLAY")
			left:SetWidth(1)
			left:SetTexture(C.media.backdrop)
			left:SetVertexColor(0, 0, 0)
			left:SetPoint("TOPLEFT", 9, -7)
			left:SetPoint("BOTTOMLEFT", 9, 10)

			local right = LFGDungeonReadyDialogRoleIcon:CreateTexture(nil, "OVERLAY")
			right:SetWidth(1)
			right:SetTexture(C.media.backdrop)
			right:SetVertexColor(0, 0, 0)
			right:SetPoint("TOPRIGHT", -8, -7)
			right:SetPoint("BOTTOMRIGHT", -8, 10)

			local top = LFGDungeonReadyDialogRoleIcon:CreateTexture(nil, "OVERLAY")
			top:SetHeight(1)
			top:SetTexture(C.media.backdrop)
			top:SetVertexColor(0, 0, 0)
			top:SetPoint("TOPLEFT", 9, -7)
			top:SetPoint("TOPRIGHT", -8, -7)

			local bottom = LFGDungeonReadyDialogRoleIcon:CreateTexture(nil, "OVERLAY")
			bottom:SetHeight(1)
			bottom:SetTexture(C.media.backdrop)
			bottom:SetVertexColor(0, 0, 0)
			bottom:SetPoint("BOTTOMLEFT", 9, 10)
			bottom:SetPoint("BOTTOMRIGHT", -8, 10)
		end

		hooksecurefunc("LFGDungeonReadyDialogReward_SetMisc", function(button)
			if not button.styled then
				local border = _G[button:GetName().."Border"]

				button.texture:SetTexCoord(.08, .92, .08, .92)

				border:SetTexture(0, 0, 0)
				border:SetDrawLayer("BACKGROUND")
				border:SetPoint("TOPLEFT", button.texture, -1, 1)
				border:SetPoint("BOTTOMRIGHT", button.texture, 1, -1)

				button.styled = true
			end

			button.texture:SetTexture("Interface\\Icons\\inv_misc_coin_02")
		end)

		hooksecurefunc("LFGDungeonReadyDialogReward_SetReward", function(button, dungeonID, rewardIndex, rewardType, rewardArg)
			if not button.styled then
				local border = _G[button:GetName().."Border"]

				button.texture:SetTexCoord(.08, .92, .08, .92)

				border:SetTexture(0, 0, 0)
				border:SetDrawLayer("BACKGROUND")
				border:SetPoint("TOPLEFT", button.texture, -1, 1)
				border:SetPoint("BOTTOMRIGHT", button.texture, 1, -1)

				button.styled = true
			end

			local name, texturePath, quantity
			if rewardType == "reward" then
				name, texturePath, quantity = GetLFGDungeonRewardInfo(dungeonID, rewardIndex);
			elseif rewardType == "shortage" then
				name, texturePath, quantity = GetLFGDungeonShortageRewardInfo(dungeonID, rewardArg, rewardIndex);
			end
			if texturePath then
				button.texture:SetTexture(texturePath)
			end
		end)

		F.CreateBD(LFGDungeonReadyDialog)
		LFGDungeonReadyDialog.SetBackdrop = F.dummy
		F.CreateBD(LFGInvitePopup)
		F.CreateBD(LFGDungeonReadyStatus)

		F.Reskin(LFGDungeonReadyDialogEnterDungeonButton)
		F.Reskin(LFGDungeonReadyDialogLeaveQueueButton)
		F.Reskin(LFGInvitePopupAcceptButton)
		F.Reskin(LFGInvitePopupDeclineButton)
		F.ReskinClose(LFGDungeonReadyDialogCloseButton)
		F.ReskinClose(LFGDungeonReadyStatusCloseButton)

		for _, roleButton in pairs({LFDQueueFrameRoleButtonTank, LFDQueueFrameRoleButtonHealer, LFDQueueFrameRoleButtonDPS, LFDQueueFrameRoleButtonLeader, LFRQueueFrameRoleButtonTank, LFRQueueFrameRoleButtonHealer, LFRQueueFrameRoleButtonDPS, RaidFinderQueueFrameRoleButtonTank, RaidFinderQueueFrameRoleButtonHealer, RaidFinderQueueFrameRoleButtonDPS, RaidFinderQueueFrameRoleButtonLeader}) do
			if roleButton.background then
				roleButton.background:SetTexture("")
			end

			roleButton.cover:SetTexture(C.media.roleIcons)
			roleButton:SetNormalTexture(C.media.roleIcons)

			roleButton.checkButton:SetFrameLevel(roleButton:GetFrameLevel() + 2)

			for i = 1, 2 do
				local left = roleButton:CreateTexture()
				left:SetDrawLayer("OVERLAY", i)
				left:SetWidth(1)
				left:SetTexture(C.media.backdrop)
				left:SetVertexColor(0, 0, 0)
				left:SetPoint("TOPLEFT", roleButton, 6, -5)
				left:SetPoint("BOTTOMLEFT", roleButton, 6, 7)
				roleButton["leftLine"..i] = left

				local right = roleButton:CreateTexture()
				right:SetDrawLayer("OVERLAY", i)
				right:SetWidth(1)
				right:SetTexture(C.media.backdrop)
				right:SetVertexColor(0, 0, 0)
				right:SetPoint("TOPRIGHT", roleButton, -6, -5)
				right:SetPoint("BOTTOMRIGHT", roleButton, -6, 7)
				roleButton["rightLine"..i] = right

				local top = roleButton:CreateTexture()
				top:SetDrawLayer("OVERLAY", i)
				top:SetHeight(1)
				top:SetTexture(C.media.backdrop)
				top:SetVertexColor(0, 0, 0)
				top:SetPoint("TOPLEFT", roleButton, 6, -5)
				top:SetPoint("TOPRIGHT", roleButton, -6, -5)
				roleButton["topLine"..i] = top

				local bottom = roleButton:CreateTexture()
				bottom:SetDrawLayer("OVERLAY", i)
				bottom:SetHeight(1)
				bottom:SetTexture(C.media.backdrop)
				bottom:SetVertexColor(0, 0, 0)
				bottom:SetPoint("BOTTOMLEFT", roleButton, 6, 7)
				bottom:SetPoint("BOTTOMRIGHT", roleButton, -6, 7)
				roleButton["bottomLine"..i] = bottom
			end

			roleButton.leftLine2:Hide()
			roleButton.rightLine2:Hide()
			roleButton.topLine2:Hide()
			roleButton.bottomLine2:Hide()

			local shortageBorder = roleButton.shortageBorder
			if shortageBorder then
				local icon = roleButton.incentiveIcon

				shortageBorder:SetTexture("")

				icon.border:SetTexture(0, 0, 0)
				icon.border:SetDrawLayer("BACKGROUND")
				icon.border:SetPoint("TOPLEFT", icon.texture, -1, 1)
				icon.border:SetPoint("BOTTOMRIGHT", icon.texture, 1, -1)

				icon:SetPoint("BOTTOMRIGHT", 3, -3)
				icon:SetSize(14, 14)
				icon.texture:SetSize(14, 14)
				icon.texture:SetTexCoord(.12, .88, .12, .88)
			end

			F.ReskinCheck(roleButton.checkButton)
		end

		for _, roleButton in pairs({LFDRoleCheckPopupRoleButtonTank, LFDRoleCheckPopupRoleButtonHealer, LFDRoleCheckPopupRoleButtonDPS, LFGInvitePopupRoleButtonTank, LFGInvitePopupRoleButtonHealer, LFGInvitePopupRoleButtonDPS}) do
			roleButton.cover:SetTexture(C.media.roleIcons)
			roleButton:SetNormalTexture(C.media.roleIcons)

			roleButton.checkButton:SetFrameLevel(roleButton:GetFrameLevel() + 2)

			local left = roleButton:CreateTexture(nil, "OVERLAY")
			left:SetWidth(1)
			left:SetTexture(C.media.backdrop)
			left:SetVertexColor(0, 0, 0)
			left:SetPoint("TOPLEFT", roleButton, 9, -7)
			left:SetPoint("BOTTOMLEFT", roleButton, 9, 11)

			local right = roleButton:CreateTexture(nil, "OVERLAY")
			right:SetWidth(1)
			right:SetTexture(C.media.backdrop)
			right:SetVertexColor(0, 0, 0)
			right:SetPoint("TOPRIGHT", roleButton, -9, -7)
			right:SetPoint("BOTTOMRIGHT", roleButton, -9, 11)

			local top = roleButton:CreateTexture(nil, "OVERLAY")
			top:SetHeight(1)
			top:SetTexture(C.media.backdrop)
			top:SetVertexColor(0, 0, 0)
			top:SetPoint("TOPLEFT", roleButton, 9, -7)
			top:SetPoint("TOPRIGHT", roleButton, -9, -7)

			local bottom = roleButton:CreateTexture(nil, "OVERLAY")
			bottom:SetHeight(1)
			bottom:SetTexture(C.media.backdrop)
			bottom:SetVertexColor(0, 0, 0)
			bottom:SetPoint("BOTTOMLEFT", roleButton, 9, 11)
			bottom:SetPoint("BOTTOMRIGHT", roleButton, -9, 11)

			F.ReskinCheck(roleButton.checkButton)
		end

		do
			local roleButtons = {LFGDungeonReadyStatusGroupedTank, LFGDungeonReadyStatusGroupedHealer, LFGDungeonReadyStatusGroupedDamager, LFGDungeonReadyStatusRolelessReady}

			for i = 1, 5 do
				tinsert(roleButtons, _G["LFGDungeonReadyStatusIndividualPlayer"..i])
			end

			for _, roleButton in pairs(roleButtons) do
				roleButton.texture:SetTexture(C.media.roleIcons)
				roleButton.statusIcon:SetDrawLayer("OVERLAY", 2)

				local left = roleButton:CreateTexture(nil, "OVERLAY")
				left:SetWidth(1)
				left:SetTexture(C.media.backdrop)
				left:SetVertexColor(0, 0, 0)
				left:SetPoint("TOPLEFT", 7, -6)
				left:SetPoint("BOTTOMLEFT", 7, 8)

				local right = roleButton:CreateTexture(nil, "OVERLAY")
				right:SetWidth(1)
				right:SetTexture(C.media.backdrop)
				right:SetVertexColor(0, 0, 0)
				right:SetPoint("TOPRIGHT", -7, -6)
				right:SetPoint("BOTTOMRIGHT", -7, 8)

				local top = roleButton:CreateTexture(nil, "OVERLAY")
				top:SetHeight(1)
				top:SetTexture(C.media.backdrop)
				top:SetVertexColor(0, 0, 0)
				top:SetPoint("TOPLEFT", 7, -6)
				top:SetPoint("TOPRIGHT", -7, -6)

				local bottom = roleButton:CreateTexture(nil, "OVERLAY")
				bottom:SetHeight(1)
				bottom:SetTexture(C.media.backdrop)
				bottom:SetVertexColor(0, 0, 0)
				bottom:SetPoint("BOTTOMLEFT", 7, 8)
				bottom:SetPoint("BOTTOMRIGHT", -7, 8)
			end
		end

		LFGDungeonReadyStatusRolelessReady.texture:SetTexCoord(0.5234375, 0.78750, 0, 0.25875)

		hooksecurefunc("LFG_SetRoleIconIncentive", function(roleButton, incentiveIndex)
			if incentiveIndex then
				local tex
				if incentiveIndex == LFG_ROLE_SHORTAGE_PLENTIFUL then
					tex = "Interface\\Icons\\INV_Misc_Coin_19"
				elseif incentiveIndex == LFG_ROLE_SHORTAGE_UNCOMMON then
					tex = "Interface\\Icons\\INV_Misc_Coin_18"
				elseif incentiveIndex == LFG_ROLE_SHORTAGE_RARE then
					tex = "Interface\\Icons\\INV_Misc_Coin_17"
				end
				roleButton.incentiveIcon.texture:SetTexture(tex)
				roleButton.leftLine2:Show()
				roleButton.rightLine2:Show()
				roleButton.topLine2:Show()
				roleButton.bottomLine2:Show()
			else
				roleButton.leftLine2:Hide()
				roleButton.rightLine2:Hide()
				roleButton.topLine2:Hide()
				roleButton.bottomLine2:Hide()
			end
		end)

		hooksecurefunc("LFG_PermanentlyDisableRoleButton", function(button)
			if button.shortageBorder then
				button.leftLine2:SetVertexColor(.5, .45, .03)
				button.rightLine2:SetVertexColor(.5, .45, .03)
				button.topLine2:SetVertexColor(.5, .45, .03)
				button.bottomLine2:SetVertexColor(.5, .45, .03)
			end
		end)

		hooksecurefunc("LFG_DisableRoleButton", function(button)
			if button.shortageBorder then
				button.leftLine2:SetVertexColor(.5, .45, .03)
				button.rightLine2:SetVertexColor(.5, .45, .03)
				button.topLine2:SetVertexColor(.5, .45, .03)
				button.bottomLine2:SetVertexColor(.5, .45, .03)
			end
		end)

		hooksecurefunc("LFG_EnableRoleButton", function(button)
			if button.shortageBorder then
				button.leftLine2:SetVertexColor(1, .9, .06)
				button.rightLine2:SetVertexColor(1, .9, .06)
				button.topLine2:SetVertexColor(1, .9, .06)
				button.bottomLine2:SetVertexColor(1, .9, .06)
			end
		end)

		-- Role poll

		F.CreateBD(RolePollPopup)
		F.Reskin(RolePollPopupAcceptButton)
		F.ReskinClose(RolePollPopupCloseButton)

		for _, roleButton in pairs({RolePollPopupRoleButtonTank, RolePollPopupRoleButtonHealer, RolePollPopupRoleButtonDPS}) do
			roleButton.cover:SetTexture(C.media.roleIcons)
			roleButton:SetNormalTexture(C.media.roleIcons)

			roleButton.checkButton:SetFrameLevel(roleButton:GetFrameLevel() + 2)

			local left = roleButton:CreateTexture(nil, "OVERLAY")
			left:SetWidth(1)
			left:SetTexture(C.media.backdrop)
			left:SetVertexColor(0, 0, 0)
			left:SetPoint("TOPLEFT", 9, -7)
			left:SetPoint("BOTTOMLEFT", 9, 11)

			local right = roleButton:CreateTexture(nil, "OVERLAY")
			right:SetWidth(1)
			right:SetTexture(C.media.backdrop)
			right:SetVertexColor(0, 0, 0)
			right:SetPoint("TOPRIGHT", -9, -7)
			right:SetPoint("BOTTOMRIGHT", -9, 11)

			local top = roleButton:CreateTexture(nil, "OVERLAY")
			top:SetHeight(1)
			top:SetTexture(C.media.backdrop)
			top:SetVertexColor(0, 0, 0)
			top:SetPoint("TOPLEFT", 9, -7)
			top:SetPoint("TOPRIGHT", -9, -7)

			local bottom = roleButton:CreateTexture(nil, "OVERLAY")
			bottom:SetHeight(1)
			bottom:SetTexture(C.media.backdrop)
			bottom:SetVertexColor(0, 0, 0)
			bottom:SetPoint("BOTTOMLEFT", 9, 11)
			bottom:SetPoint("BOTTOMRIGHT", -9, 11)

			F.ReskinRadio(roleButton.checkButton)
		end

		-- LFD frame

		LFDQueueFrameRandomScrollFrameScrollBackgroundTopLeft:Hide()
		LFDQueueFrameRandomScrollFrameScrollBackgroundBottomRight:Hide()

		-- this fixes right border of second reward being cut off
		LFDQueueFrameRandomScrollFrame:SetWidth(LFDQueueFrameRandomScrollFrame:GetWidth()+1)

		hooksecurefunc("LFDQueueFrameRandom_UpdateFrame", function()
			for i = 1, LFD_MAX_REWARDS do
				local button = _G["LFDQueueFrameRandomScrollFrameChildFrameItem"..i]

				if button and not button.styled then
					local icon = _G["LFDQueueFrameRandomScrollFrameChildFrameItem"..i.."IconTexture"]
					local cta = _G["LFDQueueFrameRandomScrollFrameChildFrameItem"..i.."ShortageBorder"]
					local count = _G["LFDQueueFrameRandomScrollFrameChildFrameItem"..i.."Count"]
					local na = _G["LFDQueueFrameRandomScrollFrameChildFrameItem"..i.."NameFrame"]

					F.CreateBG(icon)
					icon:SetTexCoord(.08, .92, .08, .92)
					icon:SetDrawLayer("OVERLAY")
					count:SetDrawLayer("OVERLAY")
					na:SetTexture(0, 0, 0, .25)
					na:SetSize(118, 39)
					cta:SetAlpha(0)

					button.bg2 = CreateFrame("Frame", nil, button)
					button.bg2:SetPoint("TOPLEFT", na, "TOPLEFT", 10, 0)
					button.bg2:SetPoint("BOTTOMRIGHT", na, "BOTTOMRIGHT")
					F.CreateBD(button.bg2, 0)

					button.styled = true
				end
			end
		end)

		hooksecurefunc("LFGDungeonListButton_SetDungeon", function(button, dungeonID)
			if not button.expandOrCollapseButton.plus then
				F.ReskinCheck(button.enableButton)
				F.ReskinExpandOrCollapse(button.expandOrCollapseButton)
			end
			if LFGCollapseList[dungeonID] then
				button.expandOrCollapseButton.plus:Show()
			else
				button.expandOrCollapseButton.plus:Hide()
			end

			button.enableButton:GetCheckedTexture():SetDesaturated(true)
		end)

		local bonusValor = LFDQueueFrameRandomScrollFrameChildFrameBonusValor
		bonusValor.Border:Hide()
		bonusValor.Icon:SetTexCoord(.08, .92, .08, .92)
		bonusValor.Icon:SetPoint("CENTER", bonusValor.Border, -3, 0)
		bonusValor.Icon:SetSize(24, 24)
		bonusValor.BonusText:SetPoint("LEFT", bonusValor.Border, "RIGHT", -5, -1)
		F.CreateBG(bonusValor.Icon)

		F.CreateBD(LFDRoleCheckPopup)
		F.Reskin(LFDRoleCheckPopupAcceptButton)
		F.Reskin(LFDRoleCheckPopupDeclineButton)
		F.Reskin(LFDQueueFrameRandomScrollFrameChildFrame.bonusRepFrame.ChooseButton)

		-- Raid Finder

		RaidFinderFrameBottomInset:DisableDrawLayer("BORDER")
		RaidFinderFrameBottomInsetBg:Hide()
		RaidFinderFrameBtnCornerRight:Hide()
		RaidFinderFrameButtonBottomBorder:Hide()
		RaidFinderQueueFrameScrollFrameScrollBackground:Hide()
		RaidFinderQueueFrameScrollFrameScrollBackgroundTopLeft:Hide()
		RaidFinderQueueFrameScrollFrameScrollBackgroundBottomRight:Hide()

		-- this fixes right border of second reward being cut off
		RaidFinderQueueFrameScrollFrame:SetWidth(RaidFinderQueueFrameScrollFrame:GetWidth()+1)

		hooksecurefunc("RaidFinderQueueFrameRewards_UpdateFrame", function()
			for i = 1, LFD_MAX_REWARDS do
				local button = _G["RaidFinderQueueFrameScrollFrameChildFrameItem"..i]

				if button and not button.styled then
					local icon = _G["RaidFinderQueueFrameScrollFrameChildFrameItem"..i.."IconTexture"]
					local cta = _G["RaidFinderQueueFrameScrollFrameChildFrameItem"..i.."ShortageBorder"]
					local count = _G["RaidFinderQueueFrameScrollFrameChildFrameItem"..i.."Count"]
					local na = _G["RaidFinderQueueFrameScrollFrameChildFrameItem"..i.."NameFrame"]

					F.CreateBG(icon)
					icon:SetTexCoord(.08, .92, .08, .92)
					icon:SetDrawLayer("OVERLAY")
					count:SetDrawLayer("OVERLAY")
					na:SetTexture(0, 0, 0, .25)
					na:SetSize(118, 39)
					cta:SetAlpha(0)

					button.bg2 = CreateFrame("Frame", nil, button)
					button.bg2:SetPoint("TOPLEFT", na, "TOPLEFT", 10, 0)
					button.bg2:SetPoint("BOTTOMRIGHT", na, "BOTTOMRIGHT")
					F.CreateBD(button.bg2, 0)

					button.styled = true
				end
			end
		end)

		F.ReskinScroll(RaidFinderQueueFrameScrollFrameScrollBar)

		-- Scenario finder

		ScenarioFinderFrameInset:DisableDrawLayer("BORDER")
		ScenarioFinderFrame.TopTileStreaks:Hide()
		ScenarioFinderFrameBtnCornerRight:Hide()
		ScenarioFinderFrameButtonBottomBorder:Hide()
		ScenarioQueueFrameRandomScrollFrameScrollBackground:Hide()
		ScenarioQueueFrameRandomScrollFrameScrollBackgroundTopLeft:Hide()
		ScenarioQueueFrameRandomScrollFrameScrollBackgroundBottomRight:Hide()
		ScenarioQueueFrameSpecificScrollFrameScrollBackgroundTopLeft:Hide()
		ScenarioQueueFrameSpecificScrollFrameScrollBackgroundBottomRight:Hide()
		ScenarioQueueFrame.Bg:Hide()
		ScenarioFinderFrameInset:GetRegions():Hide()

		ScenarioQueueFrameRandomScrollFrame:SetWidth(304)

		hooksecurefunc("ScenarioQueueFrameRandom_UpdateFrame", function()
			for i = 1, 2 do
				local button = _G["ScenarioQueueFrameRandomScrollFrameChildFrameItem"..i]

				if button and not button.styled then
					local icon = _G["ScenarioQueueFrameRandomScrollFrameChildFrameItem"..i.."IconTexture"]
					local cta = _G["ScenarioQueueFrameRandomScrollFrameChildFrameItem"..i.."ShortageBorder"]
					local count = _G["ScenarioQueueFrameRandomScrollFrameChildFrameItem"..i.."Count"]
					local na = _G["ScenarioQueueFrameRandomScrollFrameChildFrameItem"..i.."NameFrame"]

					F.CreateBG(icon)
					icon:SetTexCoord(.08, .92, .08, .92)
					icon:SetDrawLayer("OVERLAY")
					count:SetDrawLayer("OVERLAY")
					na:SetTexture(0, 0, 0, .25)
					na:SetSize(118, 39)
					cta:SetAlpha(0)

					button.bg2 = CreateFrame("Frame", nil, button)
					button.bg2:SetPoint("TOPLEFT", na, "TOPLEFT", 10, 0)
					button.bg2:SetPoint("BOTTOMRIGHT", na, "BOTTOMRIGHT")
					F.CreateBD(button.bg2, 0)

					button.styled = true
				end
			end
		end)

		local bonusValor = ScenarioQueueFrameRandomScrollFrameChildFrameBonusValor
		bonusValor.Border:Hide()
		bonusValor.Icon:SetTexCoord(.08, .92, .08, .92)
		bonusValor.Icon:SetPoint("CENTER", bonusValor.Border, -3, 0)
		bonusValor.Icon:SetSize(24, 24)
		bonusValor.BonusText:SetPoint("LEFT", bonusValor.Border, "RIGHT", -5, -1)
		F.CreateBG(bonusValor.Icon)

		F.Reskin(ScenarioQueueFrameFindGroupButton)
		F.Reskin(ScenarioQueueFrameRandomScrollFrameChildFrame.bonusRepFrame.ChooseButton)
		F.ReskinDropDown(ScenarioQueueFrameTypeDropDown)
		F.ReskinScroll(ScenarioQueueFrameRandomScrollFrameScrollBar)
		F.ReskinScroll(ScenarioQueueFrameSpecificScrollFrameScrollBar)

		-- Raid frame (social frame)

		F.Reskin(RaidFrameRaidBrowserButton)
		F.ReskinCheck(RaidFrameAllAssistCheckButton)

		-- Looking for raid

		LFRQueueFrame:DisableDrawLayer("BACKGROUND")
		LFRBrowseFrame:DisableDrawLayer("BACKGROUND")
		LFRBrowseFrameRoleInset:DisableDrawLayer("BORDER")
		LFRQueueFrameRoleInset:DisableDrawLayer("BORDER")
		LFRQueueFrameListInset:DisableDrawLayer("BORDER")
		LFRQueueFrameCommentInset:DisableDrawLayer("BORDER")
		LFRQueueFrameSpecificListScrollFrameScrollBackgroundTopLeft:Hide()
		LFRQueueFrameSpecificListScrollFrameScrollBackgroundBottomRight:Hide()
		LFRBrowseFrameRoleInsetBg:Hide()
		LFRQueueFrameRoleInsetBg:Hide()
		LFRQueueFrameListInsetBg:Hide()
		LFRQueueFrameCommentInsetBg:Hide()
		for i = 1, 7 do
			_G["LFRBrowseFrameColumnHeader"..i]:DisableDrawLayer("BACKGROUND")
		end

		F.Reskin(LFRBrowseFrameSendMessageButton)
		F.Reskin(LFRBrowseFrameInviteButton)
		F.Reskin(LFRBrowseFrameRefreshButton)
		F.Reskin(LFRQueueFrameFindGroupButton)
		F.Reskin(LFRQueueFrameAcceptCommentButton)
		F.ReskinPortraitFrame(RaidBrowserFrame)
		F.ReskinScroll(LFRQueueFrameSpecificListScrollFrameScrollBar)
		F.ReskinScroll(LFRQueueFrameCommentScrollFrameScrollBar)
		F.ReskinScroll(LFRBrowseFrameListScrollFrameScrollBar)
		F.ReskinDropDown(LFRBrowseFrameRaidDropDown)

		for i = 1, 2 do
			local tab = _G["LFRParentFrameSideTab"..i]
			tab:GetRegions():Hide()
			tab:SetCheckedTexture(C.media.checked)
			if i == 1 then
				local a1, p, a2, x, y = tab:GetPoint()
				tab:SetPoint(a1, p, a2, x + 2, y)
			end
			F.CreateBG(tab)
			select(2, tab:GetRegions()):SetTexCoord(.08, .92, .08, .92)
		end

		for i = 1, NUM_LFR_CHOICE_BUTTONS do
			local bu = _G["LFRQueueFrameSpecificListButton"..i].enableButton
			F.ReskinCheck(bu)
			bu.SetNormalTexture = F.dummy
			bu.SetPushedTexture = F.dummy

			F.ReskinExpandOrCollapse(_G["LFRQueueFrameSpecificListButton"..i].expandOrCollapseButton)
		end

		hooksecurefunc("LFRQueueFrameSpecificListButton_SetDungeon", function(button, dungeonID)
			if LFGCollapseList[dungeonID] then
				button.expandOrCollapseButton.plus:Show()
			else
				button.expandOrCollapseButton.plus:Hide()
			end

			button.enableButton:GetCheckedTexture():SetDesaturated(true)
		end)

		-- Spellbook frame

		SpellBookFrame:DisableDrawLayer("BACKGROUND")
		SpellBookFrame:DisableDrawLayer("BORDER")
		SpellBookFrame:DisableDrawLayer("OVERLAY")
		SpellBookFrameInset:DisableDrawLayer("BORDER")

		F.SetBD(SpellBookFrame)
		F.ReskinClose(SpellBookFrameCloseButton)

		SpellBookFrameTabButton1:ClearAllPoints()
		SpellBookFrameTabButton1:SetPoint("TOPLEFT", SpellBookFrame, "BOTTOMLEFT", 0, 2)

		for i = 1, 5 do
			F.ReskinTab(_G["SpellBookFrameTabButton"..i])
		end

		for i = 1, SPELLS_PER_PAGE do
			local bu = _G["SpellButton"..i]
			local ic = _G["SpellButton"..i.."IconTexture"]

			_G["SpellButton"..i.."SlotFrame"]:SetAlpha(0)
			_G["SpellButton"..i.."Highlight"]:SetAlpha(0)

			bu.EmptySlot:SetAlpha(0)
			bu.TextBackground:Hide()
			bu.TextBackground2:Hide()
			bu.UnlearnedFrame:SetAlpha(0)

			bu:SetCheckedTexture("")
			bu:SetPushedTexture("")

			ic:SetTexCoord(.08, .92, .08, .92)

			ic.bg = F.CreateBG(bu)
		end

		hooksecurefunc("SpellButton_UpdateButton", function(self)
			if SpellBookFrame.bookType == BOOKTYPE_PROFESSION then return end

			local slot, slotType = SpellBook_GetSpellBookSlot(self);
			local name = self:GetName();
			local subSpellString = _G[name.."SubSpellName"]

			local isOffSpec = self.offSpecID ~= 0 and SpellBookFrame.bookType == BOOKTYPE_SPELL

			subSpellString:SetTextColor(1, 1, 1)

			if slotType == "FUTURESPELL" then
				local level = GetSpellAvailableLevel(slot, SpellBookFrame.bookType)
				if level and level > UnitLevel("player") then
					self.SpellName:SetTextColor(.7, .7, .7)
					subSpellString:SetTextColor(.7, .7, .7)
				end
			else
				if slotType == "SPELL" and isOffSpec then
					subSpellString:SetTextColor(.7, .7, .7)
				end
			end

			self.RequiredLevelString:SetTextColor(.7, .7, .7)

			local ic = _G[name.."IconTexture"]
			if not ic.bg then return end
			if ic:IsShown() then
				ic.bg:Show()
			else
				ic.bg:Hide()
			end
		end)

		SpellBookSkillLineTab1:SetPoint("TOPLEFT", SpellBookSideTabsFrame, "TOPRIGHT", 2, -36)

		hooksecurefunc("SpellBookFrame_UpdateSkillLineTabs", function()
			for i = 1, GetNumSpellTabs() do
				local tab = _G["SpellBookSkillLineTab"..i]

				if not tab.styled then
					tab:GetRegions():Hide()
					tab:SetCheckedTexture(C.media.checked)

					F.CreateBG(tab)

					tab:GetNormalTexture():SetTexCoord(.08, .92, .08, .92)

					tab.styled = true
				end
			end
		end)

		local coreTabsSkinned = false
		hooksecurefunc("SpellBookCoreAbilities_UpdateTabs", function()
			if coreTabsSkinned then return end
			coreTabsSkinned = true
			for i = 1, GetNumSpecializations() do
				local tab = SpellBookCoreAbilitiesFrame.SpecTabs[i]

				tab:GetRegions():Hide()
				tab:SetCheckedTexture(C.media.checked)

				F.CreateBG(tab)

				tab:GetNormalTexture():SetTexCoord(.08, .92, .08, .92)

				if i == 1 then
					tab:SetPoint("TOPLEFT", SpellBookCoreAbilitiesFrame, "TOPRIGHT", 2, -53)
				end
			end
		end)

		hooksecurefunc("SpellBook_UpdateCoreAbilitiesTab", function()
			for i = 1, #SpellBookCoreAbilitiesFrame.Abilities do
				local bu = SpellBook_GetCoreAbilityButton(i)
				if not bu.reskinned then
					bu.EmptySlot:SetAlpha(0)
					bu.ActiveTexture:SetAlpha(0)
					bu.FutureTexture:SetAlpha(0)
					bu.RequiredLevel:SetTextColor(1, 1, 1)

					bu.iconTexture:SetTexCoord(.08, .92, .08, .92)
					bu.iconTexture.bg = F.CreateBG(bu.iconTexture)

					if bu.FutureTexture:IsShown() then
						bu.Name:SetTextColor(.8, .8, .8)
						bu.InfoText:SetTextColor(.7, .7, .7)
					else
						bu.Name:SetTextColor(1, 1, 1)
						bu.InfoText:SetTextColor(.9, .9, .9)
					end
					bu.reskinned = true
				end
			end
		end)

		SpellBookFrameTutorialButton.Ring:Hide()
		SpellBookFrameTutorialButton:SetPoint("TOPLEFT", SpellBookFrame, "TOPLEFT", -12, 12)

		-- Professions

		local professions = {"PrimaryProfession1", "PrimaryProfession2", "SecondaryProfession1", "SecondaryProfession2", "SecondaryProfession3", "SecondaryProfession4"}

		for _, button in pairs(professions) do
			local bu = _G[button]
			bu.professionName:SetTextColor(1, 1, 1)
			bu.missingHeader:SetTextColor(1, 1, 1)
			bu.missingText:SetTextColor(1, 1, 1)

			bu.statusBar:SetHeight(13)
			bu.statusBar:SetStatusBarTexture(C.media.backdrop)
			bu.statusBar:GetStatusBarTexture():SetGradient("VERTICAL", 0, .6, 0, 0, .8, 0)
			bu.statusBar.rankText:SetPoint("CENTER")

			local _, p = bu.statusBar:GetPoint()
			bu.statusBar:SetPoint("TOPLEFT", p, "BOTTOMLEFT", 1, -3)

			_G[button.."StatusBarLeft"]:Hide()
			bu.statusBar.capRight:SetAlpha(0)
			_G[button.."StatusBarBGLeft"]:Hide()
			_G[button.."StatusBarBGMiddle"]:Hide()
			_G[button.."StatusBarBGRight"]:Hide()

			local bg = CreateFrame("Frame", nil, bu.statusBar)
			bg:SetPoint("TOPLEFT", -1, 1)
			bg:SetPoint("BOTTOMRIGHT", 1, -1)
			bg:SetFrameLevel(bu:GetFrameLevel()-1)
			F.CreateBD(bg, .25)
		end

		local professionbuttons = {"PrimaryProfession1SpellButtonTop", "PrimaryProfession1SpellButtonBottom", "PrimaryProfession2SpellButtonTop", "PrimaryProfession2SpellButtonBottom", "SecondaryProfession1SpellButtonLeft", "SecondaryProfession1SpellButtonRight", "SecondaryProfession2SpellButtonLeft", "SecondaryProfession2SpellButtonRight", "SecondaryProfession3SpellButtonLeft", "SecondaryProfession3SpellButtonRight", "SecondaryProfession4SpellButtonLeft", "SecondaryProfession4SpellButtonRight"}

		for _, button in pairs(professionbuttons) do
			local icon = _G[button.."IconTexture"]
			local bu = _G[button]
			_G[button.."NameFrame"]:SetAlpha(0)

			bu:SetPushedTexture("")
			bu:SetCheckedTexture(C.media.checked)
			bu:GetHighlightTexture():Hide()

			if icon then
				icon:SetTexCoord(.08, .92, .08, .92)
				icon:ClearAllPoints()
				icon:SetPoint("TOPLEFT", 2, -2)
				icon:SetPoint("BOTTOMRIGHT", -2, 2)
				F.CreateBG(icon)
			end
		end

		for i = 1, 2 do
			local bu = _G["PrimaryProfession"..i]

			_G["PrimaryProfession"..i.."IconBorder"]:Hide()

			bu.professionName:ClearAllPoints()
			bu.professionName:SetPoint("TOPLEFT", 100, -4)

			bu.icon:SetAlpha(1)
			bu.icon:SetTexCoord(.08, .92, .08, .92)
			bu.icon:SetDesaturated(false)
			F.CreateBG(bu.icon)

			local bg = CreateFrame("Frame", nil, bu)
			bg:SetPoint("TOPLEFT")
			bg:SetPoint("BOTTOMRIGHT", 0, -4)
			bg:SetFrameLevel(0)
			F.CreateBD(bg, .25)
		end

		hooksecurefunc("FormatProfession", function(frame, index)
			if index then
				local _, texture = GetProfessionInfo(index)

				if frame.icon and texture then
					frame.icon:SetTexture(texture)
				end
			end
		end)

		-- Merchant Frame

		MerchantMoneyInset:DisableDrawLayer("BORDER")
		MerchantExtraCurrencyInset:DisableDrawLayer("BORDER")
		BuybackBG:SetAlpha(0)
		MerchantMoneyBg:Hide()
		MerchantMoneyInsetBg:Hide()
		MerchantFrameBottomLeftBorder:SetAlpha(0)
		MerchantFrameBottomRightBorder:SetAlpha(0)
		MerchantExtraCurrencyBg:SetAlpha(0)
		MerchantExtraCurrencyInsetBg:Hide()

		F.ReskinPortraitFrame(MerchantFrame, true)
		F.ReskinDropDown(MerchantFrameLootFilter)

		MerchantFrameTab1:ClearAllPoints()
		MerchantFrameTab1:SetPoint("CENTER", MerchantFrame, "BOTTOMLEFT", 50, -14)
		MerchantFrameTab2:SetPoint("LEFT", MerchantFrameTab1, "RIGHT", -15, 0)

		for i = 1, 2 do
			F.ReskinTab(_G["MerchantFrameTab"..i])
		end

		for i = 1, BUYBACK_ITEMS_PER_PAGE do
			local button = _G["MerchantItem"..i]
			local bu = _G["MerchantItem"..i.."ItemButton"]
			local mo = _G["MerchantItem"..i.."MoneyFrame"]
			local ic = bu.icon

			bu:SetHighlightTexture("")

			_G["MerchantItem"..i.."SlotTexture"]:Hide()
			_G["MerchantItem"..i.."Name"]:SetHeight(20)
			_G["MerchantItem"..i.."NameFrame"]:Hide()

			local a1, p, a2= bu:GetPoint()
			bu:SetPoint(a1, p, a2, -2, -2)
			bu:SetNormalTexture("")
			bu:SetPushedTexture("")
			bu:SetSize(40, 40)

			local a3, p2, a4, x, y = mo:GetPoint()
			mo:SetPoint(a3, p2, a4, x, y+2)

			F.CreateBD(bu, 0)

			button.bd = CreateFrame("Frame", nil, button)
			button.bd:SetPoint("TOPLEFT", 39, 0)
			button.bd:SetPoint("BOTTOMRIGHT")
			button.bd:SetFrameLevel(0)
			F.CreateBD(button.bd, .25)

			ic:SetTexCoord(.08, .92, .08, .92)
			ic:ClearAllPoints()
			ic:SetPoint("TOPLEFT", 1, -1)
			ic:SetPoint("BOTTOMRIGHT", -1, 1)

			for j = 1, 3 do
				F.CreateBG(_G["MerchantItem"..i.."AltCurrencyFrameItem"..j.."Texture"])
				_G["MerchantItem"..i.."AltCurrencyFrameItem"..j.."Texture"]:SetTexCoord(.08, .92, .08, .92)
			end
		end

		hooksecurefunc("MerchantFrame_UpdateMerchantInfo", function()
			local numMerchantItems = GetMerchantNumItems()
			for i = 1, MERCHANT_ITEMS_PER_PAGE do
				local index = ((MerchantFrame.page - 1) * MERCHANT_ITEMS_PER_PAGE) + i
				if index <= numMerchantItems then
					local name, texture, price, stackCount, numAvailable, isUsable, extendedCost = GetMerchantItemInfo(index)
					if extendedCost and (price <= 0) then
						_G["MerchantItem"..i.."AltCurrencyFrame"]:SetPoint("BOTTOMLEFT", "MerchantItem"..i.."NameFrame", "BOTTOMLEFT", 0, 35)
					end

					local bu = _G["MerchantItem"..i.."ItemButton"]
					local name = _G["MerchantItem"..i.."Name"]
					if bu.link then
						local _, _, quality = GetItemInfo(bu.link)
						local r, g, b = GetItemQualityColor(quality)

						name:SetTextColor(r, g, b)
					else
						name:SetTextColor(1, 1, 1)
					end
				end
			end

			local name = GetBuybackItemLink(GetNumBuybackItems())
			if name then
				local _, _, quality = GetItemInfo(name)
				local r, g, b = GetItemQualityColor(quality)

				MerchantBuyBackItemName:SetTextColor(r, g, b)
			end
		end)

		hooksecurefunc("MerchantFrame_UpdateBuybackInfo", function()
			for i = 1, BUYBACK_ITEMS_PER_PAGE do
				local itemLink = GetBuybackItemLink(i)
				local name = _G["MerchantItem"..i.."Name"]

				if itemLink then
					local _, _, quality = GetItemInfo(itemLink)
					local r, g, b = GetItemQualityColor(quality)

					name:SetTextColor(r, g, b)
				else
					name:SetTextColor(1, 1, 1)
				end
			end
		end)

		MerchantBuyBackItemSlotTexture:SetAlpha(0)
		MerchantBuyBackItemNameFrame:Hide()
		MerchantBuyBackItemItemButton:SetNormalTexture("")
		MerchantBuyBackItemItemButton:SetPushedTexture("")

		F.CreateBD(MerchantBuyBackItemItemButton, 0)
		F.CreateBD(MerchantBuyBackItem, .25)

		MerchantBuyBackItemItemButtonIconTexture:SetTexCoord(.08, .92, .08, .92)
		MerchantBuyBackItemItemButtonIconTexture:ClearAllPoints()
		MerchantBuyBackItemItemButtonIconTexture:SetPoint("TOPLEFT", 1, -1)
		MerchantBuyBackItemItemButtonIconTexture:SetPoint("BOTTOMRIGHT", -1, 1)

		MerchantBuyBackItemName:SetHeight(25)
		MerchantBuyBackItemName:ClearAllPoints()
		MerchantBuyBackItemName:SetPoint("LEFT", MerchantBuyBackItemSlotTexture, "RIGHT", -5, 8)

		MerchantGuildBankRepairButton:SetPushedTexture("")
		F.CreateBG(MerchantGuildBankRepairButton)
		MerchantGuildBankRepairButtonIcon:SetTexCoord(0.595, 0.8075, 0.05, 0.52)

		MerchantRepairAllButton:SetPushedTexture("")
		F.CreateBG(MerchantRepairAllButton)
		MerchantRepairAllIcon:SetTexCoord(0.31375, 0.53, 0.06, 0.52)

		MerchantRepairItemButton:SetPushedTexture("")
		F.CreateBG(MerchantRepairItemButton)
		local ic = MerchantRepairItemButton:GetRegions()
		ic:SetTexture("Interface\\Icons\\INV_Hammer_20")
		ic:SetTexCoord(.08, .92, .08, .92)

		hooksecurefunc("MerchantFrame_UpdateCurrencies", function()
			for i = 1, MAX_MERCHANT_CURRENCIES do
				local bu = _G["MerchantToken"..i]
				if bu and not bu.reskinned then
					local ic = _G["MerchantToken"..i.."Icon"]
					local co = _G["MerchantToken"..i.."Count"]

					ic:SetTexCoord(.08, .92, .08, .92)
					ic:SetDrawLayer("OVERLAY")
					ic:SetPoint("LEFT", co, "RIGHT", 2, 0)
					co:SetPoint("TOPLEFT", bu, "TOPLEFT", -2, 0)

					F.CreateBG(ic)
					bu.reskinned = true
				end
			end
		end)

		-- Friends Frame

		FriendsFrameFriendsScrollFrameTop:Hide()
		FriendsFrameFriendsScrollFrameMiddle:Hide()
		FriendsFrameFriendsScrollFrameBottom:Hide()
		IgnoreListFrameTop:Hide()
		IgnoreListFrameMiddle:Hide()
		IgnoreListFrameBottom:Hide()
		PendingListFrameTop:Hide()
		PendingListFrameMiddle:Hide()
		PendingListFrameBottom:Hide()

		for i = 1, 4 do
			F.ReskinTab(_G["FriendsFrameTab"..i])
		end

		FriendsFrameIcon:Hide()

		for i = 1, FRIENDS_TO_DISPLAY do
			local bu = _G["FriendsFrameFriendsScrollFrameButton"..i]
			local ic = bu.gameIcon

			bu.background:Hide()
			bu.travelPassButton:SetAlpha(0)
			bu.travelPassButton:EnableMouse(false)

			bu:SetHighlightTexture(C.media.backdrop)
			bu:GetHighlightTexture():SetVertexColor(.24, .56, 1, .2)

			ic:SetSize(22, 22)
			ic:SetTexCoord(.15, .85, .15, .85)

			bu.bg = CreateFrame("Frame", nil, bu)
			bu.bg:SetAllPoints(ic)
			F.CreateBD(bu.bg, 0)
		end

		local function UpdateScroll()
			for i = 1, FRIENDS_TO_DISPLAY do
				local bu = _G["FriendsFrameFriendsScrollFrameButton"..i]

				if bu.gameIcon:IsShown() then
					bu.bg:Show()
					bu.gameIcon:SetPoint("TOPRIGHT", bu, "TOPRIGHT", -2, -2)
				else
					bu.bg:Hide()
				end
			end
		end

		local bu1 = FriendsFrameFriendsScrollFrameButton1
		bu1.bg:SetPoint("BOTTOMRIGHT", bu1.gameIcon, 0, -1)

		hooksecurefunc("FriendsFrame_UpdateFriends", UpdateScroll)
		hooksecurefunc(FriendsFrameFriendsScrollFrame, "update", UpdateScroll)

		FriendsFrameStatusDropDown:ClearAllPoints()
		FriendsFrameStatusDropDown:SetPoint("TOPLEFT", FriendsFrame, "TOPLEFT", 10, -28)

		for _, button in pairs({FriendsTabHeaderSoRButton, FriendsTabHeaderRecruitAFriendButton}) do
			button:SetPushedTexture("")
			button:GetRegions():SetTexCoord(.08, .92, .08, .92)
			F.CreateBDFrame(button)
		end

		F.CreateBD(FriendsFrameBattlenetFrame.UnavailableInfoFrame)
		FriendsFrameBattlenetFrame.UnavailableInfoFrame:SetPoint("TOPLEFT", FriendsFrame, "TOPRIGHT", 1, -18)

		FriendsFrameBattlenetFrame:GetRegions():Hide()
		F.CreateBD(FriendsFrameBattlenetFrame, .25)

		FriendsFrameBattlenetFrame.Tag:SetParent(FriendsListFrame)
		FriendsFrameBattlenetFrame.Tag:SetPoint("TOP", FriendsFrame, "TOP", 0, -8)

		hooksecurefunc("FriendsFrame_CheckBattlenetStatus", function()
			if BNFeaturesEnabled() then
				local frame = FriendsFrameBattlenetFrame

				frame.BroadcastButton:Hide()

				if BNConnected() then
					frame:Hide()
					FriendsFrameBroadcastInput:Show()
					FriendsFrameBroadcastInput_UpdateDisplay()
				end
			end
		end)

		hooksecurefunc("FriendsFrame_Update", function()
			if FriendsFrame.selectedTab == 1 and FriendsTabHeader.selectedTab == 1 and FriendsFrameBattlenetFrame.Tag:IsShown() then
				FriendsFrameTitleText:Hide()
			else
				FriendsFrameTitleText:Show()
			end
		end)

		local whoBg = CreateFrame("Frame", nil, WhoFrameEditBoxInset)
		whoBg:SetPoint("TOPLEFT")
		whoBg:SetPoint("BOTTOMRIGHT", -1, 1)
		whoBg:SetFrameLevel(WhoFrameEditBoxInset:GetFrameLevel()-1)
		F.CreateBD(whoBg, .25)

		F.ReskinPortraitFrame(FriendsFrame, true)
		F.Reskin(FriendsFrameAddFriendButton)
		F.Reskin(FriendsFrameSendMessageButton)
		F.Reskin(FriendsFrameIgnorePlayerButton)
		F.Reskin(FriendsFrameUnsquelchButton)
		F.Reskin(FriendsFrameMutePlayerButton)
		F.ReskinScroll(FriendsFrameFriendsScrollFrameScrollBar)
		F.ReskinScroll(FriendsFrameIgnoreScrollFrameScrollBar)
		F.ReskinDropDown(FriendsFrameStatusDropDown)

		-- Battlenet toast frame

		F.CreateBD(BNToastFrame)
		F.CreateBD(BNToastFrame.TooltipFrame)
		BNToastFrameCloseButton:SetAlpha(0)

		-- Battletag invite frame

		for i = 1, 9 do
			select(i, BattleTagInviteFrame.NoteFrame:GetRegions()):Hide()
		end

		F.CreateBD(BattleTagInviteFrame)
		F.CreateBD(BattleTagInviteFrame.NoteFrame, .25)

		local _, send, cancel = BattleTagInviteFrame:GetChildren()
		F.Reskin(send)
		F.Reskin(cancel)

		F.ReskinScroll(BattleTagInviteFrameScrollFrameScrollBar)

		-- Nav Bar

		local function moveNavButtons(self)
			for i=1, #self.navList do
				local navButton = self.navList[i]
				local lastNav = self.navList[i-1]
				if navButton and lastNav then
					navButton:ClearAllPoints()
					navButton:SetPoint("LEFT", lastNav, "RIGHT", 1, 0)
				end
			end
		end

		hooksecurefunc("NavBar_AddButton", function(self, buttonData)
			local navButton = self.navList[#self.navList]

			if not navButton.skinned then
				F.Reskin(navButton)
				F.ReskinArrow(navButton.MenuArrowButton, "down")

				navButton.arrowUp:SetAlpha(0)
				navButton.arrowDown:SetAlpha(0)
				navButton.selected:SetAlpha(0)
				navButton.MenuArrowButton.Art:Hide()

				navButton.skinned = true
			end

			moveNavButtons(self)
		end)

		-- Character frame

		do
			local i = 1
			while _G["CharacterFrameTab"..i] do
				F.ReskinTab(_G["CharacterFrameTab"..i])
				i = i + 1
			end
		end

		F.ReskinPortraitFrame(CharacterFrame, true)

		local function colourPopout(self)
			local aR, aG, aB
			local glow = self:GetParent().IconBorder

			if glow:IsShown() then
				aR, aG, aB = glow:GetVertexColor()
			else
				aR, aG, aB = r, g, b
			end

			self.arrow:SetVertexColor(aR, aG, aB)
		end

		local function clearPopout(self)
			self.arrow:SetVertexColor(1, 1, 1)
		end

		local slots = {
			"Head", "Neck", "Shoulder", "Shirt", "Chest", "Waist", "Legs", "Feet", "Wrist",
			"Hands", "Finger0", "Finger1", "Trinket0", "Trinket1", "Back", "MainHand",
			"SecondaryHand", "Tabard",
		}

		for i = 1, #slots do
			local slot = _G["Character"..slots[i].."Slot"]
			local ic = _G["Character"..slots[i].."SlotIconTexture"]
			local border = slot.IconBorder

			_G["Character"..slots[i].."SlotFrame"]:Hide()

			slot:SetNormalTexture("")
			slot:SetPushedTexture("")
			ic:SetTexCoord(.08, .92, .08, .92)

			border:SetTexture(C.media.backdrop)
			border:SetPoint("TOPLEFT", -1, 1)
			border:SetPoint("BOTTOMRIGHT", 1, -1)
			border:SetDrawLayer("BACKGROUND")

			local popout = slot.popoutButton

			popout:SetNormalTexture("")
			popout:SetHighlightTexture("")

			local arrow = popout:CreateTexture(nil, "OVERLAY")

			if slot.verticalFlyout then
				arrow:SetSize(13, 8)
				arrow:SetTexture(C.media.arrowDown)
				arrow:SetPoint("TOP", slot, "BOTTOM", 0, 1)
			else
				arrow:SetSize(8, 14)
				arrow:SetTexture(C.media.arrowRight)
				arrow:SetPoint("LEFT", slot, "RIGHT", -1, 0)
			end

			popout.arrow = arrow

			popout:HookScript("OnEnter", clearPopout)
			popout:HookScript("OnLeave", colourPopout)
		end

		select(11, CharacterMainHandSlot:GetRegions()):Hide()
		select(11, CharacterSecondaryHandSlot:GetRegions()):Hide()

		local updateChar = function(self)
			if not PaperDollFrame:IsShown() then return end

			for i, slotName in ipairs(slots) do
				if i == 18 then i = 19 end

				local slot = _G["Character"..slotName.."Slot"]
				local slotLink = GetInventoryItemLink("player", i)

				if slotLink then
					slot.icon:SetAlpha(1)
				else
					slot.icon:SetAlpha(0)
				end

				colourPopout(slot.popoutButton)
			end
		end

		do
			local f = CreateFrame("Frame")
			f:RegisterEvent("UNIT_INVENTORY_CHANGED")
			f:SetScript("OnEvent", updateChar)
			PaperDollFrame:HookScript("OnShow", updateChar)
		end

		for i = 1, #PAPERDOLL_SIDEBARS do
			local tab = _G["PaperDollSidebarTab"..i]

			if i == 1 then
				for i = 1, 4 do
					local region = select(i, tab:GetRegions())
					region:SetTexCoord(0.16, 0.86, 0.16, 0.86)
					region.SetTexCoord = F.dummy
				end
			end

			tab.Highlight:SetTexture(r, g, b, .2)
			tab.Highlight:SetPoint("TOPLEFT", 3, -4)
			tab.Highlight:SetPoint("BOTTOMRIGHT", -1, 0)
			tab.Hider:SetTexture(.3, .3, .3, .4)
			tab.TabBg:SetAlpha(0)

			select(2, tab:GetRegions()):ClearAllPoints()
			if i == 1 then
				select(2, tab:GetRegions()):SetPoint("TOPLEFT", 3, -4)
				select(2, tab:GetRegions()):SetPoint("BOTTOMRIGHT", -1, 0)
			else
				select(2, tab:GetRegions()):SetPoint("TOPLEFT", 2, -4)
				select(2, tab:GetRegions()):SetPoint("BOTTOMRIGHT", -1, -1)
			end

			tab.bg = CreateFrame("Frame", nil, tab)
			tab.bg:SetPoint("TOPLEFT", 2, -3)
			tab.bg:SetPoint("BOTTOMRIGHT", 0, -1)
			tab.bg:SetFrameLevel(0)
			F.CreateBD(tab.bg)

			tab.Hider:SetPoint("TOPLEFT", tab.bg, 1, -1)
			tab.Hider:SetPoint("BOTTOMRIGHT", tab.bg, -1, 1)
		end

		for i = 1, NUM_GEARSET_ICONS_SHOWN do
			local bu = _G["GearManagerDialogPopupButton"..i]
			local ic = _G["GearManagerDialogPopupButton"..i.."Icon"]

			bu:SetCheckedTexture(C.media.checked)
			select(2, bu:GetRegions()):Hide()
			ic:SetPoint("TOPLEFT", 1, -1)
			ic:SetPoint("BOTTOMRIGHT", -1, 1)
			ic:SetTexCoord(.08, .92, .08, .92)

			F.CreateBD(bu, .25)
		end

		local sets = false
		PaperDollSidebarTab3:HookScript("OnClick", function()
			if sets == false then
				for i = 1, 9 do
					local bu = _G["PaperDollEquipmentManagerPaneButton"..i]
					local bd = _G["PaperDollEquipmentManagerPaneButton"..i.."Stripe"]
					local ic = _G["PaperDollEquipmentManagerPaneButton"..i.."Icon"]
					_G["PaperDollEquipmentManagerPaneButton"..i.."BgTop"]:SetAlpha(0)
					_G["PaperDollEquipmentManagerPaneButton"..i.."BgMiddle"]:Hide()
					_G["PaperDollEquipmentManagerPaneButton"..i.."BgBottom"]:SetAlpha(0)

					bu.HighlightBar:SetTexture(r, g, b, .1)
					bu.HighlightBar:SetDrawLayer("BACKGROUND")
					bu.SelectedBar:SetTexture(r, g, b, .2)
					bu.SelectedBar:SetDrawLayer("BACKGROUND")

					bd:Hide()
					bd.Show = F.dummy
					ic:SetTexCoord(.08, .92, .08, .92)

					F.CreateBG(ic)
				end
				sets = true
			end
		end)

		-- Equipment flyout

		EquipmentFlyoutFrameHighlight:Hide()

		local border = F.CreateBDFrame(EquipmentFlyoutFrame, 0)
		border:SetBackdropBorderColor(1, 1, 1)
		border:SetPoint("TOPLEFT", 2, -2)
		border:SetPoint("BOTTOMRIGHT", -2, 2)

		local navFrame = EquipmentFlyoutFrame.NavigationFrame

		EquipmentFlyoutFrameButtons.bg1:SetAlpha(0)
		EquipmentFlyoutFrameButtons:DisableDrawLayer("ARTWORK")
		Test2:Hide() -- wat

		navFrame:SetWidth(204)
		navFrame:SetPoint("TOPLEFT", EquipmentFlyoutFrameButtons, "BOTTOMLEFT", 1, 0)

		hooksecurefunc("EquipmentFlyout_DisplayButton", function(button)
			if not button.styled then
				button:SetNormalTexture("")
				button:SetPushedTexture("")
				button.bg = F.CreateBG(button)

				button.icon:SetTexCoord(.08, .92, .08, .92)

				button.styled = true
			end

			local location = button.location
			if not location then return end

			local r, g, b

			if location >= EQUIPMENTFLYOUT_FIRST_SPECIAL_LOCATION then
				r, g, b = 0, 0, 0
			else
				local _, _, quality = GetItemInfo(EquipmentManager_GetItemInfoByLocation(location))
				r, g, b = GetItemQualityColor(quality)

				if r == 1 and g == 1 then r, g, b = 0, 0, 0 end
			end

			button.bg:SetVertexColor(r, g, b)
		end)

		F.CreateBD(EquipmentFlyoutFrame.NavigationFrame)
		F.ReskinArrow(EquipmentFlyoutFrame.NavigationFrame.PrevButton, "left")
		F.ReskinArrow(EquipmentFlyoutFrame.NavigationFrame.NextButton, "right")

		-- Quest Frame

		F.ReskinPortraitFrame(QuestFrame, true)

		QuestFrameDetailPanel:DisableDrawLayer("BACKGROUND")
		QuestFrameProgressPanel:DisableDrawLayer("BACKGROUND")
		QuestFrameRewardPanel:DisableDrawLayer("BACKGROUND")
		QuestFrameGreetingPanel:DisableDrawLayer("BACKGROUND")
		QuestFrameDetailPanel:DisableDrawLayer("BORDER")
		QuestFrameRewardPanel:DisableDrawLayer("BORDER")

		QuestDetailScrollFrameTop:Hide()
		QuestDetailScrollFrameBottom:Hide()
		QuestDetailScrollFrameMiddle:Hide()
		QuestProgressScrollFrameTop:Hide()
		QuestProgressScrollFrameBottom:Hide()
		QuestProgressScrollFrameMiddle:Hide()
		QuestRewardScrollFrameTop:Hide()
		QuestRewardScrollFrameBottom:Hide()
		QuestRewardScrollFrameMiddle:Hide()
		QuestGreetingScrollFrameTop:Hide()
		QuestGreetingScrollFrameBottom:Hide()
		QuestGreetingScrollFrameMiddle:Hide()

		QuestNPCModelShadowOverlay:Hide()
		QuestNPCModelBg:Hide()
		QuestNPCModel:DisableDrawLayer("OVERLAY")
		QuestNPCModelNameText:SetDrawLayer("ARTWORK")
		QuestNPCModelTextFrameBg:Hide()
		QuestNPCModelTextFrame:DisableDrawLayer("OVERLAY")

		QuestInfoItemHighlight:GetRegions():Hide()
		QuestInfoSpellObjectiveFrameNameFrame:Hide()
		QuestFrameProgressPanelMaterialTopLeft:SetAlpha(0)
		QuestFrameProgressPanelMaterialTopRight:SetAlpha(0)
		QuestFrameProgressPanelMaterialBotLeft:SetAlpha(0)
		QuestFrameProgressPanelMaterialBotRight:SetAlpha(0)

		local line = QuestFrameGreetingPanel:CreateTexture()
		line:SetTexture(1, 1, 1, .2)
		line:SetSize(256, 1)
		line:SetPoint("CENTER", QuestGreetingFrameHorizontalBreak)

		QuestGreetingFrameHorizontalBreak:SetTexture("")

		QuestFrameGreetingPanel:HookScript("OnShow", function()
			line:SetShown(QuestGreetingFrameHorizontalBreak:IsShown())
		end)

		local npcbd = CreateFrame("Frame", nil, QuestNPCModel)
		npcbd:SetPoint("TOPLEFT", -1, 1)
		npcbd:SetPoint("RIGHT", 1, 0)
		npcbd:SetPoint("BOTTOM", QuestNPCModelTextScrollFrame)
		npcbd:SetFrameLevel(0)
		F.CreateBD(npcbd)

		local npcLine = CreateFrame("Frame", nil, QuestNPCModel)
		npcLine:SetPoint("BOTTOMLEFT", 0, -2)
		npcLine:SetPoint("BOTTOMRIGHT", 0, -2)
		npcLine:SetHeight(1)
		npcLine:SetFrameLevel(0)
		F.CreateBD(npcLine, 0)

		QuestInfoSkillPointFrameIconTexture:SetSize(40, 40)
		QuestInfoSkillPointFrameIconTexture:SetTexCoord(.08, .92, .08, .92)

		local bg = CreateFrame("Frame", nil, QuestInfoSkillPointFrame)
		bg:SetPoint("TOPLEFT", -3, 0)
		bg:SetPoint("BOTTOMRIGHT", -3, 0)
		bg:Lower()
		F.CreateBD(bg, .25)

		QuestInfoSkillPointFrameNameFrame:Hide()
		QuestInfoSkillPointFrameName:SetParent(bg)
		QuestInfoSkillPointFrameIconTexture:SetParent(bg)

		local skillPointLine = QuestInfoSkillPointFrame:CreateTexture(nil, "BACKGROUND")
		skillPointLine:SetSize(1, 40)
		skillPointLine:SetPoint("RIGHT", QuestInfoSkillPointFrameIconTexture, 1, 0)
		skillPointLine:SetTexture(C.media.backdrop)
		skillPointLine:SetVertexColor(0, 0, 0)

		QuestInfoRewardSpellIconTexture:SetSize(40, 40)
		QuestInfoRewardSpellIconTexture:SetTexCoord(.08, .92, .08, .92)
		QuestInfoRewardSpellIconTexture:SetDrawLayer("OVERLAY")

		local bg = CreateFrame("Frame", nil, QuestInfoRewardSpell)
		bg:SetPoint("TOPLEFT", 9, -1)
		bg:SetPoint("BOTTOMRIGHT", -10, 13)
		bg:Lower()
		F.CreateBD(bg, .25)

		QuestInfoRewardSpellNameFrame:Hide()
		QuestInfoRewardSpellSpellBorder:Hide()
		QuestInfoRewardSpellName:SetParent(bg)
		QuestInfoRewardSpellIconTexture:SetParent(bg)

		local spellLine = QuestInfoRewardSpell:CreateTexture(nil, "BACKGROUND")
		spellLine:SetSize(1, 40)
		spellLine:SetPoint("RIGHT", QuestInfoRewardSpellIconTexture, 1, 0)
		spellLine:SetTexture(C.media.backdrop)
		spellLine:SetVertexColor(0, 0, 0)

		local function clearHighlight()
			for i = 1, MAX_NUM_ITEMS do
				_G["QuestInfoItem"..i]:SetBackdropColor(0, 0, 0, .25)
			end
		end

		local function setHighlight(self)
			clearHighlight()

			local _, point = self:GetPoint()
			point:SetBackdropColor(r, g, b, .2)
		end

		hooksecurefunc(QuestInfoItemHighlight, "SetPoint", setHighlight)
		QuestInfoItemHighlight:HookScript("OnShow", setHighlight)
		QuestInfoItemHighlight:HookScript("OnHide", clearHighlight)

		for i = 1, MAX_REQUIRED_ITEMS do
			local bu = _G["QuestProgressItem"..i]
			local ic = _G["QuestProgressItem"..i.."IconTexture"]
			local na = _G["QuestProgressItem"..i.."NameFrame"]
			local co = _G["QuestProgressItem"..i.."Count"]

			ic:SetSize(40, 40)
			ic:SetTexCoord(.08, .92, .08, .92)
			ic:SetDrawLayer("OVERLAY")

			F.CreateBD(bu, .25)

			na:Hide()
			co:SetDrawLayer("OVERLAY")

			local line = CreateFrame("Frame", nil, bu)
			line:SetSize(1, 40)
			line:SetPoint("RIGHT", ic, 1, 0)
			F.CreateBD(line)
		end

		QuestDetailScrollFrame:SetWidth(302) -- else these buttons get cut off

		hooksecurefunc("QuestFrame_ShowQuestPortrait", function(parentFrame, _, _, _, _, y)
			QuestNPCModel:SetPoint("TOPLEFT", parentFrame, "TOPRIGHT", 2, y)
		end)

		hooksecurefunc(QuestProgressRequiredMoneyText, "SetTextColor", function(self, r, g, b)
			if r == 0 then
				self:SetTextColor(.8, .8, .8)
			elseif r == .2 then
				self:SetTextColor(1, 1, 1)
			end
		end)

		hooksecurefunc(QuestInfoRequiredMoneyText, "SetTextColor", function(self, r, g, b)
			if r == 0 then
				self:SetTextColor(.8, .8, .8)
			elseif r == .2 then
				self:SetTextColor(1, 1, 1)
			end
		end)

		for _, questButton in pairs({"QuestFrameAcceptButton", "QuestFrameDeclineButton", "QuestFrameCompleteQuestButton", "QuestFrameCompleteButton", "QuestFrameGoodbyeButton", "QuestFrameGreetingGoodbyeButton"}) do
			F.Reskin(_G[questButton])
		end

		F.ReskinScroll(QuestProgressScrollFrameScrollBar)
		F.ReskinScroll(QuestRewardScrollFrameScrollBar)
		F.ReskinScroll(QuestDetailScrollFrameScrollBar)
		F.ReskinScroll(QuestGreetingScrollFrameScrollBar)
		F.ReskinScroll(QuestNPCModelTextScrollFrameScrollBar)

		-- Gossip Frame

		GossipGreetingScrollFrameTop:Hide()
		GossipGreetingScrollFrameBottom:Hide()
		GossipGreetingScrollFrameMiddle:Hide()
		select(19, GossipFrame:GetRegions()):Hide()

		GossipGreetingText:SetTextColor(1, 1, 1)

		NPCFriendshipStatusBar:GetRegions():Hide()
		NPCFriendshipStatusBarNotch1:SetTexture(0, 0, 0)
		NPCFriendshipStatusBarNotch1:SetSize(1, 16)
		NPCFriendshipStatusBarNotch2:SetTexture(0, 0, 0)
		NPCFriendshipStatusBarNotch2:SetSize(1, 16)
		NPCFriendshipStatusBarNotch3:SetTexture(0, 0, 0)
		NPCFriendshipStatusBarNotch3:SetSize(1, 16)
		NPCFriendshipStatusBarNotch4:SetTexture(0, 0, 0)
		NPCFriendshipStatusBarNotch4:SetSize(1, 16)
		select(7, NPCFriendshipStatusBar:GetRegions()):Hide()

		NPCFriendshipStatusBar.icon:SetPoint("TOPLEFT", -30, 7)
		F.CreateBDFrame(NPCFriendshipStatusBar, .25)

		F.ReskinPortraitFrame(GossipFrame, true)
		F.Reskin(GossipFrameGreetingGoodbyeButton)
		F.ReskinScroll(GossipGreetingScrollFrameScrollBar)

		-- StaticPopup

		local function colourMinimize(f)
			if f:IsEnabled() then
				f.minimize:SetVertexColor(r, g, b)
			end
		end

		local function clearMinimize(f)
			f.minimize:SetVertexColor(1, 1, 1)
		end

		for i = 1, 4 do
			local frame = _G["StaticPopup"..i]
			local bu = _G["StaticPopup"..i.."ItemFrame"]
			local close = _G["StaticPopup"..i.."CloseButton"]

			local gold = _G["StaticPopup"..i.."MoneyInputFrameGold"]
			local silver = _G["StaticPopup"..i.."MoneyInputFrameSilver"]
			local copper = _G["StaticPopup"..i.."MoneyInputFrameCopper"]

			_G["StaticPopup"..i.."ItemFrameNameFrame"]:Hide()
			_G["StaticPopup"..i.."ItemFrameIconTexture"]:SetTexCoord(.08, .92, .08, .92)

			bu:SetNormalTexture("")
			bu:SetHighlightTexture("")
			bu:SetPushedTexture("")
			F.CreateBG(bu)

			silver:SetPoint("LEFT", gold, "RIGHT", 1, 0)
			copper:SetPoint("LEFT", silver, "RIGHT", 1, 0)

			F.CreateBD(frame)

			for j = 1, 3 do
				F.Reskin(frame["button"..j])
			end

			F.ReskinClose(close)

			close.minimize = close:CreateTexture(nil, "OVERLAY")
			close.minimize:SetSize(9, 1)
			close.minimize:SetPoint("CENTER")
			close.minimize:SetTexture(C.media.backdrop)
			close.minimize:SetVertexColor(1, 1, 1)
			close:HookScript("OnEnter", colourMinimize)
			close:HookScript("OnLeave", clearMinimize)

			F.ReskinInput(_G["StaticPopup"..i.."EditBox"], 20)
			F.ReskinInput(gold)
			F.ReskinInput(silver)
			F.ReskinInput(copper)
		end

		hooksecurefunc("StaticPopup_Show", function(which, text_arg1, text_arg2, data)
			local info = StaticPopupDialogs[which]

			if not info then return end

			local dialog = nil
			dialog = StaticPopup_FindVisible(which, data)

			if not dialog then
				local index = 1
				if info.preferredIndex then
					index = info.preferredIndex
				end
				for i = index, STATICPOPUP_NUMDIALOGS do
					local frame = _G["StaticPopup"..i]
					if not frame:IsShown() then
						dialog = frame
						break
					end
				end

				if not dialog and info.preferredIndex then
					for i = 1, info.preferredIndex do
						local frame = _G["StaticPopup"..i]
						if not frame:IsShown() then
							dialog = frame
							break
						end
					end
				end
			end

			if not dialog then return end

			if info.closeButton then
				local closeButton = _G[dialog:GetName().."CloseButton"]

				closeButton:SetNormalTexture("")
				closeButton:SetPushedTexture("")

				if info.closeButtonIsHide then
					for _, pixel in pairs(closeButton.pixels) do
						pixel:Hide()
					end
					closeButton.minimize:Show()
				else
					for _, pixel in pairs(closeButton.pixels) do
						pixel:Show()
					end
					closeButton.minimize.Hide()
				end
			end
		end)

		-- Achievement alert

		local function fixBg(f)
			if f:GetObjectType() == "AnimationGroup" then
				f = f:GetParent()
			end
			f.bg:SetBackdropColor(0, 0, 0, .5)
		end

		hooksecurefunc("AlertFrame_FixAnchors", function()
			for i = 1, MAX_ACHIEVEMENT_ALERTS do
				local frame = _G["AchievementAlertFrame"..i]

				if frame then
					frame:SetAlpha(1)
					frame.SetAlpha = F.dummy

					local ic = _G["AchievementAlertFrame"..i.."Icon"]
					local texture = _G["AchievementAlertFrame"..i.."IconTexture"]
					local guildName = _G["AchievementAlertFrame"..i.."GuildName"]

					ic:ClearAllPoints()
					ic:SetPoint("LEFT", frame, "LEFT", -26, 0)

					if not frame.bg then
						frame.bg = CreateFrame("Frame", nil, frame)
						frame.bg:SetPoint("TOPLEFT", texture, -10, 12)
						frame.bg:SetPoint("BOTTOMRIGHT", texture, "BOTTOMRIGHT", 240, -12)
						frame.bg:SetFrameLevel(frame:GetFrameLevel()-1)
						F.CreateBD(frame.bg)

						frame:HookScript("OnEnter", fixBg)
						frame:HookScript("OnShow", fixBg)
						frame.animIn:HookScript("OnFinished", fixBg)
						F.CreateBD(frame.bg)

						F.CreateBG(texture)

						_G["AchievementAlertFrame"..i.."Background"]:Hide()
						_G["AchievementAlertFrame"..i.."IconOverlay"]:Hide()
						_G["AchievementAlertFrame"..i.."GuildBanner"]:SetTexture("")
						_G["AchievementAlertFrame"..i.."GuildBorder"]:SetTexture("")
						_G["AchievementAlertFrame"..i.."OldAchievement"]:SetTexture("")

						guildName:ClearAllPoints()
						guildName:SetPoint("TOPLEFT", 50, -14)
						guildName:SetPoint("TOPRIGHT", -50, -14)

						_G["AchievementAlertFrame"..i.."Unlocked"]:SetTextColor(1, 1, 1)
						_G["AchievementAlertFrame"..i.."Unlocked"]:SetShadowOffset(1, -1)
					end

					frame.glow:Hide()
					frame.shine:Hide()
					frame.glow.Show = F.dummy
					frame.shine.Show = F.dummy

					texture:SetTexCoord(.08, .92, .08, .92)

					if guildName:IsShown() then
						_G["AchievementAlertFrame"..i.."Shield"]:SetPoint("TOPRIGHT", -10, -22)
					end
				end
			end
		end)

		-- Guild challenges

		local challenge = CreateFrame("Frame", nil, GuildChallengeAlertFrame)
		challenge:SetPoint("TOPLEFT", 8, -12)
		challenge:SetPoint("BOTTOMRIGHT", -8, 13)
		challenge:SetFrameLevel(GuildChallengeAlertFrame:GetFrameLevel()-1)
		F.CreateBD(challenge)
		F.CreateBG(GuildChallengeAlertFrameEmblemBackground)

		GuildChallengeAlertFrameGlow:SetTexture("")
		GuildChallengeAlertFrameShine:SetTexture("")
		GuildChallengeAlertFrameEmblemBorder:SetTexture("")

		-- Dungeon completion rewards

		local bg = CreateFrame("Frame", nil, DungeonCompletionAlertFrame1)
		bg:SetPoint("TOPLEFT", 6, -14)
		bg:SetPoint("BOTTOMRIGHT", -6, 6)
		bg:SetFrameLevel(DungeonCompletionAlertFrame1:GetFrameLevel()-1)
		F.CreateBD(bg)

		DungeonCompletionAlertFrame1DungeonTexture:SetDrawLayer("ARTWORK")
		DungeonCompletionAlertFrame1DungeonTexture:SetTexCoord(.02, .98, .02, .98)
		F.CreateBG(DungeonCompletionAlertFrame1DungeonTexture)

		DungeonCompletionAlertFrame1.dungeonArt1:SetAlpha(0)
		DungeonCompletionAlertFrame1.dungeonArt2:SetAlpha(0)
		DungeonCompletionAlertFrame1.dungeonArt3:SetAlpha(0)
		DungeonCompletionAlertFrame1.dungeonArt4:SetAlpha(0)
		DungeonCompletionAlertFrame1.raidArt:SetAlpha(0)

		DungeonCompletionAlertFrame1.dungeonTexture:SetPoint("BOTTOMLEFT", DungeonCompletionAlertFrame1, "BOTTOMLEFT", 13, 13)
		DungeonCompletionAlertFrame1.dungeonTexture.SetPoint = F.dummy

		DungeonCompletionAlertFrame1.shine:Hide()
		DungeonCompletionAlertFrame1.shine.Show = F.dummy
		DungeonCompletionAlertFrame1.glow:Hide()
		DungeonCompletionAlertFrame1.glow.Show = F.dummy

		hooksecurefunc("DungeonCompletionAlertFrame_ShowAlert", function()
			local bu = DungeonCompletionAlertFrame1Reward1
			local index = 1

			while bu do
				if not bu.styled then
					_G["DungeonCompletionAlertFrame1Reward"..index.."Border"]:Hide()

					bu.texture:SetTexCoord(.08, .92, .08, .92)
					F.CreateBG(bu.texture)

					bu.styled = true
				end

				index = index + 1
				bu = _G["DungeonCompletionAlertFrame1Reward"..index]
			end
		end)

		-- Challenge popup

		hooksecurefunc("AlertFrame_SetChallengeModeAnchors", function()
			local frame = ChallengeModeAlertFrame1

			if frame then
				frame:SetAlpha(1)
				frame.SetAlpha = F.dummy

				if not frame.bg then
					frame.bg = CreateFrame("Frame", nil, frame)
					frame.bg:SetPoint("TOPLEFT", ChallengeModeAlertFrame1DungeonTexture, -12, 12)
					frame.bg:SetPoint("BOTTOMRIGHT", ChallengeModeAlertFrame1DungeonTexture, 243, -12)
					frame.bg:SetFrameLevel(frame:GetFrameLevel()-1)
					F.CreateBD(frame.bg)

					frame:HookScript("OnEnter", fixBg)
					frame:HookScript("OnShow", fixBg)
					frame.animIn:HookScript("OnFinished", fixBg)

					F.CreateBG(ChallengeModeAlertFrame1DungeonTexture)
				end

				frame:GetRegions():Hide()

				ChallengeModeAlertFrame1Shine:Hide()
				ChallengeModeAlertFrame1Shine.Show = F.dummy
				ChallengeModeAlertFrame1GlowFrame:Hide()
				ChallengeModeAlertFrame1GlowFrame.Show = F.dummy
				ChallengeModeAlertFrame1Border:Hide()
				ChallengeModeAlertFrame1Border.Show = F.dummy

				ChallengeModeAlertFrame1DungeonTexture:SetTexCoord(.08, .92, .08, .92)
			end
		end)

		-- Scenario alert

		hooksecurefunc("AlertFrame_SetScenarioAnchors", function()
			local frame = ScenarioAlertFrame1

			if frame then
				frame:SetAlpha(1)
				frame.SetAlpha = F.dummy

				if not frame.bg then
					frame.bg = CreateFrame("Frame", nil, frame)
					frame.bg:SetPoint("TOPLEFT", ScenarioAlertFrame1DungeonTexture, -12, 12)
					frame.bg:SetPoint("BOTTOMRIGHT", ScenarioAlertFrame1DungeonTexture, 244, -12)
					frame.bg:SetFrameLevel(frame:GetFrameLevel()-1)
					F.CreateBD(frame.bg)

					frame:HookScript("OnEnter", fixBg)
					frame:HookScript("OnShow", fixBg)
					frame.animIn:HookScript("OnFinished", fixBg)

					F.CreateBG(ScenarioAlertFrame1DungeonTexture)
					ScenarioAlertFrame1DungeonTexture:SetDrawLayer("OVERLAY")
				end

				frame:GetRegions():Hide()
				select(3, frame:GetRegions()):Hide()

				ScenarioAlertFrame1Shine:Hide()
				ScenarioAlertFrame1Shine.Show = F.dummy
				ScenarioAlertFrame1GlowFrame:Hide()
				ScenarioAlertFrame1GlowFrame.Show = F.dummy

				ScenarioAlertFrame1DungeonTexture:SetTexCoord(.08, .92, .08, .92)
			end
		end)

		hooksecurefunc("ScenarioAlertFrame_ShowAlert", function()
			local bu = ScenarioAlertFrame1Reward1
			local index = 1

			while bu do
				if not bu.styled then
					_G["ScenarioAlertFrame1Reward"..index.."Border"]:Hide()

					bu.texture:SetTexCoord(.08, .92, .08, .92)
					F.CreateBG(bu.texture)

					bu.styled = true
				end

				index = index + 1
				bu = _G["ScenarioAlertFrame1Reward"..index]
			end
		end)

		-- Loot won alert

		-- I still don't know why I can't parent bg to frame
		local function showHideBg(self)
			self.bg:SetShown(self:IsShown())
		end

		local function onUpdate(self)
			self.bg:SetAlpha(self:GetAlpha())
		end

		hooksecurefunc("LootWonAlertFrame_SetUp", function(frame)
			if not frame.bg then
				frame.bg = CreateFrame("Frame", nil, UIParent)
				frame.bg:SetPoint("TOPLEFT", frame, 10, -10)
				frame.bg:SetPoint("BOTTOMRIGHT", frame, -10, 10)
				frame.bg:SetFrameStrata("DIALOG")
				frame.bg:SetFrameLevel(frame:GetFrameLevel()-1)
				frame.bg:SetShown(frame:IsShown())
				F.CreateBD(frame.bg)

				frame:HookScript("OnShow", showHideBg)
				frame:HookScript("OnHide", showHideBg)
				frame:HookScript("OnUpdate", onUpdate)

				frame.Background:Hide()
				frame.IconBorder:Hide()
				frame.glow:SetTexture("")
				frame.shine:SetTexture("")
				frame.SpecRing:SetTexture("")

				frame.Icon:SetTexCoord(.08, .92, .08, .92)
				F.CreateBG(frame.Icon)

				frame.SpecIcon:SetTexCoord(.08, .92, .08, .92)
				frame.SpecIcon.bg = F.CreateBG(frame.SpecIcon)
				frame.SpecIcon.bg:SetDrawLayer("BORDER", 2)
			end

			frame.SpecIcon.bg:SetShown(frame.SpecIcon:IsShown())
		end)

		-- Money won alert

		hooksecurefunc("MoneyWonAlertFrame_SetUp", function(frame)
			if not frame.bg then
				frame.bg = CreateFrame("Frame", nil, UIParent)
				frame.bg:SetPoint("TOPLEFT", frame, 10, -10)
				frame.bg:SetPoint("BOTTOMRIGHT", frame, -10, 10)
				frame.bg:SetFrameStrata("DIALOG")
				frame.bg:SetFrameLevel(frame:GetFrameLevel()-1)
				frame.bg:SetShown(frame:IsShown())
				F.CreateBD(frame.bg)

				frame:HookScript("OnShow", showHideBg)
				frame:HookScript("OnHide", showHideBg)
				frame:HookScript("OnUpdate", onUpdate)

				frame.Background:Hide()
				frame.IconBorder:Hide()

				frame.Icon:SetTexCoord(.08, .92, .08, .92)
				F.CreateBG(frame.Icon)
			end
		end)

		-- Criteria alert

		hooksecurefunc("CriteriaAlertFrame_ShowAlert", function()
			for i = 1, MAX_ACHIEVEMENT_ALERTS do
				local frame = _G["CriteriaAlertFrame"..i]
				if frame and not frame.bg then
					local icon = _G["CriteriaAlertFrame"..i.."IconTexture"]

					frame.bg = CreateFrame("Frame", nil, UIParent)
					frame.bg:SetPoint("TOPLEFT", icon, -6, 5)
					frame.bg:SetPoint("BOTTOMRIGHT", icon, 236, -5)
					frame.bg:SetFrameStrata("DIALOG")
					frame.bg:SetFrameLevel(frame:GetFrameLevel()-1)
					frame.bg:SetShown(frame:IsShown())
					F.CreateBD(frame.bg)

					frame:SetScript("OnShow", showHideBg)
					frame:SetScript("OnHide", showHideBg)
					frame:HookScript("OnUpdate", onUpdate)

					_G["CriteriaAlertFrame"..i.."Background"]:Hide()
					_G["CriteriaAlertFrame"..i.."IconOverlay"]:Hide()
					frame.glow:Hide()
					frame.glow.Show = F.dummy
					frame.shine:Hide()
					frame.shine.Show = F.dummy

					_G["CriteriaAlertFrame"..i.."Unlocked"]:SetTextColor(.9, .9, .9)

					icon:SetTexCoord(.08, .92, .08, .92)
					F.CreateBG(icon)
				end
			end
		end)

		-- Digsite completion alert

		do
			local frame = DigsiteCompleteToastFrame
			local icon = frame.DigsiteTypeTexture

			F.CreateBD(DigsiteCompleteToastFrame)

			frame:GetRegions():Hide()

			frame.glow:Hide()
			frame.glow.Show = F.dummy
			frame.shine:Hide()
			frame.shine.Show = F.dummy
		end

		-- Help frame

		for i = 1, 15 do
			local bu = _G["HelpFrameKnowledgebaseScrollFrameButton"..i]
			bu:DisableDrawLayer("ARTWORK")
			F.CreateBD(bu, 0)

			F.CreateGradient(bu)
		end

		local function colourTab(f)
			f.text:SetTextColor(1, 1, 1)
		end

		local function clearTab(f)
			f.text:SetTextColor(1, .82, 0)
		end

		local function styleTab(bu)
			bu.selected:SetTexture(r, g, b, .2)
			bu.selected:SetDrawLayer("BACKGROUND")
			bu.text:SetFont(C.media.font2, 14)
			F.Reskin(bu, true)
			bu:SetScript("OnEnter", colourTab)
			bu:SetScript("OnLeave", clearTab)
		end

		for i = 1, 6 do
			styleTab(_G["HelpFrameButton"..i])
		end
		styleTab(HelpFrameButton16)

		HelpFrameAccountSecurityOpenTicket.text:SetFont(C.media.font2, 14)
		HelpFrameOpenTicketHelpOpenTicket.text:SetFont(C.media.font2, 14)
		HelpFrameOpenTicketHelpTopIssues.text:SetFont(C.media.font2, 14)
		HelpFrameOpenTicketHelpItemRestoration.text:SetFont(C.media.font2, 14)

		HelpFrameCharacterStuckHearthstone:SetSize(56, 56)
		F.CreateBG(HelpFrameCharacterStuckHearthstone)
		HelpFrameCharacterStuckHearthstoneIconTexture:SetTexCoord(.08, .92, .08, .92)

		F.Reskin(HelpBrowserNavHome)
		F.Reskin(HelpBrowserNavReload)
		F.Reskin(HelpBrowserNavStop)
		F.Reskin(HelpBrowserBrowserSettings)
		F.ReskinArrow(HelpBrowserNavBack, "left")
		F.ReskinArrow(HelpBrowserNavForward, "right")

		HelpBrowserNavHome:SetSize(18, 18)
		HelpBrowserNavReload:SetSize(18, 18)
		HelpBrowserNavStop:SetSize(18, 18)
		HelpBrowserBrowserSettings:SetSize(18, 18)

		HelpBrowserNavHome:SetPoint("BOTTOMLEFT", HelpBrowser, "TOPLEFT", 2, 4)
		HelpBrowserBrowserSettings:SetPoint("TOPRIGHT", HelpFrameCloseButton, "BOTTOMLEFT", -4, -1)
		LoadingIcon:ClearAllPoints()
		LoadingIcon:SetPoint("LEFT", HelpBrowserNavStop, "RIGHT")

		for i = 1, 9 do
			select(i, BrowserSettingsTooltip:GetRegions()):Hide()
		end

		F.CreateBD(BrowserSettingsTooltip)
		F.Reskin(BrowserSettingsTooltip.CacheButton)
		F.Reskin(BrowserSettingsTooltip.CookiesButton)

		-- Option panels

		local options = false
		VideoOptionsFrame:HookScript("OnShow", function()
			if options == true then return end
			options = true

			local line = VideoOptionsFrame:CreateTexture(nil, "ARTWORK")
			line:SetSize(1, 512)
			line:SetPoint("LEFT", 205, 30)
			line:SetTexture(1, 1, 1, .2)

			F.CreateBD(AudioOptionsSoundPanelPlayback, .25)
			F.CreateBD(AudioOptionsSoundPanelHardware, .25)
			F.CreateBD(AudioOptionsSoundPanelVolume, .25)
			F.CreateBD(AudioOptionsVoicePanelTalking, .25)
			F.CreateBD(AudioOptionsVoicePanelBinding, .25)
			F.CreateBD(AudioOptionsVoicePanelListening, .25)

			AudioOptionsSoundPanelPlaybackTitle:SetPoint("BOTTOMLEFT", AudioOptionsSoundPanelPlayback, "TOPLEFT", 5, 2)
			AudioOptionsSoundPanelHardwareTitle:SetPoint("BOTTOMLEFT", AudioOptionsSoundPanelHardware, "TOPLEFT", 5, 2)
			AudioOptionsSoundPanelVolumeTitle:SetPoint("BOTTOMLEFT", AudioOptionsSoundPanelVolume, "TOPLEFT", 5, 2)
			AudioOptionsVoicePanelTalkingTitle:SetPoint("BOTTOMLEFT", AudioOptionsVoicePanelTalking, "TOPLEFT", 5, 2)
			AudioOptionsVoicePanelListeningTitle:SetPoint("BOTTOMLEFT", AudioOptionsVoicePanelListening, "TOPLEFT", 5, 2)

			local dropdowns = {"Graphics_DisplayModeDropDown", "Graphics_ResolutionDropDown", "Graphics_RefreshDropDown", "Graphics_PrimaryMonitorDropDown", "Graphics_MultiSampleDropDown", "Graphics_VerticalSyncDropDown", "Graphics_TextureResolutionDropDown", "Graphics_FilteringDropDown", "Graphics_ProjectedTexturesDropDown", "Graphics_ShadowsDropDown", "Graphics_LiquidDetailDropDown", "Graphics_SunshaftsDropDown", "Graphics_ParticleDensityDropDown", "Graphics_ViewDistanceDropDown", "Graphics_EnvironmentalDetailDropDown", "Graphics_GroundClutterDropDown", "Graphics_SSAODropDown", "Advanced_BufferingDropDown", "Advanced_LagDropDown", "Advanced_HardwareCursorDropDown", "AudioOptionsSoundPanelHardwareDropDown", "AudioOptionsSoundPanelSoundChannelsDropDown", "AudioOptionsVoicePanelInputDeviceDropDown", "AudioOptionsVoicePanelChatModeDropDown", "AudioOptionsVoicePanelOutputDeviceDropDown", "InterfaceOptionsLanguagesPanelLocaleDropDown"}
			for i = 1, #dropdowns do
				F.ReskinDropDown(_G[dropdowns[i]])
			end

			Graphics_RightQuality:GetRegions():Hide()
			Graphics_RightQuality:DisableDrawLayer("BORDER")

			local sliders = {"Graphics_Quality", "Advanced_UIScaleSlider", "Advanced_MaxFPSSlider", "Advanced_MaxFPSBKSlider", "Advanced_GammaSlider", "AudioOptionsSoundPanelSoundQuality", "AudioOptionsSoundPanelMasterVolume", "AudioOptionsSoundPanelSoundVolume", "AudioOptionsSoundPanelMusicVolume", "AudioOptionsSoundPanelAmbienceVolume", "AudioOptionsVoicePanelMicrophoneVolume", "AudioOptionsVoicePanelSpeakerVolume", "AudioOptionsVoicePanelSoundFade", "AudioOptionsVoicePanelMusicFade", "AudioOptionsVoicePanelAmbienceFade"}
			for i = 1, #sliders do
				F.ReskinSlider(_G[sliders[i]])
			end

			Graphics_Quality.SetBackdrop = F.dummy

			local checkboxes = {"Advanced_UseUIScale", "Advanced_MaxFPSCheckBox", "Advanced_MaxFPSBKCheckBox", "Advanced_DesktopGamma", "NetworkOptionsPanelOptimizeSpeed", "NetworkOptionsPanelUseIPv6", "NetworkOptionsPanelAdvancedCombatLogging", "AudioOptionsSoundPanelEnableSound", "AudioOptionsSoundPanelSoundEffects", "AudioOptionsSoundPanelErrorSpeech", "AudioOptionsSoundPanelEmoteSounds", "AudioOptionsSoundPanelPetSounds", "AudioOptionsSoundPanelMusic", "AudioOptionsSoundPanelLoopMusic", "AudioOptionsSoundPanelPetBattleMusic", "AudioOptionsSoundPanelAmbientSounds", "AudioOptionsSoundPanelSoundInBG", "AudioOptionsSoundPanelReverb", "AudioOptionsSoundPanelHRTF", "AudioOptionsSoundPanelEnableDSPs", "AudioOptionsVoicePanelEnableVoice", "AudioOptionsVoicePanelEnableMicrophone", "AudioOptionsVoicePanelPushToTalkSound"}
			for i = 1, #checkboxes do
				F.ReskinCheck(_G[checkboxes[i]])
			end

			F.Reskin(RecordLoopbackSoundButton)
			F.Reskin(PlayLoopbackSoundButton)
			F.Reskin(AudioOptionsVoicePanelChatMode1KeyBindingButton)
		end)

		local interface = false
		InterfaceOptionsFrame:HookScript("OnShow", function()
			if interface == true then return end
			interface = true

			local line = InterfaceOptionsFrame:CreateTexture(nil, "ARTWORK")
			line:SetSize(1, 546)
			line:SetPoint("LEFT", 205, 10)
			line:SetTexture(1, 1, 1, .2)

			local checkboxes = {"InterfaceOptionsControlsPanelStickyTargeting", "InterfaceOptionsControlsPanelAutoDismount", "InterfaceOptionsControlsPanelAutoClearAFK", "InterfaceOptionsControlsPanelBlockTrades", "InterfaceOptionsControlsPanelBlockGuildInvites", "InterfaceOptionsControlsPanelBlockChatChannelInvites", "InterfaceOptionsControlsPanelLootAtMouse", "InterfaceOptionsControlsPanelAutoLootCorpse", "InterfaceOptionsControlsPanelInteractOnLeftClick", "InterfaceOptionsControlsPanelReverseCleanUpBags", "InterfaceOptionsControlsPanelReverseNewLoot", "InterfaceOptionsCombatPanelAttackOnAssist", "InterfaceOptionsCombatPanelStopAutoAttack", "InterfaceOptionsNamesPanelUnitNameplatesNameplateClassColors", "InterfaceOptionsCombatPanelTargetOfTarget", "InterfaceOptionsCombatPanelShowSpellAlerts", "InterfaceOptionsCombatPanelReducedLagTolerance", "InterfaceOptionsCombatPanelActionButtonUseKeyDown", "InterfaceOptionsCombatPanelEnemyCastBarsOnPortrait", "InterfaceOptionsCombatPanelEnemyCastBarsOnNameplates", "InterfaceOptionsCombatPanelEnemyCastBarsOnOnlyTargetNameplates", "InterfaceOptionsCombatPanelEnemyCastBarsNameplateSpellNames", "InterfaceOptionsCombatPanelAutoSelfCast", "InterfaceOptionsCombatPanelLossOfControl", "InterfaceOptionsDisplayPanelShowCloak", "InterfaceOptionsDisplayPanelShowHelm", "InterfaceOptionsDisplayPanelShowAggroPercentage", "InterfaceOptionsDisplayPanelPlayAggroSounds", "InterfaceOptionsDisplayPanelShowSpellPointsAvg", "InterfaceOptionsDisplayPanelShowFreeBagSpace", "InterfaceOptionsDisplayPanelCinematicSubtitles", "InterfaceOptionsDisplayPanelRotateMinimap", "InterfaceOptionsDisplayPanelShowAccountAchievments", "InterfaceOptionsObjectivesPanelAutoQuestTracking", "InterfaceOptionsObjectivesPanelMapFade", "InterfaceOptionsSocialPanelProfanityFilter", "InterfaceOptionsSocialPanelSpamFilter", "InterfaceOptionsSocialPanelChatBubbles", "InterfaceOptionsSocialPanelPartyChat", "InterfaceOptionsSocialPanelChatHoverDelay", "InterfaceOptionsSocialPanelGuildMemberAlert", "InterfaceOptionsSocialPanelChatMouseScroll", "InterfaceOptionsSocialPanelWholeChatWindowClickable", "InterfaceOptionsActionBarsPanelBottomLeft", "InterfaceOptionsActionBarsPanelBottomRight", "InterfaceOptionsActionBarsPanelRight", "InterfaceOptionsActionBarsPanelRightTwo", "InterfaceOptionsActionBarsPanelLockActionBars", "InterfaceOptionsActionBarsPanelAlwaysShowActionBars", "InterfaceOptionsActionBarsPanelSecureAbilityToggle", "InterfaceOptionsActionBarsPanelCountdownCooldowns", "InterfaceOptionsNamesPanelMyName", "InterfaceOptionsNamesPanelMinus", "InterfaceOptionsNamesPanelFriendlyPlayerNames", "InterfaceOptionsNamesPanelFriendlyPets", "InterfaceOptionsNamesPanelFriendlyGuardians", "InterfaceOptionsNamesPanelFriendlyTotems", "InterfaceOptionsNamesPanelUnitNameplatesFriends", "InterfaceOptionsNamesPanelUnitNameplatesFriendlyPets", "InterfaceOptionsNamesPanelUnitNameplatesFriendlyGuardians", "InterfaceOptionsNamesPanelUnitNameplatesFriendlyTotems", "InterfaceOptionsNamesPanelGuilds", "InterfaceOptionsNamesPanelGuildTitles", "InterfaceOptionsNamesPanelTitles", "InterfaceOptionsNamesPanelNonCombatCreature", "InterfaceOptionsNamesPanelEnemyPlayerNames", "InterfaceOptionsNamesPanelEnemyPets", "InterfaceOptionsNamesPanelEnemyGuardians", "InterfaceOptionsNamesPanelEnemyTotems", "InterfaceOptionsNamesPanelUnitNameplatesEnemies", "InterfaceOptionsNamesPanelUnitNameplatesEnemyPets", "InterfaceOptionsNamesPanelUnitNameplatesEnemyGuardians", "InterfaceOptionsNamesPanelUnitNameplatesEnemyTotems", "InterfaceOptionsNamesPanelUnitNameplatesEnemyMinus", "InterfaceOptionsCombatTextPanelTargetDamage", "InterfaceOptionsCombatTextPanelPeriodicDamage", "InterfaceOptionsCombatTextPanelPetDamage", "InterfaceOptionsCombatTextPanelHealing", "InterfaceOptionsCombatTextPanelHealingAbsorbTarget", "InterfaceOptionsCombatTextPanelTargetEffects", "InterfaceOptionsCombatTextPanelOtherTargetEffects", "InterfaceOptionsCombatTextPanelEnableFCT", "InterfaceOptionsCombatTextPanelDodgeParryMiss", "InterfaceOptionsCombatTextPanelDamageReduction", "InterfaceOptionsCombatTextPanelRepChanges", "InterfaceOptionsCombatTextPanelReactiveAbilities", "InterfaceOptionsCombatTextPanelFriendlyHealerNames", "InterfaceOptionsCombatTextPanelCombatState", "InterfaceOptionsCombatTextPanelHealingAbsorbSelf", "InterfaceOptionsCombatTextPanelComboPoints", "InterfaceOptionsCombatTextPanelLowManaHealth", "InterfaceOptionsCombatTextPanelEnergyGains", "InterfaceOptionsCombatTextPanelPeriodicEnergyGains", "InterfaceOptionsCombatTextPanelHonorGains", "InterfaceOptionsCombatTextPanelAuras", "InterfaceOptionsCombatTextPanelPetBattle", "InterfaceOptionsStatusTextPanelPlayer", "InterfaceOptionsStatusTextPanelPet", "InterfaceOptionsStatusTextPanelParty", "InterfaceOptionsStatusTextPanelTarget", "InterfaceOptionsStatusTextPanelAlternateResource", "InterfaceOptionsStatusTextPanelXP", "InterfaceOptionsBuffsPanelDispellableDebuffs", "InterfaceOptionsBuffsPanelCastableBuffs", "InterfaceOptionsBuffsPanelConsolidateBuffs", "InterfaceOptionsBuffsPanelShowAllEnemyDebuffs", "InterfaceOptionsBattlenetPanelOnlineFriends", "InterfaceOptionsBattlenetPanelOfflineFriends", "InterfaceOptionsBattlenetPanelBroadcasts", "InterfaceOptionsBattlenetPanelFriendRequests", "InterfaceOptionsBattlenetPanelConversations", "InterfaceOptionsBattlenetPanelShowToastWindow", "InterfaceOptionsCameraPanelFollowTerrain", "InterfaceOptionsCameraPanelHeadBob", "InterfaceOptionsCameraPanelWaterCollision", "InterfaceOptionsCameraPanelSmartPivot", "InterfaceOptionsMousePanelInvertMouse", "InterfaceOptionsMousePanelClickToMove", "InterfaceOptionsMousePanelWoWMouse", "InterfaceOptionsHelpPanelShowTutorials", "InterfaceOptionsHelpPanelEnhancedTooltips", "InterfaceOptionsHelpPanelShowLuaErrors", "InterfaceOptionsHelpPanelColorblindMode", "InterfaceOptionsHelpPanelMovePad", "InterfaceOptionsControlsPanelAutoOpenLootHistory"}
			for i = 1, #checkboxes do
				F.ReskinCheck(_G[checkboxes[i]])
			end

			local dropdowns = {"InterfaceOptionsControlsPanelAutoLootKeyDropDown", "InterfaceOptionsCombatPanelFocusCastKeyDropDown", "InterfaceOptionsCombatPanelSelfCastKeyDropDown", "InterfaceOptionsCombatPanelLossOfControlFullDropDown", "InterfaceOptionsCombatPanelLossOfControlSilenceDropDown", "InterfaceOptionsCombatPanelLossOfControlInterruptDropDown", "InterfaceOptionsCombatPanelLossOfControlDisarmDropDown", "InterfaceOptionsCombatPanelLossOfControlRootDropDown", "InterfaceOptionsDisplayPanelOutlineDropDown", "InterfaceOptionsObjectivesPanelQuestSorting", "InterfaceOptionsSocialPanelChatStyle", "InterfaceOptionsSocialPanelTimestamps", "InterfaceOptionsSocialPanelWhisperMode", "InterfaceOptionsSocialPanelBnWhisperMode", "InterfaceOptionsSocialPanelConversationMode", "InterfaceOptionsActionBarsPanelPickupActionKeyDropDown", "InterfaceOptionsNamesPanelNPCNamesDropDown", "InterfaceOptionsNamesPanelUnitNameplatesMotionDropDown", "InterfaceOptionsCombatTextPanelTargetModeDropDown", "InterfaceOptionsCombatTextPanelFCTDropDown", "InterfaceOptionsStatusTextPanelDisplayDropDown", "InterfaceOptionsCameraPanelStyleDropDown", "InterfaceOptionsMousePanelClickMoveStyleDropDown"}
			for i = 1, #dropdowns do
				F.ReskinDropDown(_G[dropdowns[i]])
			end

			local sliders = {"InterfaceOptionsCombatPanelSpellAlertOpacitySlider", "InterfaceOptionsCombatPanelMaxSpellStartRecoveryOffset", "InterfaceOptionsBattlenetPanelToastDurationSlider", "InterfaceOptionsCameraPanelMaxDistanceSlider", "InterfaceOptionsCameraPanelFollowSpeedSlider", "InterfaceOptionsMousePanelMouseSensitivitySlider", "InterfaceOptionsMousePanelMouseLookSpeedSlider"}
			for i = 1, #sliders do
				F.ReskinSlider(_G[sliders[i]])
			end

			F.Reskin(InterfaceOptionsHelpPanelResetTutorials)

			if not C.unitframes.enable and IsAddOnLoaded("Blizzard_CompactRaidFrames") then
				CompactUnitFrameProfilesGeneralOptionsFrameAutoActivateBG:Hide()

				local boxes = {CompactUnitFrameProfilesRaidStylePartyFrames, CompactUnitFrameProfilesGeneralOptionsFrameKeepGroupsTogether, CompactUnitFrameProfilesGeneralOptionsFrameHorizontalGroups, CompactUnitFrameProfilesGeneralOptionsFrameDisplayIncomingHeals, CompactUnitFrameProfilesGeneralOptionsFrameDisplayPowerBar, CompactUnitFrameProfilesGeneralOptionsFrameDisplayAggroHighlight, CompactUnitFrameProfilesGeneralOptionsFrameUseClassColors, CompactUnitFrameProfilesGeneralOptionsFrameDisplayPets, CompactUnitFrameProfilesGeneralOptionsFrameDisplayMainTankAndAssist, CompactUnitFrameProfilesGeneralOptionsFrameDisplayBorder, CompactUnitFrameProfilesGeneralOptionsFrameShowDebuffs, CompactUnitFrameProfilesGeneralOptionsFrameDisplayOnlyDispellableDebuffs, CompactUnitFrameProfilesGeneralOptionsFrameAutoActivate2Players, CompactUnitFrameProfilesGeneralOptionsFrameAutoActivate3Players, CompactUnitFrameProfilesGeneralOptionsFrameAutoActivate5Players, CompactUnitFrameProfilesGeneralOptionsFrameAutoActivate10Players, CompactUnitFrameProfilesGeneralOptionsFrameAutoActivate15Players, CompactUnitFrameProfilesGeneralOptionsFrameAutoActivate25Players, CompactUnitFrameProfilesGeneralOptionsFrameAutoActivate40Players, CompactUnitFrameProfilesGeneralOptionsFrameAutoActivateSpec1, CompactUnitFrameProfilesGeneralOptionsFrameAutoActivateSpec2, CompactUnitFrameProfilesGeneralOptionsFrameAutoActivatePvP, CompactUnitFrameProfilesGeneralOptionsFrameAutoActivatePvE}

				for _, box in next, boxes do
					F.ReskinCheck(box)
				end

				F.Reskin(CompactUnitFrameProfilesSaveButton)
				F.Reskin(CompactUnitFrameProfilesDeleteButton)
				F.Reskin(CompactUnitFrameProfilesGeneralOptionsFrameResetPositionButton)
				F.ReskinDropDown(CompactUnitFrameProfilesProfileSelector)
				F.ReskinDropDown(CompactUnitFrameProfilesGeneralOptionsFrameSortByDropdown)
				F.ReskinDropDown(CompactUnitFrameProfilesGeneralOptionsFrameHealthTextDropdown)
				F.ReskinSlider(CompactUnitFrameProfilesGeneralOptionsFrameHeightSlider)
				F.ReskinSlider(CompactUnitFrameProfilesGeneralOptionsFrameWidthSlider)
			end
		end)

		hooksecurefunc("InterfaceOptions_AddCategory", function()
			local num = #INTERFACEOPTIONS_ADDONCATEGORIES
			for i = 1, num do
				local bu = _G["InterfaceOptionsFrameAddOnsButton"..i.."Toggle"]
				if bu and not bu.reskinned then
					F.ReskinExpandOrCollapse(bu)
					bu:SetPushedTexture("")
					bu.SetPushedTexture = F.dummy
					bu.reskinned = true
				end
			end
		end)

		hooksecurefunc("OptionsListButtonToggle_OnClick", function(self)
			if self:GetParent().element.collapsed then
				self.plus:Show()
			else
				self.plus:Hide()
			end
		end)

		-- SideDressUp

		SideDressUpModel:HookScript("OnShow", function(self)
			self:ClearAllPoints()
			self:SetPoint("LEFT", self:GetParent():GetParent(), "RIGHT", 1, 0)
		end)

		SideDressUpModel.bg = CreateFrame("Frame", nil, SideDressUpModel)
		SideDressUpModel.bg:SetPoint("TOPLEFT", 0, 1)
		SideDressUpModel.bg:SetPoint("BOTTOMRIGHT", 1, -1)
		SideDressUpModel.bg:SetFrameLevel(SideDressUpModel:GetFrameLevel()-1)
		F.CreateBD(SideDressUpModel.bg)

		-- Trade Frame

		TradePlayerEnchantInset:DisableDrawLayer("BORDER")
		TradePlayerItemsInset:DisableDrawLayer("BORDER")
		TradeRecipientEnchantInset:DisableDrawLayer("BORDER")
		TradeRecipientItemsInset:DisableDrawLayer("BORDER")
		TradePlayerInputMoneyInset:DisableDrawLayer("BORDER")
		TradeRecipientMoneyInset:DisableDrawLayer("BORDER")
		TradeRecipientBG:Hide()
		TradePlayerEnchantInsetBg:Hide()
		TradePlayerItemsInsetBg:Hide()
		TradePlayerInputMoneyInsetBg:Hide()
		TradeRecipientEnchantInsetBg:Hide()
		TradeRecipientItemsInsetBg:Hide()
		TradeRecipientMoneyBg:Hide()
		TradeRecipientPortraitFrame:Hide()
		TradeRecipientBotLeftCorner:Hide()
		TradeRecipientLeftBorder:Hide()
		select(4, TradePlayerItem7:GetRegions()):Hide()
		select(4, TradeRecipientItem7:GetRegions()):Hide()
		TradeFramePlayerPortrait:Hide()
		TradeFrameRecipientPortrait:Hide()

		F.ReskinPortraitFrame(TradeFrame, true)
		F.Reskin(TradeFrameTradeButton)
		F.Reskin(TradeFrameCancelButton)
		F.ReskinInput(TradePlayerInputMoneyFrameGold)
		F.ReskinInput(TradePlayerInputMoneyFrameSilver)
		F.ReskinInput(TradePlayerInputMoneyFrameCopper)

		TradePlayerInputMoneyFrameSilver:SetPoint("LEFT", TradePlayerInputMoneyFrameGold, "RIGHT", 1, 0)
		TradePlayerInputMoneyFrameCopper:SetPoint("LEFT", TradePlayerInputMoneyFrameSilver, "RIGHT", 1, 0)

		for i = 1, MAX_TRADE_ITEMS do
			local bu1 = _G["TradePlayerItem"..i.."ItemButton"]
			local bu2 = _G["TradeRecipientItem"..i.."ItemButton"]

			_G["TradePlayerItem"..i.."SlotTexture"]:Hide()
			_G["TradePlayerItem"..i.."NameFrame"]:Hide()
			_G["TradeRecipientItem"..i.."SlotTexture"]:Hide()
			_G["TradeRecipientItem"..i.."NameFrame"]:Hide()

			bu1:SetNormalTexture("")
			bu1:SetPushedTexture("")
			bu1.icon:SetTexCoord(.08, .92, .08, .92)
			bu2:SetNormalTexture("")
			bu2:SetPushedTexture("")
			bu2.icon:SetTexCoord(.08, .92, .08, .92)

			local bg1 = CreateFrame("Frame", nil, bu1)
			bg1:SetPoint("TOPLEFT", -1, 1)
			bg1:SetPoint("BOTTOMRIGHT", 1, -1)
			bg1:SetFrameLevel(bu1:GetFrameLevel()-1)
			F.CreateBD(bg1, .25)

			local bg2 = CreateFrame("Frame", nil, bu2)
			bg2:SetPoint("TOPLEFT", -1, 1)
			bg2:SetPoint("BOTTOMRIGHT", 1, -1)
			bg2:SetFrameLevel(bu2:GetFrameLevel()-1)
			F.CreateBD(bg2, .25)
		end

		-- Tutorial Frame

		F.CreateBD(TutorialFrame)

		TutorialFrameBackground:Hide()
		TutorialFrameBackground.Show = F.dummy
		TutorialFrame:DisableDrawLayer("BORDER")

		F.Reskin(TutorialFrameOkayButton, true)
		F.ReskinClose(TutorialFrameCloseButton)
		F.ReskinArrow(TutorialFramePrevButton, "left")
		F.ReskinArrow(TutorialFrameNextButton, "right")

		TutorialFrameOkayButton:ClearAllPoints()
		TutorialFrameOkayButton:SetPoint("BOTTOMLEFT", TutorialFrameNextButton, "BOTTOMRIGHT", 10, 0)

		-- because gradient alpha and OnUpdate doesn't work for some reason...

		select(14, TutorialFrameOkayButton:GetRegions()):Hide()
		select(15, TutorialFramePrevButton:GetRegions()):Hide()
		select(15, TutorialFrameNextButton:GetRegions()):Hide()
		select(14, TutorialFrameCloseButton:GetRegions()):Hide()
		TutorialFramePrevButton:SetScript("OnEnter", nil)
		TutorialFrameNextButton:SetScript("OnEnter", nil)
		TutorialFrameOkayButton:SetBackdropColor(0, 0, 0, .25)
		TutorialFramePrevButton:SetBackdropColor(0, 0, 0, .25)
		TutorialFrameNextButton:SetBackdropColor(0, 0, 0, .25)

		-- Loot history

		local LootHistoryFrame = LootHistoryFrame

		for i = 1, 9 do
			select(i, LootHistoryFrame:GetRegions()):Hide()
		end
		LootHistoryFrame.LootIcon:Hide()
		LootHistoryFrame.Divider:SetAlpha(0)
		LootHistoryFrameScrollFrame:GetRegions():Hide()

		LootHistoryFrame.Label:ClearAllPoints()
		LootHistoryFrame.Label:SetPoint("TOP", LootHistoryFrame, "TOP", 0, -8)

		LootHistoryFrame.ResizeButton:SetPoint("TOP", LootHistoryFrame, "BOTTOM", 0, 1)
		LootHistoryFrame.ResizeButton:SetFrameStrata("LOW")

		F.ReskinArrow(LootHistoryFrame.ResizeButton, "down")
		LootHistoryFrame.ResizeButton:SetSize(32, 12)

		F.CreateBD(LootHistoryFrame)

		F.ReskinClose(LootHistoryFrame.CloseButton)
		F.ReskinScroll(LootHistoryFrameScrollFrameScrollBar)

		hooksecurefunc("LootHistoryFrame_UpdateItemFrame", function(self, frame)
			local rollID, _, _, isDone, winnerIdx = C_LootHistory.GetItem(frame.itemIdx)
			local expanded = self.expandedRolls[rollID]

			if not frame.styled then
				frame.Divider:Hide()
				frame.NameBorderLeft:Hide()
				frame.NameBorderRight:Hide()
				frame.NameBorderMid:Hide()
				frame.IconBorder:Hide()

				F.SetFS(frame.ItemName)
				frame.ItemName:SetShadowOffset(0, 0)
				F.SetFS(frame.WinnerName)
				frame.WinnerName:SetShadowOffset(0, 0)
				F.SetFS(frame.WinnerRoll)
				frame.WinnerRoll:SetShadowOffset(0, 0)
				F.SetFS(frame.WinnerRoll)
				frame.WinnerRoll:SetShadowOffset(0, 0)
				frame.WinnerRoll:SetTextColor(.9, .9, .9)

				frame.Icon:SetTexCoord(.08, .92, .08, .92)
				frame.Icon:SetDrawLayer("ARTWORK")
				frame.bg = F.CreateBG(frame.Icon)
				frame.bg:SetVertexColor(frame.IconBorder:GetVertexColor())

				F.ReskinExpandOrCollapse(frame.ToggleButton)
				frame.ToggleButton:GetNormalTexture():SetAlpha(0)
				frame.ToggleButton:GetPushedTexture():SetAlpha(0)
				frame.ToggleButton:GetDisabledTexture():SetAlpha(0)

				frame.styled = true
			end

			if isDone and not expanded and winnerIdx then
				local name, class = C_LootHistory.GetPlayerInfo(frame.itemIdx, winnerIdx)
				if name then
					local colour = C.classcolours[class]
					frame.WinnerName:SetVertexColor(colour.r, colour.g, colour.b)
				end
			end

			frame.bg:SetVertexColor(frame.IconBorder:GetVertexColor())
			frame.ToggleButton.plus:SetShown(not expanded)
		end)

		hooksecurefunc("LootHistoryFrame_UpdatePlayerFrame", function(_, playerFrame)
			if not playerFrame.styled then
				F.SetFS(playerFrame.PlayerName)
				playerFrame.PlayerName:SetShadowOffset(0, 0)
				F.SetFS(playerFrame.RollText)
				playerFrame.RollText:SetShadowOffset(0, 0)
				playerFrame.RollText:SetTextColor(.9, .9, .9)
				playerFrame.WinMark:SetDesaturated(true)

				playerFrame.styled = true
			end

			if playerFrame.playerIdx then
				local name, class, _, _, isWinner = C_LootHistory.GetPlayerInfo(playerFrame.itemIdx, playerFrame.playerIdx)

				if name then
					local colour = C.classcolours[class]
					playerFrame.PlayerName:SetTextColor(colour.r, colour.g, colour.b)

					if isWinner then
						playerFrame.WinMark:SetVertexColor(colour.r, colour.g, colour.b)
					end
				end
			end
		end)

		-- Master looter frame

		for i = 1, 9 do
			select(i, MasterLooterFrame:GetRegions()):Hide()
		end

		MasterLooterFrame.Item.NameBorderLeft:Hide()
		MasterLooterFrame.Item.NameBorderRight:Hide()
		MasterLooterFrame.Item.NameBorderMid:Hide()
		MasterLooterFrame.Item.IconBorder:Hide()

		F.SetFS(MasterLooterFrame.Item.ItemName)
		MasterLooterFrame.Item.ItemName:SetShadowOffset(0, 0)

		MasterLooterFrame.Item.Icon:SetTexCoord(.08, .92, .08, .92)
		MasterLooterFrame.Item.Icon:SetDrawLayer("ARTWORK")
		MasterLooterFrame.Item.bg = F.CreateBG(MasterLooterFrame.Item.Icon)

		MasterLooterFrame:HookScript("OnShow", function(self)
			self.Item.bg:SetVertexColor(self.Item.IconBorder:GetVertexColor())
			Butsu:SetAlpha(.4)
		end)

		MasterLooterFrame:HookScript("OnHide", function(self)
			Butsu:SetAlpha(1)
		end)

		F.CreateBD(MasterLooterFrame)
		F.ReskinClose(select(3, MasterLooterFrame:GetChildren()))

		hooksecurefunc("MasterLooterFrame_UpdatePlayers", function()
			for i = 1, MAX_RAID_MEMBERS do
				local playerFrame = MasterLooterFrame["player"..i]
				if playerFrame then
					if not playerFrame.styled then
						F.SetFS(playerFrame.Name)
						playerFrame.Name:SetShadowOffset(0, 0)

						playerFrame.Bg:SetPoint("TOPLEFT", 1, -1)
						playerFrame.Bg:SetPoint("BOTTOMRIGHT", -1, 1)
						playerFrame.Highlight:SetPoint("TOPLEFT", 1, -1)
						playerFrame.Highlight:SetPoint("BOTTOMRIGHT", -1, 1)

						playerFrame.Highlight:SetTexture(C.media.backdrop)

						F.CreateBD(playerFrame, 0)

						playerFrame.styled = true
					end
					local colour = C.classcolours[select(2, UnitClass(playerFrame.Name:GetText()))]
					playerFrame.Name:SetTextColor(colour.r, colour.g, colour.b)
					playerFrame.Highlight:SetVertexColor(colour.r, colour.g, colour.b, .2)
				else
					break
				end
			end
		end)

		-- Missing loot frame

		MissingLootFrameCorner:Hide()

		hooksecurefunc("MissingLootFrame_Show", function()
			for i = 1, GetNumMissingLootItems() do
				local bu = _G["MissingLootFrameItem"..i]

				if not bu.styled then
					_G["MissingLootFrameItem"..i.."NameFrame"]:Hide()

					bu.icon:SetTexCoord(.08, .92, .08, .92)
					F.CreateBG(bu.icon)

					bu.styled = true
				end
			end
		end)

		F.CreateBD(MissingLootFrame)
		F.ReskinClose(MissingLootFramePassButton)

		-- BN conversation

		BNConversationInviteDialogHeader:SetTexture("")

		F.CreateBD(BNConversationInviteDialog)
		F.CreateBD(BNConversationInviteDialogList, .25)

		F.Reskin(BNConversationInviteDialogInviteButton)
		F.Reskin(BNConversationInviteDialogCancelButton)
		F.ReskinScroll(BNConversationInviteDialogListScrollFrameScrollBar)
		for i = 1, BN_CONVERSATION_INVITE_NUM_DISPLAYED do
			F.ReskinCheck(_G["BNConversationInviteDialogListFriend"..i].checkButton)
		end

		-- Taxi Frame

		TaxiFrame:DisableDrawLayer("BORDER")
		TaxiFrame:DisableDrawLayer("OVERLAY")
		TaxiFrame.Bg:Hide()
		TaxiFrame.TitleBg:Hide()
		TaxiFrame.TopTileStreaks:Hide()

		F.SetBD(TaxiFrame, 3, -23, -5, 3)
		F.ReskinClose(TaxiFrame.CloseButton, "TOPRIGHT", TaxiRouteMap, "TOPRIGHT", -6, -6)

		-- Tabard Frame

		TabardFrameMoneyInset:DisableDrawLayer("BORDER")
		TabardFrameCustomizationBorder:Hide()
		TabardFrameMoneyBg:Hide()
		TabardFrameMoneyInsetBg:Hide()

		for i = 19, 28 do
			select(i, TabardFrame:GetRegions()):Hide()
		end

		for i = 1, 5 do
			_G["TabardFrameCustomization"..i.."Left"]:Hide()
			_G["TabardFrameCustomization"..i.."Middle"]:Hide()
			_G["TabardFrameCustomization"..i.."Right"]:Hide()
			F.ReskinArrow(_G["TabardFrameCustomization"..i.."LeftButton"], "left")
			F.ReskinArrow(_G["TabardFrameCustomization"..i.."RightButton"], "right")
		end

		F.ReskinPortraitFrame(TabardFrame, true)
		F.CreateBD(TabardFrameCostFrame, .25)
		F.Reskin(TabardFrameAcceptButton)
		F.Reskin(TabardFrameCancelButton)

		-- Guild registrar frame

		GuildRegistrarFrameTop:Hide()
		GuildRegistrarFrameBottom:Hide()
		GuildRegistrarFrameMiddle:Hide()
		select(19, GuildRegistrarFrame:GetRegions()):Hide()
		select(6, GuildRegistrarFrameEditBox:GetRegions()):Hide()
		select(7, GuildRegistrarFrameEditBox:GetRegions()):Hide()

		GuildRegistrarFrameEditBox:SetHeight(20)

		F.ReskinPortraitFrame(GuildRegistrarFrame, true)
		F.CreateBD(GuildRegistrarFrameEditBox, .25)
		F.Reskin(GuildRegistrarFrameGoodbyeButton)
		F.Reskin(GuildRegistrarFramePurchaseButton)
		F.Reskin(GuildRegistrarFrameCancelButton)

		-- World state score frame

		select(2, WorldStateScoreScrollFrame:GetRegions()):Hide()
		select(3, WorldStateScoreScrollFrame:GetRegions()):Hide()

		WorldStateScoreFrameTab1:ClearAllPoints()
		WorldStateScoreFrameTab1:SetPoint("TOPLEFT", WorldStateScoreFrame, "BOTTOMLEFT", 5, 2)
		WorldStateScoreFrameTab2:SetPoint("LEFT", WorldStateScoreFrameTab1, "RIGHT", -15, 0)
		WorldStateScoreFrameTab3:SetPoint("LEFT", WorldStateScoreFrameTab2, "RIGHT", -15, 0)

		for i = 1, 3 do
			F.ReskinTab(_G["WorldStateScoreFrameTab"..i])
		end

		F.ReskinPortraitFrame(WorldStateScoreFrame, true)
		F.Reskin(WorldStateScoreFrameLeaveButton)
		F.ReskinScroll(WorldStateScoreScrollFrameScrollBar)

		-- Item text

		select(18, ItemTextFrame:GetRegions()):Hide()
		InboxFrameBg:Hide()
		ItemTextScrollFrameMiddle:SetAlpha(0)
		ItemTextScrollFrameTop:SetAlpha(0)
		ItemTextScrollFrameBottom:SetAlpha(0)
		ItemTextPrevPageButton:GetRegions():Hide()
		ItemTextNextPageButton:GetRegions():Hide()
		ItemTextMaterialTopLeft:SetAlpha(0)
		ItemTextMaterialTopRight:SetAlpha(0)
		ItemTextMaterialBotLeft:SetAlpha(0)
		ItemTextMaterialBotRight:SetAlpha(0)

		F.ReskinPortraitFrame(ItemTextFrame, true)
		F.ReskinScroll(ItemTextScrollFrameScrollBar)
		F.ReskinArrow(ItemTextPrevPageButton, "left")
		F.ReskinArrow(ItemTextNextPageButton, "right")

		-- Petition frame

		select(18, PetitionFrame:GetRegions()):Hide()
		select(19, PetitionFrame:GetRegions()):Hide()
		select(23, PetitionFrame:GetRegions()):Hide()
		select(24, PetitionFrame:GetRegions()):Hide()
		PetitionFrameTop:Hide()
		PetitionFrameBottom:Hide()
		PetitionFrameMiddle:Hide()

		F.ReskinPortraitFrame(PetitionFrame, true)
		F.Reskin(PetitionFrameSignButton)
		F.Reskin(PetitionFrameRequestButton)
		F.Reskin(PetitionFrameRenameButton)
		F.Reskin(PetitionFrameCancelButton)

		-- Mac options

		if IsMacClient() then
			F.CreateBD(MacOptionsFrame)

			MacOptionsFrameHeader:SetTexture("")
			MacOptionsFrameHeader:ClearAllPoints()
			MacOptionsFrameHeader:SetPoint("TOP", MacOptionsFrame, 0, 0)

			F.CreateBD(MacOptionsFrameMovieRecording, .25)
			F.CreateBD(MacOptionsITunesRemote, .25)
			F.CreateBD(MacOptionsFrameMisc, .25)

			F.Reskin(MacOptionsButtonKeybindings)
			F.Reskin(MacOptionsButtonCompress)
			F.Reskin(MacOptionsFrameCancel)
			F.Reskin(MacOptionsFrameOkay)
			F.Reskin(MacOptionsFrameDefaults)

			F.ReskinDropDown(MacOptionsFrameResolutionDropDown)
			F.ReskinDropDown(MacOptionsFrameFramerateDropDown)
			F.ReskinDropDown(MacOptionsFrameCodecDropDown)

			for i = 1, 11 do
				F.ReskinCheck(_G["MacOptionsFrameCheckButton"..i])
			end
			F.ReskinSlider(MacOptionsFrameQualitySlider)

			MacOptionsButtonCompress:SetWidth(136)

			MacOptionsFrameCancel:SetWidth(96)
			MacOptionsFrameCancel:SetHeight(22)
			MacOptionsFrameCancel:ClearAllPoints()
			MacOptionsFrameCancel:SetPoint("LEFT", MacOptionsButtonKeybindings, "RIGHT", 107, 0)

			MacOptionsFrameOkay:SetWidth(96)
			MacOptionsFrameOkay:SetHeight(22)
			MacOptionsFrameOkay:ClearAllPoints()
			MacOptionsFrameOkay:SetPoint("LEFT", MacOptionsButtonKeybindings, "RIGHT", 5, 0)

			MacOptionsButtonKeybindings:SetWidth(96)
			MacOptionsButtonKeybindings:SetHeight(22)
			MacOptionsButtonKeybindings:ClearAllPoints()
			MacOptionsButtonKeybindings:SetPoint("LEFT", MacOptionsFrameDefaults, "RIGHT", 5, 0)

			MacOptionsFrameDefaults:SetWidth(96)
			MacOptionsFrameDefaults:SetHeight(22)
		end

		-- Micro button alerts

		local microButtons = {TalentMicroButtonAlert, CompanionsMicroButtonAlert}
			for _, button in pairs(microButtons) do
			button:DisableDrawLayer("BACKGROUND")
			button:DisableDrawLayer("BORDER")
			button.Arrow:Hide()

			button:ClearAllPoints()
			button:SetPoint("BOTTOM", FreeUI_MultiBarBottomRight, "TOP", 0, 12)

			F.SetBD(button)
			F.ReskinClose(button.CloseButton)
		end

		TalentMicroButtonAlert:SetScript("OnMouseUp", ToggleTalentFrame)
		CompanionsMicroButtonAlert:SetScript("OnMouseUp", TogglePetJournal)

		-- Cinematic popup

		CinematicFrameCloseDialog:HookScript("OnShow", function(self)
			self:SetScale(UIParent:GetScale())
		end)
		F.CreateBD(CinematicFrameCloseDialog)
		F.Reskin(CinematicFrameCloseDialogConfirmButton)
		F.Reskin(CinematicFrameCloseDialogResumeButton)

		-- Bonus roll

		BonusRollFrame.Background:SetAlpha(0)
		BonusRollFrame.IconBorder:Hide()
		BonusRollFrame.BlackBackgroundHoist.Background:Hide()

		BonusRollFrame.PromptFrame.Icon:SetTexCoord(.08, .92, .08, .92)
		F.CreateBG(BonusRollFrame.PromptFrame.Icon)

		BonusRollFrame.PromptFrame.Timer.Bar:SetTexture(C.media.backdrop)

		F.CreateBD(BonusRollFrame)
		F.CreateBDFrame(BonusRollFrame.PromptFrame.Timer, .25)

		-- Chat config

		hooksecurefunc("ChatConfig_CreateCheckboxes", function(frame, checkBoxTable, checkBoxTemplate)
			if frame.styled then return end

			frame:SetBackdrop(nil)

			local checkBoxNameString = frame:GetName().."CheckBox"

			if checkBoxTemplate == "ChatConfigCheckBoxTemplate" then
				for index, value in ipairs(checkBoxTable) do
					local checkBoxName = checkBoxNameString..index
					local checkbox = _G[checkBoxName]

					checkbox:SetBackdrop(nil)

					local bg = CreateFrame("Frame", nil, checkbox)
					bg:SetPoint("TOPLEFT")
					bg:SetPoint("BOTTOMRIGHT", 0, 1)
					bg:SetFrameLevel(checkbox:GetFrameLevel()-1)
					F.CreateBD(bg, .25)

					F.ReskinCheck(_G[checkBoxName.."Check"])
				end
			elseif checkBoxTemplate == "ChatConfigCheckBoxWithSwatchTemplate" or checkBoxTemplate == "ChatConfigCheckBoxWithSwatchAndClassColorTemplate" then
				for index, value in ipairs(checkBoxTable) do
					local checkBoxName = checkBoxNameString..index
					local checkbox = _G[checkBoxName]

					checkbox:SetBackdrop(nil)

					local bg = CreateFrame("Frame", nil, checkbox)
					bg:SetPoint("TOPLEFT")
					bg:SetPoint("BOTTOMRIGHT", 0, 1)
					bg:SetFrameLevel(checkbox:GetFrameLevel()-1)
					F.CreateBD(bg, .25)

					F.ReskinColourSwatch(_G[checkBoxName.."ColorSwatch"])

					F.ReskinCheck(_G[checkBoxName.."Check"])

					if checkBoxTemplate == "ChatConfigCheckBoxWithSwatchAndClassColorTemplate" then
						F.ReskinCheck(_G[checkBoxName.."ColorClasses"])
					end
				end
			end

			frame.styled = true
		end)

		hooksecurefunc("ChatConfig_CreateTieredCheckboxes", function(frame, checkBoxTable, checkBoxTemplate, subCheckBoxTemplate)
			if frame.styled then return end

			local checkBoxNameString = frame:GetName().."CheckBox"

			for index, value in ipairs(checkBoxTable) do
				local checkBoxName = checkBoxNameString..index

				F.ReskinCheck(_G[checkBoxName])

				if value.subTypes then
					local subCheckBoxNameString = checkBoxName.."_"

					for k, v in ipairs(value.subTypes) do
						F.ReskinCheck(_G[subCheckBoxNameString..k])
					end
				end
			end

			frame.styled = true
		end)

		hooksecurefunc("ChatConfig_CreateColorSwatches", function(frame, swatchTable, swatchTemplate)
			if frame.styled then return end

			frame:SetBackdrop(nil)

			local nameString = frame:GetName().."Swatch"

			for index, value in ipairs(swatchTable) do
				local swatchName = nameString..index
				local swatch = _G[swatchName]

				swatch:SetBackdrop(nil)

				local bg = CreateFrame("Frame", nil, swatch)
				bg:SetPoint("TOPLEFT")
				bg:SetPoint("BOTTOMRIGHT", 0, 1)
				bg:SetFrameLevel(swatch:GetFrameLevel()-1)
				F.CreateBD(bg, .25)

				F.ReskinColourSwatch(_G[swatchName.."ColorSwatch"])
			end

			frame.styled = true
		end)

		for i = 1, 5 do
			_G["CombatConfigTab"..i.."Left"]:Hide()
			_G["CombatConfigTab"..i.."Middle"]:Hide()
			_G["CombatConfigTab"..i.."Right"]:Hide()
		end

		local line = ChatConfigFrame:CreateTexture()
		line:SetSize(1, 460)
		line:SetPoint("TOPLEFT", ChatConfigCategoryFrame, "TOPRIGHT")
		line:SetTexture(1, 1, 1, .2)

		ChatConfigCategoryFrame:SetBackdrop(nil)
		ChatConfigBackgroundFrame:SetBackdrop(nil)
		ChatConfigCombatSettingsFilters:SetBackdrop(nil)
		CombatConfigColorsHighlighting:SetBackdrop(nil)
		CombatConfigColorsColorizeUnitName:SetBackdrop(nil)
		CombatConfigColorsColorizeSpellNames:SetBackdrop(nil)
		CombatConfigColorsColorizeDamageNumber:SetBackdrop(nil)
		CombatConfigColorsColorizeDamageSchool:SetBackdrop(nil)
		CombatConfigColorsColorizeEntireLine:SetBackdrop(nil)

		local combatBoxes = {CombatConfigColorsHighlightingLine, CombatConfigColorsHighlightingAbility, CombatConfigColorsHighlightingDamage, CombatConfigColorsHighlightingSchool, CombatConfigColorsColorizeUnitNameCheck, CombatConfigColorsColorizeSpellNamesCheck, CombatConfigColorsColorizeSpellNamesSchoolColoring, CombatConfigColorsColorizeDamageNumberCheck, CombatConfigColorsColorizeDamageNumberSchoolColoring, CombatConfigColorsColorizeDamageSchoolCheck, CombatConfigColorsColorizeEntireLineCheck, CombatConfigFormattingShowTimeStamp, CombatConfigFormattingShowBraces, CombatConfigFormattingUnitNames, CombatConfigFormattingSpellNames, CombatConfigFormattingItemNames, CombatConfigFormattingFullText, CombatConfigSettingsShowQuickButton, CombatConfigSettingsSolo, CombatConfigSettingsParty, CombatConfigSettingsRaid}

		for _, box in next, combatBoxes do
			F.ReskinCheck(box)
		end

		local bg = CreateFrame("Frame", nil, ChatConfigCombatSettingsFilters)
		bg:SetPoint("TOPLEFT", 3, 0)
		bg:SetPoint("BOTTOMRIGHT", 0, 1)
		bg:SetFrameLevel(ChatConfigCombatSettingsFilters:GetFrameLevel()-1)
		F.CreateBD(bg, .25)

		F.Reskin(CombatLogDefaultButton)
		F.Reskin(ChatConfigCombatSettingsFiltersCopyFilterButton)
		F.Reskin(ChatConfigCombatSettingsFiltersAddFilterButton)
		F.Reskin(ChatConfigCombatSettingsFiltersDeleteButton)
		F.Reskin(CombatConfigSettingsSaveButton)
		F.ReskinArrow(ChatConfigMoveFilterUpButton, "up")
		F.ReskinArrow(ChatConfigMoveFilterDownButton, "down")
		F.ReskinInput(CombatConfigSettingsNameEditBox)
		F.ReskinRadio(CombatConfigColorsColorizeEntireLineBySource)
		F.ReskinRadio(CombatConfigColorsColorizeEntireLineByTarget)
		F.ReskinColourSwatch(CombatConfigColorsColorizeSpellNamesColorSwatch)
		F.ReskinColourSwatch(CombatConfigColorsColorizeDamageNumberColorSwatch)

		ChatConfigMoveFilterUpButton:SetSize(28, 28)
		ChatConfigMoveFilterDownButton:SetSize(28, 28)

		ChatConfigCombatSettingsFiltersAddFilterButton:SetPoint("RIGHT", ChatConfigCombatSettingsFiltersDeleteButton, "LEFT", -1, 0)
		ChatConfigCombatSettingsFiltersCopyFilterButton:SetPoint("RIGHT", ChatConfigCombatSettingsFiltersAddFilterButton, "LEFT", -1, 0)
		ChatConfigMoveFilterUpButton:SetPoint("TOPLEFT", ChatConfigCombatSettingsFilters, "BOTTOMLEFT", 3, 0)
		ChatConfigMoveFilterDownButton:SetPoint("LEFT", ChatConfigMoveFilterUpButton, "RIGHT", 1, 0)

		-- Level up display

		LevelUpDisplaySide:HookScript("OnShow", function(self)
			for i = 1, #self.unlockList do
				local f = _G["LevelUpDisplaySideUnlockFrame"..i]

				if not f.restyled then
					f.icon:SetTexCoord(.08, .92, .08, .92)
					F.CreateBG(f.icon)
				end
			end
		end)

		-- Movie Frame

		MovieFrame.CloseDialog:HookScript("OnShow", function(self)
			self:SetScale(UIParent:GetScale())
		end)

		F.CreateBD(MovieFrame.CloseDialog)
		F.Reskin(MovieFrame.CloseDialog.ConfirmButton)
		F.Reskin(MovieFrame.CloseDialog.ResumeButton)

		-- Pet battle queue popup

		F.CreateBD(PetBattleQueueReadyFrame)
		F.CreateBG(PetBattleQueueReadyFrame.Art)
		F.Reskin(PetBattleQueueReadyFrame.AcceptButton)
		F.Reskin(PetBattleQueueReadyFrame.DeclineButton)

		-- PVP Ready Dialog

		local PVPReadyDialog = PVPReadyDialog

		PVPReadyDialogBackground:Hide()
		PVPReadyDialogBottomArt:Hide()
		PVPReadyDialogFiligree:Hide()

		PVPReadyDialogRoleIconTexture:SetTexture(C.media.roleIcons)

		do
			local left = PVPReadyDialogRoleIcon:CreateTexture(nil, "OVERLAY")
			left:SetWidth(1)
			left:SetTexture(C.media.backdrop)
			left:SetVertexColor(0, 0, 0)
			left:SetPoint("TOPLEFT", 9, -7)
			left:SetPoint("BOTTOMLEFT", 9, 10)

			local right = PVPReadyDialogRoleIcon:CreateTexture(nil, "OVERLAY")
			right:SetWidth(1)
			right:SetTexture(C.media.backdrop)
			right:SetVertexColor(0, 0, 0)
			right:SetPoint("TOPRIGHT", -8, -7)
			right:SetPoint("BOTTOMRIGHT", -8, 10)

			local top = PVPReadyDialogRoleIcon:CreateTexture(nil, "OVERLAY")
			top:SetHeight(1)
			top:SetTexture(C.media.backdrop)
			top:SetVertexColor(0, 0, 0)
			top:SetPoint("TOPLEFT", 9, -7)
			top:SetPoint("TOPRIGHT", -8, -7)

			local bottom = PVPReadyDialogRoleIcon:CreateTexture(nil, "OVERLAY")
			bottom:SetHeight(1)
			bottom:SetTexture(C.media.backdrop)
			bottom:SetVertexColor(0, 0, 0)
			bottom:SetPoint("BOTTOMLEFT", 9, 10)
			bottom:SetPoint("BOTTOMRIGHT", -8, 10)
		end

		F.CreateBD(PVPReadyDialog)
		PVPReadyDialog.SetBackdrop = F.dummy

		F.Reskin(PVPReadyDialog.enterButton)
		F.Reskin(PVPReadyDialog.leaveButton)
		F.ReskinClose(PVPReadyDialogCloseButton)

		-- Loss of control frame

		LossOfControlFrame.Icon:SetTexCoord(.08, .92, .08, .92)
		F.CreateBG(LossOfControlFrame.Icon)

		-- Queue status frame

		for i = 1, 9 do
			select(i, QueueStatusFrame:GetRegions()):Hide()
		end

		F.CreateBD(QueueStatusFrame)

		hooksecurefunc("QueueStatusFrame_GetEntry", function(self, entryIndex)
			local entry = self.StatusEntries[entryIndex]

			if not entry.styled then
				for _, roleButton in pairs({entry.HealersFound, entry.TanksFound, entry.DamagersFound}) do
					roleButton.Texture:SetTexture(C.media.roleIcons)
					roleButton.Cover:SetTexture(C.media.roleIcons)

					local left = roleButton:CreateTexture(nil, "OVERLAY")
					left:SetWidth(1)
					left:SetTexture(C.media.backdrop)
					left:SetVertexColor(0, 0, 0)
					left:SetPoint("TOPLEFT", 5, -3)
					left:SetPoint("BOTTOMLEFT", 5, 6)

					local right = roleButton:CreateTexture(nil, "OVERLAY")
					right:SetWidth(1)
					right:SetTexture(C.media.backdrop)
					right:SetVertexColor(0, 0, 0)
					right:SetPoint("TOPRIGHT", -4, -3)
					right:SetPoint("BOTTOMRIGHT", -4, 6)

					local top = roleButton:CreateTexture(nil, "OVERLAY")
					top:SetHeight(1)
					top:SetTexture(C.media.backdrop)
					top:SetVertexColor(0, 0, 0)
					top:SetPoint("TOPLEFT", 5, -3)
					top:SetPoint("TOPRIGHT", -4, -3)

					local bottom = roleButton:CreateTexture(nil, "OVERLAY")
					bottom:SetHeight(1)
					bottom:SetTexture(C.media.backdrop)
					bottom:SetVertexColor(0, 0, 0)
					bottom:SetPoint("BOTTOMLEFT", 5, 6)
					bottom:SetPoint("BOTTOMRIGHT", -4, 6)
				end

				for i = 1, LFD_NUM_ROLES do
					local roleIcon = entry["RoleIcon"..i]

					roleIcon:SetTexture(C.media.roleIcons)

					entry["RoleIconBorders"..i] = {}
					local borders = entry["RoleIconBorders"..i]

					local left = entry:CreateTexture(nil, "OVERLAY")
					left:SetWidth(1)
					left:SetTexture(C.media.backdrop)
					left:SetVertexColor(0, 0, 0)
					left:SetPoint("TOPLEFT", roleIcon, 2, -2)
					left:SetPoint("BOTTOMLEFT", roleIcon, 2, 3)
					tinsert(borders, left)

					local right = entry:CreateTexture(nil, "OVERLAY")
					right:SetWidth(1)
					right:SetTexture(C.media.backdrop)
					right:SetVertexColor(0, 0, 0)
					right:SetPoint("TOPRIGHT", roleIcon, -2, -2)
					right:SetPoint("BOTTOMRIGHT", roleIcon, -2, 3)
					tinsert(borders, right)

					local top = entry:CreateTexture(nil, "OVERLAY")
					top:SetHeight(1)
					top:SetTexture(C.media.backdrop)
					top:SetVertexColor(0, 0, 0)
					top:SetPoint("TOPLEFT", roleIcon, 2, -2)
					top:SetPoint("TOPRIGHT", roleIcon, -2, -2)
					tinsert(borders, top)

					local bottom = entry:CreateTexture(nil, "OVERLAY")
					bottom:SetHeight(1)
					bottom:SetTexture(C.media.backdrop)
					bottom:SetVertexColor(0, 0, 0)
					bottom:SetPoint("BOTTOMLEFT", roleIcon, 2, 3)
					bottom:SetPoint("BOTTOMRIGHT", roleIcon, -2, 3)
					tinsert(borders, bottom)
				end

				entry.styled = true
			end
		end)

		hooksecurefunc("QueueStatusEntry_SetMinimalDisplay", function(entry)
			for i = 1, LFD_NUM_ROLES do
				for _, border in pairs(entry["RoleIconBorders"..i]) do
					border:Hide()
				end
			end
		end)

		hooksecurefunc("QueueStatusEntry_SetFullDisplay", function(entry)
			for i = 1, LFD_NUM_ROLES do
				local shown = entry["RoleIcon"..i]:IsShown()

				for _, border in pairs(entry["RoleIconBorders"..i]) do
					border:SetShown(shown)
				end
			end
		end)

		-- Recruit A Friend frame

		local RecruitAFriendFrame = RecruitAFriendFrame
		local RecruitAFriendSentFrame = RecruitAFriendSentFrame

		RecruitAFriendFrame.NoteFrame:DisableDrawLayer("BACKGROUND")

		F.CreateBD(RecruitAFriendFrame)
		F.ReskinClose(RecruitAFriendFrameCloseButton)
		F.Reskin(RecruitAFriendFrame.SendButton)
		F.ReskinInput(RecruitAFriendNameEditBox)

		F.CreateBDFrame(RecruitAFriendFrame.NoteFrame, .25)

		F.CreateBD(RecruitAFriendSentFrame)
		F.Reskin(RecruitAFriendSentFrame.OKButton)
		F.ReskinClose(RecruitAFriendSentFrameCloseButton)

		-- Product Choice frame

		local ProductChoiceFrame = ProductChoiceFrame

		ProductChoiceFrame.Inset.Bg:Hide()
		ProductChoiceFrame.Inset:DisableDrawLayer("BORDER")

		F.ReskinPortraitFrame(ProductChoiceFrame)
		F.Reskin(ProductChoiceFrame.Inset.ClaimButton)

		-- Model Preview frame

		local ModelPreviewFrame = ModelPreviewFrame
		local Display = ModelPreviewFrame.Display

		Display.YesMountsTex:Hide()
		Display.ShadowOverlay:Hide()

		F.ReskinPortraitFrame(ModelPreviewFrame, true)
		F.Reskin(ModelPreviewFrame.CloseButton)
		F.ReskinArrow(Display.Model.RotateLeftButton, "left")
		F.ReskinArrow(Display.Model.RotateRightButton, "right")

		local bg = F.CreateBDFrame(Display.Model, .25)
		bg:SetPoint("TOPLEFT", -1, 0)
		bg:SetPoint("BOTTOMRIGHT", 2, -2)

		Display.Model.RotateLeftButton:SetPoint("TOPRIGHT", Display.Model, "BOTTOM", -5, -10)
		Display.Model.RotateRightButton:SetPoint("TOPLEFT", Display.Model, "BOTTOM", 5, -10)

		-- Addon List

		F.ReskinPortraitFrame(AddonList, true)
		F.Reskin(AddonListEnableAllButton)
		F.Reskin(AddonListDisableAllButton)
		F.Reskin(AddonListCancelButton)
		F.Reskin(AddonListOkayButton)
		F.ReskinCheck(AddonListForceLoad)
		F.ReskinDropDown(AddonCharacterDropDown)

		AddonCharacterDropDown:SetWidth(170)

		for i = 1, MAX_ADDONS_DISPLAYED do
			F.ReskinCheck(_G["AddonListEntry"..i.."Enabled"])
		end

		-- Splash frame

		F.Reskin(SplashFrame.BottomCloseButton)
		F.ReskinClose(SplashFrame.TopCloseButton)

		SplashFrame.TopCloseButton:ClearAllPoints()

		SplashFrame.TopCloseButton:SetPoint("TOPRIGHT", SplashFrame, "TOPRIGHT", -18, -18)

		-- [[ World map frame / quest log ]]

		local WorldMapFrame = WorldMapFrame
		local BorderFrame = WorldMapFrame.BorderFrame

		WorldMapFrame.UIElementsFrame.CloseQuestPanelButton:GetRegions():Hide()
		WorldMapFrame.UIElementsFrame.OpenQuestPanelButton:GetRegions():Hide()
		BorderFrame.Bg:Hide()
		select(2, BorderFrame:GetRegions()):Hide()
		BorderFrame.portrait:SetTexture("")
		BorderFrame.portraitFrame:SetTexture("")
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

		F.SetBD(BorderFrame, 1, 0, -3, 2)
		F.ReskinClose(BorderFrame.CloseButton)
		F.Reskin(WorldMapFrameSizeUpButton)
		F.ReskinArrow(WorldMapFrame.UIElementsFrame.CloseQuestPanelButton, "left")
		F.ReskinArrow(WorldMapFrame.UIElementsFrame.OpenQuestPanelButton, "right")
		F.ReskinDropDown(WorldMapLevelDropDown)

		BorderFrame.CloseButton:SetPoint("TOPRIGHT", -9, -6)

		local WorldMapFrameSizeUpButton = WorldMapFrameSizeUpButton
		WorldMapFrameSizeUpButton:SetSize(17, 17)
		WorldMapFrameSizeUpButton:ClearAllPoints()
		WorldMapFrameSizeUpButton:SetPoint("RIGHT", BorderFrame.CloseButton, "LEFT", -1, 0)

		do
			local function colourClose(f)
				if f:IsEnabled() then
					for _, pixel in pairs(f.pixels) do
						pixel:SetVertexColor(r, g, b)
					end
				end
			end

			local function clearClose(f)
				for _, pixel in pairs(f.pixels) do
					pixel:SetVertexColor(1, 1, 1)
				end
			end

			WorldMapFrameSizeUpButton.pixels = {}

			for i = 1, 8 do
				local tex = WorldMapFrameSizeUpButton:CreateTexture()
				tex:SetTexture(1, 1, 1)
				tex:SetSize(1, 1)
				tex:SetPoint("BOTTOMLEFT", 3+i, 3+i)
				tinsert(WorldMapFrameSizeUpButton.pixels, tex)
			end

			local topLine = WorldMapFrameSizeUpButton:CreateTexture()
			topLine:SetTexture(1, 1, 1)
			topLine:SetSize(7, 1)
			topLine:SetPoint("TOP", 1, -4)
			tinsert(WorldMapFrameSizeUpButton.pixels, topLine)

			local rightLine = WorldMapFrameSizeUpButton:CreateTexture()
			rightLine:SetTexture(1, 1, 1)
			rightLine:SetSize(1, 7)
			rightLine:SetPoint("RIGHT", -4, 1)
			tinsert(WorldMapFrameSizeUpButton.pixels, rightLine)

			WorldMapFrameSizeUpButton:SetScript("OnEnter", colourClose)
			WorldMapFrameSizeUpButton:SetScript("OnLeave", clearClose)
		end

		WorldMapFrameTutorialButton.Ring:Hide()
		WorldMapFrameTutorialButton:SetPoint("TOPLEFT", WorldMapFrame, "TOPLEFT", -12, 12)

		do
			local topLine = WorldMapFrame.UIElementsFrame:CreateTexture()
			topLine:SetTexture(0, 0, 0)
			topLine:SetHeight(1)
			topLine:SetPoint("TOPLEFT", 0, 1)
			topLine:SetPoint("TOPRIGHT", 1, 1)

			local rightLine = WorldMapFrame.UIElementsFrame:CreateTexture()
			rightLine:SetTexture(0, 0, 0)
			rightLine:SetWidth(1)
			rightLine:SetPoint("BOTTOMRIGHT", 1, 0)
			rightLine:SetPoint("TOPRIGHT", 1, 1)
		end

		local TrackingOptions = WorldMapFrame.UIElementsFrame.TrackingOptionsButton

		TrackingOptions:GetRegions():Hide()
		TrackingOptions.Background:Hide()
		TrackingOptions.IconOverlay:SetTexture("")
		TrackingOptions.Button.Border:Hide()

		-- nav bar

		WorldMapFrameNavBar:GetRegions():Hide()
		WorldMapFrameNavBar:DisableDrawLayer("BORDER")
		WorldMapFrameNavBar.overlay:Hide()
		WorldMapFrameNavBarHomeButtonLeft:Hide()
		F.Reskin(WorldMapFrameNavBar.home)

		-- quest frame

		local QuestScrollFrame = QuestScrollFrame

		QuestMapFrame.VerticalSeparator:Hide()
		QuestScrollFrame.Background:Hide()

		F.Reskin(QuestScrollFrame.ViewAll)
		F.ReskinScroll(QuestScrollFrame.ScrollBar)

		-- [[ Hide regions ]]

		local bglayers = {"LFDParentFrame", "LFDParentFrameInset", "WhoFrameColumnHeader1", "WhoFrameColumnHeader2", "WhoFrameColumnHeader3", "WhoFrameColumnHeader4", "RaidInfoInstanceLabel", "RaidInfoIDLabel", "CharacterFrameInsetRight", "HelpFrameMainInset", "CharacterModelFrame", "HelpFrame", "HelpFrameLeftInset", "VideoOptionsFrameCategoryFrame", "InterfaceOptionsFrameCategories", "InterfaceOptionsFrameAddOns", "RaidParentFrame"}
		for i = 1, #bglayers do
			_G[bglayers[i]]:DisableDrawLayer("BACKGROUND")
		end
		local borderlayers = {"WhoFrameListInset", "WhoFrameEditBoxInset", "ChannelFrameLeftInset", "ChannelFrameRightInset", "LFDParentFrame", "LFDParentFrameInset", "CharacterFrameInsetRight", "HelpFrame", "HelpFrameLeftInset", "HelpFrameMainInset", "CharacterModelFrame", "VideoOptionsFramePanelContainer", "InterfaceOptionsFramePanelContainer", "RaidParentFrame", "RaidParentFrameInset", "RaidFinderFrameRoleInset"}
		for i = 1, #borderlayers do
			_G[borderlayers[i]]:DisableDrawLayer("BORDER")
		end
		local overlayers = {"LFDParentFrame", "CharacterModelFrame"}
		for i = 1, #overlayers do
			_G[overlayers[i]]:DisableDrawLayer("OVERLAY")
		end
		for i = 1, 6 do
			for j = 1, 3 do
				select(i, _G["FriendsTabHeaderTab"..j]:GetRegions()):Hide()
				select(i, _G["FriendsTabHeaderTab"..j]:GetRegions()).Show = F.dummy
			end
			select(i, ScrollOfResurrectionFrameNoteFrame:GetRegions()):Hide()
		end
		OpenStationeryBackgroundLeft:Hide()
		OpenStationeryBackgroundRight:Hide()
		SendStationeryBackgroundLeft:Hide()
		SendStationeryBackgroundRight:Hide()
		DressUpFramePortrait:Hide()
		DressUpBackgroundTopLeft:Hide()
		DressUpBackgroundTopRight:Hide()
		DressUpBackgroundBotLeft:Hide()
		DressUpBackgroundBotRight:Hide()
		for i = 1, 4 do
			select(i, GearManagerDialogPopup:GetRegions()):Hide()
			select(i, SideDressUpFrame:GetRegions()):Hide()
		end
		StackSplitFrame:GetRegions():Hide()
		RaidInfoDetailFooter:Hide()
		RaidInfoDetailHeader:Hide()
		RaidInfoDetailCorner:Hide()
		RaidInfoFrameHeader:Hide()
		for i = 1, 9 do
			select(i, FriendsFriendsNoteFrame:GetRegions()):Hide()
			select(i, AddFriendNoteFrame:GetRegions()):Hide()
			select(i, ReportPlayerNameDialogCommentFrame:GetRegions()):Hide()
			select(i, ReportCheatingDialogCommentFrame:GetRegions()):Hide()
		end
		HelpFrameHeader:Hide()
		ReadyCheckPortrait:SetAlpha(0)
		select(2, ReadyCheckListenerFrame:GetRegions()):Hide()
		HelpFrameLeftInsetBg:Hide()
		LFDQueueFrameBackground:Hide()
		select(3, HelpFrameReportBug:GetChildren()):Hide()
		select(3, HelpFrameSubmitSuggestion:GetChildren()):Hide()
		select(4, HelpFrameTicket:GetChildren()):Hide()
		HelpFrameKnowledgebaseStoneTex:Hide()
		HelpFrameKnowledgebaseNavBarOverlay:Hide()
		GhostFrameLeft:Hide()
		GhostFrameRight:Hide()
		GhostFrameMiddle:Hide()
		for i = 3, 6 do
			select(i, GhostFrame:GetRegions()):Hide()
		end
		PaperDollSidebarTabs:GetRegions():Hide()
		select(2, PaperDollSidebarTabs:GetRegions()):Hide()
		select(6, PaperDollEquipmentManagerPaneEquipSet:GetRegions()):Hide()
		select(5, HelpFrameGM_Response:GetChildren()):Hide()
		select(6, HelpFrameGM_Response:GetChildren()):Hide()
		HelpFrameKnowledgebaseNavBarHomeButtonLeft:Hide()
		GearManagerDialogPopupScrollFrame:GetRegions():Hide()
		select(2, GearManagerDialogPopupScrollFrame:GetRegions()):Hide()
		for i = 1, 10 do
			select(i, GuildInviteFrame:GetRegions()):Hide()
		end
		CharacterFrameExpandButton:GetNormalTexture():SetAlpha(0)
		CharacterFrameExpandButton:GetPushedTexture():SetAlpha(0)
		InboxPrevPageButton:GetRegions():Hide()
		InboxNextPageButton:GetRegions():Hide()
		MerchantPrevPageButton:GetRegions():Hide()
		MerchantNextPageButton:GetRegions():Hide()
		select(2, MerchantPrevPageButton:GetRegions()):Hide()
		select(2, MerchantNextPageButton:GetRegions()):Hide()
		LFDQueueFrameRandomScrollFrameScrollBackground:Hide()
		ChannelFrameDaughterFrameCorner:Hide()
		LFDQueueFrameSpecificListScrollFrameScrollBackgroundTopLeft:Hide()
		LFDQueueFrameSpecificListScrollFrameScrollBackgroundBottomRight:Hide()
		for i = 1, MAX_DISPLAY_CHANNEL_BUTTONS do
			_G["ChannelButton"..i]:SetNormalTexture("")
		end
		CharacterStatsPaneTop:Hide()
		CharacterStatsPaneBottom:Hide()
		hooksecurefunc("PaperDollFrame_CollapseStatCategory", function(categoryFrame)
			categoryFrame.BgMinimized:Hide()
		end)
		hooksecurefunc("PaperDollFrame_ExpandStatCategory", function(categoryFrame)
			categoryFrame.BgTop:Hide()
			categoryFrame.BgMiddle:Hide()
			categoryFrame.BgBottom:Hide()
		end)
		local titles = false
		hooksecurefunc("PaperDollTitlesPane_Update", function()
			if titles == false then
				for i = 1, 17 do
					_G["PaperDollTitlesPaneButton"..i]:DisableDrawLayer("BACKGROUND")
				end
				titles = true
			end
		end)
		MerchantNameText:SetDrawLayer("ARTWORK")
		SendScrollBarBackgroundTop:Hide()
		select(4, SendMailScrollFrame:GetRegions()):Hide()
		HelpFrameKnowledgebaseTopTileStreaks:Hide()
		for i = 2, 5 do
			select(i, DressUpFrame:GetRegions()):Hide()
		end
		ChannelFrameDaughterFrameTitlebar:Hide()
		OpenScrollBarBackgroundTop:Hide()
		select(2, OpenMailScrollFrame:GetRegions()):Hide()
		HelpFrameKnowledgebaseNavBar:GetRegions():Hide()
		WhoListScrollFrame:GetRegions():Hide()
		select(2, WhoListScrollFrame:GetRegions()):Hide()
		select(2, GuildChallengeAlertFrame:GetRegions()):Hide()
		InterfaceOptionsFrameTab1TabSpacer:SetAlpha(0)
		for i = 1, 2 do
			_G["InterfaceOptionsFrameTab"..i.."Left"]:SetAlpha(0)
			_G["InterfaceOptionsFrameTab"..i.."Middle"]:SetAlpha(0)
			_G["InterfaceOptionsFrameTab"..i.."Right"]:SetAlpha(0)
			_G["InterfaceOptionsFrameTab"..i.."LeftDisabled"]:SetAlpha(0)
			_G["InterfaceOptionsFrameTab"..i.."MiddleDisabled"]:SetAlpha(0)
			_G["InterfaceOptionsFrameTab"..i.."RightDisabled"]:SetAlpha(0)
			_G["InterfaceOptionsFrameTab2TabSpacer"..i]:SetAlpha(0)
		end
		ChannelRosterScrollFrameTop:SetAlpha(0)
		ChannelRosterScrollFrameBottom:SetAlpha(0)
		WhoFrameListInsetBg:Hide()
		WhoFrameEditBoxInsetBg:Hide()
		ChannelFrameLeftInsetBg:Hide()
		ChannelFrameRightInsetBg:Hide()
		RaidFinderQueueFrameBackground:Hide()
		RaidParentFrameInsetBg:Hide()
		RaidFinderFrameRoleInsetBg:Hide()
		RaidFinderFrameRoleBackground:Hide()
		RaidParentFramePortraitFrame:Hide()
		RaidParentFramePortrait:Hide()
		RaidParentFrameTopBorder:Hide()
		RaidParentFrameTopRightCorner:Hide()
		select(5, SideDressUpModelCloseButton:GetRegions()):Hide()
		ScrollOfResurrectionSelectionFrameBackground:Hide()

		ReadyCheckFrame:HookScript("OnShow", function(self) if UnitIsUnit("player", self.initiator) then self:Hide() end end)

		-- [[ Text colour functions ]]

		GameFontBlackMedium:SetTextColor(1, 1, 1)
		QuestFont:SetTextColor(1, 1, 1)
		MailFont_Large:SetTextColor(1, 1, 1)
		MailFont_Large:SetShadowColor(0, 0, 0)
		MailFont_Large:SetShadowOffset(1, -1)
		MailTextFontNormal:SetTextColor(1, 1, 1)
		MailTextFontNormal:SetShadowOffset(1, -1)
		MailTextFontNormal:SetShadowColor(0, 0, 0)
		InvoiceTextFontNormal:SetTextColor(1, 1, 1)
		InvoiceTextFontSmall:SetTextColor(1, 1, 1)
		SpellBookPageText:SetTextColor(.8, .8, .8)
		QuestProgressRequiredItemsText:SetTextColor(1, 1, 1)
		QuestProgressRequiredItemsText:SetShadowColor(0, 0, 0)
		QuestProgressTitleText:SetShadowColor(0, 0, 0)
		QuestInfoTitleHeader:SetShadowColor(0, 0, 0)
		AvailableServicesText:SetTextColor(1, 1, 1)
		AvailableServicesText:SetShadowColor(0, 0, 0)
		PetitionFrameCharterTitle:SetTextColor(1, 1, 1)
		PetitionFrameCharterTitle:SetShadowColor(0, 0, 0)
		PetitionFrameMasterTitle:SetTextColor(1, 1, 1)
		PetitionFrameMasterTitle:SetShadowColor(0, 0, 0)
		PetitionFrameMemberTitle:SetTextColor(1, 1, 1)
		PetitionFrameMemberTitle:SetShadowColor(0, 0, 0)
		QuestInfoTitleHeader:SetTextColor(1, 1, 1)
		QuestInfoTitleHeader.SetTextColor = F.dummy
		QuestInfoDescriptionHeader:SetTextColor(1, 1, 1)
		QuestInfoDescriptionHeader.SetTextColor = F.dummy
		QuestInfoDescriptionHeader:SetShadowColor(0, 0, 0)
		QuestInfoObjectivesHeader:SetTextColor(1, 1, 1)
		QuestInfoObjectivesHeader.SetTextColor = F.dummy
		QuestInfoObjectivesHeader:SetShadowColor(0, 0, 0)
		QuestInfoDescriptionText:SetTextColor(1, 1, 1)
		QuestInfoDescriptionText.SetTextColor = F.dummy
		QuestInfoObjectivesText:SetTextColor(1, 1, 1)
		QuestInfoObjectivesText.SetTextColor = F.dummy
		QuestInfoGroupSize:SetTextColor(1, 1, 1)
		QuestInfoGroupSize.SetTextColor = F.dummy
		QuestInfoRewardText:SetTextColor(1, 1, 1)
		QuestInfoRewardText.SetTextColor = F.dummy
		QuestProgressTitleText:SetTextColor(1, 1, 1)
		QuestProgressTitleText.SetTextColor = F.dummy
		QuestProgressText:SetTextColor(1, 1, 1)
		QuestProgressText.SetTextColor = F.dummy
		ItemTextPageText:SetTextColor(1, 1, 1)
		ItemTextPageText.SetTextColor = F.dummy
		GreetingText:SetTextColor(1, 1, 1)
		GreetingText.SetTextColor = F.dummy
		AvailableQuestsText:SetTextColor(1, 1, 1)
		AvailableQuestsText.SetTextColor = F.dummy
		AvailableQuestsText:SetShadowColor(0, 0, 0)
		QuestInfoSpellObjectiveLearnLabel:SetTextColor(1, 1, 1)
		QuestInfoSpellObjectiveLearnLabel.SetTextColor = F.dummy
		CurrentQuestsText:SetTextColor(1, 1, 1)
		CurrentQuestsText.SetTextColor = F.dummy
		CurrentQuestsText:SetShadowColor(0, 0, 0)
		CoreAbilityFont:SetTextColor(1, 1, 1)

		hooksecurefunc("UpdateProfessionButton", function(self)
			self.spellString:SetTextColor(1, 1, 1);
			self.subSpellString:SetTextColor(1, 1, 1)
		end)

		hooksecurefunc("PaperDollFrame_SetLevel", function()
			local primaryTalentTree = GetSpecialization()
			local classDisplayName, class = UnitClass("player")
			local classColorString = format("ff%.2x%.2x%.2x", r * 255, g * 255, b * 255)
			local specName, _

			if primaryTalentTree then
				_, specName = GetSpecializationInfo(primaryTalentTree, nil, nil, nil, UnitSex("player"))
			end

			if specName and specName ~= "" then
				CharacterLevelText:SetFormattedText(PLAYER_LEVEL, UnitLevel("player"), classColorString, specName, classDisplayName)
			else
				CharacterLevelText:SetFormattedText(PLAYER_LEVEL_NO_SPEC, UnitLevel("player"), classColorString, classDisplayName)
			end
		end)

		-- [[ Change positions ]]

		ChatConfigFrameDefaultButton:SetWidth(125)
		ChatConfigFrameDefaultButton:SetPoint("TOPLEFT", ChatConfigCategoryFrame, "BOTTOMLEFT", 0, -4)
		ChatConfigFrameOkayButton:SetPoint("TOPRIGHT", ChatConfigBackgroundFrame, "BOTTOMRIGHT", 0, -4)
		PaperDollEquipmentManagerPaneEquipSet:SetWidth(PaperDollEquipmentManagerPaneEquipSet:GetWidth()-1)
		PaperDollEquipmentManagerPaneSaveSet:SetPoint("LEFT", PaperDollEquipmentManagerPaneEquipSet, "RIGHT", 1, 0)
		GearManagerDialogPopup:SetPoint("LEFT", PaperDollFrame, "RIGHT", 1, 0)
		DressUpFrameResetButton:SetPoint("RIGHT", DressUpFrameCancelButton, "LEFT", -1, 0)
		SendMailMailButton:SetPoint("RIGHT", SendMailCancelButton, "LEFT", -1, 0)
		OpenMailDeleteButton:SetPoint("RIGHT", OpenMailCancelButton, "LEFT", -1, 0)
		OpenMailReplyButton:SetPoint("RIGHT", OpenMailDeleteButton, "LEFT", -1, 0)
		HelpFrameReportBugScrollFrameScrollBar:SetPoint("TOPLEFT", HelpFrameReportBugScrollFrame, "TOPRIGHT", 1, -16)
		HelpFrameSubmitSuggestionScrollFrameScrollBar:SetPoint("TOPLEFT", HelpFrameSubmitSuggestionScrollFrame, "TOPRIGHT", 1, -16)
		HelpFrameTicketScrollFrameScrollBar:SetPoint("TOPLEFT", HelpFrameTicketScrollFrame, "TOPRIGHT", 1, -16)
		HelpFrameGM_ResponseScrollFrame1ScrollBar:SetPoint("TOPLEFT", HelpFrameGM_ResponseScrollFrame1, "TOPRIGHT", 1, -16)
		HelpFrameGM_ResponseScrollFrame2ScrollBar:SetPoint("TOPLEFT", HelpFrameGM_ResponseScrollFrame2, "TOPRIGHT", 1, -16)
		RaidInfoFrame:SetPoint("TOPLEFT", RaidFrame, "TOPRIGHT", 1, -28)
		CharacterFrameExpandButton:SetPoint("BOTTOMRIGHT", CharacterFrameInset, "BOTTOMRIGHT", -14, 6)
		TabardCharacterModelRotateRightButton:SetPoint("TOPLEFT", TabardCharacterModelRotateLeftButton, "TOPRIGHT", 1, 0)
		LFDQueueFrameSpecificListScrollFrameScrollBarScrollDownButton:SetPoint("TOP", LFDQueueFrameSpecificListScrollFrameScrollBar, "BOTTOM", 0, 2)
		LFDQueueFrameRandomScrollFrameScrollBarScrollDownButton:SetPoint("TOP", LFDQueueFrameRandomScrollFrameScrollBar, "BOTTOM", 0, 2)
		SendMailMoneySilver:SetPoint("LEFT", SendMailMoneyGold, "RIGHT", 1, 0)
		SendMailMoneyCopper:SetPoint("LEFT", SendMailMoneySilver, "RIGHT", 1, 0)

		WhoFrameWhoButton:SetPoint("RIGHT", WhoFrameAddFriendButton, "LEFT", -1, 0)
		WhoFrameAddFriendButton:SetPoint("RIGHT", WhoFrameGroupInviteButton, "LEFT", -1, 0)
		FriendsFrameTitleText:SetPoint("TOP", FriendsFrame, "TOP", 0, -8)
		VideoOptionsFrameOkay:SetPoint("BOTTOMRIGHT", VideoOptionsFrameCancel, "BOTTOMLEFT", -1, 0)
		InterfaceOptionsFrameOkay:SetPoint("BOTTOMRIGHT", InterfaceOptionsFrameCancel, "BOTTOMLEFT", -1, 0)

		-- [[ Buttons ]]

		local buttons = {"VideoOptionsFrameOkay", "VideoOptionsFrameCancel", "VideoOptionsFrameDefaults", "VideoOptionsFrameApply", "AudioOptionsFrameOkay", "AudioOptionsFrameCancel", "AudioOptionsFrameDefaults", "InterfaceOptionsFrameDefaults", "InterfaceOptionsFrameOkay", "InterfaceOptionsFrameCancel", "ChatConfigFrameOkayButton", "ChatConfigFrameDefaultButton", "DressUpFrameCancelButton", "DressUpFrameResetButton", "WhoFrameWhoButton", "WhoFrameAddFriendButton", "WhoFrameGroupInviteButton", "SendMailMailButton", "SendMailCancelButton", "OpenMailReplyButton", "OpenMailDeleteButton", "OpenMailCancelButton", "OpenMailReportSpamButton", "aMailButton", "ChannelFrameNewButton", "RaidFrameRaidInfoButton", "RaidFrameConvertToRaidButton", "GearManagerDialogPopupOkay", "GearManagerDialogPopupCancel", "StackSplitOkayButton", "StackSplitCancelButton", "GameMenuButtonHelp", "GameMenuButtonWhatsNew", "GameMenuButtonOptions", "GameMenuButtonUIOptions", "GameMenuButtonKeybindings", "GameMenuButtonMacros", "GameMenuButtonAddons", "GameMenuButtonLogout", "GameMenuButtonQuit", "GameMenuButtonContinue", "GameMenuButtonMacOptions", "LFDQueueFrameFindGroupButton", "AddFriendEntryFrameAcceptButton", "AddFriendEntryFrameCancelButton", "FriendsFriendsSendRequestButton", "FriendsFriendsCloseButton", "ColorPickerOkayButton", "ColorPickerCancelButton", "GuildInviteFrameJoinButton", "GuildInviteFrameDeclineButton", "FriendsFramePendingButton1AcceptButton", "FriendsFramePendingButton1DeclineButton", "RaidInfoExtendButton", "RaidInfoCancelButton", "PaperDollEquipmentManagerPaneEquipSet", "PaperDollEquipmentManagerPaneSaveSet", "HelpFrameAccountSecurityOpenTicket", "HelpFrameCharacterStuckStuck", "HelpFrameOpenTicketHelpTopIssues", "HelpFrameOpenTicketHelpOpenTicket", "ReadyCheckFrameYesButton", "ReadyCheckFrameNoButton", "HelpFrameTicketSubmit", "HelpFrameTicketCancel", "HelpFrameKnowledgebaseSearchButton", "GhostFrame", "HelpFrameGM_ResponseNeedMoreHelp", "HelpFrameGM_ResponseCancel", "GMChatOpenLog", "HelpFrameKnowledgebaseNavBarHomeButton", "AddFriendInfoFrameContinueButton", "LFDQueueFramePartyBackfillBackfillButton", "LFDQueueFramePartyBackfillNoBackfillButton", "ChannelFrameDaughterFrameOkayButton", "ChannelFrameDaughterFrameCancelButton", "PendingListInfoFrameContinueButton", "LFDQueueFrameNoLFDWhileLFRLeaveQueueButton", "InterfaceOptionsHelpPanelResetTutorials", "RaidFinderFrameFindRaidButton", "RaidFinderQueueFrameIneligibleFrameLeaveQueueButton", "SideDressUpModelResetButton", "RaidFinderQueueFramePartyBackfillBackfillButton", "RaidFinderQueueFramePartyBackfillNoBackfillButton", "ScrollOfResurrectionSelectionFrameAcceptButton", "ScrollOfResurrectionSelectionFrameCancelButton", "ScrollOfResurrectionFrameAcceptButton", "ScrollOfResurrectionFrameCancelButton", "HelpFrameReportBugSubmit", "HelpFrameSubmitSuggestionSubmit", "ReportPlayerNameDialogReportButton", "ReportPlayerNameDialogCancelButton", "ReportCheatingDialogReportButton", "ReportCheatingDialogCancelButton", "HelpFrameOpenTicketHelpItemRestoration"}
		for i = 1, #buttons do
			local reskinbutton = _G[buttons[i]]
			if reskinbutton then
				F.Reskin(reskinbutton)
			else
				print("FreeUI: "..buttons[i].." was not found.")
			end
		end

		for i = 1, NUM_CHAT_WINDOWS do
			F.ReskinArrow(_G["ChatFrame"..i.."ButtonFrameBottomButton"], "down")
		end

		hooksecurefunc("FCF_SetTemporaryWindowType", function(f)
			F.ReskinArrow(_G[f:GetName().."ButtonFrameBottomButton"], "down")
		end)

		local closebuttons = {"HelpFrameCloseButton", "RaidInfoCloseButton", "ItemRefCloseButton", "ChannelFrameDaughterFrameDetailCloseButton", "RaidParentFrameCloseButton", "SideDressUpModelCloseButton"}
		for i = 1, #closebuttons do
			F.ReskinClose(_G[closebuttons[i]])
		end

		F.ReskinClose(DressUpFrameCloseButton, "TOPRIGHT", DressUpFrame, "TOPRIGHT", -38, -16)
	end
end)
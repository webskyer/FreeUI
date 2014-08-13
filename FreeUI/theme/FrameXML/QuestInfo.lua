local F, C = unpack(select(2, ...))

tinsert(C.themes["FreeUI"], function()
	local r, g, b = C.r, C.g, C.b

	-- [[ Quest info rewards ]]

	QuestInfoItemHighlight:GetRegions():Hide()
	QuestInfoSpellObjectiveFrameNameFrame:Hide()

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

	hooksecurefunc(QuestInfoRequiredMoneyText, "SetTextColor", function(self, r, g, b)
		if r == 0 then
			self:SetTextColor(.8, .8, .8)
		elseif r == .2 then
			self:SetTextColor(1, 1, 1)
		end
	end)

	-- [[ Objectives ]]

	local function colourObjectivesText()
		local objectivesTable = QuestInfoObjectivesFrame.Objectives
		local numVisibleObjectives = 0

		for i = 1, GetNumQuestLeaderBoards() do
			local text, type, finished = GetQuestLogLeaderBoard(i)

			if (type ~= "spell" and type ~= "log" and numVisibleObjectives < MAX_OBJECTIVES) then
				numVisibleObjectives = numVisibleObjectives + 1
				local objective = objectivesTable[numVisibleObjectives]

				if finished then
					objective:SetTextColor(.7, .7, .7)
				else
					objective:SetTextColor(1, 1, 1)
				end
			end
		end
	end

	hooksecurefunc("QuestMapFrame_ShowQuestDetails", colourObjectivesText)
	hooksecurefunc("QuestInfo_Display", colourObjectivesText)

	-- [[ Quest rewards ]]

	local function restyleRewardButton(bu)
		bu.NameFrame:Hide()
		bu.Icon:SetTexCoord(.08, .92, .08, .92)
		bu.Icon:SetDrawLayer("BACKGROUND", 1)
		F.CreateBG(bu.Icon, 1)
	end

	hooksecurefunc("QuestInfo_GetRewardButton", function(rewardsFrame, index)
		local bu = rewardsFrame.RewardButtons[index]

		if not bu.restyled then
			if rewardsFrame == MapQuestInfoRewardsFrame then
				bu.Icon:SetSize(29, 29)
			end

			restyleRewardButton(bu)

			bu.restyled = true
		end
	end)

	restyleRewardButton(MapQuestInfoRewardsFrame.SpellFrame)
	restyleRewardButton(MapQuestInfoRewardsFrame.XPFrame)
	restyleRewardButton(MapQuestInfoRewardsFrame.MoneyFrame)
	restyleRewardButton(MapQuestInfoRewardsFrame.SkillPointFrame)

	MapQuestInfoRewardsFrame.XPFrame.Name:SetShadowOffset(0, 0)

	-- [[ Change text colours ]]

	QuestInfoTitleHeader:SetTextColor(1, 1, 1)
	QuestInfoTitleHeader.SetTextColor = F.dummy
	QuestInfoTitleHeader:SetShadowColor(0, 0, 0)

	QuestInfoDescriptionHeader:SetTextColor(1, 1, 1)
	QuestInfoDescriptionHeader.SetTextColor = F.dummy
	QuestInfoDescriptionHeader:SetShadowColor(0, 0, 0)

	QuestInfoObjectivesHeader:SetTextColor(1, 1, 1)
	QuestInfoObjectivesHeader.SetTextColor = F.dummy
	QuestInfoObjectivesHeader:SetShadowColor(0, 0, 0)

	QuestInfoRewardsFrame.Header:SetTextColor(1, 1, 1)
	QuestInfoRewardsFrame.Header.SetTextColor = F.dummy
	QuestInfoRewardsFrame.Header:SetShadowColor(0, 0, 0)

	QuestInfoDescriptionText:SetTextColor(1, 1, 1)
	QuestInfoDescriptionText.SetTextColor = F.dummy

	QuestInfoObjectivesText:SetTextColor(1, 1, 1)
	QuestInfoObjectivesText.SetTextColor = F.dummy

	QuestInfoGroupSize:SetTextColor(1, 1, 1)
	QuestInfoGroupSize.SetTextColor = F.dummy

	QuestInfoRewardText:SetTextColor(1, 1, 1)
	QuestInfoRewardText.SetTextColor = F.dummy

	QuestInfoSpellObjectiveLearnLabel:SetTextColor(1, 1, 1)
	QuestInfoSpellObjectiveLearnLabel.SetTextColor = F.dummy

	QuestInfoRewardsFrame.ItemChooseText:SetTextColor(1, 1, 1)
	QuestInfoRewardsFrame.ItemChooseText.SetTextColor = F.dummy

	QuestInfoRewardsFrame.ItemReceiveText:SetTextColor(1, 1, 1)
	QuestInfoRewardsFrame.ItemReceiveText.SetTextColor = F.dummy

	QuestInfoRewardsFrame.SpellLearnText:SetTextColor(1, 1, 1)
	QuestInfoRewardsFrame.SpellLearnText.SetTextColor = F.dummy

	QuestInfoRewardsFrame.PlayerTitleText:SetTextColor(1, 1, 1)
	QuestInfoRewardsFrame.PlayerTitleText.SetTextColor = F.dummy

	QuestInfoRewardsFrame.XPFrame.ReceiveText:SetTextColor(1, 1, 1)
	QuestInfoRewardsFrame.XPFrame.ReceiveText.SetTextColor = F.dummy
end)
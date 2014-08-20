local F, C = unpack(select(2, ...))

tinsert(C.themes["FreeUI"], function()
	local LFGListFrame = LFGListFrame

	-- [[ Category selection ]]

	local CategorySelection = LFGListFrame.CategorySelection

	CategorySelection.Inset.Bg:Hide()
	select(10, CategorySelection.Inset:GetRegions()):Hide()
	CategorySelection.Inset:DisableDrawLayer("BORDER")

	F.Reskin(CategorySelection.FindGroupButton)
	F.Reskin(CategorySelection.StartGroupButton)

	CategorySelection.CategoryButtons[1]:SetNormalFontObject(GameFontNormal)

	hooksecurefunc("LFGListCategorySelection_AddButton", function(self, btnIndex)
		local bu = self.CategoryButtons[btnIndex]

		if not bu.styled then
			bu.Cover:Hide()

			bu.Icon:SetDrawLayer("BACKGROUND", 1)
			bu.Icon:SetTexCoord(.01, .99, .01, .99)

			local bg = F.CreateBG(bu)
			bg:SetPoint("TOPLEFT", 4, -4)
			bg:SetPoint("BOTTOMRIGHT", -4, 4)

			bu.styled = true
		end
	end)

	-- [[ Entry creation ]]

	local EntryCreation = LFGListFrame.EntryCreation

	EntryCreation.Inset.Bg:Hide()
	select(10, EntryCreation.Inset:GetRegions()):Hide()
	EntryCreation.Inset:DisableDrawLayer("BORDER")

	for i = 1, 9 do
		select(i, EntryCreation.Description:GetRegions()):Hide()
	end

	F.Reskin(EntryCreation.ListGroupButton)
	F.Reskin(EntryCreation.CancelButton)
	F.CreateBD(EntryCreation.Description, 0)
	F.CreateGradient(EntryCreation.Description)
	F.ReskinInput(EntryCreation.Name)
	F.ReskinInput(EntryCreation.ItemLevel.EditBox)
	F.ReskinInput(EntryCreation.VoiceChat.EditBox)
	F.ReskinDropDown(EntryCreation.CategoryDropDown)
	F.ReskinDropDown(EntryCreation.GroupDropDown)
	F.ReskinDropDown(EntryCreation.ActivityDropDown)
	F.ReskinCheck(EntryCreation.ItemLevel.CheckButton)
	F.ReskinCheck(EntryCreation.VoiceChat.CheckButton)
end)
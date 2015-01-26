ToyBoxFilterFixerFilter = false
local f, name = CreateFrame('frame'), ...
f:SetScript('OnEvent', function(self, event, addon)
	if addon == name then
		C_ToyBox.SetFilterUncollected(ToyBoxFilterFixerFilter)
		hooksecurefunc(C_ToyBox, 'SetFilterUncollected', function(filter) ToyBoxFilterFixerFilter = filter end)
		self:UnregisterEvent(event)
	end
end)
f:RegisterEvent('ADDON_LOADED')
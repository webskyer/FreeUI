local F, C, L = unpack(select(2, ...))

local modifier = "shift" -- shift, alt or ctrl 三个配合按键可用
local mouseButton = "1" -- 1 = left, 2 = right, 3 = middle, 4 and 5 = thumb buttons if there are any 鼠标按键对照

local function SetFocusHotkey(frame)
	frame:SetAttribute(modifier.."-type"..mouseButton,"focus")
end

local function CreateFrame_Hook(type, name, parent, template)
	if template == "SecureUnitButtonTemplate" then
		SetFocusHotkey(_G[name])
	end
end

hooksecurefunc("CreateFrame", CreateFrame_Hook)

-- Keybinding override so that models can be shift/alt/ctrl+clicked
local f = CreateFrame("CheckButton", "FocuserButton", UIParent, "SecureActionButtonTemplate")
f:SetAttribute("type1","macro")
f:SetAttribute("macrotext","/focus mouseover")
SetOverrideBindingClick(FocuserButton,true,modifier.."-BUTTON"..mouseButton,"FocuserButton")

-- Set the keybindings on the default unit frames since we won't get any CreateFrame notification about them
for i = 1, 5 do
	local party_dps = "oUF_PartyDPSUnitButton"..i
	local partytarget_dps = "oUF_PartyTargetDPSUnitButton"..i
	local party_heal = "oUF_PartyUnitButton"..i
	local partytarget_heal = "oUF_PartyTargetUnitButton"..i
	local arena = "oUF_Arena"..i
	local arenatarget = "oUF_Arena"..i.."Target"
end

for i = 1, 8 do
	for j = 1, 5 do
		local raid_heal = "oUF_RaidHeal"..i.."UnitButton"..j
		local raid_dps = "oUF_RaidDPS"..i.."UnitButton"..j
	end
end

local duf = {
	oUF_Player,
	oUF_Pet,
	oUF_Target,
	oUF_TargetTarget,
	oUF_Focus,
	oUF_FocusTarget,
	oUF_Boss1,
	oUF_Boss2,
	oUF_Boss3,
	party_dps,
	partytarget_dps,
	party_heal,
	partytarget_heal,
	arena,
	arenatarget,
	PlayerFrame,
	PetFrame,
	PartyMemberFrame1,
	PartyMemberFrame2,
	PartyMemberFrame3,
	PartyMemberFrame4,
	PartyMemberFrame1PetFrame,
	PartyMemberFrame2PetFrame,
	PartyMemberFrame3PetFrame,
	PartyMemberFrame4PetFrame,
	TargetFrame,
	TargetofTargetFrame,
}

for i,frame in pairs(duf) do
	SetFocusHotkey(frame)
end

hooksecurefunc("CooldownFrame_SetTimer", function(self) if self.currentCooldownType == COOLDOWN_TYPE_LOSS_OF_CONTROL then self:SetCooldown(0, 0) end end)
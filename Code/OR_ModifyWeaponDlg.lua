local REV_OriginalModifyWeaponDlg_ApplyChangesSlot = ModifyWeaponDlg.ApplyChangesSlot

function ModifyWeaponDlg:ApplyChangesSlot(modSlot, skipChance)
	assert(modSlot)
	if not modSlot then return end

	if REV_isNoComponentSlot(modSlot) then
		REV_OriginalModifyWeaponDlg_ApplyChangesSlot(self, modSlot, skipChance)
		return
	end

	local actualWeapon = self.context.weapon
	local owner = self.context.owner
	local slot = self.context.slot
	if not self.canEdit then return end
	assert(type(self.context.owner) == "string")
	local unit

	if gv_UnitData[owner] then
		unit = gv_UnitData[owner]
	end

	local componentToChangeTo = self.weaponClone.components[modSlot]
	local componentToChangePreset = WeaponComponents[componentToChangeTo]
	local playerMechSkill, bestMechSkillUnit, difficulty, allowed = self:GetModificationDifficultyParams(
		componentToChangePreset)

	-- Changing to empty is free
	-- if componentToChangeTo == "" then
	-- 	skipChance = true
	-- end

	-- This needs to be in a thread as the popup needs to close first.
	-- We can't call the function before closing it as then we cannot observe its changes on the weapon clone.
	CreateMapRealTimeThread(function()
		PlayFX("WeaponModificationSuccess", "start")
		local modAdded = true


		CombatLog("important",
			T { 753849538837, "Modification of <weapon> successful", weapon = actualWeapon.DisplayName })

		local clone = self.weaponClone
		clone:SetWeaponComponent(modSlot, componentToChangeTo)
		clone:UpdateVisualObj(self.weaponModel)

		local oldComponent = actualWeapon.components[modSlot]

		if componentToChangeTo and componentToChangeTo ~= "" then
			local newItem = REV_getItemComponent(componentToChangeTo, unit, actualWeapon)
			if newItem then
				REV_removeComponent(newItem, unit)
			end
		end

		if oldComponent and oldComponent ~= "" then
			local componentClass = REV_getItemComponentClass(oldComponent, actualWeapon)
			if componentClass then
				local oldItem = PlaceInventoryItem(componentClass)
				REV_placeComponent(oldItem, unit)
			end
		end

		NetSyncEvent("WeaponModified", owner, slot, clone.components, clone.components.Color, true, modAdded,
			bestMechSkillUnit, modSlot, oldComponent)

		CreateMapRealTimeThread(function()
			if oldComponent and oldComponent ~= "" then
				PlayFX("WeaponComponentDetached", "start", oldComponent)
				Sleep(1000)
			end
			if componentToChangeTo and componentToChangeTo ~= "" then
				PlayFX("WeaponComponentAttached", "start", componentToChangeTo)
			end
		end)
		-- PlayFX("WeaponColorChanged", "end", actualWeapon, colorId)
		-- weapon:UpdateColorMod(self.weaponModel) -- The weapon in the cabinet
		-- weapon:UpdateColorMod() -- The weapon in the world
		--[[ObjModified(actualWeapon)
		self.idToolBar:OnUpdateActions()]]
		local mechanic = gv_SatelliteView and gv_UnitData[bestMechSkillUnit] or g_Units[bestMechSkillUnit]
		Msg("WeaponModifiedSuccess", actualWeapon, mechanic, modAdded, mechanic, modSlot, oldComponent)
	end)
end

local REV_OriginalModifyWeaponDlgCanModifySlot = ModifyWeaponDlg.CanModifySlot

function ModifyWeaponDlg:CanModifySlot(slot, partId)
	if REV_isNoComponentSlot(slot.SlotType) then
		return REV_OriginalModifyWeaponDlgCanModifySlot(self, slot, partId)
	end

	local weapon = self.context.weapon
	local slotName = slot.SlotType
	local blocked = false

	-- Check if slot is blocked
	for name, attached in pairs(weapon.components) do
		local def = WeaponComponents[attached]
		if def and def.BlockSlots and next(def.BlockSlots) then
			if table.find(def.BlockSlots, slotName) then
				blocked = attached
				break
			end
		end
	end
	if blocked then return false, "blocked", blocked end

	local availableComponents = slot and REV_getAvailableComponents(slot.AvailableComponents, weapon)

	-- Check if placing any of the slot options is possible due to a blocked slot having a component in it already.
	if availableComponents and #availableComponents > 0 then
		local anyPossible, impossibleBecauseOf = false
		for i, component in ipairs(availableComponents) do
			local def = WeaponComponents[component]
			local blocksAny, blockedId = GetComponentBlocksAnyOfAttachedSlots(weapon, def)
			impossibleBecauseOf = impossibleBecauseOf or blockedId
			if not blocksAny then
				anyPossible = true
				break
			end
		end
		if not anyPossible then
			return false, "blocked", impossibleBecauseOf
		end
	else
		return true, "cantAfford"
	end

	-- If a part id is provided, check if it blocks any of the current components,
	-- or if it itself blocked by an attached component.
	if partId then
		-- Check if there's an attached component in a slot that this component will block
		local partDef = WeaponComponents[partId]
		local blocksAny, blockedId = GetComponentBlocksAnyOfAttachedSlots(weapon, partDef)
		if blocksAny then
			return false, "blocked", blockedId
		end

		for name, attached in pairs(weapon.components) do
			local componentsBlock = GetComponentsBlockedByComponent(attached, weapon.class)
			if componentsBlock[partId] then -- Attached is blocking me
				return false, "blocked", attached
			end
		end

		local componentsWillBlock = GetComponentsBlockedByComponent(partId, weapon.class)
		for name, attached in pairs(weapon.components) do
			if componentsWillBlock[attached] then -- Blocking already attached
				return false, "blocked", attached
			end
		end
	end

	return true
end

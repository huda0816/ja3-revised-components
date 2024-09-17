function REV_getAvailableComponents(componentIds, weapon)
	local owner = weapon.owner

	local availableComponents = {}

	local iconNames = REV_getComponentIconNames(componentIds, weapon)

	local slot = WeaponComponents[componentIds[1]].Slot

	if owner and gv_UnitData[owner] then
		local unit = gv_UnitData[owner]

		local inventories = REV_getPossibleInventories(unit)

		for _, inventory in ipairs(inventories) do
			for _, item in ipairs(inventory) do
				if not IsKindOfClasses(item, "WeaponComponentItem") then
					goto continue
				end

				if IsKindOfClasses(item, iconNames) then
					local component, iconPath = REV_getComponentAndIconpath(item.class, weapon.class, componentIds)

					if not table.find_value(availableComponents, component.id) and weapon.components[slot] ~= component.id then
						table.insert(availableComponents, component.id)
					end
				end

				::continue::
			end
		end
	end

	local freeComponent = REV_getFreeDefaultComponent(slot, weapon)

	if freeComponent and not table.find_value(availableComponents, freeComponent) then
		table.insert(availableComponents, freeComponent.id)
	end

	return availableComponents
end

function REV_getFreeDefaultComponent(slot, weapon)
	local weaponSlotData = table.find_value(weapon.ComponentSlots, "SlotType", slot)

	if not weaponSlotData then
		return
	end

	if weaponSlotData.CanBeEmpty or not weaponSlotData.DefaultComponent then
		return
	end

	if weapon.components[slot] == weaponSlotData.DefaultComponent then
		return
	end

	local freeComponentIcons = REV_Components_Config.freeRevertComponents

	local defaultComponent = WeaponComponents[weaponSlotData.DefaultComponent]

	if not defaultComponent then
		return
	end

	if not freeComponentIcons[slot] then
		return defaultComponent
	end

	for i, freeIcon in ipairs(freeComponentIcons[slot]) do
		for _, visual in ipairs(defaultComponent.Visuals) do
			if visual.ApplyTo == weapon.class and visual.Icon and visual.Icon ~= "" then
				if string.find(visual.Icon .. " ", "/" .. freeIcon .. " ") then
					return defaultComponent
				else
					return
				end
			end
		end

		if defaultComponent.Icon and string.find(defaultComponent.Icon .. " ", "/" .. freeIcon .. " ") then
			return defaultComponent
		end
	end
end

function REV_getComponentIconNames(componentIds, weapon)
	local iconNames = {}

	for i, componentId in ipairs(componentIds) do
		local component = WeaponComponents[componentId]

		if component then
			local icon = REV_getComponentIcon(component, weapon.class)

			if icon then
				local iconName = REV_getIconName(icon)

				table.insert(iconNames, iconName)
			end
		end
	end

	return iconNames
end

function REV_getComponentIcon(component, weaponId)
	local visuals = component.Visuals

	for i, visual in ipairs(visuals) do
		if visual.Icon and visual.Icon ~= "" and visual.ApplyTo == weaponId then
			return visual.Icon
		end
	end

	return component.Icon
end

function REV_isWeaponComponent(component, weapon)
	local weaponComponentSlots = weapon.ComponentSlots

	if not weaponComponentSlots then
		return false
	end

	for i, weaponComponentSlot in ipairs(weaponComponentSlots) do
		if weaponComponentSlot.SlotType ~= component.Slot then
			goto continue
		end

		if table.find_value(weaponComponentSlot.AvailableComponents, component.id) then
			return true
		end

		::continue::
	end

	return false
end

function REV_getItemComponent(componentId, unit, weapon)
	local inventories = REV_getPossibleInventories(unit)

	local component = WeaponComponents[componentId]

	local componentIcon = REV_getComponentIcon(component, weapon.class)

	local iconName = REV_getIconName(componentIcon)

	if not InventoryItemDefs[iconName] then
		return
	end

	for _, inventory in ipairs(inventories) do
		for i, item in ipairs(inventory) do
			if not IsKindOfClasses(item, "WeaponComponentItem") then
				goto continue
			end

			if componentIcon and item.class == iconName then
				return item
			end

			::continue::
		end
	end
end

function REV_getItemComponentClass(componentId, weapon)
	local component = WeaponComponents[componentId]

	local componentIcon = REV_getComponentIcon(component, weapon.class)

	local iconName = REV_getIconName(componentIcon)

	if not InventoryItemDefs[iconName] then
		return
	end

	return iconName
end

function REV_getComponentAndIconpath(iconName, weaponId, allowedComponents)
	local components = WeaponComponents

	local blackList = REV_Components_Config.componentBlacklist

	for _, component in pairs(components) do
		if table.find_value(blackList, component.id) then
			goto continue
		end

		if allowedComponents and not table.find_value(allowedComponents, component.id) then
			goto continue
		end

		if component.Icon and component.Icon ~= "" and REV_getIconName(component.Icon) == iconName then
			return component, component.Icon
		end

		for _, visual in ipairs(component.Visuals) do
			if visual.Icon and visual.Icon ~= "" and REV_getIconName(visual.Icon) == iconName then
				if not weaponId or visual.ApplyTo == weaponId then
					return component, visual.Icon
				end
			end
		end

		::continue::
	end
end

function REV_getIconName(iconPath)
	local iconName = "WCI_" .. (string.match(iconPath, "([^/]+)$") or "")

	return iconName
end

function REV_getAllowedComponents(weapon)
	local allowedComponents = {}

	local componentSlots = weapon.ComponentSlots

	for i, slot in ipairs(componentSlots) do
		for i, available in ipairs(slot.AvailableComponents) do
			table.insert(allowedComponents, available)
		end
	end

	return allowedComponents
end

function REV_RemoveComponents(context)
	local weapon = context.item

	if not weapon then
		return
	end

	REV_removeAllComponents(weapon)
end

function REV_removeAllComponents(weapon, silent)
	local components = weapon.components

	local owner = weapon.owner

	local unit = owner and gv_UnitData[owner]

	local items = {}

	for slot, componentId in pairs(components) do
		if REV_isNoComponentSlot(slot) or not componentId or componentId == "" then
			goto continue
		end

		local componentSlot = table.find_value(weapon.ComponentSlots, "SlotType", slot)

		if not componentSlot then
			goto continue
		end

		if not componentSlot.CanBeEmpty and not componentSlot.DefaultComponent then
			goto continue
		end

		local freeDefaultComponent

		if not componentSlot.CanBeEmpty and componentSlot.DefaultComponent then
			freeDefaultComponent = REV_getFreeDefaultComponent(slot, weapon)

			if not freeDefaultComponent then
				goto continue
			end
		end

		local componentClass = REV_getItemComponentClass(componentId, weapon)

		if not componentClass then
			goto continue
		end

		weapon:SetWeaponComponent(slot, freeDefaultComponent and freeDefaultComponent.id or nil)

		local item = PlaceInventoryItem(componentClass)

		if item then
			table.insert(items, item)
		end



		::continue::
	end

	REV_placeComponents(items, unit)

	if not silent then
		CombatLog("important", T { 7538495388370817, "All components removed" })
	end

	InventoryUIRespawn()
end

function REV_isNoComponentSlot(slot)
	return table.find_value(REV_Components_Config.noComponentSlots, slot)
end

function REV_canRemoveComponents(weapon)
	if not weapon or not weapon.components then
		return false
	end

	local components = weapon.components

	local removeableComponents = {}

	for slot, componentId in pairs(components) do
		if REV_isNoComponentSlot(slot) or not componentId or componentId == "" then
			goto continue
		end

		local componentSlot = table.find_value(weapon.ComponentSlots, "SlotType", slot)

		if componentSlot and componentSlot.CanBeEmpty then
			table.insert(removeableComponents, slot)
		else
			local freeDefaultComponent = REV_getFreeDefaultComponent(slot, weapon)

			if freeDefaultComponent then
				table.insert(removeableComponents, slot)
			end
		end

		::continue::
	end

	return #removeableComponents > 0
end

function REV_getPossibleInventories(unit)
	local inventories = {}

	local containers = REV_getPossibleContainers(unit)

	for i, container in ipairs(containers) do
		if container.Inventory then
			table.insert(inventories, container.Inventory)
		end
	end

	return inventories
end

function REV_getPossibleContainers(unit)
	local altContainers = {}
	-- local squad

	if unit then
		table.insert(altContainers, unit)
	end

	if gv_SectorInventory and gv_SectorInventory.sector_id then
		local sectorId = gv_SectorInventory.sector_id
		table.insert(altContainers, GetSectorInventory(sectorId))
	end

	if unit and unit.Squad then
		local squadId = unit.Squad
		squad = squadId and gv_Squads[squadId]

		if squad and squad.units then
			for i, unitId in ipairs(squad.units) do
				local squadUnit = gv_UnitData[unitId]

				table.insert(altContainers, squadUnit)
			end
		end
	end

	return altContainers
end

function REV_placeComponents(items, unit)
	-- unit = unit or SelectedObj

	local containers = REV_getPossibleContainers(unit)

	local remainingItems = items

	for i, container in ipairs(containers) do
		for j = 1, #remainingItems, 1 do
			if container:AddItem("Inventory", remainingItems[j]) then
				table.remove(remainingItems, j)
			end
		end
	end

	if #remainingItems < 1 then
		return
	end

	if not gv_SatelliteView and unit then
		local altcontainer = PlaceObject("ItemDropContainer")
		local drop_pos = terrain.FindPassable(altcontainer, 0, const.SlabSizeX / 2)
		altcontainer:SetPos(drop_pos or unit:GetPos())
		altcontainer:SetAngle(altcontainer:Random(21600))

		for i, item in ipairs(remainingItems) do
			altcontainer:AddItem("Inventory", item)
		end
	end
end

function REV_placeComponent(item, unit)
	unit = unit or item.owner and gv_UnitData[item.owner] -- or SelectedObj

	local containers = REV_getPossibleContainers(unit)

	for i, container in ipairs(containers) do
		if container:AddItem("Inventory", item) then
			return true
		end
	end

	if not gv_SatelliteView and unit then
		local altcontainer = PlaceObject("ItemDropContainer")
		local drop_pos = terrain.FindPassable(altcontainer, 0, const.SlabSizeX / 2)
		altcontainer:SetPos(drop_pos or unit:GetPos())
		altcontainer:SetAngle(altcontainer:Random(21600))
		altcontainer:AddItem("Inventory", item)
	end
end

function REV_removeComponent(item, unit)
	local containers = REV_getPossibleContainers(unit)

	for i, container in ipairs(containers) do
		if container:RemoveItem("Inventory", item) then
			return true
		end
	end
end

function REV_getItemWeaponList(itemName)
	local weapons = {}
	local inventoryItems = InventoryItemDefs
	local blackList = REV_Components_Config.weaponBlacklist

	for _, component in pairs(WeaponComponents) do
		local excludedWeapons = {}

		for _, visual in ipairs(component.Visuals) do
			if visual.Icon and visual.Icon ~= "" and REV_getIconName(visual.Icon) == itemName then
				local weapon = inventoryItems[visual.ApplyTo]

				if not weapon or not REV_customCanBeModified(weapon) or table.find_value(blackList, visual.ApplyTo) then
					goto continue
				end

				for _, componentSlot in ipairs(weapon.ComponentSlots) do
					if componentSlot.SlotType == component.Slot then
						if table.find_value(componentSlot.AvailableComponents, component.id) then
							table.insert(weapons, weapon.DisplayName)
							break
						end
					end
				end

				::continue::
			elseif visual.Icon and visual.Icon ~= "" and REV_getIconName(visual.Icon) ~= itemName then
				table.insert(excludedWeapons, visual.ApplyTo)
			end
		end

		if component.Icon and component.Icon ~= "" and REV_getIconName(component.Icon) == itemName then
			for class, item in pairs(inventoryItems) do
				if table.find_value(excludedWeapons, class) or (item.ComponentSlots and not REV_customCanBeModified(item)) or table.find_value(blackList, class) then
					goto continue
				end
				for _, componentSlot in ipairs(item.ComponentSlots) do
					if componentSlot.SlotType == component.Slot then
						if table.find_value(componentSlot.AvailableComponents, component.id) then
							table.insert(weapons, item.DisplayName)
							break
						end
					end
				end

				::continue::
			end
		end
	end

	return table.concat(weapons, " | ")
end

function REV_customCanBeModified(item)
	if not item.ComponentSlots or #item.ComponentSlots < 1 then
		return false
	end

	local modifiable = false

	for _, slot in ipairs(item.ComponentSlots) do
		if slot.Modifiable then
			modifiable = true
			break
		end
	end

	return modifiable
end

function REV_addScrapItems(item)
	local component, componentIcon = REV_getComponentAndIconpath(item.class)

	if component.AdditionalCosts then
		local unit = item.owner and gv_UnitData[item.owner]

		for _, cost in ipairs(component.AdditionalCosts) do
			for i = 1, cost.Amount do
				local item = PlaceInventoryItem(cost.Type)
				REV_placeComponent(item, unit)
			end
		end
	end
end

function REV_calculateComponentPrice(component)
	local partPrices = {
		Microchip = 220,
		FineSteelPipe = 250,
		OpticalLense = 180,
		Parts = 15
	}

	local price = component.Cost * partPrices.Parts

	if component.AdditionalCosts then
		for _, cost in ipairs(component.AdditionalCosts) do
			price = price + ((partPrices[cost.Type] or 200) * (cost.Amount or 1))
		end
	end

	return MulDivRound(price, REV_Components_Config.costsModifier, 100)
end

function REV_isAllowedComponent(componentItem, weapon)
	local allowedComponents = REV_getAllowedComponents(weapon)

	if not allowedComponents or #allowedComponents < 1 then
		return false
	end

	for i, componentId in ipairs(allowedComponents) do
		local componentIconClass = REV_getItemComponentClass(componentId, weapon)

		if componentIconClass == componentItem.class then
			return true, WeaponComponents[componentId]
		end
	end

	return false
end

function REV_HighlightWeaponsForComponents(component, bShow)
	local dlg = GetMercInventoryDlg()
	if not dlg or not component then
		return
	end
	if dlg.compare_mode then
		bShow = false
	end

	if not IsKindOf(component, "WeaponComponentItem") then
		return
	end

	local h_members = {}
	local left = dlg:ResolveId("idPartyContainer")
	local squad_list = left.idParty and left.idParty.idContainer or empty_table
	for _, button in ipairs(squad_list) do
		local member = button:GetContext()
		if member then
			for _, slot_data in ipairs(member.inventory_slots) do
				local slot_name = slot_data.slot_name
				if IsEquipSlot(slot_name) then
					local result = member:ForEachItemInSlot(slot_name, "Firearm",
						function(witem, slot, left, top, component)
							if REV_isAllowedComponent(component, witem) then
								return "break"
							end
						end, component)
					if result == "break" then
						-- head
						button:SetHighlightedStatOrIcon(bShow and "UI/Icons/Rollover/ammo")
						-- backpack
						h_members[member] = true
					end
				end
			end
		end

		--Highlight weapons
		local all_slots = dlg:GetSlotsArray()
		for slot_wnd in pairs(all_slots) do
			local slot_name = slot_wnd.slot_name
			local target = slot_wnd:GetContext()
			local found = false
			for wnd, witem in pairs(slot_wnd.item_windows or empty_table) do
				if REV_isAllowedComponent(component, witem) then
					wnd:OnSetRollover(bShow)
					HighlihgtRollover(witem:GetUIWidth(), wnd, bShow)
					found = true
				end
			end
			if not IsKindOf(target, "SquadBag") and slot_wnd and not IsEquipSlot(slot_name) and (IsKindOf(target, "Unit") and not target:IsDead()) and (found or not bShow or h_members[target]) then
				local name = slot_wnd.parent.idName
				name:SetHightlighted(bShow)
			end
		end

		if not bShow then
			button:SetHighlighted(bShow)
		end
	end
end

function REV_isModActive(modId)
	local activeMods = GetLoadedModsSavegameData()

	for i, mod in ipairs(activeMods) do
		if mod.id == modId then
			return true
		end
	end
end

local REV_Original_XInventorySlotDragDropMoveItem = XInventorySlot.DragDrop_MoveItem

function XInventorySlot:DragDrop_MoveItem(pt, target, check_only)
	local tg = target

	if not InventoryDragItem or not target then
		return REV_Original_XInventorySlotDragDropMoveItem(self, pt, target, check_only)
	end

	local dragItem = InventoryDragItem

	if dragItem.object_class ~= "WeaponComponentItem" then
		return REV_Original_XInventorySlotDragDropMoveItem(self, pt, target, check_only)
	end

	if not table.find({ "Inventory", "Handheld A", "Handheld B" }, target.slot_name) or not target.context.session_id then
		return REV_Original_XInventorySlotDragDropMoveItem(self, pt, target, check_only)
	end

	local dest_slot = target.slot_name
	local _, dx, dy = target:FindTile(pt)

	if not dx then
		return "no target tile"
	end

	local dest_container = target:GetContext()
	local src_container = InventoryStartDragContext

	local under_item = dest_container:GetItemInSlot(target.slot_name, nil, dx, dy)

	if not under_item or not under_item.ComponentSlots or not REV_customCanBeModified(under_item) then
		return REV_Original_XInventorySlotDragDropMoveItem(self, pt, target, check_only)
	end

	local allowed, component = REV_isAllowedComponent(dragItem, under_item)

	if not allowed then
		return REV_Original_XInventorySlotDragDropMoveItem(self, pt, target, check_only)
	end

	if check_only then
		return false
	end

	local oldComponent = under_item.components[component.Slot]

	under_item:SetWeaponComponent(component.Slot, component.id)

	src_container:RemoveItem("Inventory", dragItem)

	if oldComponent and oldComponent ~= "" then
		local componentClass = REV_getItemComponentClass(oldComponent, under_item)
		if componentClass then
			local oldItem = PlaceInventoryItem(componentClass)
			REV_placeComponent(oldItem)
		end
	end

	InventoryUIRespawn()

	CreateGameTimeThread(function()
		if oldComponent and oldComponent ~= "" then
			PlayFX("WeaponComponentDetached", "start", oldComponent)
			Sleep(1000)
		end
		PlayFX("WeaponComponentAttached", "start", component)
	end)

	
end

local REV_Original_SetInventoryHighlights = SetInventoryHighlights

function SetInventoryHighlights(item, bShow)
	REV_Original_SetInventoryHighlights(item, bShow)
	REV_HighlightWeaponsForComponents(item, bShow)
end

-- local REV_Original_XInventoryTileOnDropEnter = XInventoryTile.OnDropEnter

-- function XInventoryTile:OnDropEnter(drag_win, pt, drag_source_win)
-- 	if not IsKindOf(InventoryDragItem, "WeaponComponentItem") then
-- 		return REV_Original_XInventoryTileOnDropEnter(self, drag_win, pt, drag_source_win)
-- 	end

-- 	if not pt then return true end

-- 	local unit = self:GetContext()
-- 	if not unit then return end

-- 	local item_at_dest = unit:GetItemInSlot("Inventory", nil, self.GridX, self.GridY)

-- 	if not item_at_dest then
-- 		return REV_Original_XInventoryTileOnDropEnter(self, drag_win, pt, drag_source_win)
-- 	end

-- 	if REV_isAllowedComponent(InventoryDragItem, item_at_dest) then
-- 		local mouse_text = Untranslated("Add Component")
-- 		InventoryShowMouseText(true, mouse_text)
-- 		HighlightDropSlot(self, true, pt, drag_win)
-- 	else
-- 		return REV_Original_XInventoryTileOnDropEnter(self, drag_win, pt, drag_source_win)
-- 	end
-- end


local REV_OriginalCanDropAt = XInventorySlot.CanDropAt

function XInventorySlot:CanDropAt(pt)
	if not IsKindOf(InventoryDragItem, "WeaponComponentItem") then
		return REV_OriginalCanDropAt(self, pt)
	end

	if not pt then return true end

	local unit = self:GetContext()
	if not unit then return end

	local dest_slot = self.slot_name
	local _, dx, dy = self:FindTile(pt)
	if not dx then return true end

	local item_at_dest = dx and unit:GetItemInSlot(dest_slot, nil, dx, dy)

	if not item_at_dest then
		return REV_OriginalCanDropAt(self, pt)
	end

	if REV_isAllowedComponent(InventoryDragItem, item_at_dest) then
		return true
	else
		return REV_OriginalCanDropAt(self, pt)
	end
end

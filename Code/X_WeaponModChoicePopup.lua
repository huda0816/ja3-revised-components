function OnMsg.DataLoaded()
	local weaponModChoicePopupEach = REV_CustomSettingsUtils.XTemplate_FindElementsByProp(
		XTemplates.WeaponModChoicePopup, 'comment', 'slot alternatives')

	if weaponModChoicePopupEach and weaponModChoicePopupEach.element then
		local OriginalArray = weaponModChoicePopupEach.element.array

		weaponModChoicePopupEach.element.array = function(parent, context)
			if REV_isNoComponentSlot(context.slot.SlotType) then
				return OriginalArray(parent, context)
			end

			return REV_getAvailableComponents(context.slot.AvailableComponents, context[1])
		end

		local OriginalRunAfter = weaponModChoicePopupEach.element.run_after

		weaponModChoicePopupEach.element.run_after = function(child, context, item, i, n, last)
			if REV_isNoComponentSlot(context.slot.SlotType) then
				return OriginalRunAfter(child, context, item, i, n, last)
			end

			context.affordable = true

			rawset(child, "itemId", item)
		end
	end

	local preview = REV_CustomSettingsUtils.XTemplate_FindElementsByProp(
		XTemplates.WeaponModChoicePopup, 'Id', 'idPreview')

	if preview and preview.element then
		local OriginalOnContextUpdate = preview.element[1].OnContextUpdate

		preview.element[1].OnContextUpdate = function(self, context, ...)
			local component = context[1]

			if REV_isNoComponentSlot(component.Slot) then
				return OriginalOnContextUpdate(self, context, ...)
			end

			local modifyMode = context.modifyMode
			local node = self:ResolveId("node")
			local popup = self:ResolveId("node"):ResolveId("node")
			local modifyDlg = GetDialog("ModifyWeaponDlg").idModifyDialog

			local description = GetWeaponComponentDescription(component)
			node.idText:SetText(description)

			local container = node.idCostsSection
			container:SetVisible(false)

			if #container > 0 then -- Should always be true!
				local first = container[1]
				local pOne = first.Padding
				first:SetPadding(box(pOne:minx(), pOne:miny() + 5, pOne:maxx(), pOne:maxy()))

				local last = container[#container]
				local pLast = last.Padding
				last:SetPadding(box(pLast:minx(), pLast:miny(), pLast:maxx(), pLast:maxy() + 5))
			end

			if component == "" then -- Going to empty
				node.idTitle:SetText(T(617720036390, "Empty"))
				node.idDifficultySection:SetVisible(false)
				return
			end

			node.idDifficultySection:SetVisible(false)

			local name = rawget(component, "name") or component.DisplayName
			node.idTitle:SetText(name)
		end
	end

	local xButtons = REV_CustomSettingsUtils.XTemplate_FindElementsByProp(
		XTemplates.WeaponModChoicePopup, '__class', 'XButton', "all")

	if xButtons then
		for i, xButton in ipairs(xButtons) do
			if xButton and xButton.element then
				local OriginalOnPress = xButton.element.OnPress

				xButton.element.OnPress = function(self, gamepad)
					local modifyDlg = GetDialog("ModifyWeaponDlg").idModifyDialog
					local host = modifyDlg and modifyDlg:ResolveId("idChoicePopup")

					if not modifyDlg or not host.context then return "hidden" end

					if REV_isNoComponentSlot(host.context.slot.SlotTyp) then
						OriginalOnPress(self, gamepad)
					else
						modifyDlg:ApplyChangesSlot(host.context.slot.SlotType)

						assert(IsKindOf(host, "WeaponModChoicePopupClass"))
						host:Close()
					end
				end
			end
		end
	end
end

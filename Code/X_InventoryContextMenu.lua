function OnMsg.DataLoaded()
	local contextMenuActions = REV_CustomSettingsUtils.XTemplate_FindElementsByProp(XTemplates.InventoryContextMenu, 'Id',
		'idPopupWindow')

	if contextMenuActions and contextMenuActions.element then
		table.insert(contextMenuActions.element, PlaceObj('XTemplateTemplate', {
			'comment', "remove components",
			'__condition', function(parent, context)
			return context and IsKindOf(context.item, "Firearm") and REV_customCanBeModified(context.item)
		end,
			'__template', "ContextMenuButton",
			'Id', "removeComponents",
			'FocusOrder', point(1, 2),
			'RelativeFocusOrder', "new-line",
			'OnContextUpdate', function(self, context, ...)
			self:SetEnabled(REV_canRemoveComponents(context.item))
		end,
			'OnPress', function(self, gamepad)
			local context = self.context
			REV_RemoveComponents(context)
		end,
			'Text', T(7375332244470820, --[[XTemplate InventoryContextMenu Text]] "REMOVE COMPONENTS"),
		}))
	end
end
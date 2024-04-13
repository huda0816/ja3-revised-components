function REV_TableFind(t, f)
	for k, v in pairs(t) do
		if f(v) then
			return v
		end
	end
end

function REV_OverrideDefaultComponentProps(properties)
	local mergedProperties = {}

	local inventoryItemProperties = InventoryItemProperties.properties

	local bobbyProperties = BobbyRayShopItemProperties.properties

	local bobbyWeaponProperties = BobbyRayShopWeaponProperties.properties

	local zuluModProperties = ZuluModifiable.properties

	local scrapableProperties = ScrapableItem.properties

	local conditionProperties = ItemWithCondition.properties

	for _, prop in ipairs(properties) do
		local invProp = REV_TableFind(inventoryItemProperties, function(invProp)
			return invProp.id == prop.id
		end)

		if not invProp then
			invProp = REV_TableFind(conditionProperties, function(invProp)
				return invProp.id == prop.id
			end)
		end

		if not invProp then
			invProp = REV_TableFind(bobbyWeaponProperties, function(invProp)
				return invProp.id == prop.id
			end)
		end

		if not invProp then
			invProp = REV_TableFind(bobbyProperties, function(invProp)
				return invProp.id == prop.id
			end)
		end

		if not invProp then
			invProp = REV_TableFind(zuluModProperties, function(invProp)
				return invProp.id == prop.id
			end)
		end

		if not invProp then
			invProp = REV_TableFind(scrapableProperties, function(invProp)
				return invProp.id == prop.id
			end)
		end

		if invProp then
			local mergedProp = table.copy(invProp)

			for k, v2 in pairs(mergedProp) do
				mergedProp[k] = prop[k] == nil and v2 or prop[k]
			end

			table.insert(mergedProperties, mergedProp)
		else
			table.insert(mergedProperties, prop)
		end
	end

	return mergedProperties
end

function OnMsg.DataLoaded()
	PlaceObj('BobbyRayShopSubCategory', {
		Category = "Weapons",
		DisplayName = T(3722768203508160817, "Weapon Components"),
		SortKey = 100,
		group = "Weapons",
		id = "Components",
	})
end

DefineClass.BobbyRayShopComponentProperties = {
	__parents = { "BobbyRayShopItemProperties", },
	__generated_by_class = "ClassDef",

	properties = {
		{
			category = "BobbyRayShop",
			id = "CategoryPair",
			editor = "preset_id",
			default = "Components",
			no_edit = function(self) return not self.CanAppearInShop end,
			template = true,
			preset_class = "BobbyRayShopSubCategory",
			preset_group = "Weapons",
		},
	},
}

function BobbyRayShopComponentProperties:GetShopStats(stacks)
	return ""
end

UndefineClass("WeaponComponentItem")
DefineClass.WeaponComponentItem = {
	__parents = {
		"InventoryItem",
		"BobbyRayShopComponentProperties"
	},
	properties = REV_OverrideDefaultComponentProps({
		{
			id = "Group",
			default = 'WeaponComponent',
		},
		{
			id = "Repairable",
			default = false,
		},
		{
			id = "CanAppearInShop",
			default = true,
		},
		{
			id = "Tier",
			default = 2,
		},
		{
			id = "RestockWeight",
			default = 70,
		},
		{
			id = "Weight",
			default = 0,
		},
		{
			id = "CanBeConsumed",
			default = false,
		},
		{
			id = "CanAppearUsed",
			default = false,
		},
		{
			id = "CategoryPair",
			default = "Components",
		}
	})
}

function WeaponComponentItem:Init()
	REV_SetDefaultComponentValues(self.class)
end

function OnMsg.ClassesGenerate(classdefs)
	for name, class in pairs(classdefs) do
		if class.object_class == "WeaponComponentItem" then
			REV_SetDefaultComponentValues(name, class)
		end
	end
end

function REV_SetDefaultComponentValues(componentItemName, class)
	local component, componentIcon = REV_getComponentAndIconpath(componentItemName)

	if not component then
		return
	end

	local class = class or g_Classes[componentItemName]

	class.Weight = class.Weight and class.Weight ~= 0 and class.Weight or
	REV_Components_Config.slotDefaultWeights[component.Slot]

	class.Cost = class.Cost ~= 1000 and class.Cost or REV_calculateComponentPrice(component)

	class.ScrapParts = class.ScrapParts and class.ScrapParts ~= 0 and class.ScrapParts or
		MulDivRound(component.Cost, REV_Components_Config.scrapPartModifier, 500)

	class.DisplayName = class.DisplayName and class.DisplayName ~= "" and class.DisplayName or component.DisplayName

	class.Description = class.Description and class.Description ~= "" and class.Description or
		(GetWeaponComponentDescription(component) .. "\n\n" .. REV_getItemWeaponList(componentItemName))

	class.Icon = class.Icon and class.Icon ~= "" and class.Icon or componentIcon
end

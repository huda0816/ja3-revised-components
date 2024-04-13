local REV_OriginalScrapItem = ScrapItem


function ScrapItem(inventory, slot_name, item, amount, squadBag, squadId)

	if IsKindOf(item, "WeaponComponentItem") then
		REV_addScrapItems(item)
	end

	REV_OriginalScrapItem(inventory, slot_name, item, amount, squadBag, squadId)
end
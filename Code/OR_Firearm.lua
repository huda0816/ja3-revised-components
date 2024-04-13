local REV_OriginalGetSpecialScrapItems = FirearmBase.GetSpecialScrapItems

function FirearmBase:GetSpecialScrapItems()
	if self.components then
		REV_removeAllComponents(self, 'silent')
	end

	return REV_OriginalGetSpecialScrapItems(self)
end
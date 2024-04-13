return {
	PlaceObj('ModItemCode', {
		'name', "OR_Firearm",
		'CodeFileName', "Code/OR_Firearm.lua",
	}),
	PlaceObj('ModItemCode', {
		'name', "OR_Inventory",
		'CodeFileName', "Code/OR_Inventory.lua",
	}),
	PlaceObj('ModItemCode', {
		'name', "CODE_Components",
		'CodeFileName', "Code/CODE_Components.lua",
	}),
	PlaceObj('ModItemCode', {
		'name', "OR_ModifyWeaponDlg",
		'CodeFileName', "Code/OR_ModifyWeaponDlg.lua",
	}),
	PlaceObj('ModItemCode', {
		'name', "X_InventoryContextMenu",
		'CodeFileName', "Code/X_InventoryContextMenu.lua",
	}),
	PlaceObj('ModItemCode', {
		'name', "X_WeaponModChoicePopup",
		'CodeFileName', "Code/X_WeaponModChoicePopup.lua",
	}),
	PlaceObj('ModItemCode', {
		'name', "X_Utils",
		'CodeFileName', "Code/X_Utils.lua",
	}),
	PlaceObj('ModItemCode', {
		'name', "SETUP_Config",
		'CodeFileName', "Code/SETUP_Config.lua",
	}),
	PlaceObj('ModItemCode', {
		'name', "SETUP_WeaponComponentItemDef",
		'CodeFileName', "Code/SETUP_WeaponComponentItemDef.lua",
	}),
	PlaceObj('ModItemCode', {
		'name', "OR_InventoryUI",
		'CodeFileName', "Code/OR_InventoryUI.lua",
	}),
	PlaceObj('ModItemFolder', {
		'name', "Comp",
	}, {
		PlaceObj('ModItemCode', {
			'name', "COMP_REV_LBE",
			'CodeFileName', "Code/COMP_REV_LBE.lua",
		}),
		}),
	PlaceObj('ModItemFolder', {
		'name', "OilFilterExample",
	}, {
		PlaceObj('ModItemLootDef', {
			group = "MapContainers",
			id = "REV_OilFilterLoot",
			PlaceObj('LootEntryInventoryItem', {
				item = "REV_OilFilterSmall",
			}),
			PlaceObj('LootEntryInventoryItem', {
				item = "REV_OilFilterLarge",
			}),
		}),
		PlaceObj('ModItemLootDef', {
			Comment = "list",
			group = "MapContainers",
			id = "Container_JunkMoney",
			loot = "all",
			PlaceObj('LootEntryInventoryItem', {
				item = "Parts",
				stack_max = 30,
				stack_min = 15,
				weight = 300000,
			}),
			PlaceObj('LootEntryInventoryItem', {
				item = "MoneyBag",
				stack_max = 4,
				stack_min = 2,
				weight = 700000,
			}),
			PlaceObj('LootEntryLootDef', {
				loot_def = "REV_OilFilterLoot",
				weight = 500000,
			}),
		}),
		PlaceObj('ModItemLootDef', {
			Comment = "ernie container",
			group = "Ernie",
			id = "FlagHill_Beach_Gun",
			loot = "all",
			PlaceObj('LootEntryInventoryItem', {
				item = "_762NATO_Basic",
				stack_max = 5,
				stack_min = 5,
			}),
			PlaceObj('LootEntryInventoryItem', {
				item = "Parts",
				stack_max = 12,
				stack_min = 4,
			}),
			PlaceObj('LootEntryInventoryItem', {
				item = "REV_OilFilterSmall",
			}),
		}),
		PlaceObj('ModItemLootDef', {
			Comment = "ernie container",
			group = "MapContainers",
			id = "Outlook_Pile_Up",
			loot = "all",
			PlaceObj('LootEntryInventoryItem', {
				item = "Parts",
				stack_max = 11,
				stack_min = 11,
			}),
			PlaceObj('LootEntryInventoryItem', {
				item = "REV_OilFilterLarge",
			}),
		}),
		PlaceObj('ModItemLootDef', {
			Comment = "list",
			group = "MapContainers",
			id = "Container_Tools_Parts",
			loot = "all",
			PlaceObj('LootEntryLootDef', {
				loot_def = "Container_Tools_RandomTool",
			}),
			PlaceObj('LootEntryInventoryItem', {
				item = "Parts",
				stack_max = 40,
				stack_min = 15,
			}),
			PlaceObj('LootEntryLootDef', {
				loot_def = "REV_OilFilterLoot",
			}),
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Id', "REV_OilFilterSmall",
			'object_class', "Valuables",
			'ScrapParts', 2,
			'Repairable', false,
			'Icon', "UI/Icons/Upgrades/oil_filter_suppressor_small",
			'DisplayName', T(481237052515, --[[ModItemInventoryItemCompositeDef REV_OilFilterSmall DisplayName]] "Used Oil Filter small"),
			'DisplayNamePlural', "",
			'Description', T(771683323711, --[[ModItemInventoryItemCompositeDef REV_OilFilterSmall Description]] "A piece of junk"),
			'AdditionalHint', "",
			'Valuable', 1,
			'Cost', 10,
			'RestockWeight', 0,
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Id', "REV_OilFilterLarge",
			'object_class', "Valuables",
			'ScrapParts', 2,
			'Repairable', false,
			'Icon', "UI/Icons/Upgrades/oil_filter_suppressor_large",
			'DisplayName', T(899047496642, --[[ModItemInventoryItemCompositeDef REV_OilFilterLarge DisplayName]] "Used Oil Filter large"),
			'DisplayNamePlural', "",
			'Description', T(670380076585, --[[ModItemInventoryItemCompositeDef REV_OilFilterLarge Description]] "A piece of junk"),
			'AdditionalHint', "",
			'Valuable', 1,
			'Cost', 10,
			'RestockWeight', 0,
		}),
		PlaceObj('ModItemRecipeDef', {
			Ingredients = {
				PlaceObj('RecipeIngredient', {
					'item', "REV_OilFilterLarge",
				}),
				PlaceObj('RecipeIngredient', {
					'item', "Parts",
					'amount', 15,
				}),
			},
			MechanicalRoll = true,
			ResultItems = {
				PlaceObj('RecipeIngredient', {
					'item', "WCI_oil_filter_suppressor_large",
				}),
			},
			group = "Default",
			id = "WCI_OilFilterSuppressorLarge",
		}),
		PlaceObj('ModItemRecipeDef', {
			Ingredients = {
				PlaceObj('RecipeIngredient', {
					'item', "REV_OilFilterSmall",
				}),
				PlaceObj('RecipeIngredient', {
					'item', "Parts",
					'amount', 10,
				}),
			},
			MechanicalRoll = true,
			ResultItems = {
				PlaceObj('RecipeIngredient', {
					'item', "WCI_oil_filter_suppressor_small",
				}),
			},
			group = "Default",
			id = "WCI_OilFilterSuppressorSmall",
		}),
		}),
	PlaceObj('ModItemFolder', {
		'name', "Defaults unused",
	}, {
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_default_muzzle_backup",
			'object_class', "InventoryItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_default_stock_backup",
			'object_class', "InventoryItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_default_under_backup",
			'object_class', "InventoryItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_default_handguard_backup",
			'object_class', "InventoryItem",
		}),
		}),
	PlaceObj('ModItemFolder', {
		'name', "Handguard",
	}, {
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_mp5_grip",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_tactical_grip",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_ak47_vertical_grip",
			'object_class', "WeaponComponentItem",
			'Tier', 1,
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_AK47_default_handguard",
			'object_class', "WeaponComponentItem",
			'ScrapParts', 3,
			'CanAppearInShop', false,
		}),
		}),
	PlaceObj('ModItemFolder', {
		'name', "Side",
	}, {
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_side_laser",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_side_laserlight",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_side_light",
			'object_class', "WeaponComponentItem",
			'Tier', 1,
		}),
		}),
	PlaceObj('ModItemFolder', {
		'name', "Scope",
	}, {
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_custom_Steyr_AUG_scope",
			'object_class', "WeaponComponentItem",
			'CanAppearInShop', false,
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_scope_ACOG",
			'object_class', "WeaponComponentItem",
			'Tier', 3,
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_scope_thermal",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_g36_scope_01",
			'object_class', "WeaponComponentItem",
			'CanAppearInShop', false,
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_prism_scope",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_scope_reflex",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_sniper_scope_x10",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_g36_scope_02",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_scope_longrange",
			'object_class', "WeaponComponentItem",
			'Tier', 1,
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_custom_PSG1_scope",
			'object_class', "WeaponComponentItem",
			'CanAppearInShop', false,
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_custom_Dragunov_scope",
			'object_class', "WeaponComponentItem",
			'CanAppearInShop', false,
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_ironsights_hands",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_ironsights",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_compact_reflex_sight",
			'object_class', "WeaponComponentItem",
		}),
		}),
	PlaceObj('ModItemFolder', {
		'name', "Under",
	}, {
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_m16_grenade_launcher",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_grenade_launcher_WP",
			'object_class', "WeaponComponentItem",
		}),
		}),
	PlaceObj('ModItemFolder', {
		'name', "Muzzle",
	}, {
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_shotgun_suppressor",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_M82_suppressor",
			'object_class', "WeaponComponentItem",
			'Tier', 3,
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_AK_suppressor",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_762_suppressor",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_556_suppressor",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_9mm_SMG_suppressor",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_deserteagle_suppressor",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_beretta_silencer",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_AK_muzzle_booster",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_oil_filter_suppressor_large",
			'object_class', "WeaponComponentItem",
			'CanAppearInShop', false,
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_shotgun_full_choke",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_duckbill_choke",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_shotgun_compensator",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_auto5_duckbill",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_muzzle_fal_01",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_AK_compensator",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_MP5_compensator",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_booster_NATO",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_glock_compensator",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_oil_filter_suppressor_small",
			'object_class', "WeaponComponentItem",
			'CanAppearInShop', false,
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_m16_muzzle",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_muzzle_steyr_01",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_muzzle_steyr_02",
			'object_class', "WeaponComponentItem",
			'CanAppearInShop', false,
		}),
		}),
	PlaceObj('ModItemFolder', {
		'name', "Bipod",
	}, {
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_Harris_bipod",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_HK21_bipod",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_ak47_bipod",
			'object_class', "WeaponComponentItem",
			'Tier', 1,
		}),
		}),
	PlaceObj('ModItemFolder', {
		'name', "Stock",
	}, {
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_psg_stock_light",
			'object_class', "WeaponComponentItem",
			'CanAppearInShop', false,
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_fnminimi_stock_light_unused",
			'object_class', "InventoryItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_fnfal_stock_light",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_ar15_stock_light",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_dragunov_stock_light",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_m24_stock_light",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_galil_stock_heavy",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_ak47_stock_foldable",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_g36_stock_heavy",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_HK21_stock_heavy",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_fnfal_stock_heavy",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_dragunov_stock_heavy",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_MP5_stock_heavy",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_m24_stock_heavy",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_galil_stock_light",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_ak74_stock_wooden",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_MP5_stock_light",
			'object_class', "WeaponComponentItem",
		}),
		PlaceObj('ModItemInventoryItemCompositeDef', {
			'Group', "WeaponComponentItem",
			'Id', "WCI_bump_stock",
			'object_class', "WeaponComponentItem",
		}),
		}),
}
return PlaceObj('ModDef', {
	'title', "Revised Components",
	'description', 'This mod makes it possible to remove and add components to your weapon via drag and drop or the weapon modification screen. It is the third mod in the "new" Revised Series which is based on Ablomis\' great mods and modding ideas.\n\nThis mod is not a component mod as it does not touch the components itself. It is not intended to change the components or make them more realistic. It is all about adding, removing, and buying components.\n\nThe main reason behind this decision is that this guarantees that other mod authors can easily add their components or reworked vanilla components. I will describe the steps necessary below.\n\nThere are compromises (which can also be dealt with sub-mods):\n\nBarrels are still using the default modification mode. The main reason is that there were only two barrel icons.\nI did not add InventoryItems for magazines as I recommend using Revised Mags mod to manage magazines\nSome weapons share components that should not be compatible. The reason is that shared icons will lead to shared components. (If you want to change that all you have to do is change the icons of the component)\n\n[b]Important[/b]\n[list]\n[*]Restart the game after activating the mod\n[*]Custom components from other mods won\'t work unless the mod added them as described below\n[*]If you are a mod creator and want to increase compatibility, please contact me\n[*]Plays nicely with the other Revised mods but they are not needed\n[*]There was some playtesting but there can still be bugs.\n[*]If you find bugs, please send me your bug reports.\n[/list]\n\n[b]Info for mod authors:[b]\nTo make your components show up you have to create WeaponComponentItems. \nThe ID must follow this pattern: WCI_[IconName], IconName is the last part of the Icons path.\nThe good thing is that those WeaponComponentItems don\'t have to be configured as they are getting their information from the component itself (Name, Description, Icon). There is also an automatic price calculation for BobbyRays and other calculated properties.',
	'image', "Mod/rCD6ERe/Images/JA3Revised-components.png",
	'last_changes', "Fixed an error where a component could end up in a different sector",
	'id', "rCD6ERe",
	'author', "permanent666",
	'version_minor', 5,
	'version', 608,
	'lua_revision', 233360,
	'saved_with_revision', 350233,
	'code', {
		"Code/OR_Firearm.lua",
		"Code/OR_Inventory.lua",
		"Code/CODE_Components.lua",
		"Code/OR_ModifyWeaponDlg.lua",
		"Code/X_InventoryContextMenu.lua",
		"Code/X_WeaponModChoicePopup.lua",
		"Code/X_Utils.lua",
		"Code/SETUP_Config.lua",
		"Code/SETUP_WeaponComponentItemDef.lua",
		"Code/OR_InventoryUI.lua",
		"Code/COMP_REV_LBE.lua",
		"InventoryItem/REV_OilFilterSmall.lua",
		"InventoryItem/REV_OilFilterLarge.lua",
		"InventoryItem/WCI_default_muzzle_backup.lua",
		"InventoryItem/WCI_default_stock_backup.lua",
		"InventoryItem/WCI_default_under_backup.lua",
		"InventoryItem/WCI_default_handguard_backup.lua",
		"InventoryItem/WCI_mp5_grip.lua",
		"InventoryItem/WCI_tactical_grip.lua",
		"InventoryItem/WCI_ak47_vertical_grip.lua",
		"InventoryItem/WCI_AK47_default_handguard.lua",
		"InventoryItem/WCI_side_laser.lua",
		"InventoryItem/WCI_side_laserlight.lua",
		"InventoryItem/WCI_side_light.lua",
		"InventoryItem/WCI_custom_Steyr_AUG_scope.lua",
		"InventoryItem/WCI_scope_ACOG.lua",
		"InventoryItem/WCI_scope_thermal.lua",
		"InventoryItem/WCI_g36_scope_01.lua",
		"InventoryItem/WCI_prism_scope.lua",
		"InventoryItem/WCI_scope_reflex.lua",
		"InventoryItem/WCI_sniper_scope_x10.lua",
		"InventoryItem/WCI_g36_scope_02.lua",
		"InventoryItem/WCI_scope_longrange.lua",
		"InventoryItem/WCI_custom_PSG1_scope.lua",
		"InventoryItem/WCI_custom_Dragunov_scope.lua",
		"InventoryItem/WCI_ironsights_hands.lua",
		"InventoryItem/WCI_ironsights.lua",
		"InventoryItem/WCI_compact_reflex_sight.lua",
		"InventoryItem/WCI_m16_grenade_launcher.lua",
		"InventoryItem/WCI_grenade_launcher_WP.lua",
		"InventoryItem/WCI_shotgun_suppressor.lua",
		"InventoryItem/WCI_M82_suppressor.lua",
		"InventoryItem/WCI_AK_suppressor.lua",
		"InventoryItem/WCI_762_suppressor.lua",
		"InventoryItem/WCI_556_suppressor.lua",
		"InventoryItem/WCI_9mm_SMG_suppressor.lua",
		"InventoryItem/WCI_deserteagle_suppressor.lua",
		"InventoryItem/WCI_beretta_silencer.lua",
		"InventoryItem/WCI_AK_muzzle_booster.lua",
		"InventoryItem/WCI_oil_filter_suppressor_large.lua",
		"InventoryItem/WCI_shotgun_full_choke.lua",
		"InventoryItem/WCI_duckbill_choke.lua",
		"InventoryItem/WCI_shotgun_compensator.lua",
		"InventoryItem/WCI_auto5_duckbill.lua",
		"InventoryItem/WCI_muzzle_fal_01.lua",
		"InventoryItem/WCI_AK_compensator.lua",
		"InventoryItem/WCI_MP5_compensator.lua",
		"InventoryItem/WCI_booster_NATO.lua",
		"InventoryItem/WCI_glock_compensator.lua",
		"InventoryItem/WCI_oil_filter_suppressor_small.lua",
		"InventoryItem/WCI_m16_muzzle.lua",
		"InventoryItem/WCI_muzzle_steyr_01.lua",
		"InventoryItem/WCI_muzzle_steyr_02.lua",
		"InventoryItem/WCI_Harris_bipod.lua",
		"InventoryItem/WCI_HK21_bipod.lua",
		"InventoryItem/WCI_ak47_bipod.lua",
		"InventoryItem/WCI_psg_stock_light.lua",
		"InventoryItem/WCI_fnminimi_stock_light_unused.lua",
		"InventoryItem/WCI_fnfal_stock_light.lua",
		"InventoryItem/WCI_ar15_stock_light.lua",
		"InventoryItem/WCI_dragunov_stock_light.lua",
		"InventoryItem/WCI_m24_stock_light.lua",
		"InventoryItem/WCI_galil_stock_heavy.lua",
		"InventoryItem/WCI_ak47_stock_foldable.lua",
		"InventoryItem/WCI_g36_stock_heavy.lua",
		"InventoryItem/WCI_HK21_stock_heavy.lua",
		"InventoryItem/WCI_fnfal_stock_heavy.lua",
		"InventoryItem/WCI_dragunov_stock_heavy.lua",
		"InventoryItem/WCI_MP5_stock_heavy.lua",
		"InventoryItem/WCI_m24_stock_heavy.lua",
		"InventoryItem/WCI_galil_stock_light.lua",
		"InventoryItem/WCI_ak74_stock_wooden.lua",
		"InventoryItem/WCI_MP5_stock_light.lua",
		"InventoryItem/WCI_bump_stock.lua",
	},
	'default_options', {},
	'has_data', true,
	'saved', 1726601070,
	'code_hash', 3864558049930383608,
	'affected_resources', {
		PlaceObj('ModResourcePreset', {
			'Class', "LootDef",
			'Id', "REV_OilFilterLoot",
			'ClassDisplayName', "Loot definition",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "LootDef",
			'Id', "Container_JunkMoney",
			'ClassDisplayName', "Loot definition",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "LootDef",
			'Id', "FlagHill_Beach_Gun",
			'ClassDisplayName', "Loot definition",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "LootDef",
			'Id', "Outlook_Pile_Up",
			'ClassDisplayName', "Loot definition",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "LootDef",
			'Id', "Container_Tools_Parts",
			'ClassDisplayName', "Loot definition",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "REV_OilFilterSmall",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "REV_OilFilterLarge",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "RecipeDef",
			'Id', "WCI_OilFilterSuppressorLarge",
			'ClassDisplayName', "Combine recipe",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "RecipeDef",
			'Id', "WCI_OilFilterSuppressorSmall",
			'ClassDisplayName', "Combine recipe",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_default_muzzle_backup",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_default_stock_backup",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_default_under_backup",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_default_handguard_backup",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_mp5_grip",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_tactical_grip",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_ak47_vertical_grip",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_AK47_default_handguard",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_side_laser",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_side_laserlight",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_side_light",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_custom_Steyr_AUG_scope",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_scope_ACOG",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_scope_thermal",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_g36_scope_01",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_prism_scope",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_scope_reflex",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_sniper_scope_x10",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_g36_scope_02",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_scope_longrange",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_custom_PSG1_scope",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_custom_Dragunov_scope",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_ironsights_hands",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_ironsights",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_compact_reflex_sight",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_m16_grenade_launcher",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_grenade_launcher_WP",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_shotgun_suppressor",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_M82_suppressor",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_AK_suppressor",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_762_suppressor",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_556_suppressor",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_9mm_SMG_suppressor",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_deserteagle_suppressor",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_beretta_silencer",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_AK_muzzle_booster",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_oil_filter_suppressor_large",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_shotgun_full_choke",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_duckbill_choke",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_shotgun_compensator",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_auto5_duckbill",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_muzzle_fal_01",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_AK_compensator",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_MP5_compensator",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_booster_NATO",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_glock_compensator",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_oil_filter_suppressor_small",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_m16_muzzle",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_muzzle_steyr_01",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_muzzle_steyr_02",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_Harris_bipod",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_HK21_bipod",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_ak47_bipod",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_psg_stock_light",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_fnminimi_stock_light_unused",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_fnfal_stock_light",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_ar15_stock_light",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_dragunov_stock_light",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_m24_stock_light",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_galil_stock_heavy",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_ak47_stock_foldable",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_g36_stock_heavy",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_HK21_stock_heavy",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_fnfal_stock_heavy",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_dragunov_stock_heavy",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_MP5_stock_heavy",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_m24_stock_heavy",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_galil_stock_light",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_ak74_stock_wooden",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_MP5_stock_light",
			'ClassDisplayName', "Inventory item",
		}),
		PlaceObj('ModResourcePreset', {
			'Class', "InventoryItemCompositeDef",
			'Id', "WCI_bump_stock",
			'ClassDisplayName', "Inventory item",
		}),
	},
	'steam_id', "3195158109",
})
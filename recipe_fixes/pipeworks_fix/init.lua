minetest.register_craft( {
	output = "pipeworks:entry_panel_empty 2",
	recipe = {
		{ "", "default:steel_ingot", "" },
		{ "", "pipeworks:pipe_110000_empty", "" },
		{ "", "default:steel_ingot", "" },
	},
})

minetest.register_craft( {
	output = "pipeworks:valve_off_empty 2",
	recipe = {
		{ "", "default:stick", "" },
		{ "default:steel_ingot", "default:steel_ingot", "default:steel_ingot" },
		{ "", "default:steel_ingot", "" }
	},
})
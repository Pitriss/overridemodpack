minetest.register_craft({
	output = 'homedecor:air_conditioner',
	recipe = {
		{'default:glass', 'default:glass', 'default:glass'},
		{'homedecor:plastic_sheeting', 'default:coal_lump', 'homedecor:plastic_sheeting'},
		{'homedecor:plastic_sheeting', 'homedecor:plastic_sheeting', 'homedecor:plastic_sheeting'},
	}
})
minetest.register_craft( {
	type = "shapeless",
	output = "homedecor:shutter_light_blue 4",
	recipe = {
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"dye:blue",
		"dye:white",
	},
})
minetest.register_craft( {
	type = "shapeless",
	output = "homedecor:shutter_violet 4",
	recipe = {
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"homedecor:shutter_oak",
		"group:dye,excolor_violet",
	},
})

minetest.register_craft( {
	output = "homedecor:wood_table_small_round_b 15",
	recipe = {
		{ "", "default:wood", "" },
		{ "default:wood", "default:wood", "default:wood" },
		{ "", "default:wood", "" },
	},
})

minetest.register_craft( {
	output = "homedecor:wood_table_small_square_b 4",
	recipe = {
		{ "homedecor:wood_table_small_round","homedecor:wood_table_small_round" },
		{ "homedecor:wood_table_small_round","homedecor:wood_table_small_round" }
	}
})

minetest.register_craft( {
	output = "homedecor:wood_table_large_b 4",
	recipe = {
		{ "homedecor:wood_table_small_square", "homedecor:wood_table_small_square" },
		{ "homedecor:wood_table_small_square", "homedecor:wood_table_small_square" }
	}
})

minetest.register_craft( {
	output = "homedecor:glass_table_small_round_b 15",
	recipe = {
		{ "", "default:glass", "" },
		{ "default:glass", "default:glass", "default:glass" },
		{ "", "default:glass", "" },
	},
})

minetest.register_craft( {
	output = "homedecor:glass_table_small_square_b 4",
	recipe = {
		{"homedecor:glass_table_small_round", "homedecor:glass_table_small_round" },
		{"homedecor:glass_table_small_round", "homedecor:glass_table_small_round" }
	}
})

minetest.register_craft( {
	output = "homedecor:glass_table_large_b 4",
	recipe = {
		{ "homedecor:glass_table_small_square", "homedecor:glass_table_small_square" },
		{ "homedecor:glass_table_small_square", "homedecor:glass_table_small_square" }
	}
})
-- homedecor:utility_table_top zatim nema recept


minetest.register_craft( {
	output = "homedecor:brass_ingot 18",
	recipe = {
		{ "technic:brass_block", "technic:brass_block" },
	}
})


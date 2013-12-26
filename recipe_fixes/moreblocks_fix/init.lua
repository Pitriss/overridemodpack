minetest.register_craftitem(":moreblocks:jungle_stick", {
	description = ("Jungle Stick"),
	inventory_image = "moreblocks_junglestick.png",
	groups = {stick=1},
})

minetest.register_craft({
	output = "moreblocks:wood_tile 9",
	recipe = {
		{"default:wood", "default:wood", "default:wood"},
		{"default:wood", "default:wood", "default:wood"},
		{"default:wood", "default:wood", "default:wood"},
	}
})

minetest.register_craft({
	output = "moreblocks:wood_tile_flipped 1",
	recipe = {
		{"moreblocks:wood_tile"},
	}
})

minetest.register_craft({
	output = "moreblocks:wood_tile_center 9",
	recipe = {
		{"default:wood", "default:wood", "default:wood"},
		{"default:wood", "moreblocks:wood_tile", "default:wood"},
		{"default:wood", "default:wood", "default:wood"},
	}
})

minetest.register_craft({
	output = "moreblocks:wood_tile_full 4",
	recipe = {
		{"moreblocks:wood_tile", "moreblocks:wood_tile"},
		{"moreblocks:wood_tile", "moreblocks:wood_tile"},
	}
})

minetest.register_craft({
	output = "moreblocks:wood_tile_up 1",
	recipe = {
		{"default:stick"},
		{"moreblocks:wood_tile_center"},
	}
})

minetest.register_craft({
	output = "moreblocks:wood_tile_down 1",
	recipe = {
		{"moreblocks:wood_tile_center"},
		{"default:stick"},
	}
})

minetest.register_craft({
	output = "moreblocks:wood_tile_left 1",
	recipe = {
		{"default:stick", "moreblocks:wood_tile_center"},
	}
})

minetest.register_craft({
	output = "moreblocks:wood_tile_right 1",
	recipe = {
		{"moreblocks:wood_tile_center", "default:stick"},
	}
})
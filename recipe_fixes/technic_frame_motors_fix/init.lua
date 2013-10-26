minetest.register_craft({
	output = 'technic:frame_111111',
	recipe = {
		{'default:stick', '', 'default:stick'},
		{'', 'default:wood', ''},
		{'default:stick', '', 'default:stick'},
	}
})
minetest.register_craft({
	output = 'technic:frame_motor',
	recipe = {
		{'default:steel_ingot', 'mesecons:wire_00000000_off', 'default:steel_ingot'},
		{'mesecons:wire_00000000_off', 'technic:motor', 'mesecons:wire_00000000_off'},
		{'default:steel_ingot', 'mesecons:wire_00000000_off', 'default:steel_ingot'},
	}
})

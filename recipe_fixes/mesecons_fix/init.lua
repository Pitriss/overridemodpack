minetest.register_craft({
	output = 'mesecons_microcontroller:microcontroller0000 2',
	recipe = {
		{'mesecons:wire_00000000_off', 'mesecons_materials:silicon', 'mesecons_materials:silicon'},
		{'mesecons:wire_00000000_off', 'mesecons_materials:silicon', 'mesecons_materials:silicon'},
		{'', 'mesecons:wire_00000000_off', 'mesecons:wire_00000000_off'},
	}
})
minetest.register_craft({
	output = 'mesecons_microcontroller:microcontroller0000 2',
	recipe = {
		{'group:mesecon_conductor_craftable', 'mesecons_materials:silicon', 'mesecons_materials:silicon'},
		{'group:mesecon_conductor_craftable', 'mesecons_materials:silicon', 'mesecons_materials:silicon'},
		{'', 'group:mesecon_conductor_craftable', 'group:mesecon_conductor_craftable'},
	}
})

minetest.register_craft({
	output = "mesecons_luacontroller:luacontroller0000 2",
	recipe = {
		{'mesecons_materials:silicon', 'mesecons_materials:silicon', 'mesecons:wire_00000000_off'},
		{'mesecons_materials:silicon', 'mesecons_materials:silicon', 'mesecons:wire_00000000_off'},
		{'mesecons:wire_00000000_off', 'mesecons:wire_00000000_off', ''},
	}
})
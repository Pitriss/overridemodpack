
minetest.register_craft({
	output = 'mesecons_microcontroller:microcontroller0000 2',
	recipe = {
		{'group:mesecon_conductor_craftable', 'mesecons_materials:silicon', 'mesecons_materials:silicon'},
		{'group:mesecon_conductor_craftable', 'mesecons_materials:silicon', 'mesecons_materials:silicon'},
		{'', 'group:mesecon_conductor_craftable', 'group:mesecon_conductor_craftable'},
	}
})

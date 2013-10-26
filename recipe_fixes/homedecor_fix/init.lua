minetest.register_craft({
	output = 'homedecor:air_conditioner',
	recipe = {
		{'default:glass', 'default:glass', 'default:glass'},
		{'homedecor:plastic_sheeting', 'default:coal_lump', 'homedecor:plastic_sheeting'},
		{'homedecor:plastic_sheeting', 'homedecor:plastic_sheeting', 'homedecor:plastic_sheeting'},
	}
})

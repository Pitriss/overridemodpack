for i, berry in ipairs(bushes_classic.bushes) do
	local desc = bushes_classic.bushes_descriptions[i]
	minetest.register_craft({
		output = 'bushes:'..berry..'_bush',
		recipe = {
			{'bushes:'..berry, 'bushes:'..berry, 'bushes:'..berry},
			{'bushes:'..berry, 'bushes:'..berry, 'bushes:'..berry},
			{'', '', ''},
		}
	})
end
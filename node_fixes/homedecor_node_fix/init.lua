-- Boilerplate to support localized strings if intllib mod is installed.
local S
if homedecor.intllib_modpath then
    dofile(homedecor.intllib_modpath.."/intllib.lua")
    S = intllib.Getter(minetest.get_current_modname())
else
    S = function ( s ) return s end
end

minetest.register_node(":homedecor:table_legs_wrought_iron", {
	description = S("Wrought Iron Table Legs"),
	drawtype = "plantlike",
	tiles = {"homedecor_table_legs_wrought_iron.png"},
	inventory_image = "homedecor_table_legs_wrought_iron.png",
	wield_image = "homedecor_table_legs_wrought_iron.png",
	paramtype = "light",
	walkable = false,
	groups = {snappy=3},
	sounds = default.node_sound_leaves_defaults(),
	walkable = true,
	selection_box = {
	type = "fixed",
	fixed = { -0.37, -0.5, -0.37, 0.37, 0.5, 0.37 }
	},
})
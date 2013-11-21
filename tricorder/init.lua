-- init.lua
-- tricorder minetest mod, by darkrose
-- Copyright (C) Lisa Milne 2012 <lisa@ltmnet.com>
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 2 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-- See the GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>

local searches = {
	{name="coal",node="default:stone_with_coal"},
	{name="iron",node="default:stone_with_iron"},
	{name="mese",node="default:mese"},
	{name="lava",node="default:lava_source"},
	{name="gold",node="moreores:mineral_gold"},
	{name="silver",node="moreores:mineral_silver"},
	{name="copper",node="moreores:mineral_copper"},
	{name="tin",node="moreores:mineral_tin"},
	{name="mithril",node="moreores:mineral_mithril"},
	{name="uranium",node="technic:mineral_uranium"},
	{name="zinc",node="technic:mineral_zinc"},
	{name="chromium",node="technic:mineral_chromium"},
	{name="mese",node="default:stone_with_mese"},
	{name="diamond",node="default:stone_with_diamond"}
}


minetest.register_node("tricorder:tricorder", {
	description = "Tricorder",
	drawtype = "nodebox",
	tiles = {"tricorder_tricorder.png","tricorder_tricorder.png","tricorder_tricorder_front.png","tricorder_tricorder.png"},
	paramtype = "light",
	liquids_pointable = true,
	groups = {snappy=1,bendy=2,cracky=1,melty=2},
	node_box = {
		type = "fixed",
		fixed = {
			-- x,y,z,x,y,z
			{0, -0.2, -0.2, 0.1, 0.5, 0.2},
			{0.1, -0.4, -0.2, 0.2, -0.1, 0.2},
			{0.1, 0.2, -0.2, 0.2, 0.5, 0.2},
		},
	},
	on_use = function(itemstack, user, pointed_thing)
		local name = user:get_player_name()
		local node
		local pos
		local ppos
		local found = false

		if pointed_thing.type == 'node' then
			node = minetest.get_node(pointed_thing.above)
			if node.name == "air" then
				node = minetest.get_node(pointed_thing.under)
				pos = pointed_thing.under
			else
				pos = pointed_thing.above
			end
			ppos = pos
			minetest.chat_send_player(name, 'Tricorder: pointing at '..node.name..' '..minetest.pos_to_string(pos))
			local current_light = minetest.get_node_light(pos)
			if current_light ~= nil and current_light > 0 then
				minetest.chat_send_player(name, 'Tricorder: Light level is '..current_light)
			end
		elseif pointed_thing.type == 'object' then
			pos = pointed_thing.ref:getpos()
			ppos = pos
			if pointed_thing.ref:is_player() then
				local pname = pointed_thing.ref:get_player_name()
				local pbreath = pointed_thing.ref:get_breath()
				local phealth = pointed_thing.ref:get_hp()
				local oxylvl = ""
				if pbreath > 10 then
					oxylvl = "normal breathing"
				else
					oxylvl = pbreath.."/10 bubbles remaining"
				end
-- 				minetest.chat_send_player(name, 'Tricorder: pointing at player '..pname..' at '..minetest.pos_to_string(pos))
				minetest.chat_send_player(name, 'Tricorder: pointing at player '..pname..' at ( '..tostring(math.floor(pos.x))..','..tostring(math.floor(pos.y))..','..tostring(math.floor(pos.x))..')')
				minetest.chat_send_player(name, 'Tricorder: '..pname..'\'s health status is '..tostring(phealth)..'/20')
				minetest.chat_send_player(name, 'Tricorder: '..pname..'\'s oxygen status is '..oxylvl)
				return
			else
				minetest.chat_send_player(name, 'Tricorder: pointing at Object '..minetest.pos_to_string(pos))
			end
		else
			pos = user:getpos()
			ppos = {x = math.floor(pos.x),y = math.floor(pos.y),z = math.floor(pos.z)}
			minetest.chat_send_player(name, 'Tricorder: pointing at Air from '..minetest.pos_to_string(ppos))
			local current_light = minetest.get_node_light(pos)
			minetest.chat_send_player(name, 'Tricorder: Light level is '..current_light)
		end
		local ores_found = {}
		for i,n in ipairs(searches) do
			pos = minetest.find_node_near(ppos,16,n.node)
			if pos then
				table.insert(ores_found, n.name)
				found = true
			end
		end
		local ores_found_string
		if not found then
			minetest.chat_send_player(name, 'Tricorder: no resources found')
		else
			if #ores_found > 1 then
				for key,value in pairs(ores_found) do
					if ores_found_string == nil then
						ores_found_string = value
					else
						ores_found_string = ores_found_string..value
					end
					if tonumber(key) < #ores_found then
						ores_found_string = ores_found_string..", "
					end
				end
			else
				ores_found_string = ores_found[1]
			end
			minetest.chat_send_player(name, 'Tricorder: following resources were found in 16 nodes range: '..ores_found_string)
		end
		return nil
	end
})

minetest.register_craft({
	output = "tricorder:tricorder",
	recipe = {
		{"technic:copper_coil","technic:hv_cable","technic:copper_coil"},
		{"technic:carbon_cloth","technic:hv_transformer","technic:carbon_cloth"},
		{"technic:solar_panel","technic:control_logic_unit","technic:battery"},
	}
})


local function overwrite(name)
	local table = minetest.registered_nodes[name]
	local table2 = {}
	for i,v in pairs(table) do
		table2[i] = v
	end
	table2.stack_max = 299
	minetest.register_node(":"..name, table2)
end

overwrite("default:cobble")
overwrite("default:dirt")
overwrite("default:gravel")

if minetest.setting_get("log_mods") then
	minetest.log("action", "stacks override loaded")
end
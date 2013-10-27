local max_players = minetest.setting_get("max_users")
munin_enabled = false
if minetest.setting_getbool("munin.enabled") ~= nil then
	munin_enabled = minetest.setting_getbool("munin.enabled")
end

local last_time = os.time() + 30

function munin_write(status, path)
	local file_desc = io.open(path, "w")
	file_desc:write(status.."\n")
	file_desc:close()
end

if munin_enabled then
	minetest.register_globalstep(function(dtime)
		if os.time() >= last_time then
			last_time = os.time() + 30
			if max_players == nil then
				local max_players = 100
			end
			local players = minetest.get_connected_players()
			local player_count = table.getn(players)
			local status = minetest.get_server_status()
			local status_splitted = {}
			for k, v in string.gmatch(status, "([_%w]+)=([%w%.]+)") do
				status_splitted[k] = v
			end
			local uptime = status_splitted.uptime
			local max_lag = status_splitted.max_lag
	-- 		print ("Server info:\nPlayer_cap: "..max_players.."\nPlayers_connected: "..player_count.."\nStatus line: "..status)
	-- 		minetest.chat_send_all("Server info:\nPlayer_cap: "..max_players.."\nPlayers_connected: "..player_count.."\nUptime: "..uptime.."\nMax_Lag: "..max_lag)

			local status_to_write = max_players.."\n"..player_count.."\n"..max_lag.."\n"..uptime
			local fpath = minetest.get_worldpath().."/munin.txt"

			munin_write(status_to_write, fpath)
		end
	end)
end

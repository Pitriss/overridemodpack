--[[

Minetest chat mod adding configurable forced timestamps
and possible chatlogging with configurable path and mothly
log rotating

Based on fairiestoy timestamp code and chatlog mod

Thanks to fairiestoy

Licence: WTFPL

]]

-- Default timestamp format in chat
local format_string = '(%T)'

-- Default settings for chat logging
local chatlog = false
local chatlog_name = "chatlog.txt"
local chatlog_path = minetest.get_worldpath()
local chatlog_autorotate = false

local folder_delim = "/"
if os.getenv("WINDIR") ~= nil then
	local folder_delim = "\\"
end
chatlog_path = chatlog_path..folder_delim

minetest.log("[Chatmod] loaded")

if minetest.setting_get('chatmod.time_format') ~= nil then
	format_string = minetest.setting_get('chatmod.time_format')
	format_string = string.sub(format_string, 2) -- remove leading "
	format_string = string.sub(format_string, 1, -2) -- remove trailing "
end

if minetest.setting_getbool('chatmod.chatlog_enabled') ~= nil then
	chatlog = minetest.setting_getbool('chatmod.chatlog_enabled')
end

if minetest.setting_get('chatmod.chatlog_path') ~= nil then
	chatlog_path = minetest.setting_get('chatmod.chatlog_path')
	chatlog_path = string.sub(chatlog_path, 2) -- remove leading "
	chatlog_path = string.sub(chatlog_path, 1, -2) -- remove trailing "
	if string.sub(chatlog_path, -1) ~= folder_delim then
		chatlog_path = chatlog_path..folder_delim
	end
end

if minetest.setting_getbool('chatmod.chatlog_autorotate') ~= nil then
	chatlog_autorotate = minetest.setting_getbool('chatmod.chatlog_autorotate')
end

function chatlog_write(time, name, message, path)
	local file_desc = io.open(path, "a")
	file_desc:write(time.." ["..name.."]: "..message.."\n")
	file_desc:close()
end

minetest.register_on_chat_message( function( name, message )
	local raw_time = os.time()
	local formatted_time = os.date(format_string, raw_time)

	if chatlog_autorotate and chatlog then
		chatlog_name = os.date('%Y-%m-', raw_time)..chatlog_name
		local full_chatlog_path = chatlog_path..chatlog_name
		chatlog_write(raw_time, name, message, full_chatlog_path)
	elseif chatlog then
		local full_chatlog_path = chatlog_path..chatlog_name
		chatlog_write(raw_time, name, message, full_chatlog_path)
	end

	-- minetest.chat_send_all( '<'..name..'> '..format_message( message ), false )
	for _, player in pairs( minetest.get_connected_players() ) do
		if name ~= player:get_player_name() then
			local final_msg =  formatted_time..' <'..name..'> '..message
			minetest.chat_send_player(player:get_player_name(), final_msg, false)
		end
	end
	return true
end )



#!/usr/bin/ruby

##################################
# MT monitoring plugin for munin #
# Author: Pitriss & Ritchie      #
# Licence: WTFPL                 #
##################################

# Some config
datafile = ""
worldname = ""
# graph uptime of minetestserver? Multigraph feature will be used. http://munin-monitoring.org/wiki/MultigraphSampleOutput
uptime = "no"

# maximum value of maxlag. It prevents to make your graph unreadable when some huge peak appears.
maxlag_maximum = 100

# Maximal possible delay between value in munin.txt and server time in seconds
# Formula is: servertime - (MTserverstartuptime + MTserveruptime)
# MTserver should log every 30s
max_delay = 60

# colors
color1 = "6DFF90"
color2 = "FF0000"
color3 = "0066B3"
color4 = "00CC00"

# Not needed to change anything below this comment
if  ARGV[0] == "config"
	if uptime == "yes"
		puts "multigraph minetest_players"
	end
	puts "graph_title Minetest server - #{worldname}"
	puts "graph_category minetest"
	puts "graph_info this graph shows information provided by munin mod"
	puts "graph_args --base 1000 -l 0"
	puts "graph_vlabel Players | Lag"
	puts "PlayerCap.label Player cap"
	puts "PlayerCap.draw AREA"
	puts "PlayerCap.colour #{color1}"
	puts "PlayersConnected.label Connected players"
	puts "PlayersConnected.draw AREA"
	puts "PlayersConnected.colour #{color2}"
	puts "MaxLag.label Maximal lag"
	puts "MaxLag.draw LINE"
	puts "MaxLag.colour #{color3}"
	if uptime == "yes"
		puts "multigraph minetest_uptime"
		puts "graph_title Minetest server - #{worldname}"
		puts "graph_category minetest"
		puts "graph_info this graph shows information provided by munin mod"
		puts "graph_args --base 1000 -l 0"
		puts "graph_vlabel Uptime in days"
		puts "Uptime.label Uptime"
		puts "Uptime.draw AREA"
		puts "Uptime.colour #{color4}"
	end
elsif ARGV[0] == "debug"
	begin
		content = IO.readlines(datafile)
		offset = Time.now.to_i-content[4].to_i
		puts "Max delay is now: #{offset} second(s)"
	rescue Errno::ENOENT
		puts "ERROR: Misconfigured path to munin.txt or munin.txt doesn't exist."
	rescue
		puts "ERROR: Unknown error"
	end
else
	content = IO.readlines(datafile)
	offset = Time.now.to_i-content[4].to_i
	if offset > max_delay
		if uptime == "yes"
			puts "multigraph minetest_players"
		end
		puts "PlayerCap.value 0"
		puts "PlayersConnected.value 0"
		puts "MaxLag.value 0"
		if uptime == "yes"
			puts "multigraph minetest_uptime"
			puts "Uptime.value 0"
		end
	else
		if uptime == "yes"
			puts "multigraph minetest_players"
		end
		puts "PlayerCap.value #{content[0]}"
		puts "PlayersConnected.value #{content[1]}"
		if content[2].to_f > maxlag_maximum then
			maxlag_value = maxlag_maximum.to_s
		else
			maxlag_value = content[2].to_s
		end
		puts "MaxLag.value #{maxlag_value}"
		if uptime == "yes"
			uptime_mt = content[3].to_f
			uptime_mt_day = uptime_mt / 86400
			puts "multigraph minetest_uptime"
			puts "Uptime.value #{uptime_mt_day}"
		end
	end
end

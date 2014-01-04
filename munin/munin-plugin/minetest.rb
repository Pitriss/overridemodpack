#!/usr/bin/ruby

##################################
# MT monitoring plugin for munin #
# Author: Pitriss & Ritchie      #
# Licence: WTFPL                 #
##################################

# Some config
datafile = "/path/to/munin.txt"
worldname = "name of game"


# Maximal possible delay between value in munin.txt and server time in seconds
# Formula is: servertime - (MTserverstartuptime + MTserveruptime)
# MTserver should logging every 30s
max_delay = 60

# colors
color1 = "6DFF90"
color2 = "FF0000"
color3 = "0066B3"

# Not needed to change anything below this comment
if  ARGV[0] == "config"
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
		puts "PlayerCap.value 0"
		puts "PlayersConnected.value 0"
		puts "MaxLag.value 0"
	else
		puts "PlayerCap.value #{content[0]}"
		puts "PlayersConnected.value #{content[1]}"
		puts "MaxLag.value #{content[2]}"
	end
end

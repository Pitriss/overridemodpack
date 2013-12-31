#!/usr/bin/ruby

#Some config

datafile = "/path/to/munin.txt"
worldname = "name of game"

#colors

color1 = "6DFF90"
color2 = "FF0000"
color3 = "0066B3"

#Not needed to change anything below this comment

if  ARGV[0] == "config"
	puts "graph_title Minetest server - #{worldname}"
	puts "graph_category minetest"
	puts "graph_info this graph shows information provided by munin mod"
	puts 'graph_args --base 1000 -l 0 '
	puts "PlayerCap.label Player cap"
	puts "PlayerCap.draw AREA"
	puts "PlayerCap.colour #{color1}"
	puts "PlayersConnected.label Connected players"
	puts "PlayersConnected.draw AREA"
	puts "PlayersConnected.colour #{color2}"
	puts "MaxLag.label Maximal lag"
	puts "MaxLag.draw LINE"
	puts "MaxLag.colour #{color3}"
else
	content = IO.readlines(datafile)
	offset = Time.now.to_i-(content[4].to_i+content[3].to_i)
	if offset > 50
		puts "PlayerCap.value 0"
		puts "PlayersConnected.value 0"
		puts "MaxLag.value 0"
	else
		puts "PlayerCap.value #{content[0]}"
		puts "PlayersConnected.value #{content[1]}"
		puts "MaxLag.value #{content[2]}"
	end
end

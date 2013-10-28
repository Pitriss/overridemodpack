#!/bin/bash

# Path to munin.txt
WORLDFILE="/opt/minetest/world/classic_technic_game/munin.txt"
# Name of world displayed in graph title
WORLDNAME="classic_technic_game"

if [ "$1" = "config" ] ; then

	echo "graph_title Minetest server - $WORLDNAME"
	echo "graph_category minetest"
	echo "graph_info this graph shows information provided by munin mod"
	echo 'graph_args --base 1000 -l 0 '
	echo "PlayerCap.label Player cap"
	echo "PlayerCap.draw AREA"
	echo "PlayerCap.color 6DFF90"
	echo "PlayersConnected.label Connected players"
	echo "PlayersConnected.draw AREA"
	echo "PlayersConnected.color FF0000"
	echo "MaxLag.label Maximal lag"
	echo "MaxLag.draw LINE"
	echo "MaxLag.color 0066B3"

## Uptime is commented out, because high
## numbers will break whole graph

# 	echo "Uptime.label Uptime"
# 	echo "Uptime.draw LINE"
else
	COUNT=0
	while read LINE; do
		case $COUNT in
			0)
				echo "PlayerCap.value $LINE"
				COUNT=$((COUNT+1))
			;;
			1)
				echo "PlayersConnected.value $LINE"
				COUNT=$((COUNT+1))
			;;
			2)

				echo "MaxLag.value $LINE"
				COUNT=$((COUNT+1))
			;;
			3)

## Uptime is commented out, because high
## numbers will break whole graph

# 				echo "Uptime.value $LINE"
				COUNT=$((COUNT+1))
			;;
		esac
	done <$WORLDFILE
fi

#!/bin/bash

# Path to munin.txt
WORLDFILE=""
# Name of world displayed in graph title
WORLDNAME=""

if [ "$1" = "config" ] ; then

	echo "graph_title Minetest server - $WORLDNAME"
	echo "graph_category minetest"
	echo "graph_info this graph shows information provided by munin mod"
	echo 'graph_args --base 1000 -l 0 '

else
	COUNT=0
	while read LINE; do
		case $COUNT in
			0)
				echo "PlayerCap.label Player cap"
				echo "PlayerCap.value $LINE"
				echo "PlayerCap.draw STACK"
				COUNT=$((COUNT+1))
			;;
			1)
				echo "PlayersConnected.label Connected players"
				echo "PlayersConnected.value $LINE"
				echo "PlayersConnected.draw STACK"
				COUNT=$((COUNT+1))
			;;
			2)
				echo "MaxLag.label Maximal lag"
				echo "MaxLag.value $LINE"
				echo "MaxLag.draw LINE"
				COUNT=$((COUNT+1))
			;;
			3)
# 				echo "Uptime.label Uptime"
# 				echo "Uptime.value $LINE"
# 				echo "Uptime.draw LINE"
				COUNT=$((COUNT+1))
			;;
		esac
	done <$WORLDFILE
fi

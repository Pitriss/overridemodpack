Munin mod

This mod provide player cap, number of connected players, current max_lag and uptime into munin.txt file once per 30 secpnds.

To enable this add:

munin.enabled = true

into your minetest.conf file

Directory munin-plugin contains bash and ruby version of plugin for munin monitoring.

Ruby one is more advanced as it can detect crashed minetest and put zero values into graph.

Licence: WTFPL


Structure of munin.txt

player cap
connected players
max_lag
uptime
generation unixtimestamp

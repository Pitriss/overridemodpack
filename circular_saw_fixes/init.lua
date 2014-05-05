-- These blocks can be processed by circular saw and was not added

for i,v in ipairs({"moreblocks:wood_tile_center", "moreblocks:wood_tile", "moreblocks:plankstone",}) do
	table.insert(circular_saw.known_stairs, v);
end
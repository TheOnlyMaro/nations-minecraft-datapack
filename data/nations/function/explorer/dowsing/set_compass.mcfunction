# nations:explorer/dowsing/set_compass
# Replaces compass in offhand with one pointing to found storage
# Uses data storage to get coordinates and pass to macro

# Prepare macro data with target coordinates
data modify storage nations:dowsing macro_data set value {tx:0,ty:0,tz:0}
execute store result storage nations:dowsing macro_data.tx int 1 run data get storage nations:dowsing target_x
execute store result storage nations:dowsing macro_data.ty int 1 run data get storage nations:dowsing target_y
execute store result storage nations:dowsing macro_data.tz int 1 run data get storage nations:dowsing target_z

# Call macro function with the coordinate data
function nations:explorer/dowsing/set_compass_macro with storage nations:dowsing macro_data

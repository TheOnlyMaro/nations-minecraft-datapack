# nations:explorer/home_warp_extract_data
# Inputs: $(uuid0)... used to find the player's data
# This function extracts Pos/Dim from nations:data to nations:temp for the final jump
# (Force re-index)

# 1. Check if Home exists checks
$execute unless data storage nations:data players.$(uuid0)_$(uuid1)_$(uuid2)_$(uuid3).home run title @s actionbar {"text":"No home set! Use /trigger set_home","color":"red"}
$execute unless data storage nations:data players.$(uuid0)_$(uuid1)_$(uuid2)_$(uuid3).home run return 0

# 2. Extract Data to Macro Args
$data modify storage nations:temp macro_args.pos_x set from storage nations:data players.$(uuid0)_$(uuid1)_$(uuid2)_$(uuid3).home.Pos[0]
$data modify storage nations:temp macro_args.pos_y set from storage nations:data players.$(uuid0)_$(uuid1)_$(uuid2)_$(uuid3).home.Pos[1]
$data modify storage nations:temp macro_args.pos_z set from storage nations:data players.$(uuid0)_$(uuid1)_$(uuid2)_$(uuid3).home.Pos[2]
$data modify storage nations:temp macro_args.dimension set from storage nations:data players.$(uuid0)_$(uuid1)_$(uuid2)_$(uuid3).home.Dimension

# 3. Call Final Teleport
function nations:explorer/home_warp_macro with storage nations:temp macro_args

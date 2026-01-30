# nations:explorer/home_warp_macro
# Inputs: $(dimension), $(pos_x), $(pos_y), $(pos_z)

$execute in $(dimension) run tp @s $(pos_x) $(pos_y) $(pos_z)
title @s actionbar {"text":"Warped Home!","color":"green"}
playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 1 1

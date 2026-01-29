# nations:nerf/break_anvil
# Destroys the anvil via raycast from player's eyes

# DEBUG
tellraw @s {"text":"[DEBUG] break_anvil called - starting raycast...","color":"light_purple"}

scoreboard players set #raycast_temp nations_temp 0
scoreboard players set #anvil_found nations_temp 0
execute anchored eyes positioned ^ ^ ^0.5 run function nations:nerf/raycast_anvil

tellraw @s {"text":"[DEBUG] break_anvil finished","color":"light_purple"}

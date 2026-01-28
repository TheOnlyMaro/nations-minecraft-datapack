# nations:enchanter/scan_lectern
# Scans 10x10x10 volume centered on player
# We restart at player position (run from blood_sacrifice at ~ ~ ~)

# Debug
tellraw @s {"text":"[DEBUG] Scanning for Lectern in 10x10 area...","color":"gray"}

# We iterate Y from -5 to 5.
# For each Y, we check 4 quadrants of 5x5 (scan_lectern_layer covers 0..4, 0..4)

# Y = -5
execute positioned ~ ~-5 ~ run function nations:enchanter/scan_layer_quadrants
# Y = -4
execute positioned ~ ~-4 ~ run function nations:enchanter/scan_layer_quadrants
# Y = -3
execute positioned ~ ~-3 ~ run function nations:enchanter/scan_layer_quadrants
# Y = -2
execute positioned ~ ~-2 ~ run function nations:enchanter/scan_layer_quadrants
# Y = -1
execute positioned ~ ~-1 ~ run function nations:enchanter/scan_layer_quadrants
# Y = 0
execute positioned ~ ~ ~ run function nations:enchanter/scan_layer_quadrants
# Y = 1
execute positioned ~ ~1 ~ run function nations:enchanter/scan_layer_quadrants
# Y = 2
execute positioned ~ ~2 ~ run function nations:enchanter/scan_layer_quadrants
# Y = 3
execute positioned ~ ~3 ~ run function nations:enchanter/scan_layer_quadrants
# Y = 4
execute positioned ~ ~4 ~ run function nations:enchanter/scan_layer_quadrants
# Y = 5
execute positioned ~ ~5 ~ run function nations:enchanter/scan_layer_quadrants
 
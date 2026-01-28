# nations:enchanter/scan_layer_quadrants
# Runs scan_lectern_layer (5x5 positive) in 4 quadrants relative to current position

# Quadrant 1: [+0, +4] [+0, +4]
execute positioned ~ ~ ~ run function nations:enchanter/scan_lectern_layer

# Quadrant 2: [-5, -1] [+0, +4]
execute positioned ~-5 ~ ~ run function nations:enchanter/scan_lectern_layer

# Quadrant 3: [+0, +4] [-5, -1]
execute positioned ~ ~ ~-5 run function nations:enchanter/scan_lectern_layer

# Quadrant 4: [-5, -1] [-5, -1]
execute positioned ~-5 ~ ~-5 run function nations:enchanter/scan_lectern_layer

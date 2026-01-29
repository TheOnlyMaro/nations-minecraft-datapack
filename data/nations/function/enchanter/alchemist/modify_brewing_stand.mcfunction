# nations:enchanter/modify_brewing_stand
# Modifies the brewing stand at the current position
# - Check Cap (<40)
# - Consumes Items
# - Adds Fuel (20)

# 1. Fuel Logic
# Ensure tag exists
execute unless data block ~ ~ ~ Fuel run data merge block ~ ~ ~ {Fuel:0b}

# Get Current Fuel
scoreboard players set #current_fuel nations_temp 0
execute store result score #current_fuel nations_temp run data get block ~ ~ ~ Fuel

# Check Cap: If >= 20, Abort.
execute if score #current_fuel nations_temp matches 20.. run title @s actionbar {"text":"The Brewing Stand is already full of energy.","color":"yellow"}
execute if score #current_fuel nations_temp matches 20.. run return 1

# Calculate New Fuel (Current + 10)
scoreboard players add #current_fuel nations_temp 10

# Apply Fuel
execute store result block ~ ~ ~ Fuel byte 1 run scoreboard players get #current_fuel nations_temp

# 2. Consume Items (Mainhand & Offhand)
item modify entity @s weapon.mainhand nations:consume_one
item modify entity @s weapon.offhand nations:consume_one

# 3. Success Effects
playsound item.firecharge.use player @s
particle flame ~ ~1 ~ 0.5 0.5 0.5 0.05 10
title @s actionbar {"text":"You infuse the Brewing Stand with alchemical power!","color":"gold"}

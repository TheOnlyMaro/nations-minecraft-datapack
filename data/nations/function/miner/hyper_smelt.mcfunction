# nations:miner/hyper_smelt
# Called every 5 ticks on each miner_furnace marker
# Increments cooking_time_spent by 5 for 2x speed
# Includes safety checks to prevent infinite loop

# Check if furnace still exists at marker position, if not kill marker
execute unless block ~ ~ ~ minecraft:furnace unless block ~ ~ ~ minecraft:blast_furnace unless block ~ ~ ~ minecraft:smoker run return run kill @s

# Get current cooking values
execute store result score #cook_time nations_temp run data get block ~ ~ ~ cooking_time_spent
execute store result score #cook_total nations_temp run data get block ~ ~ ~ cooking_total_time

# Safety check: if not cooking (cook_time <= 0), skip
execute if score #cook_time nations_temp matches ..0 run return 0

# Safety check: if cooking_time_spent >= cooking_time_total, cap it
execute if score #cook_time nations_temp >= #cook_total nations_temp run scoreboard players operation #cook_time nations_temp = #cook_total nations_temp
execute if score #cook_time nations_temp >= #cook_total nations_temp run scoreboard players remove #cook_time nations_temp 1
execute if score #cook_time nations_temp >= #cook_total nations_temp store result block ~ ~ ~ cooking_time_spent int 1 run scoreboard players get #cook_time nations_temp
execute if score #cook_time nations_temp >= #cook_total nations_temp run return 0

# Increment by 5
scoreboard players add #cook_time nations_temp 5

# Safety: cap at cook_total - 1 to prevent overshoot and infinite loop
scoreboard players operation #safe_max nations_temp = #cook_total nations_temp
scoreboard players remove #safe_max nations_temp 2
execute if score #cook_time nations_temp > #safe_max nations_temp run scoreboard players operation #cook_time nations_temp = #safe_max nations_temp

# Apply the increment
execute store result block ~ ~ ~ cooking_time_spent int 1 run scoreboard players get #cook_time nations_temp

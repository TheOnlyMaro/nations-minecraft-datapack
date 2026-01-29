# nations:nerf/anvil_check
# Triggered by tick when player's anvil use stat increases
# 10% break chance for non-enchanters

# DEBUG: Confirm trigger fired
tellraw @s {"text":"[DEBUG] Anvil use detected!","color":"yellow"}

# Reset the stat to 0 so we can detect the next use
scoreboard players set @s nations_anvil_use 0

# 1. Enchanter Safe
execute if entity @s[tag=role_enchanter] run tellraw @s {"text":"[DEBUG] Player is Enchanter - safe!","color":"green"}
execute if entity @s[tag=role_enchanter] run return 1

# DEBUG: Non-enchanter path
tellraw @s {"text":"[DEBUG] Player is NOT Enchanter - rolling dice...","color":"gold"}

# 2. Roll Random Chance (1..10)
execute store result score #anvil_chance nations_temp run random value 1..10
tellraw @s [{"text":"[DEBUG] Rolled: ","color":"aqua"},{"score":{"name":"#anvil_chance","objective":"nations_temp"},"color":"white"}]

# 3. If 1, Break Anvil (10% chance)
execute if score #anvil_chance nations_temp matches 1 run tellraw @s {"text":"[DEBUG] Roll was 1 - breaking anvil!","color":"red"}
execute if score #anvil_chance nations_temp matches 1 run function nations:nerf/break_anvil


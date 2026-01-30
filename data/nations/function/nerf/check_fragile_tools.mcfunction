# nations:nerf/check_fragile_tools
# Check if non-miners mined any blocks that should apply durability penalty
# Called per non-miner player with @s context

# Group 1: Regular Ores (3x damage = +2 extra)
scoreboard players set @s nations_temp 0
scoreboard players operation @s nations_temp += @s mined_coal_ore
scoreboard players operation @s nations_temp += @s mined_copper_ore
scoreboard players operation @s nations_temp += @s mined_diamond_ore
scoreboard players operation @s nations_temp += @s mined_emerald_ore
scoreboard players operation @s nations_temp += @s mined_gold_ore
scoreboard players operation @s nations_temp += @s mined_iron_ore
scoreboard players operation @s nations_temp += @s mined_lapis_ore
scoreboard players operation @s nations_temp += @s mined_redstone_ore
scoreboard players operation @s nations_temp += @s mined_nether_gold
scoreboard players operation @s nations_temp += @s mined_nether_quartz
scoreboard players operation @s nations_temp += @s mined_obsidian
scoreboard players operation @s nations_temp += @s mined_glowstone
scoreboard players operation @s nations_temp += @s mined_amethyst
execute if score @s nations_temp matches 1.. run function nations:nerf/damage_tool_2x

scoreboard players set @s nations_temp_2 0
scoreboard players operation @s nations_temp_2 += @s nations_temp

# Group 2: Deepslate blocks (2x damage = +1 extra)
scoreboard players set @s nations_temp 0
scoreboard players operation @s nations_temp += @s mined_deepslate
scoreboard players operation @s nations_temp += @s mined_cobbled_deep
execute if score @s nations_temp matches 1.. run function nations:nerf/damage_tool_1x

scoreboard players operation @s nations_temp_2 += @s nations_temp

# Group 3: Deepslate Ores (4x damage = +3 extra)
scoreboard players set @s nations_temp 0
scoreboard players operation @s nations_temp += @s mined_deep_coal
scoreboard players operation @s nations_temp += @s mined_deep_copper
scoreboard players operation @s nations_temp += @s mined_deep_diamond
scoreboard players operation @s nations_temp += @s mined_deep_emerald
scoreboard players operation @s nations_temp += @s mined_deep_gold
scoreboard players operation @s nations_temp += @s mined_deep_iron
scoreboard players operation @s nations_temp += @s mined_deep_lapis
scoreboard players operation @s nations_temp += @s mined_deep_redstone
execute if score @s nations_temp matches 1.. run function nations:nerf/damage_tool_3x

scoreboard players operation @s nations_temp_2 += @s nations_temp

# Reset scores if any mining was detected
execute if score @s nations_temp_2 matches 1.. run function nations:nerf/reset_mining_scores

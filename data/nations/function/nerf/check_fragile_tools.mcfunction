# nations:nerf/check_fragile_tools
# Check if non-miners mined any blocks that should apply durability penalty

# Debug: Check if function is running
execute as @a[scores={mined_diamond_ore=1..}] run tellraw @s [{"text":"[DEBUG] Detected diamond ore mined! Score: ","color":"yellow"},{"score":{"name":"@s","objective":"mined_diamond_ore"},"color":"white"}]
execute as @a[scores={mined_diamond_ore=1..}] if entity @s[tag=role_miner] run tellraw @s [{"text":"[DEBUG] Player IS a miner, no penalty","color":"green"}]
execute as @a[scores={mined_diamond_ore=1..}] unless entity @s[tag=role_miner] run tellraw @s [{"text":"[DEBUG] Player is NOT a miner, applying penalty","color":"red"}]

# Regular Ores (3x damage = +2 extra)
execute as @a[scores={mined_coal_ore=1..}] unless entity @s[tag=role_miner] run function nations:nerf/damage_tool_2x
execute as @a[scores={mined_copper_ore=1..}] unless entity @s[tag=role_miner] run function nations:nerf/damage_tool_2x
execute as @a[scores={mined_diamond_ore=1..}] unless entity @s[tag=role_miner] run function nations:nerf/damage_tool_2x
execute as @a[scores={mined_emerald_ore=1..}] unless entity @s[tag=role_miner] run function nations:nerf/damage_tool_2x
execute as @a[scores={mined_gold_ore=1..}] unless entity @s[tag=role_miner] run function nations:nerf/damage_tool_2x
execute as @a[scores={mined_iron_ore=1..}] unless entity @s[tag=role_miner] run function nations:nerf/damage_tool_2x
execute as @a[scores={mined_lapis_ore=1..}] unless entity @s[tag=role_miner] run function nations:nerf/damage_tool_2x
execute as @a[scores={mined_redstone_ore=1..}] unless entity @s[tag=role_miner] run function nations:nerf/damage_tool_2x
execute as @a[scores={mined_nether_gold=1..}] unless entity @s[tag=role_miner] run function nations:nerf/damage_tool_2x
execute as @a[scores={mined_nether_quartz=1..}] unless entity @s[tag=role_miner] run function nations:nerf/damage_tool_2x
execute as @a[scores={mined_obsidian=1..}] unless entity @s[tag=role_miner] run function nations:nerf/damage_tool_2x
execute as @a[scores={mined_glowstone=1..}] unless entity @s[tag=role_miner] run function nations:nerf/damage_tool_2x
execute as @a[scores={mined_amethyst=1..}] unless entity @s[tag=role_miner] run function nations:nerf/damage_tool_2x

# Deepslate blocks (2x damage = +1 extra)
execute as @a[scores={mined_deepslate=1..}] unless entity @s[tag=role_miner] run function nations:nerf/damage_tool_1x
execute as @a[scores={mined_cobbled_deep=1..}] unless entity @s[tag=role_miner] run function nations:nerf/damage_tool_1x

# Deepslate Ores (4x damage = +3 extra)
execute as @a[scores={mined_deep_coal=1..}] unless entity @s[tag=role_miner] run function nations:nerf/damage_tool_3x
execute as @a[scores={mined_deep_copper=1..}] unless entity @s[tag=role_miner] run function nations:nerf/damage_tool_3x
execute as @a[scores={mined_deep_diamond=1..}] unless entity @s[tag=role_miner] run function nations:nerf/damage_tool_3x
execute as @a[scores={mined_deep_emerald=1..}] unless entity @s[tag=role_miner] run function nations:nerf/damage_tool_3x
execute as @a[scores={mined_deep_gold=1..}] unless entity @s[tag=role_miner] run function nations:nerf/damage_tool_3x
execute as @a[scores={mined_deep_iron=1..}] unless entity @s[tag=role_miner] run function nations:nerf/damage_tool_3x
execute as @a[scores={mined_deep_lapis=1..}] unless entity @s[tag=role_miner] run function nations:nerf/damage_tool_3x
execute as @a[scores={mined_deep_redstone=1..}] unless entity @s[tag=role_miner] run function nations:nerf/damage_tool_3x

# Reset all scores
scoreboard players reset @a mined_coal_ore
scoreboard players reset @a mined_copper_ore
scoreboard players reset @a mined_diamond_ore
scoreboard players reset @a mined_emerald_ore
scoreboard players reset @a mined_gold_ore
scoreboard players reset @a mined_iron_ore
scoreboard players reset @a mined_lapis_ore
scoreboard players reset @a mined_redstone_ore
scoreboard players reset @a mined_nether_gold
scoreboard players reset @a mined_nether_quartz
scoreboard players reset @a mined_obsidian
scoreboard players reset @a mined_glowstone
scoreboard players reset @a mined_amethyst
scoreboard players reset @a mined_deepslate
scoreboard players reset @a mined_cobbled_deep
scoreboard players reset @a mined_deep_coal
scoreboard players reset @a mined_deep_copper
scoreboard players reset @a mined_deep_diamond
scoreboard players reset @a mined_deep_emerald
scoreboard players reset @a mined_deep_gold
scoreboard players reset @a mined_deep_iron
scoreboard players reset @a mined_deep_lapis
scoreboard players reset @a mined_deep_redstone

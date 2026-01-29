# nations:explorer/dowsing_activate
# Triggered by /trigger dowsing
# Scans for chests/spawners in 30x30 radius and reports to player

# Check: Must be Explorer (redundant but safe)
execute unless entity @s[predicate=nations:is_explorer] run return fail

# Check: Must have amethyst shard in inventory
execute unless items entity @s container.* amethyst_shard run tellraw @s {"text":"You need an amethyst shard to use Dowsing Rod!","color":"red"}
execute unless items entity @s container.* amethyst_shard run return fail

# Check: Cooldown (5 seconds = 100 ticks)
execute if score @s nations_dowsing_cooldown matches 1.. run tellraw @s [{"text":"Dowsing Rod is on cooldown! ","color":"red"},{"text":"(","color":"gray"},{"score":{"name":"@s","objective":"nations_dowsing_cooldown"},"color":"gold"},{"text":" ticks remaining)","color":"gray"}]
execute if score @s nations_dowsing_cooldown matches 1.. run return fail

# Remove 1 amethyst shard
clear @s amethyst_shard 1

# Set cooldown (5 seconds)
scoreboard players set @s nations_dowsing_cooldown 100

# Scan for targets in radius
function nations:explorer/dowsing_scan_simple

# Feedback
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2

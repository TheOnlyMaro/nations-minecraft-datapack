# nations:explorer/weightless_spirit
# Triggered each tick for Explorers
# If holding glowstone powder in offhand and cooldown is 0, check for newly shot arrows

# Check: Must have glowstone dust in offhand
execute unless items entity @s weapon.offhand glowstone_dust run return fail

# Check: Cooldown (10 ticks)
execute if score @s nations_weightless_cd matches 1.. run return fail

# Reset arrow found flag
scoreboard players set #arrow_found nations_pid 0

# Find arrows shot by this player in the last tick (recent arrows within 5 blocks, in flight, not yet processed)
execute as @e[type=arrow,nbt={inGround:0b},tag=!weightless_processed,distance=..5,limit=1] run function nations:explorer/weightless_spirit_apply

# If arrow was processed (flag was set), consume powder and set cooldown
execute if score #arrow_found nations_pid matches 1 run function nations:explorer/weightless_consume
execute if score #arrow_found nations_pid matches 1 run scoreboard players set @s nations_weightless_cd 200
execute if score #arrow_found nations_pid matches 1 at @s run playsound minecraft:entity.phantom.flap master @s ~ ~ ~ 0.5 1.5
execute if score #arrow_found nations_pid matches 1 run title @s actionbar [{"text":"✦ ","color":"yellow"},{"text":"Weightless Spirit activated!","color":"aqua"}]

# nations:explorer/rapid_transit
# Trigger: Mounted + holding stick -> Speed boost every tick
# Mobs get speed effect, boats get forward push

execute if score @s nations_rapid_cooldown matches ..2 run return run scoreboard players add @s nations_rapid_cooldown 1

# Check if riding and holding stick (mainhand or offhand)
execute if predicate nations:is_riding if items entity @s weapon.mainhand stick run function nations:explorer/rapid_transit_boost
execute if predicate nations:is_riding if items entity @s weapon.offhand stick run function nations:explorer/rapid_transit_boost

# Reset cooldown
scoreboard players set @s nations_rapid_cooldown 0
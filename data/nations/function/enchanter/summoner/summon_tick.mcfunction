# nations:enchanter/summon_tick
# Managed by tick.mcfunction
# Handles despawn of summoned mobs (2 mins = 2400 ticks)

scoreboard players add @e[type=!player,tag=summoned_mob] nations_summon_age 1
execute as @e[type=!player,tag=summoned_mob,scores={nations_summon_age=2400..}] run particle poof ~ ~1 ~ 0.5 0.5 0.5 0.1 20
execute as @e[type=!player,tag=summoned_mob,scores={nations_summon_age=2400..}] run playsound entity.shulker.teleport hostile @a ~ ~ ~
execute as @e[type=!player,tag=summoned_mob,scores={nations_summon_age=2400..}] run tp @s ~ -100 ~
execute as @e[type=!player,tag=summoned_mob,scores={nations_summon_age=2400..}] run kill @s

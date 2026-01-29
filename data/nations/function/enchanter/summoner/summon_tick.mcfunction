# nations:enchanter/summon_tick
# Managed by tick.mcfunction
# Handles despawn of summoned mobs (2 mins = 2400 ticks)

scoreboard players add @e[type=!player,tag=summoned_mob] nations_summon_age 1

# At 2400 ticks: play effects
execute as @e[type=!player,tag=summoned_mob,scores={nations_summon_age=2400}] at @s run particle poof ~ ~1 ~ 0.5 0.5 0.5 0.1 20
execute as @e[type=!player,tag=summoned_mob,scores={nations_summon_age=2400}] at @s run playsound entity.shulker.teleport hostile @a ~ ~ ~

# At 2404 ticks: kill the mob
execute as @e[type=!player,tag=summoned_mob,scores={nations_summon_age=2404..}] at @s run tp @s ~ -200 ~
kill @e[type=!player,tag=summoned_mob,scores={nations_summon_age=2404..}]

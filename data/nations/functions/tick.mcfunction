# nations:tick
# Farmer Branch Tick Loop

# Cooldown Managers
scoreboard players remove @a[scores={nations_cd_breeding=1..}] nations_cd_breeding 1

# Persistent Roles / Markers
execute as @e[type=marker,tag=nations_composter_marker] at @s run function nations:farmer/composter_tick

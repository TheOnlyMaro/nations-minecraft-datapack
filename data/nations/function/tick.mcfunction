# nations:tick
# Farmer Branch Tick Loop
execute as @a[tag=role_farmer] run function nations:farmer/photosynthesis

# Cooldown Managers
scoreboard players remove @a[scores={nations_cd_breeding=1..}] nations_cd_breeding 1
scoreboard players remove @a[scores={nations_cd_vengeance=1..}] nations_cd_vengeance 1

# Persistent Roles / Markers
execute as @e[type=marker,tag=nations_composter_marker] at @s run function nations:farmer/composter_tick

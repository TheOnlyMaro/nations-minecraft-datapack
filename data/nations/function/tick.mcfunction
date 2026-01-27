# nations:tick — run each tick

# Cooldown Managers
# Warrior
scoreboard players remove @a[scores={nations_cd_adrenaline=1..}] nations_cd_adrenaline 1
# Farmer
scoreboard players remove @a[scores={nations_cd_vengeance=1..}] nations_cd_vengeance 1

# Global Cooldowns
scoreboard players remove #GLOBAL nations_global_warcry_cd 1

# Farmer Branch Tick Loop
execute as @a[tag=role_farmer] run function nations:farmer/photosynthesis
execute as @a[tag=role_farmer] run function nations:farmer/convert_held_beetroots


# Persistent Roles / Markers
execute as @e[type=marker,tag=nations_composter_marker] at @s run function nations:farmer/composter_tick

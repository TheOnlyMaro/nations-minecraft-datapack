# nations:tick — run each tick

# Cooldown Managers
# Warrior
scoreboard players remove @a[scores={nations_cd_adrenaline=1..}] nations_cd_adrenaline 1
# Farmer
scoreboard players remove @a[scores={nations_cd_vengeance=1..}] nations_cd_vengeance 1
# Enchanter
scoreboard players remove @a[scores={nations_cd_skymage=1..}] nations_cd_skymage 1

# Global Cooldowns
scoreboard players remove #GLOBAL nations_global_warcry_cd 1

# Farmer Branch Tick Loop
execute as @a[tag=role_farmer] run function nations:farmer/photosynthesis
execute as @a[tag=role_farmer] run function nations:farmer/convert_held_beetroots

# Enchanter Branch Tick Loop
execute as @a[tag=role_enchanter] run function nations:enchanter/jump_handler
function nations:nerf/clear_restricted_items



# Check Death Reset
execute as @a[scores={nations_deaths=1..}] run function nations:utils/death_check

# Persistent Roles / Markers
execute as @e[type=marker,tag=nations_composter_marker] at @s run function nations:farmer/composter_tick
function nations:enchanter/summon_tick


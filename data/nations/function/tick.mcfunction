# nations:tick — run each tick
# call role handlers, cooldown processors, and periodic checks

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
execute as @a[scores={nations_mend_trigger=1..}] run function nations:enchanter/blood_mend/blood_mend
# Check for Dropped Summon Paper (Releasing Soul)
# REMOVED: Switched to Shield Block Trigger
# execute as @e[type=item] if data entity @s Item.components."minecraft:custom_data".nations_summon_item run function nations:enchanter/summoner/summoner_release
function nations:nerf/clear_restricted_items

# Anvil Nerf - Check for anvil interactions via statistic
execute as @a[scores={nations_anvil_use=1..}] at @s run function nations:nerf/anvil_check

# Check Death Reset
execute as @a[scores={nations_deaths=1..}] run function nations:utils/death_check

# Persistent Roles / Markers
execute as @e[type=marker,tag=nations_composter_marker] at @s run function nations:farmer/composter_tick
function nations:enchanter/summoner/summon_tick
function nations:enchanter/summoner/summon_marker_tick

# Miner Hyper-Smelting - Process every 5 ticks
scoreboard players add #smelt_timer nations_smelt_timer 1
execute if score #smelt_timer nations_smelt_timer matches 5.. run scoreboard players set #smelt_timer nations_smelt_timer 0
execute if score #smelt_timer nations_smelt_timer matches 0 as @e[type=marker,tag=miner_furnace] at @s run function nations:miner/hyper_smelt

# Explorer
execute as @a[predicate=nations:is_explorer] at @s run function nations:explorer/rapid_transit
execute as @a[predicate=nations:is_explorer] at @s run function nations:explorer/weightless_spirit

# Explorer Soft-Nerf: Travel Fatigue (runs every 10 ticks for performance)
scoreboard players add #fatigue_timer nations_pid 1
execute if score #fatigue_timer nations_pid matches 10.. run function nations:explorer/travel_fatigue
execute if score #fatigue_timer nations_pid matches 10.. run scoreboard players set #fatigue_timer nations_pid 0

# Explorer Trigger
scoreboard players enable @a[predicate=nations:is_explorer] backpack
execute as @a[predicate=nations:is_explorer,scores={backpack=1..}] run function nations:explorer/backpack_swap
scoreboard players reset @a[scores={backpack=1..}] backpack

# Explorer Waypoint Triggers
scoreboard players enable @a[predicate=nations:is_explorer] sethome
execute as @a[predicate=nations:is_explorer,scores={sethome=1..}] run function nations:explorer/set_home
scoreboard players reset @a[scores={sethome=1..}] sethome

scoreboard players enable @a[predicate=nations:is_explorer] home
execute as @a[predicate=nations:is_explorer,scores={home=1..}] run function nations:explorer/home_warp_start
scoreboard players reset @a[scores={home=1..}] home

# PID Assignment (Sequential)
execute as @a unless score @s nations_pid matches 1.. store result score @s nations_pid run scoreboard players add #global nations_pid 1

# Explorer Smuggler Triggers
scoreboard players enable @a[predicate=nations:is_explorer] maillist
scoreboard players enable @a[predicate=nations:is_explorer] mailto
execute as @a[predicate=nations:is_explorer,scores={maillist=1..}] run function nations:explorer/mail_trigger
execute as @a[predicate=nations:is_explorer,scores={mailto=1..}] run function nations:explorer/mail_process
scoreboard players reset @a[scores={maillist=1..}] maillist
scoreboard players reset @a[scores={mailto=1..}] mailto

# Process Cooldowns & Timers
scoreboard players remove @a[scores={nations_cooldown_waypoint=1..}] nations_cooldown_waypoint 1
scoreboard players remove @a[scores={nations_cooldown_sethome=1..}] nations_cooldown_sethome 1
scoreboard players remove @a[scores={nations_warmup=1..}] nations_warmup 1
scoreboard players remove @a[scores={nations_combat_timer=1..}] nations_combat_timer 1
scoreboard players remove @a[scores={nations_dowsing_cooldown=1..}] nations_dowsing_cooldown 1
scoreboard players remove @a[scores={nations_weightless_cd=1..}] nations_weightless_cd 1

# Explorer Dowsing Trigger
scoreboard players enable @a[predicate=nations:is_explorer] dowsing
execute as @a[predicate=nations:is_explorer,scores={dowsing=1..}] at @s run function nations:explorer/dowsing_activate
scoreboard players reset @a[scores={dowsing=1..}] dowsing

# Combat Detection (Reset Timer on Damage)
execute as @a[scores={nations_took_damage=1..}] run scoreboard players set @s nations_combat_timer 200
scoreboard players reset @a nations_took_damage

# Warmup Completion Check
execute as @a[scores={nations_warmup=1}] run function nations:explorer/home_warp_perform

# Miner Abilities
function nations:utils/detect_crawl
execute as @a[predicate=nations:is_miner] at @s run function nations:miner/cave_dweller
execute as @a[predicate=nations:is_miner] at @s run function nations:miner/tunnel_rat

# Miner Lithic Resonance (runs every 4 seconds = 80 ticks)
scoreboard players add #lithic_timer nations_pid 1
execute if score #lithic_timer nations_pid matches 80.. run tellraw @a[predicate=nations:is_miner] [{"text":"[DEBUG] Lithic timer triggered","color":"gold"}]
execute if score #lithic_timer nations_pid matches 80.. as @a[predicate=nations:is_miner] at @s run function nations:miner/lithic_resonance
execute if score #lithic_timer nations_pid matches 80.. run scoreboard players set #lithic_timer nations_pid 0

# Miner Nerf - Fragile Tools for Non-Miners
execute as @a[tag=!role_miner] run function nations:nerf/check_fragile_tools

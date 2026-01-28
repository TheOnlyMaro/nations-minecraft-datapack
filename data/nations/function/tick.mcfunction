# nations:tick — run each tick
# call role handlers, cooldown processors, and periodic checks

# Explorer
execute as @a[predicate=nations:is_explorer] at @s run function nations:explorer/rapid_transit
execute as @a[predicate=nations:is_explorer] at @s run function nations:explorer/weightless_spirit

# Explorer Soft-Nerf: Travel Fatigue (runs every 10 ticks for performance)
scoreboard players add #fatigue_timer nations_pid 1
execute if score #fatigue_timer nations_pid matches 10.. run function nations:explorer/travel_fatigue
execute if score #fatigue_timer nations_pid matches 10.. run scoreboard players set #fatigue_timer nations_pid 0
# Explorer Trigger
scoreboard players enable @a[predicate=nations:is_explorer] nations_trigger_backpack
execute as @a[predicate=nations:is_explorer,scores={nations_trigger_backpack=1..}] run function nations:explorer/backpack_swap
scoreboard players reset @a[scores={nations_trigger_backpack=1..}] nations_trigger_backpack

# Explorer Waypoint Triggers
scoreboard players enable @a[predicate=nations:is_explorer] nations_set_home
execute as @a[predicate=nations:is_explorer,scores={nations_set_home=1..}] run function nations:explorer/set_home
scoreboard players reset @a[scores={nations_set_home=1..}] nations_set_home

scoreboard players enable @a[predicate=nations:is_explorer] nations_home_warp
execute as @a[predicate=nations:is_explorer,scores={nations_home_warp=1..}] run function nations:explorer/home_warp_start
scoreboard players reset @a[scores={nations_home_warp=1..}] nations_home_warp

# PID Assignment (Sequential)
execute as @a unless score @s nations_pid matches 1.. store result score @s nations_pid run scoreboard players add #global nations_pid 1

# Explorer Smuggler Triggers
scoreboard players enable @a[predicate=nations:is_explorer] nations_mail_trigger
scoreboard players enable @a[predicate=nations:is_explorer] nations_mail_id
execute as @a[predicate=nations:is_explorer,scores={nations_mail_trigger=1..}] run function nations:explorer/mail_trigger
execute as @a[predicate=nations:is_explorer,scores={nations_mail_id=1..}] run function nations:explorer/mail_process
scoreboard players reset @a[scores={nations_mail_trigger=1..}] nations_mail_trigger
scoreboard players reset @a[scores={nations_mail_id=1..}] nations_mail_id

# Process Cooldowns & Timers
scoreboard players remove @a[scores={nations_cooldown_waypoint=1..}] nations_cooldown_waypoint 1
scoreboard players remove @a[scores={nations_cooldown_sethome=1..}] nations_cooldown_sethome 1
scoreboard players remove @a[scores={nations_warmup=1..}] nations_warmup 1
scoreboard players remove @a[scores={nations_combat_timer=1..}] nations_combat_timer 1
scoreboard players remove @a[scores={nations_dowsing_cooldown=1..}] nations_dowsing_cooldown 1
scoreboard players remove @a[scores={nations_weightless_cd=1..}] nations_weightless_cd 1

# Explorer Dowsing Trigger
scoreboard players enable @a[predicate=nations:is_explorer] nations_dowsing
execute as @a[predicate=nations:is_explorer,scores={nations_dowsing=1..}] at @s run function nations:explorer/dowsing_activate
scoreboard players reset @a[scores={nations_dowsing=1..}] nations_dowsing

# Combat Detection (Reset Timer on Damage)
execute as @a[scores={nations_took_damage=1..}] run scoreboard players set @s nations_combat_timer 200
scoreboard players reset @a nations_took_damage

# Warmup Completion Check
execute as @a[scores={nations_warmup=1}] run function nations:explorer/home_warp_perform

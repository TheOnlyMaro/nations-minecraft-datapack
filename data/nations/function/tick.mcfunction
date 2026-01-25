# nations:tick — run each tick

# Role Handlers
execute as @a[predicate=nations:warrior/is_warrior] run function nations:warrior/thou_shalt_bleed
execute as @a run function nations:warrior/vanguard
execute as @a[predicate=nations:warrior/is_warrior] run function nations:warrior/adrenaline_rush

# Cooldown Managers
scoreboard players remove @a[scores={nations_cd_adrenaline=1..}] nations_cd_adrenaline 1

# Global Event Listeners (Kills, etc)
function nations:warrior/bloodthirsty

# Global Cooldowns
scoreboard players remove #GLOBAL nations_global_warcry_cd 1



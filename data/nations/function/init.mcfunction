# nations:init — initialization function

# Scoreboards for Combat (Warrior) logic
scoreboard objectives add nations_slot_cache dummy
scoreboard objectives add nations_was_blocking dummy
scoreboard objectives add nations_is_blocking dummy
scoreboard objectives add nations_temp dummy
scoreboard objectives add nations_health dummy
scoreboard objectives add nations_cd_adrenaline dummy
scoreboard objectives add nations_pvp_kill minecraft.killed:minecraft.player
scoreboard objectives add nations_global_warcry_cd dummy
# Apply Vanguard to all warriors on reload
execute as @a run function nations:warrior/vanguard

say Nations datapack initialized.

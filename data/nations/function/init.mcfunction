# nations:init — initialization function

# Scoreboards for Combat (Warrior) logic

scoreboard objectives add nations_temp dummy
scoreboard objectives add nations_health dummy
scoreboard objectives add nations_cd_adrenaline dummy
scoreboard objectives add nations_global_warcry_cd dummy
# Apply Vanguard to all warriors on reload
execute as @a run function nations:warrior/vanguard

# Farmer Branch Initialization

scoreboard objectives add nations_timer dummy
scoreboard objectives add nations_cd_breeding dummy
scoreboard objectives add nations_photo_timer dummy
scoreboard objectives add nations_cd_vengeance dummy

say Nations datapack Initialized.

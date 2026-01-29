# nations:init — initialization function
# Register scoreboards, setup teams, or run one-time setup.

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
scoreboard objectives add nations_summon_age dummy
scoreboard objectives add nations_cd_skymage dummy
scoreboard objectives add nations_deaths deathCount
scoreboard objectives add nations_jump minecraft.custom:minecraft.jump
scoreboard objectives add nations_mend_trigger dummy
scoreboard objectives add nations_anvil_use minecraft.custom:minecraft.interact_with_anvil

# Explorer Branch Initialization
scoreboard objectives add backpack trigger
scoreboard objectives add sethome trigger
scoreboard objectives add home trigger
scoreboard objectives add nations_warmup dummy
scoreboard objectives add nations_cooldown_waypoint dummy
scoreboard objectives add nations_cooldown_sethome dummy
scoreboard objectives add nations_combat_timer dummy
scoreboard objectives add nations_took_damage minecraft.custom:minecraft.damage_taken
scoreboard objectives add nations_pid dummy
scoreboard objectives add mailto trigger
scoreboard objectives add maillist trigger
scoreboard objectives add nations_dowsing_cooldown dummy
scoreboard objectives add dowsing trigger
scoreboard objectives add nations_weightless_cd dummy

# Miner Branch Initialization
scoreboard objectives add nations_y dummy

say Nations datapack Initialized.

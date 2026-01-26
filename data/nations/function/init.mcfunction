# nations:init — initialization function (placeholder)
# Register scoreboards, setup teams, or run one-time setup.
# TODO: implement initialization logic for roles and data storage

# Example: announce datapack loaded
say Nations datapack initialized (placeholder)
scoreboard objectives add nations_trigger_backpack trigger
scoreboard objectives add nations_set_home trigger
scoreboard objectives add nations_home_warp trigger
scoreboard objectives add nations_warmup dummy
scoreboard objectives add nations_cooldown_waypoint dummy
scoreboard objectives add nations_cooldown_sethome dummy
scoreboard objectives add nations_combat_timer dummy
scoreboard objectives add nations_took_damage minecraft.custom:minecraft.damage_taken
scoreboard objectives add nations_pid dummy
scoreboard objectives add nations_mail_id trigger
scoreboard objectives add nations_mail_trigger trigger

# nations:init — initialization function
# Register scoreboards, setup teams, or run one-time setup.

# Scoreboard objectives for miner abilities
scoreboard objectives add nations_y dummy

# Start the tick loop
schedule function nations:tick 1t

# Announce datapack loaded
say Nations datapack initialized


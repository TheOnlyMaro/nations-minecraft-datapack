# nations:tick — run each tick
# call role handlers, cooldown processors, and periodic checks

# Miner Abilities
execute as @a[predicate=nations:is_miner] at @s run function nations:miner/cave_dweller

# Reschedule this function to run next tick (workaround for tick tag issues)
schedule function nations:tick 1t replace

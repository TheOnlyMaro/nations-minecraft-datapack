# nations:enchanter/summoner/summon_delayed_execute
# Executes the actual summon from marker's stored data

# Get mob data from this marker's storage
data modify storage nations:temp MobData set from entity @s data.nations_mob_data

# Summon the mob
function nations:enchanter/summoner/summon_macro with storage nations:temp MobData

# Final effects
playsound entity.illusioner.cast_spell ambient @a ~ ~ ~ 1 0.5
particle poof ~ ~1 ~ 0.5 0.5 0.5 0.1 30
particle portal ~ ~1 ~ 0.3 0.5 0.3 0.5 50

# Remove the marker
kill @s

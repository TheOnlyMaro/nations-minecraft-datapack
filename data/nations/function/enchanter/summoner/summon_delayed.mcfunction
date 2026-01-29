# nations:enchanter/summoner/summon_delayed
# Called via schedule - performs the actual mob summon at marker location

# Find all markers ready to summon and execute the macro
execute as @e[tag=summon_marker] at @s run function nations:enchanter/summoner/summon_delayed_execute

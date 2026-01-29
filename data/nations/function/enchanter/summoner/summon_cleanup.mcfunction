# nations:enchanter/summoner/summon_cleanup
# Called via schedule from summon_tick.mcfunction
# Performs the final removal of tagged mobs

execute as @e[type=!player,tag=summon_despawning] at @s run tp @s ~ -100 ~
kill @e[type=!player,tag=summon_despawning]

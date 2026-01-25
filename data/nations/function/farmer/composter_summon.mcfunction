# nations:farmer/composter_summon
# Summon the marker at the center of the block

execute align xyz positioned ~0.5 ~0.5 ~0.5 run summon marker ~ ~ ~ {Tags:["nations_composter_marker"]}
playsound minecraft:block.composter.ready block @a ~ ~ ~ 1 1

# nations:farmer/tag_fed_animal
# Triggered when farmer interacts with breedable animal (feeding)
# Tags nearby animals that just entered love mode

# Revoke advancement immediately so it can trigger again
advancement revoke @s only nations:farmer/feed_animal

# Tag any breedable animal within 5 blocks that is in love mode (InLove > 0)
# This animal was just fed by the farmer
execute at @s as @e[type=#nations:breedable,distance=..5,tag=!nations_farmer_fed] if entity @s[nbt={InLove:600}] run tag @s add nations_farmer_fed
execute at @s as @e[type=#nations:breedable,distance=..5,tag=!nations_farmer_fed] if entity @s[nbt={InLove:599}] run tag @s add nations_farmer_fed
execute at @s as @e[type=#nations:breedable,distance=..5,tag=!nations_farmer_fed] if entity @s[nbt={InLove:598}] run tag @s add nations_farmer_fed
execute at @s as @e[type=#nations:breedable,distance=..5,tag=!nations_farmer_fed] if entity @s[nbt={InLove:597}] run tag @s add nations_farmer_fed
execute at @s as @e[type=#nations:breedable,distance=..5,tag=!nations_farmer_fed] if entity @s[nbt={InLove:596}] run tag @s add nations_farmer_fed

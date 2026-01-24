# nations:warrior/vanguard
# Sets Max Health to 24 (12 hearts) for Warriors. Reverts to 20 if role removed.

# 1. Apply Effect (If Warrior and NOT already applied)
execute as @s[predicate=nations:warrior/is_warrior,tag=!nations_vanguard_applied] run attribute @s minecraft:generic.max_health base set 24
execute as @s[predicate=nations:warrior/is_warrior,tag=!nations_vanguard_applied] run tag @s add nations_vanguard_applied

# 2. Remove Effect (If NOT Warrior and IS applied)
execute as @s[predicate=!nations:warrior/is_warrior,tag=nations_vanguard_applied] run attribute @s minecraft:generic.max_health base set 20
execute as @s[predicate=!nations:warrior/is_warrior,tag=nations_vanguard_applied] run tag @s remove nations_vanguard_applied

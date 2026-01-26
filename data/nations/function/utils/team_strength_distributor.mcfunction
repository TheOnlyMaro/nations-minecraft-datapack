# nations:utils/team_strength_distributor
# Applies Strength I (8s) to the caster and nearby Warriors
# Simplified to target by role tag instead of team color

effect give @s minecraft:strength 8 0
effect give @a[tag=role_warrior,distance=..20] minecraft:strength 8 0

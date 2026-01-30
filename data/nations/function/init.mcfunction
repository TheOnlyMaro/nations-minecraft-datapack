# nations:init — initialization function
# Register scoreboards, setup teams, or run one-time setup.

# Scoreboards for Combat (Warrior) logic
scoreboard objectives add nations_temp dummy
scoreboard objectives add nations_damage_fraction dummy
scoreboard objectives add nations_health dummy
scoreboard objectives add nations_cd_adrenaline dummy
scoreboard objectives add nations_global_warcry_cd dummy

# Constants
scoreboard players set #CONST_-1 nations_pid -1

# Apply Vanguard to all warriors on reload
execute as @a run function nations:warrior/vanguard

# Farmer Branch Initialization
scoreboard objectives add nations_timer dummy
scoreboard objectives add nations_cd_breeding dummy
scoreboard objectives add nations_photo_timer dummy
scoreboard objectives add nations_cd_vengeance dummy
scoreboard objectives add nations_summon_age dummy
scoreboard objectives add nations_cd_skymage dummy
scoreboard objectives add nations_deaths deathCount
scoreboard objectives add nations_jump minecraft.custom:minecraft.jump
scoreboard objectives add nations_mend_trigger dummy
scoreboard objectives add nations_anvil_use minecraft.custom:minecraft.interact_with_anvil

# Explorer Branch Initialization
scoreboard objectives add backpack trigger
scoreboard objectives add sethome trigger
scoreboard objectives add home trigger
scoreboard objectives add nations_warmup dummy
scoreboard objectives add nations_cooldown_waypoint dummy
scoreboard objectives add nations_cooldown_sethome dummy
scoreboard objectives add nations_combat_timer dummy
scoreboard objectives add nations_took_damage minecraft.custom:minecraft.damage_taken
scoreboard objectives add nations_pid dummy
scoreboard objectives add mailto trigger
scoreboard objectives add maillist trigger
scoreboard objectives add nations_dowsing_cooldown dummy
scoreboard objectives add nations_rapid_cooldown dummy
scoreboard objectives add dowsing trigger
scoreboard objectives add nations_weightless_cd dummy

# Miner Branch Initialization
scoreboard objectives add nations_y dummy
scoreboard objectives add nations_temp_2 dummy
scoreboard objectives add nations_smelt_timer dummy

# Miner Nerf - Track blocks mined (for Fragile Tools)
# Regular ores (3x durability damage)
scoreboard objectives add mined_coal_ore minecraft.mined:minecraft.coal_ore
scoreboard objectives add mined_copper_ore minecraft.mined:minecraft.copper_ore
scoreboard objectives add mined_diamond_ore minecraft.mined:minecraft.diamond_ore
scoreboard objectives add mined_emerald_ore minecraft.mined:minecraft.emerald_ore
scoreboard objectives add mined_gold_ore minecraft.mined:minecraft.gold_ore
scoreboard objectives add mined_iron_ore minecraft.mined:minecraft.iron_ore
scoreboard objectives add mined_lapis_ore minecraft.mined:minecraft.lapis_ore
scoreboard objectives add mined_redstone_ore minecraft.mined:minecraft.redstone_ore
scoreboard objectives add mined_nether_gold minecraft.mined:minecraft.nether_gold_ore
scoreboard objectives add mined_nether_quartz minecraft.mined:minecraft.nether_quartz_ore
scoreboard objectives add mined_obsidian minecraft.mined:minecraft.obsidian
scoreboard objectives add mined_glowstone minecraft.mined:minecraft.glowstone
scoreboard objectives add mined_amethyst minecraft.mined:minecraft.amethyst_cluster

# Deepslate blocks (2x durability damage)
scoreboard objectives add mined_deepslate minecraft.mined:minecraft.deepslate
scoreboard objectives add mined_cobbled_deep minecraft.mined:minecraft.cobbled_deepslate

# Deepslate ores (4x durability damage)
scoreboard objectives add mined_deep_coal minecraft.mined:minecraft.deepslate_coal_ore
scoreboard objectives add mined_deep_copper minecraft.mined:minecraft.deepslate_copper_ore
scoreboard objectives add mined_deep_diamond minecraft.mined:minecraft.deepslate_diamond_ore
scoreboard objectives add mined_deep_emerald minecraft.mined:minecraft.deepslate_emerald_ore
scoreboard objectives add mined_deep_gold minecraft.mined:minecraft.deepslate_gold_ore
scoreboard objectives add mined_deep_iron minecraft.mined:minecraft.deepslate_iron_ore
scoreboard objectives add mined_deep_lapis minecraft.mined:minecraft.deepslate_lapis_ore
scoreboard objectives add mined_deep_redstone minecraft.mined:minecraft.deepslate_redstone_ore

say Nations datapack Initialized.

# nations-minecraft-datapack

# SMP Role-Based Design: Technical Revision (v3.1)



## 1. Overview

This document defines a symmetric team-based SMP structure. Implementation relies on Java Edition Data Packs (Pack Format 61, v1.21.4), utilizing custom_data, Loot Tables, predicates, and .mcfunction files.



## 2. Role Implementation Mechanics

All roles are assigned via player NBT tags, persisted for the lifetime of the player profile.

### 2.1 Tag Assignment & Storage

* **Command:** `/tag @s add role_<role_name>` (e.g., `role_farmer`, `role_miner`, `role_enchanter`, `role_explorer`, `role_warrior`)
* **Storage:** Tags persist in player NBT (`Tags` array) for predicate checks and command filters.
* **Verification:** Predicates in `data/nations/predicates/is_<role>.json` check for tag presence via `entity_properties` condition.
* **Removal:** `/tag @s remove role_<role_name>` to unassign.

### 2.2 Cooldown & Effect Tracking

* **Scoreboard Objectives:** Track ability cooldowns and effect timers per player.
  * `nations_cooldown_ability` — General cooldown counter (decremented each tick).
  * `nations_effect_duration` — Remaining duration of active effects (e.g., Absorption hearts, buffs).
  * `nations_resource` — Resource tracking (e.g., feather count for Sky Mage, amethyst shards for Dowsing Rod).
* **Cooldown Mechanism:** On ability trigger, set cooldown counter. Ticking function decrements it; ability is blocked if counter > 0.
* **Predicate Filtering:** Use `score_cooldown_duration` conditions to prevent double-triggering.



## 3. Detailed Role Analysis & Abilities



### 3.1 Farmers (Cultivators)

**Focus:** Food production, cooperative buffs, defensive PvE.



**Approved Abilities:**

- **Composter Automation:** Placing a composter forces nearby crops to grow.
  * **Trigger:** `PlayerPlacedBlock` predicate on Composter block.
  * **Detection:** Marker summons in 9x9 area; scans for crops (age < max) and increments age.
  * **Cooldown:** None (placement-based).
  * **Audio:** `block.composter.ready` sound on completion.

- **Breeding Mastery:** Animals breed faster (2.5 min cooldown).
  * **Trigger:** Right-click animal (any breedable) with applicable item in hand.
  * **Mechanism:** Sets animal's `minecraft:breed_cooldown` NBT to 3000 ticks (instead of default 6000).
  * **Cooldown:** 150 ticks (2.5 min).
  * **Audio:** `entity.sheep.shear` sound.

- **Optimized Yield:** 50% more drops when harvesting crops.
  * **Implementation:** Custom loot tables check for `role_farmer` tag; on match, apply 1.5x multiplier.
  * **Mechanics:** Seeds and crops drop separately; crop drops scaled, seeds unaffected.
  * **Trigger:** Block break event on mature crops.

- **Midas Touch:** Eating apples grants 1 Absorption Heart (2 mins) and Regen I (2s).
  * **Trigger:** `PlayerConsumeItem` event (apple).
  * **Effect:** Applies `minecraft:absorption` (2 levels) and `minecraft:regeneration` (1 level, 40 ticks).
  * **Audio:** `entity.player.levelup` sound.
  * **Cooldown:** None (consumable-based).

- **Photosynthesis:** Standing in sunlight grants 2 Absorption Hearts for 30s, refreshed every 30s.
  * **Detection:** Ticking function checks `time` is day (0-12000) and player `sky_light_level` >= 15 and not raining.
  * **Effect:** Applies `minecraft:absorption` (4 levels) every 30s if conditions met; removed if moved to shade.
  * **Audio:** None (ambient effect).
  * **Stacking:** Effect refreshes while standing in sun; stacks up to 4 hearts.

- **Better Together:** Eating food restores 50% of value to OTHER Farmers within 10 blocks.
  * **Trigger:** `PlayerConsumeItem` event (food).
  * **Detection:** Nearby players within 10 blocks, filtered by `role_farmer` predicate (excludes self).
  * **Effect:** Restores 50% of consumed food's hunger value to other Farmers; not self-applied.
  * **Cooldown:** None (consumable-based).

- **Nature's Vengeance (NEW):** Consuming a beetroot summons 1 fang attack near the player.
  * **Trigger:** `PlayerConsumeItem` event (beetroot).
  * **Mechanism:** Summons `minecraft:evoker_fangs` at player position; fangs deal minimal damage (PvE only).
  * **Cooldown:** 20 ticks.
  * **Effect:** Defensive, PvE only. Small damage and thematic "nature strikes back."
  * **Audio:** `entity.evoker.cast_spell` sound.
  * **Implementation:** Fangs despawn after 20 ticks; do not persist.


**Soft-Nerf (Trade Incentive):**

- **Inefficiency:** Non-Farmers have a 25% chance to receive ZERO drops when harvesting crops (Seeds still drop).
  * **Implementation:** Custom loot tables apply conditional check; 1d4 RNG if not `role_farmer`.
  * **Mechanics:** Drops processed by filter condition; if fails, only seeds proceed.



---



### 3.2 Miners (Ore Specialists)

**Focus:** Ores, industrial efficiency, underground utility.



**Approved Abilities:**

- **Ore Yield:** 1.5x drops from ores (Fortune compatible).
  * **Implementation:** Custom loot tables apply `role_miner` condition + Fortune multiplier stacking.
  * **Trigger:** Block break event on ore blocks (deepslate, copper, iron, gold, diamond, emerald, lapis, redstone).
  * **Mechanics:** Drop amount scaled by 1.5; combines with Fortune I/II/III for cumulative bonus.

- **Specialized Smelting:** Furnaces cook 2x faster for Miners.
  * **Trigger:** `PlayerInteractBlock` event on furnace.
  * **Mechanism:** Tags furnace with `nations:fast_smelt` on interaction by Miner. Ticking function increments `CookTime` by 2 per tick (normal = 1).
  * **Removal:** Tag removed if non-Miner interacts with furnace.
  * **Implementation:** Tag persists across server ticks; detected per-tick.

- **Cave Dweller:** At Y < 0, gain Night Vision, Haste I, and Resistance I.
  * **Detection:** Ticking function checks player Y coordinate < 0 and `role_miner` tag.
  * **Effect:** Applies `minecraft:night_vision` (infinite), `minecraft:haste` (1 level), `minecraft:resistance` (1 level).
  * **Stacking:** Haste stacks with Tunnel Rat (+1 additional if crawling).
  * **Audio:** None (ambient effect).
  * **Removal:** Effects removed if player ascends to Y >= 0.

- **Lithic Resonance:** Crouching + holding gemstone (offhand) plays a sound every 10s at corresponding ores.
  * **Trigger:** Ticking check for `role_miner` + sneaking + holding amethyst shard in offhand.
  * **Detection:** Raycast or position check scans 20-block radius for ore blocks; plays ore-specific sound direction.
  * **Audio:** Ore-specific sounds (e.g., `block.amethyst_block.chime` for diamonds).
  * **Cooldown:** 10 seconds between sound pulses.
  * **Implementation:** Sound location set to nearest ore block.

- **Tunnel Rat:** While crawling (1x1 space, not swimming), gain +1 Haste (stackable with Cave Dweller).
  * **Trigger:** Ticking check for player in 1x1 space (eye height < 1.8) and not in water.
  * **Effect:** Applies `minecraft:haste` (1 level). Stacks with Cave Dweller for total +2 Haste at Y < 0 while crawling.
  * **Audio:** None (ambient effect).
  * **Detection:** Checks block collision box of player + 0.3 block padding in X/Z.



**Soft-Nerf (Trade Incentive):**

- **Brittle Tools:** Non-Miners take 3x durability damage when mining Ores or Obsidian, 2x on Deepslate Stone, 4x on Deepslate Ores.
  * **Implementation:** Custom loot tables or damage event listener scales durability loss.
  * **Blocks affected:** All ore blocks, obsidian, deepslate variants.
  * **Mechanic:** On block break, check `role_miner` predicate; if false, apply multiplier.
  * **Audio:** None.



---



### 3.3 Enchanters (Magic & Alchemy)

**Approved Abilities:**

- **Alchemist:** Jumping near a brewing stand with ingredients charges it instantly.
  * **Trigger:** `PlayerJump` event + proximity to Brewing Stand (5 block radius) + holding gold nugget (main) and lapis (offhand).
  * **Mechanism:** Adds 2 charges to Brewing Stand's brewing progress (advances state).
  * **Cooldown:** 30 ticks (1.5s) per activation.
  * **Audio:** `entity.item.break` and `item.firecharge.use` sounds.
  * **Detection:** Checks Brewing Stand NBT `BrewTime` and adds 400 ticks (equivalent to 2 cycles).

- **Knowledgeable:** Refund 1 XP level after enchanting.
  * **Trigger:** `EnchantItem` event detected via advancement or scoreboard listener.
  * **Mechanism:** On successful enchant, grants player +1 experience level via `/experience add @s 1 levels`.
  * **Cooldown:** None (per-enchant).
  * **Audio:** `entity.experience_orb.pickup` sound.
  * **Detection:** Tracks Enchanting Table use via predicate.

- **Custom Recipes:** Cheaper XP bottles and Nether Wart crafting.
  * **XP Bottle Recipe:** 1 Glass Bottle + 1 Lapis Lazuli + 7 Gold Nuggets → 1 Experience Bottle.
  * **Nether Wart Recipe:** 1 Nether Wart Seed + 1 Redstone Dust + 1 Gold Nugget → 1 Nether Wart.
  * **Implementation:** Custom shaped recipes in `recipes/` folder.
  * **Availability:** All players can use (not role-restricted), but designed as Enchanter benefit.

- **Blood Sacrifice:** Kill a pig named "Vessel" for permanent +2 Hearts (until death).
  * **Trigger:** `EntityDeath` event for pig named "Vessel" killed by Enchanter.
  * **Mechanism:** Sets player's `generic.max_health` to 24 (from default 20); adds 2 hearts.
  * **Cost:** Inflicts `minecraft:weakness` (2 levels), `minecraft:slowness` (1 level), `minecraft:darkness` (1 level) for 60s (1200 ticks).
  * **Non-Stackable:** Check existing health; if >= 24, block ability. Max 1 use per Enchanter per session.
  * **Audio:** `entity.wither.spawn` sound on successful sacrifice.
  * **Detection:** Detect pig death via advancement or loot table modification.

- **Blood Mend:** Repair items with XP.
  * **Trigger:** Hold damaged tool + jump near enchanting table + consume XP bottle.
  * **Mechanism:** Repairs ~200 durability from held item; consumes 1 XP bottle.
  * **Cost:** Inflicts "Soul Sickness" for 30s. Undoes Blood Sacrifice vitality effect (+2 health reverted).
  * **Audio:** `entity.witch.ambient` and `entity.lightning_bolt.thunder` sounds.
  * **Cooldown:** 10 ticks (0.5s) between uses.
  * **Detection:** Checks durability of main-hand item; applies repair NBT.

- **Summoner:** Capture a hostile mob (Non-Boss) onto paper.
  * **Trigger:** Hold paper + right-click hostile mob (non-boss: no Wither, Ender Dragon, etc.).
  * **Mechanism:** Captures mob as NBT data on paper item (`CustomName`, `Pose`, `Rotation`, etc.); original mob despawns.
  * **Cooldown:** 30 ticks per capture.
  * **Limitation:** Summoned mob dies automatically after 2 minutes (120 ticks) via `PersistenceRequired: 0b` and timed despawn.
  * **Audio:** `entity.endermen.teleport` sound.
  * **Usage:** Right-click with captured paper to summon mob (once per paper).

- **Sky Mage (MODIFIED):** Right-clicking a Feather grants **Levitation II for 3s**. Feather is consumed.
  * **Trigger:** Right-click with feather in hand (any slot).
  * **Mechanism:** Removes feather from inventory; applies `minecraft:levitation` (2 levels) for 60 ticks (3s).
  * **Cooldown:** 15 ticks (0.75s).
  * **Audio:** `item.firecharge.use` sound.
  * **Effect:** Levitation II pushes player upward; can be canceled by jumping.



**Soft-Nerf (Trade Incentive):**

- **Volatile Anvils:** Non-Enchanters have a 10% chance to destroy an Anvil per use.
  * **Implementation:** Custom interaction handler checks for `role_enchanter` tag; if absent, 10% RNG (1d10 <= 1) triggers anvil destruction.
  * **Mechanism:** Anvil breaks and drops as item if RNG succeeds; normal repair proceeds if RNG fails.
  * **Audio:** `block.anvil.break` sound.
  * **Detection:** `PlayerInteractBlock` event on anvil.



---



### 3.4 Explorer (Mobility & Utility)

**Approved Abilities:**

- **Rapid Transit:** Move 50% faster on horses/boats/rails while holding a Stick.
  * **Trigger:** Ticking check for `role_explorer` tag + mounted entity + holding stick (main or offhand).
  * **Mechanism:** Applies `minecraft:speed` (1 level, 50% movement bonus) while conditions met.
  * **Effect:** Stacks with existing speed effects; removed when dismounted or stick dropped.
  * **Audio:** None (ambient effect).

- **Deep Pockets:** Access to a personal /backpack (9 slots). **Contents KEPT on death.**
  * **Trigger:** Command-based `/function nations:explorer/backpack_open` or item right-click (special item).
  * **Mechanism:** Opens a custom crafting grid interface (9 slots). NBT-stored on player profile or persistent custom structure.
  * **Storage:** Uses player's persistent NBT `SelectedItem` array or external scoreboard tracker linked to UUID.
  * **Death Handling:** BackpackContents saved to player profile; restored on respawn.
  * **Audio:** `ui.button.click` sound on open/close.

- **Smuggler:** Command to "mail" an item to another player instantly (Cost: XP).
  * **Trigger:** Custom command `/function nations:explorer/mail_item <target> [item_slot]`.
  * **Mechanism:** Transfers item from inventory to target's inventory (or mail storage if full).
  * **Cost:** Consumes 5 XP levels per mail.
  * **Cooldown:** 30 ticks (1.5s) between mails.
  * **Detection:** Scoreboard check for available XP; predicate filters `role_explorer`.
  * **Audio:** `entity.endermen.teleport` sound on both sender and receiver.

- **Waypoint:** Can set one "Home" warp.
  * **Trigger:** Command `/function nations:explorer/set_home` sets current coordinates in scoreboard.
  * **Warp Activation:** `/function nations:explorer/home_warp` teleports player to stored coordinates.
  * **Cast Time:** 10s (10-tick charging via scoreboard counter).
  * **Cooldown:** 10 min (600 ticks) between warps.
  * **PvP Lock:** Cannot be used while in combat (scoreboard flag check).
  * **Detection:** Checks `nations_in_combat` scoreboard; if > 0, blocks warp. Last damage timer resets counter.
  * **Audio:** `entity.endermen.teleport` sound on arrival.

- **Trailblazer:** Speed I while walking on ANY block if holding a Compass or Spyglass.
  * **Trigger:** Ticking check for `role_explorer` tag + on ground + holding compass or spyglass (main or offhand).
  * **Mechanism:** Applies `minecraft:speed` (1 level) continuously while conditions met.
  * **Removal:** Effect removed if player leaves ground or drops item.
  * **Audio:** None (ambient effect).

- **Dowsing Rod:** Right-click an Amethyst Shard to spawn particle trails pointing to the nearest Chest/Spawner (Visible only to user). Shard is consumed.
  * **Trigger:** Right-click with amethyst shard in hand.
  * **Mechanism:** Removes shard from inventory; scans 64-block radius for chests (`minecraft:chest`, `minecraft:trapped_chest`, `minecraft:shulker_box` variants) or spawners.
  * **Particle Effect:** Continuous `minecraft:end_rod` particles from player to nearest target every 5 ticks.
  * **Duration:** 30 seconds (600 ticks); particles stop and shard effect expires.
  * **Cooldown:** 10 ticks (0.5s).
  * **Audio:** `block.amethyst_block.resonate` sound on activation.

- **Weightless Spirit (NEW):** Shooting an arrow while holding Glowstone Powder in offhand consumes 1 powder to shoot an arrow that ignores gravity. Normal damage applies.
  * **Trigger:** `ProjectileLaunch` event (arrow) + holding glowstone powder in offhand.
  * **Mechanism:** Removes glowstone powder from offhand; applies `minecraft:no_gravity` tag to arrow NBT (arrow does not fall).
  * **Cooldown:** 10 ticks (0.5s).
  * **Effect:** Tactical scouting / skillshot utility. Arrow travels in straight line; normal bow damage applies.
  * **Audio:** `entity.arrow.shoot` sound (default arrow sound).



**Soft-Nerf (Trade Incentive):**

- **Travel Fatigue:** Non-Explorers lose Saturation 1.5x faster when sprinting or swimming.
  * **Implementation:** Ticking function checks player state (sprinting or in water + `!role_explorer` predicate).
  * **Mechanism:** Decrements saturation (food_saturation NBT) by 1.5x normal rate every tick.
  * **Audio:** None.



---



### 3.5 Combat (Warrior)

**Approved Abilities:**

- **Thou Shalt Bleed:** Shield block grants temporary Sharpness I.
  * **Trigger:** `PlayerBlockBreak` or `ProjectileHit` predicate on shield + `role_warrior` tag.
  * **Mechanism:** While blocking (shield raised), applies `minecraft:sharpness` (1 level) to main-hand sword if no sharpness present.
  * **Detection:** Ticking function checks shield NBT (`Blocking: 1b`) and re-applies sharpness if removed.
  * **Removal:** Sharpness removed when shield is dropped or blocking stops.
  * **Audio:** `block.grindstone.use` sound with item shield block effect.

- **Vanguard:** Base Health = 24 (12 Hearts).
  * **Mechanism:** Sets `generic.max_health` to 24 on first tag assignment (`role_warrior` added).
  * **Persistence:** Health modifier persists across sessions via player NBT attribute storage.
  * **Effect:** Grants +2 health bar hearts compared to default players (20 health).

- **Bounty Hunter:** +50% Mob Loot.
  * **Implementation:** Custom loot tables check for `role_warrior` tag on killer.
  * **Trigger:** Mob death event (`EntityDeath`).
  * **Mechanics:** Loot table entries apply 1.5x multiplier to item counts (stacks with Looting enchantment).
  * **Audio:** None.

- **Adrenaline Rush:** At 2.5 Hearts, gain Speed II for 5s (Cooldown: 60s).
  * **Trigger:** Ticking check for `role_warrior` tag + health <= 5 (2.5 hearts).
  * **Mechanism:** Applies `minecraft:speed` (2 levels) for 100 ticks (5s) when threshold met.
  * **Cooldown:** 60 ticks (3s) between activations (prevents spam).
  * **Removal:** Speed removed after duration expires or player heals above 5 health.
  * **Audio:** `entity.generic.drink` sound on activation.

- **Bloodthirsty:** Player kill heals for 1.5 Hearts.
  * **Trigger:** `EntityDeath` event for player killed by `role_warrior` player.
  * **Mechanism:** Restores 3 health points (1.5 hearts) to killer.
  * **Cooldown:** None (per-kill).
  * **Audio:** `entity.player.levelup` sound.

- **Scavenger:** 10% chance for mobs to drop armor/weapons at full durability (Unenchanted).
  * **Trigger:** Mob death event (`EntityDeath`).
  * **Implementation:** Loot table adds conditional entry; 1d10 RNG for `role_warrior` killer.
  * **Mechanics:** If RNG passes (1d10 <= 1), spawn armor/weapon item at mob death location (full durability, no enchantments).
  * **Audio:** None.

- **War Cry:** Right-clicking an Axe gives Strength I to nearby team members for 5s.
  * **Trigger:** `PlayerInteractItem` event (axe) for `role_warrior` player.
  * **Mechanism:** Scans 10-block radius for nearby players; applies `minecraft:strength` (1 level) for 100 ticks (5s) to all allies.
  * **Cooldown:** 120 ticks (2m global team cooldown) — shared across all Warriors to prevent spam.
  * **Detection:** Checks team affiliation via scoreboard or NBT tag.
  * **Audio:** `entity.evoker.cast_spell` sound with particle effect.



**Soft-Nerf (Trade Incentive):**

- **Fragile Shields:** Non-Combatants shields take 2x durability damage.
  * **Implementation:** Custom damage/durability event listener checks for `role_warrior` tag.
  * **Blocks affected:** All shield types.
  * **Mechanic:** On shield hit, check `!role_warrior` predicate; if true, apply 2x durability loss multiplier.
  * **Audio:** None.



---



## 4. Balancing Notes & Implementation Guidelines

- **Non-Stacking Rule:** Most abilities are non-stackable unless explicitly stated. Effects check for existing NBT tags or scoreboard values before re-applying.

- **Cooldown Tracking:** All cooldowns use dedicated scoreboard objectives (`nations_cooldown_<ability>`) decremented per tick. Predicates block activation if cooldown > 0.

- **Resource Management:** Consumable-based abilities (feathers, amethyst shards, XP bottles, glowstone) check inventory before allowing trigger. Items removed from slots on activation.

- **Damage Events:** PvE abilities (Nature's Vengeance, Adrenaline Rush) check environment context to avoid PvP abuse.

- **Predicate Filtering:** All role checks use `data/nations/predicates/is_<role>.json` for consistent role detection across functions.

- **Team Coordination:** Team abilities (War Cry, Better Together) use scoreboard team tracking for efficient proximity checks.

## 5. Function Folder Structure (Recommended)

```
data/nations/functions/
├── init.mcfunction                 (one-time setup)
├── tick.mcfunction                 (main loop, calls role handlers)
├── roles/
│   ├── farmer/
│   │   ├── composter_auto.mcfunction
│   │   ├── breeding_mastery.mcfunction
│   │   ├── photosynthesis.mcfunction
│   │   ├── better_together.mcfunction
│   │   └── vengeance.mcfunction
│   ├── miner/
│   │   ├── ore_yield.mcfunction
│   │   ├── specialized_smelting.mcfunction
│   │   ├── cave_dweller.mcfunction
│   │   ├── lithic_resonance.mcfunction
│   │   └── tunnel_rat.mcfunction
│   ├── enchanter/
│   │   ├── alchemist.mcfunction
│   │   ├── blood_sacrifice.mcfunction
│   │   ├── blood_mend.mcfunction
│   │   ├── summoner.mcfunction
│   │   └── sky_mage.mcfunction
│   ├── explorer/
│   │   ├── rapid_transit.mcfunction
│   │   ├── backpack_open.mcfunction
│   │   ├── mail_item.mcfunction
│   │   ├── set_home.mcfunction
│   │   ├── home_warp.mcfunction
│   │   ├── trailblazer.mcfunction
│   │   ├── dowsing_rod.mcfunction
│   │   └── weightless_spirit.mcfunction
│   └── warrior/
│       ├── thou_shalt_bleed.mcfunction
│       ├── bounty_hunter.mcfunction
│       ├── adrenaline_rush.mcfunction
│       ├── bloodthirsty.mcfunction
│       ├── scavenger.mcfunction
│       └── war_cry.mcfunction
└── utils/
    ├── cooldown_manager.mcfunction
    ├── effect_cleaner.mcfunction
    └── predicate_filters.mcfunction
```

## 6. Deployment Recommendation

- **Audio / Feedback:** Use `/playsound` with context-specific sound (player or entity source) to ensure ability activation feedback is clear. Default master volume helps; consider using `@s` as audio source for personal effects.

- **Particle Effects:** Use `particle` command with role-specific colors or shapes (e.g., `nautilus` for Farmer, `ash` for Miner, `firework` for Enchanter) for visual distinction.

- **Testing & Balancing:** 
  * Adjust cooldown timers in practice sessions to prevent ability spam or power imbalance.
  * Monitor healing abilities (Midas Touch, Photosynthesis, Bloodthirsty, Blood Mend) to ensure health economy remains balanced.
  * Verify soft-nerfs activate correctly; test with non-role players to confirm penalties apply.

- **Advancement Tracking:** Consider adding silent advancements to track ability usage for statistics or hidden achievements.

- **Debugging:** Use scoreboards for visibility into cooldown states, effect durations, and resource counts. Commands like `/scoreboard players list @s` help diagnose timing issues.

## 7. Known Limitations & Future Enhancements

- **Summoner Mob Persistence:** Summoned mobs despawn after 2 minutes by design (prevent mob farm abuse). Persistent storage of captured mobs requires external systems or mods.

- **Backpack Storage:** Deep Pockets (9-slot backpack) relies on custom NBT storage linked to player UUID. Multi-world support requires careful scoreboard/UUID tracking.

- **Ores Detection (Lithic Resonance):** Current raycast-based detection may not work reliably in heavily obstructed terrain. Consider alternatives like scanning loaded chunks or using marker entities.

- **Shield Sharpness Persistence:** Thou Shalt Bleed reapplies sharpness each tick; if shield is swapped mid-block, enchantment may briefly disappear.

- **PvP Lock (Waypoint):** Combat detection via last damage time (`@s[nbt={lastDeathLocation:[...]}]`) may be imprecise. Consider external combat tagging plugin integration for precision.
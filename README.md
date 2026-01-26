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
  * **Implementation:** Custom shaped recipes in `recipe/` folder.
  * **Availability:** ONLY Enchanters can use these custom recipes (role-restricted).

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

- **Summoner:** Capture a hostile mob (Non-Boss) onto a book via ritual.
  * **Capture Requirements:**
    - **Trap:** Mob must be confined in a 2×1 area (2 blocks tall, 1×1 wide—e.g., trapdoor ceiling or fence enclosure).
    - **Ritual:** Perform the following steps:
      1. Place a Lectern directly above the trapped mob (on the ceiling block).
      2. Insert a Book and Quill into the Lectern.
      3. The ritual activates automatically when the Lectern detects a valid trapped mob below.
    - **Mechanism:** Upon successful ritual completion, the mob's NBT data (`CustomName`, `Health`, `Attributes`, etc.) is transferred onto the Book and Quill in the Lectern. The original mob is killed (not despawned) to prevent duplication.
    - **Audio (Capture):** `entity.endermen.teleport` + `block.enchantment_table.use` sounds with purple particle effects.
  * **Summoning Mechanics:**
    - **Trigger:** Right-click with captured paper/book on a valid spawn surface (solid block).
    - **Role Requirement:** Does NOT require Enchanter role—summons can be traded to any player.
    - **Summoning Process:**
      1. **Delay:** 3-second channeling period (60 ticks). Player must stand still; moving cancels summoning.
      2. **Visual Effects:** Purple spiral particles (`minecraft:portal`) around spawn location, increasing in intensity.
      3. **Audio Effects:** Gradual buildup sound (`block.beacon.ambient` pitch increasing), culminating in `entity.wither.spawn` on completion.
      4. **Spawn:** Mob appears at target location; captured paper/book is consumed.
    - **Limitation:** Summoned mob dies automatically after 2 minutes (2400 ticks) via `PersistenceRequired: 0b` and timed despawn tag.
    - **Cooldown (Capture):** 600 ticks (30s) per capture attempt.
    - **Cooldown (Summon):** 200 ticks (10s) per summon.

- **Sky Mage (MODIFIED):** Right-clicking a Feather grants **Levitation II for 10s**. Feather is consumed.
  * **Trigger:** Right-click with feather in hand (any slot).
  * **Mechanism:** Removes feather from inventory; applies `minecraft:levitation` (2 levels) for 200 ticks (10s).
  * **Cooldown:** 2400 ticks (120s).
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

- **Thou Shalt Bleed:** Right-clicking with shield while holding a sword grants it Sharpness II equivalent (+1.5 Dmg).
  * **Trigger:** Right-click with shield (advancement-based `use_shield`, no tick overhead for activation).
  * **Effect:** Grants +1.5 Attack Damage (Sharpness II equivalent) to your sword for that engagement.
  * **Mechanism:** Adds `nations_blessed_blade` NBT tag and Attribute Modifier to mainhand sword.
  * **Duration:** Permanent until removal conditions met.
  * **Removal Conditions:**
    - Sword is unequipped from mainhand slot
    - Sword is held by a non-warrior player
  * **Detection:** Tick function checks all players with blessed blades for removal conditions.
  * **Audio:** `block.grindstone.use` sound on activation with enchant particles.
  * **Cooldown:** None (State-based; removes when you switch items).

- **Vanguard:** Base Health = 24 (12 Hearts).
  * **Effect:** +2 Hearts (24 Max HP).
  * **Mechanism:** Sets `max_health` to 24 on first tag assignment (`role_warrior` added) or join.
  * **Persistence:** Health modifier persists across sessions via player NBT attribute storage.
  * **Cooldown:** None (Always Active).

- **Bounty Hunter:** +50% Mob Loot.
  * **Implementation:** Custom loot tables check for `role_warrior` tag on killer.
  * **Trigger:** Mob death event (`EntityDeath`).
  * **Mechanics:** Loot table entries apply 1.5x multiplier to item counts (stacks with Looting enchantment).
  * **Audio:** None.

- **Adrenaline Rush:** At 2.5 Hearts, gain Speed II for 5s.
  * **Effect:** Grants Speed II for 5s when taking damage at low health (≤2.5 hearts).
  * **Trigger:** Advancement `took_damage` triggers function `adrenaline_rush`.
  * **Mechanism:** Applies `minecraft:speed` (2 levels) for 100 ticks (5s) when threshold met.
  * **Cooldown:** 1200 ticks (60s) between activations (prevents spam).
  * **Removal:** Speed removed after duration expires or player heals above 5 health.
  * **Audio:** `entity.generic.drink` sound on activation.

- **Bloodthirsty:** Player kill heals for 1.5 Hearts.
  * **Effect:** Heals 1.5 Hearts immediately upon killing a player.
  * **Trigger:** Advancement `killed_player` triggers function `bloodthirsty`.
  * **Mechanism:** Restores 3 health points (1.5 hearts) to killer.
  * **Cooldown:** None (per-kill).
  * **Audio:** `entity.player.levelup` sound.

- **War Cry:** Use a War Horn (Right-click) to give Strength I to nearby team members for 8s.
  * **Trigger:** Use a War Horn (advancement `use_goat_horn` detects usage).
  * **Effect:** Grants Strength I (+3.0 damage) for 8s to all teammates within 20 blocks.
  * **Acquisition:** Craftable by Warriors only (Shears + Pointed Dripstone). Non-warriors cannot hold the horn.
  * **Mechanism:** Scans 20-block radius for nearby players with `role_warrior` tag; applies `minecraft:strength` (1 level) for 160 ticks (8s).
  * **Cooldown:** 120 seconds (Global team cooldown).
  * **Audio:** `minecraft:item.goat_horn.play` sound with particle effect.



**Soft-Nerf (Trade Incentive):**

- **Fragile Shields:** Non-Warriors will receive 2x shield durability damage!
  * **Implementation:** Custom damage/durability event listener checks for `role_warrior` tag.
  * **Blocks affected:** All shield types.
  * **Mechanic:** On shield hit, check `!role_warrior` predicate; if true, apply 2x durability loss multiplier.
  * **Audio:** None.

#### **Comparison**
*   **Diamond Sword**: 7 Attack damage
*   Diamond Sword **+ Thou Shalt Bleed**: 8.5 Attack damage
*   Diamond Sword + Thou Shalt Bleed **+ War Cry**: 11.5 Attack damage
*   Overall Effect: **60% Damage bonus**

_Fighting with a Wooden Sword with both abilities on is stronger than fighting with a Netherite Sword!_



---



## 4. Balancing Notes & Implementation Guidelines

- **Non-Stacking Rule:** Most abilities are non-stackable unless explicitly stated. Effects check for existing NBT tags or scoreboard values before re-applying.

- **Cooldown Tracking:** All cooldowns use dedicated scoreboard objectives (`nations_cooldown_<ability>`) decremented per tick. Predicates block activation if cooldown > 0.

- **Resource Management:** Consumable-based abilities (feathers, amethyst shards, XP bottles, glowstone) check inventory before allowing trigger. Items removed from slots on activation.

- **Damage Events:** PvE abilities (Nature's Vengeance, Adrenaline Rush) check environment context to avoid PvP abuse.

- **Predicate Filtering:** General role checks use `data/nations/predicates/is_<role>.json` for consistent role detection. Specialized predicates (e.g., `warrior/is_killer_warrior.json` for loot tables) are organized in subdirectories.

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

---

## 8. Implementation Difficulty Analysis & Computational Assessment

### 8.1 Grouped by Implementation Difficulty

#### **TIER 1: Trivial (< 5 lines per ability, no complex logic)**

These are simple, loot-table based or direct effect applications with no scanning or iteration.

1. **Midas Touch (Farmer)** — Consumable → apply 2 effects
2. **Nature's Vengeance (Farmer)** — Consumable → summon entity
3. **Ore Yield (Miner)** — Loot table multiplier
4. **Bounty Hunter (Warrior)** — Loot table multiplier
5. **Vanguard (Warrior)** — One-time health attribute set
6. **Scavenger (Warrior)** — Loot table RNG condition (1d10)
7. **Inefficiency (Soft-Nerf, Farmer)** — Loot table RNG (1d4)
8. **Brittle Tools (Soft-Nerf, Miner)** — Durability penalty in loot table
9. **Volatile Anvils (Soft-Nerf, Enchanter)** — RNG (1d10) on interaction
10. **Fragile Shields (Soft-Nerf, Warrior)** — Durability penalty on shield hit
11. **Custom Recipes (Enchanter)** — Recipe JSON files (no code)
12. **Knowledgeable (Enchanter)** — XP level grant on event
13. **Weightless Spirit (Explorer)** — Arrow NBT tag on launch
14. **Bloodthirsty (Warrior)** — Heal on player death event

**Computational Load:** Negligible. Total per-tick: ~0.1ms if all players using.

---

#### **TIER 2: Simple (5-15 lines, single predicate + effect)**

These require per-tick checks on specific player states or simple effects.

1. **Breeding Mastery (Farmer)** — Detect interaction → modify entity NBT (3000 ticks)
2. **Optimized Yield (Farmer)** — Loot table check + multiplier
3. **Cave Dweller (Miner)** — Y < 0 check + apply 3 effects
4. **Tunnel Rat (Miner)** — Collision box check + apply 1 effect
5. **Rapid Transit (Explorer)** — Mounted + holding item → apply Speed I
6. **Trailblazer (Explorer)** — On ground + holding item → apply Speed I
7. **Adrenaline Rush (Warrior)** — Health <= 5 → apply Speed II (per-tick)
8. **Thou Shalt Bleed (Warrior)** — Shield blocking → apply Sharpness I
9. **Travel Fatigue (Soft-Nerf, Explorer)** — Sprinting/swimming state → reduce saturation
10. **Better Together (Farmer)** — Consumable → detect nearby Farmers (10-block radius)

**Computational Load:** ~0.5ms per 100 players (per-tick checks). Scales linearly.

**Common Pattern:** `execute as @a[tag=role_<role>] at @s if <condition> run <effect>`

---

#### **TIER 3: Moderate (15-40 lines, proximity checks or multiple conditions)**

These require scanning nearby entities/blocks or managing state across ticks.

1. **Specialized Smelting (Miner)** — Detect furnace interaction → tag block → per-tick 2x CookTime increment
2. **Photosynthesis (Farmer)** — Per-tick: check time/light/weather + apply absorption → manage stacking
3. **Alchemist (Enchanter)** — Jump near Brewing Stand (5-block radius) + check inventory → modify NBT
4. **Blood Sacrifice (Enchanter)** — Detect named pig death → set max_health + debuffs + check non-stackable
5. **Blood Mend (Enchanter)** — Jump near enchanting table + consume XP bottle → repair item NBT
6. **Sky Mage (Enchanter)** — Right-click feather → remove item + apply levitation
7. **Set Home / Home Warp (Explorer)** — Store/retrieve coordinates in scoreboard
8. **Rapid Transit + Trailblazer (Explorer)** — Multiple per-tick condition checks (mounted vs on-ground)
9. **War Cry (Warrior)** — Scan 10-block radius → apply effect to all allies + manage global cooldown

**Computational Load:** ~1.5ms per 100 players (multiple `@a` selectors, proximity checks).

**Bottleneck Pattern:** `execute as @a at @s if ... run ... as @e[distance=..10] run ...`

---

#### **TIER 4: Complex (40+ lines, intensive scanning or state management)**

These require repeated block/entity scans, raycasting, or complex coordinate tracking.

1. **Composter Automation (Farmer)** — On place: summon marker → scan 9×9 area → increment crop ages (per-tick)
2. **Lithic Resonance (Miner)** — Per-tick: check amethyst + crouch → raycast/scan 20-block radius → find nearest ore → play directional sound
3. **Dowsing Rod (Explorer)** — On use: scan 64-block radius for chests/spawners → track nearest → continuous particles every 5 ticks for 30s
4. **Deep Pockets (Explorer)** — Inventory management + death persistence + UUID-based storage (9-slot backpack system)
5. **Smuggler (Explorer)** — Cross-player inventory transfer + UUID lookup + optional mail storage
6. **Summoner (Enchanter)** — Capture mob NBT → serialize to paper → manage despawn timer (2-minute persistence)

**Computational Load:** 
- **Composter + Lithic Resonance + Dowsing Rod:** ~3-5ms per 100 players per tick (heavy block scanning)
- **Deep Pockets + Summoner:** ~2-3ms per 100 players (NBT operations + tracking)

**Worst Case (all 6 complex abilities active):** ~8-10ms per 100 players/tick (10% server TPS impact).

**Bottleneck Patterns:**
- `execute as @a at @s as @e[type=marker,distance=..20] run ...` (repeats for every Farmer)
- `summon marker ... {data: ...}` + per-tick scanning
- `particle` commands in loops (Dowsing Rod: 600 ticks × 120 particles/tick = 72k particles)

---

### 8.2 Computationally Heavy Functionalities & Optimization Strategies

#### **🔴 CRITICAL: Dowsing Rod (Explorer)**

**Problem:**
- Scans 64-block radius (262,144 blocks checked) per activation
- Spawns 120 particle effects per player every 5 ticks over 30s = 72,000 particles total
- Runs on potentially 10+ explorers simultaneously

**Impact:** 2-3ms per Dowsing Rod user per 5-tick cycle.

**Optimization:**
1. **Reduce scan radius:** 32 blocks instead of 64 (65,536 blocks; -75% checks)
2. **Reduce particle frequency:** Every 10 ticks instead of 5 (36,000 particles; -50%)
3. **Use faster particle types:** `dust` instead of `end_rod` (smaller hitbox, faster rendering)
4. **Scan only loaded chunks:** Pre-filter with `execute if loaded`
5. **Cache nearest result:** If no new chests/spawners found, reuse last location (don't rescan every tick)

**Revised Implementation:**
```mcfunction
# Only rescan every 20 ticks (1 second), reuse cached target
execute as @a[tag=dowsing_active,scores={dowsing_scan=0}] at @s run function nations:explorer/dowsing_scan_chunk
execute as @a[tag=dowsing_active] at @s run particle dust 0 1 1 1 ^ ^ ^20 0 0 0 0.1 1

scoreboard players add @a[tag=dowsing_active] dowsing_scan 1
scoreboard players set @a[tag=dowsing_active,scores={dowsing_scan=20..}] dowsing_scan 0
```

**Estimated Improvement:** 1ms → 0.3ms per user.

---

#### **🟠 HIGH: Lithic Resonance (Miner) – Ore Detection**

**Problem:**
- 20-block raycast/scan per crouch-holding-amethyst miner every 10 ticks
- Multiple miners active = repeated scanning of same zones
- Sound location calculation for nearest ore (requires distance math)

**Impact:** 0.8-1.2ms per Lithic Resonance user.

**Optimization:**
1. **Use `execute positioned` instead of raycasting:** Test blocks along cardinal directions only
2. **Reduce scan radius:** 16 blocks instead of 20 (-36% volume)
3. **Cache ore locations:** Store nearest ore location in scoreboard, only rescan if >10 blocks away or time > 30s
4. **Group miners:** Shared scan for miners in same region (detect overlapping ranges)
5. **Sound only if ore found:** Avoid redundant sound plays

**Revised Implementation:**
```mcfunction
# Every 20 ticks, rescan nearby ores
execute as @a[tag=role_miner,nbt={Sneaking:1b}] if predicate nations:holding_amethyst at @s run function nations:miner/scan_ores_optimized

# scan_ores_optimized: check only N/S/E/W directions at 4-block intervals
execute positioned ~16 ~ ~ if block ~ ~ ~ #ore_blocks run scoreboard players set @s nearest_ore_dist 16
execute positioned ~-16 ~ ~ if block ~ ~ ~ #ore_blocks run scoreboard players set @s nearest_ore_dist 16
# ... etc for vertical and diagonal ...
```

**Estimated Improvement:** 1.0ms → 0.3ms per user.

---

#### **🟠 HIGH: Composter Automation (Farmer) – Crop Scanning**

**Problem:**
- 9×9 area scan (81 blocks) per composter placement
- Per-tick: marker checks each player in range → scans crop blocks → increments age values
- Multiple farmers = multiple markers active

**Impact:** 0.6-0.9ms per active composter/tick.

**Optimization:**
1. **One-time scan on placement:** Scan crops once, store locations in marker NBT
2. **Remove marker after completion:** Once all crops aged, despawn marker (don't persist across ticks)
3. **Stagger updates:** Age crops over 5 ticks (1 per tick) instead of all at once
4. **Lazy loading:** Only activate markers if a Farmer is within 16 blocks (use tags)

**Revised Implementation:**
```mcfunction
# On place, create marker with crop data
summon marker ~4.5 ~ ~4.5 {Tags:["composter_marker"], data: {crops_found: 0}}

# Scan once on creation
execute as @e[type=marker,tag=composter_marker,tag=!scanned] at @s run function nations:farmer/scan_crops

# Age crops over 5 ticks, then despawn marker
execute as @e[type=marker,tag=composter_marker,scores={compost_age=5}] run kill @s
```

**Estimated Improvement:** 0.8ms → 0.2ms per composter.

---

#### **🟡 MODERATE: Deep Pockets (Explorer) – NBT Storage**

**Problem:**
- Every inventory open = scan all 36 slots for item data
- Death handling = copy 9 custom slot NBTs to persistent storage (UUID key)
- Respawn = retrieve NBT by UUID (potential O(n) lookup if using score table)

**Impact:** 0.3-0.5ms per inventory open, 0.2ms per death.

**Optimization:**
1. **Use player UUID as scoreboard key:** Store with `/scoreboard players set <uuid> explorer_backpack_slot_1 <item_id>`
2. **Persistent entity storage:** Create hidden armor_stand with UUID name, store NBT there (survives player death)
3. **Lazy load on open only:** Don't track all 9 slots every tick; only load when player opens backpack
4. **Compress NBT:** Store only `id`, `Count`, and custom NBT (skip enchantments/attributes if not needed)

**Revised Implementation:**
```mcfunction
# On backpack open
summon marker ~ ~ ~ {Tags:["backpack_<uuid>"]}
# Load 9 items from NBT stored on marker

# On inventory change, save to marker NBT
execute as @s[nbt={Inventory:[...]}] run data modify entity @e[tag=backpack_<uuid>] {} set from entity @s data
```

**Estimated Improvement:** 0.5ms → 0.15ms (with lazy loading).

---

#### **🟡 MODERATE: Better Together (Farmer) – Proximity Healing**

**Problem:**
- Per-consume event: scan all players within 10 blocks (`@a[distance=..10]`)
- With 20+ farmers eating = 20 × nearby player checks = quadratic complexity
- Apply hunger effect to each nearby farmer

**Impact:** 0.2-0.4ms per simultaneous food consumer.

**Optimization:**
1. **Use team selectors:** Pre-assign team affiliations (faster than tag checks)
2. **Throttle checks:** Only apply every 5 ticks, not every tick
3. **Limit nearby player count:** Cap at 5 nearest farmers (use `limit=5`)
4. **Store hunger restore in scoreboard:** Batch apply effects once per tick

**Revised Implementation:**
```mcfunction
# On consume
execute as @a[team=farmers,distance=..10,limit=5] run scoreboard players add @s hunger_restore <amount>

# Once per tick
execute as @a[scores={hunger_restore=1..}] run effect give @s saturation 0 <level>
scoreboard players reset @a hunger_restore
```

**Estimated Improvement:** 0.4ms → 0.1ms (with batching).

---

#### **🟡 MODERATE: War Cry (Warrior) – Team AOE**

**Problem:**
- Per activation: scan 10-block radius + apply effect to all nearby allies
- Global cooldown = check all warriors, prevent duplicate triggers

**Impact:** 0.2-0.3ms per activation.

**Optimization:**
1. **Use team selector:** `@a[team=warriors,distance=..10]` instead of manual tag check
2. **Cooldown via scoreboard:** Single objective, decrement once per tick (O(1) vs O(n) checking)
3. **Cap effect radius:** Limit to 5 nearest allies instead of all (use `limit=5`)

**Revised Implementation:**
```mcfunction
# On activation
execute as @s[team=warriors,scores={war_cry_cd=0}] at @s as @a[team=warriors,distance=..10,limit=5] run effect give @s strength 5 0
scoreboard players set @s[team=warriors] war_cry_cd 120

# Global decrement (one function call)
scoreboard players remove @a[scores={war_cry_cd=1..}] war_cry_cd 1
```

**Estimated Improvement:** 0.3ms → 0.08ms.

---

#### **🟢 LOW: Summoner (Enchanter) – Mob Capture**

**Problem:**
- Capture: serialize entity NBT to paper (10-20ms one-time)
- Summon: deserialize NBT from paper to new entity (10-20ms per summon)
- Despawn timer: check all summoned mobs every tick (120 ticks max)

**Impact:** One-time 20ms on capture, one-time 20ms on summon, negligible per-tick.

**Optimization:**
1. **Use `/data`commands efficiently:** Cache NBT paths, avoid redundant reads
2. **Despawn via scoreboard:** Age counter decremented per tick, kill at 0 (O(n) but n = summoned mobs only)
3. **Limit concurrent mobs:** Max 3 summoned mobs per Enchanter (prevents mob farm abuse)

**Revised Implementation:**
```mcfunction
# Capture (one-time)
data modify block ~ ~ ~ Items[0].tag.MobData set from entity @e[type=zombie,limit=1] {}

# Summon with despawn counter
summon zombie ~ ~ ~ {Tags:["summoned"],Age:0}
scoreboard players set @e[tag=summoned] summon_age 0

# Per-tick despawn check
scoreboard players add @e[tag=summoned] summon_age 1
kill @e[tag=summoned,scores={summon_age=2400}]
```

**Estimated Improvement:** Already optimal (~0ms per-tick).

---

### 8.3 Cumulative Server Impact Estimate

**Scenario:** 40-player SMP with balanced role distribution (8 per role)

| Phase | Farmers | Miners | Enchanters | Explorers | Warriors | **Total/tick** |
|-------|---------|--------|------------|-----------|----------|---|
| **Idle** | 0.4ms | 0.4ms | 0.2ms | 0.4ms | 0.3ms | **1.7ms (0.17% TPS)** |
| **Active (all abilities)** | 2.5ms | 3.0ms | 2.5ms | 8.0ms | 2.0ms | **18ms (1.8% TPS)** |
| **Peak (Dowsing Rod + Lithic)** | 2.5ms | 4.5ms | 2.5ms | 9.0ms | 2.0ms | **20.5ms (2.05% TPS)** |
| **Optimized** | 1.2ms | 1.5ms | 1.5ms | 4.0ms | 1.0ms | **9.2ms (0.92% TPS)** |

**Recommendation:** Current design is **acceptable** (< 2% TPS impact). With optimizations, reduces to **< 1% TPS impact**.

---

### 8.4 Implementation Priority for Optimization

1. **Phase 1 (Critical):** Optimize Dowsing Rod (64-block radius scan) — save 2-3ms
2. **Phase 2 (High):** Optimize Lithic Resonance (ore detection raycast) — save 0.7ms
3. **Phase 3 (High):** Optimize Composter Automation (crop scanning) — save 0.6ms
4. **Phase 4 (Moderate):** Optimize Better Together + War Cry (proximity checks) — save 0.3ms
5. **Phase 5 (Low):** Optimize Deep Pockets (lazy load backpack) — save 0.35ms

**Total Potential Savings:** ~4.0ms per-tick (halves computational load).

---

## 9. Advanced Optimization: Advancement-Triggered Abilities (Vanilla Items + Predicates)

### 9.1 Problem: Per-Tick vs. Event-Driven Design

**Current Approach (Per-Tick):**
```mcfunction
execute as @a[tag=role_farmer] at @s if score @s photosynthesis_timer <= 0 if predicate is_daylight run effect give @s absorption
scoreboard players remove @a[tag=role_farmer,scores={photosynthesis_timer=1..}] photosynthesis_timer 1
```
- Runs **every tick** for every player (40 ticks/sec × 40 players = 1,600 executions/sec)
- Wastes CPU checking players not using ability
- **Cost:** ~0.5ms per 100 players

**Advancement-Triggered Approach (Vanilla Items):**
```json
{
  "criteria": {
    "ate_apple_as_farmer": {
      "trigger": "minecraft:consume_item",
      "conditions": {
        "player": [
          {"condition": "minecraft:entity_properties", "entity": "this", "predicate": {"nbt": ["Tags[\"role_farmer\"]"]}}
        ],
        "item": {"items": ["minecraft:apple"]}
      }
    }
  },
  "requirements": [["ate_apple_as_farmer"]],
  "rewards": {"function": "nations:farmer/midas_touch"}
}
```
- Uses **vanilla apple** — no custom items needed
- Fires **only on consume event** (~10 times/sec for all players, not per tick)
- Role check happens in advancement predicate
- **Cost:** ~0.05ms per 100 players (10× faster)

---

### 9.2 Advancement-Based Abilities (Vanilla Items + Role Predicates)

#### **Category 1: Consumable-Based (Use vanilla food/potion items)**

| Ability | Vanilla Item | Predicate Check | Reward Function |
|---------|---|---|---|
| **Midas Touch** | `minecraft:apple` | Has `role_farmer` tag | Apply absorption + regen |
| **Better Together** | Any food item | Has `role_farmer` tag + nearby farmers within 10 blocks | Proximity heal to nearby farmers |
| **Nature's Vengeance** | `minecraft:beetroot` | Has `role_farmer` tag | Summon evoker fangs |
| **Knowledgeable** | N/A (Enchanting Table use) | Has `role_enchanter` tag | Grant +1 XP level |

**Advancement Predicate Example (Midas Touch):**
```json
{
  "display": {"icon": {"item": "minecraft:apple"}, "hidden": true, "announce": false},
  "criteria": {
    "ate_apple_as_farmer": {
      "trigger": "minecraft:consume_item",
      "conditions": {
        "player": [
          {"condition": "minecraft:entity_properties", "entity": "this", 
           "predicate": {"nbt": ["Tags[\"role_farmer\"]"]}}
        ],
        "item": {"items": ["minecraft:apple"]}
      }
    }
  },
  "requirements": [["ate_apple_as_farmer"]],
  "rewards": {"function": "nations:farmer/midas_touch"}
}
```

---

#### **Category 2: Item-Use-Based (Right-click events on vanilla items)**

| Ability | Vanilla Item | Trigger | Predicate Check |
|---------|---|---|---|
| **Sky Mage** | `minecraft:feather` | `using_item` | Has `role_enchanter` tag + cooldown check in reward |
| **Dowsing Rod** | `minecraft:amethyst_shard` | `item_used_on_block` | Has `role_explorer` tag |
| **War Cry** | Any `minecraft:axe` | `using_item` | Has `role_warrior` tag + global cooldown |
| **Weightless Spirit** | Arrow in `shot_projectile` | `shot_projectile` | Has `role_explorer` tag + glowstone in offhand |

**Advancement Predicate Example (Sky Mage):**
```json
{
  "display": {"icon": {"item": "minecraft:feather"}, "hidden": true, "announce": false},
  "criteria": {
    "used_feather_as_enchanter": {
      "trigger": "minecraft:using_item",
      "conditions": {
        "player": [
          {"condition": "minecraft:entity_properties", "entity": "this", 
           "predicate": {"nbt": ["Tags[\"role_enchanter\"]"]}}
        ],
        "item": {"items": ["minecraft:feather"]}
      }
    }
  },
  "rewards": {"function": "nations:enchanter/sky_mage_check"}
}
```

**Reward Function with Cooldown Check:**
```mcfunction
# sky_mage_check: validate cooldown before casting
execute if score @s sky_mage_cd matches ..0 run function nations:enchanter/sky_mage_cast
```

---

#### **Category 3: Entity-Death-Based (Kill events with predicates)**

| Ability | Entity Killed | Predicate Condition | Reward |
|---|---|---|---|
| **Blood Sacrifice** | Pig | Named "Vessel" + killed by `role_enchanter` | Set max_health to 24 + debuffs |
| **Bloodthirsty** | Player | Killed by `role_warrior` | Heal 1.5 hearts |
| **Scavenger** | Mob (any) | Killed by `role_warrior` + 10% RNG | Drop armor/weapon at full durability |

**Advancement Predicate Example (Blood Sacrifice):**
```json
{
  "display": {"icon": {"item": "minecraft:redstone"}, "hidden": true, "announce": false},
  "criteria": {
    "killed_vessel_pig": {
      "trigger": "minecraft:entity_killed",
      "conditions": {
        "entity": [
          {"condition": "minecraft:entity_properties", "entity": "this",
           "predicate": {"type": "minecraft:pig"}}
        ],
        "player": [
          {"condition": "minecraft:entity_properties", "entity": "this",
           "predicate": {"nbt": ["Tags[\"role_enchanter\"]"]}}
        ]
      }
    }
  },
  "rewards": {"function": "nations:enchanter/blood_sacrifice_check"}
}
```

**Reward Function (validate named "Vessel"):**
```mcfunction
# blood_sacrifice_check: verify pig name before applying effect
execute if entity @e[type=pig,name='"Vessel"',distance=..5] run function nations:enchanter/blood_sacrifice
```

---

### 9.3 Reducing Per-Tick Checks to Interval-Based (Every 10+ Ticks)

For abilities that **must** remain continuous (position-based), reduce frequency from every-tick to interval-based:

#### **Original Per-Tick (Runs every tick = 20 times/sec):**
```mcfunction
execute as @a[tag=role_miner] at @s if predicate is_underground run effect give @s haste
execute as @a[tag=role_miner] at @s if predicate is_underground run effect give @s night_vision
```
- **Cost:** 0.3ms per 100 players (heavy overhead)

#### **Optimized (Run every 10 ticks = 2 times/sec):**
```mcfunction
# In main tick.mcfunction
scoreboard players add tick_counter dummy 1
execute if score tick_counter dummy matches 10 run function nations:interval_checks
execute if score tick_counter dummy matches 20 run scoreboard players set tick_counter dummy 0

# In nations:interval_checks (runs every 10 ticks only)
execute as @a[tag=role_miner] at @s if predicate nations:is_below_y0 run effect give @s haste 10 0
execute as @a[tag=role_miner] at @s if predicate nations:is_below_y0 run effect give @s night_vision 10 0
execute as @a[tag=role_miner] at @s if predicate nations:is_below_y0 run effect give @s resistance 10 0
```

**Effect Duration Adjustment:**
- Effects persist 10 ticks (0.5s) after checks
- Re-apply every 10 ticks to maintain coverage
- **Savings:** 90% reduction (9/10 ticks eliminated)

---

### 9.4 Per-Tick → Interval-Based Conversion

| Ability | Original Frequency | Optimized Frequency | Effect Duration | Savings |
|---------|---|---|---|---|
| **Photosynthesis** | Every 1 tick | Every 10 ticks | 10 ticks | -90% |
| **Cave Dweller** | Every 1 tick | Every 10 ticks | 10 ticks | -90% |
| **Tunnel Rat** | Every 1 tick | Every 10 ticks | 10 ticks | -90% |
| **Trailblazer** | Every 1 tick | Every 10 ticks | 10 ticks | -90% |
| **Thou Shalt Bleed** | Every 1 tick | Every 10 ticks | 10 ticks | -90% |
| **Adrenaline Rush** | Every 1 tick | Every 10 ticks | Remains 100 ticks | -90% |
| **Rapid Transit** | Every 1 tick | Every 10 ticks | 10 ticks | -90% |
| **Travel Fatigue** | Every 1 tick | Every 10 ticks | Saturation drain 10 ticks | -90% |
| **Lithic Resonance** | Every 10 ticks | Every 20 ticks | Sound still plays every 20 ticks | -50% |
| **Specialized Smelting** | Every 1 tick | Every 10 ticks | Cook time still incremented every 10 ticks | -90% |

**Implementation Pattern (Interval-based):**
```mcfunction
# tick.mcfunction
scoreboard players add tick_counter dummy 1

# Run checks every 10 ticks
execute if score tick_counter dummy matches 10 run function nations:check_interval_10

# Reset counter at 20 (two cycles per second)
execute if score tick_counter dummy matches 20 run scoreboard players set tick_counter dummy 0

# In nations:check_interval_10
execute as @a[tag=role_farmer] at @s if predicate nations:is_in_sunlight run effect give @s absorption 10 3
execute as @a[tag=role_miner] at @s if predicate nations:is_underground run effect give @s haste 10 0
execute as @a[tag=role_explorer] at @s if predicate nations:on_ground run effect give @s speed 10 0
execute as @a[tag=!role_explorer,nbt={Sprinting:1b}] unless predicate nations:in_water run function nations:travel_fatigue
```

---

### 9.5 Predicate Library for Interval Checks

Create reusable predicates in `data/nations/predicates/`:

```json
// is_below_y0.json — Cave Dweller, Tunnel Rat
{
  "condition": "minecraft:location_check",
  "predicate": {"position": {"y": {"max": 0}}}
}

// is_in_sunlight.json — Photosynthesis
{
  "condition": "minecraft:light_level_check",
  "predicate": {"light": {"min": 15}}
}

// on_ground.json — Trailblazer, Rapid Transit
{
  "condition": "minecraft:entity_properties",
  "entity": "this",
  "predicate": {"on_ground": true}
}

// in_water.json — Travel Fatigue
{
  "condition": "minecraft:location_check",
  "predicate": {"fluid": {"fluid": "minecraft:water"}}
}

// is_sneaking.json — Lithic Resonance
{
  "condition": "minecraft:entity_properties",
  "entity": "this",
  "predicate": {"nbt": ["Sneaking:1b"]}
}

// is_riding.json — Rapid Transit
{
  "condition": "minecraft:entity_properties",
  "entity": "this",
  "predicate": {"nbt": ["RootVehicle.Entity:{}"]}
}

// holding_amethyst.json — Lithic Resonance
{
  "condition": "minecraft:match_tool",
  "predicate": {"items": ["minecraft:amethyst_shard"]}
}

// holding_stick.json — Rapid Transit
{
  "condition": "minecraft:match_tool",
  "predicate": {"items": ["minecraft:stick"]}
}

// is_daytime.json — Photosynthesis
{
  "condition": "minecraft:time_check",
  "value": {"min": 0, "max": 12000}
}
```

---

### 9.6 Complete Workflow: No Custom Items, Vanilla Only

#### **Example 1: Midas Touch (Apple consume)**

**1. Advancement (role check on vanilla apple consumption):**
```json
{
  "display": {"icon": {"item": "minecraft:apple"}, "hidden": true, "announce": false},
  "criteria": {
    "ate_apple_as_farmer": {
      "trigger": "minecraft:consume_item",
      "conditions": {
        "player": [
          {"condition": "minecraft:entity_properties", "entity": "this",
           "predicate": {"nbt": ["Tags[\"role_farmer\"]"]}}
        ],
        "item": {"items": ["minecraft:apple"]}
      }
    }
  },
  "requirements": [["ate_apple_as_farmer"]],
  "rewards": {"function": "nations:farmer/midas_touch"}
}
```

**2. Reward Function (simple effect application):**
```mcfunction
# data/nations/functions/farmer/midas_touch.mcfunction
effect give @s absorption 2 120
effect give @s regeneration 1 40
playsound entity.player.levelup master @s ~ ~ ~ 1 1
```

**3. Done.** Player eats vanilla apple → advancement checks role predicate → function runs. No custom items, no per-tick checks.

---

#### **Example 2: Sky Mage (Feather right-click with cooldown)**

**1. Advancement (role check on vanilla feather use):**
```json
{
  "display": {"icon": {"item": "minecraft:feather"}, "hidden": true, "announce": false},
  "criteria": {
    "used_feather_as_enchanter": {
      "trigger": "minecraft:using_item",
      "conditions": {
        "player": [
          {"condition": "minecraft:entity_properties", "entity": "this",
           "predicate": {"nbt": ["Tags[\"role_enchanter\"]"]}}
        ],
        "item": {"items": ["minecraft:feather"]}
      }
    }
  },
  "requirements": [["used_feather_as_enchanter"]],
  "rewards": {"function": "nations:enchanter/sky_mage_check"}
}
```

**2. Cooldown Validation Function:**
```mcfunction
# data/nations/functions/enchanter/sky_mage_check.mcfunction
# Only cast if cooldown not active
execute if score @s sky_mage_cd matches ..0 run function nations:enchanter/sky_mage_cast
```

**3. Cast Function (actual ability):**
```mcfunction
# data/nations/functions/enchanter/sky_mage_cast.mcfunction
effect give @s levitation 2 60
clear @s feather 1
scoreboard players set @s sky_mage_cd 15
playsound item.firecharge.use master @s ~ ~ ~ 1 1
```

---

#### **Example 3: Cave Dweller (Every 10 ticks, not per-tick)**

**1. Main tick loop (in tick.mcfunction):**
```mcfunction
scoreboard players add tick_counter dummy 1

# Decrement cooldowns every tick
scoreboard players remove @a[scores={cave_check_cd=1..}] cave_check_cd 1

# Run position checks every 10 ticks
execute if score tick_counter dummy matches 10 run function nations:check_positions
execute if score tick_counter dummy matches 20 run scoreboard players set tick_counter dummy 0
```

**2. Position Check Function (runs every 10 ticks):**
```mcfunction
# data/nations/functions/check_positions.mcfunction
execute as @a[tag=role_miner] at @s if predicate nations:is_below_y0 run effect give @s night_vision 10 0
execute as @a[tag=role_miner] at @s if predicate nations:is_below_y0 run effect give @s haste 10 0
execute as @a[tag=role_miner] at @s if predicate nations:is_below_y0 run effect give @s resistance 10 0

execute as @a[tag=role_farmer] at @s if predicate nations:is_in_sunlight run effect give @s absorption 10 3

execute as @a[tag=role_explorer] at @s if predicate nations:on_ground if predicate nations:holding_compass_or_spyglass run effect give @s speed 10 0
```

---

### 9.7 Revised Computational Impact

**Scenario:** 40-player SMP, 8 per role

| Phase | Before | After | Savings |
|-------|--------|-------|---------|
| **Consumable Advancements** | 0.3ms | 0.05ms | **-0.25ms** |
| **Item-Use Advancements** | 0.3ms | 0.05ms | **-0.25ms** |
| **Position-Based (10-tick)** | 2.0ms | 0.2ms | **-1.8ms** |
| **Entity-Kill Advancements** | 0.1ms | 0.01ms | **-0.09ms** |
| **Complex Abilities (Optimized)** | 3.0ms | 1.5ms | **-1.5ms** |
| **Loot Tables + Misc** | 0.5ms | 0.5ms | — |
| **TOTAL** | 6.1ms | **2.35ms** | **-61% reduction** |

**New Server Impact (40 players):**
- **Idle:** ~1.0ms (0.1% TPS)
- **Active:** ~2.35ms (0.24% TPS)
- **Peak:** ~3.0ms (0.3% TPS)

**vs Original Design (18ms for active):** **6-8× improvement** ✅

---

### 9.8 Implementation Checklist: Vanilla Items + Intervals

**Phase 1: Advancement Setup (Week 1)**
- [ ] Create advancement JSONs for all consumable abilities (Midas Touch, Better Together, Nature's Vengeance, Knowledgeable)
- [ ] Test role predicate in advancements on **vanilla items** (no custom model data)
- [ ] Create reward functions with cooldown/effect logic
- [ ] Build predicate library (is_below_y0, is_in_sunlight, etc.)

**Phase 2: Item-Use Advancements (Week 2)**
- [ ] Create advancement JSONs for item-use abilities (Sky Mage, Dowsing Rod, War Cry, Weightless Spirit)
- [ ] Test `using_item`, `item_used_on_block`, `shot_projectile` triggers on **vanilla items**
- [ ] Add cooldown management to reward functions
- [ ] Verify hand/offhand detection (glowstone for Weightless Spirit, etc.)

**Phase 3: Entity-Kill Advancements (Week 2)**
- [ ] Create advancement JSONs for death-based abilities (Blood Sacrifice, Bloodthirsty, Scavenger)
- [ ] Test entity_killed trigger with role predicates
- [ ] Add RNG logic for Scavenger (10% chance in reward function)
- [ ] Validate entity name checking (Vessel pig) in reward functions

**Phase 4: Interval-Based Position Checks (Week 3)**
- [ ] Implement tick counter in main tick.mcfunction (counts 0-20)
- [ ] Convert all per-tick position-based abilities to 10-tick intervals
- [ ] Adjust effect durations (currently 10 ticks; tune if needed for gameplay feel)
- [ ] Test predicate library matches actual conditions

**Phase 5: Testing & Optimization (Week 4)**
- [ ] Measure server impact before/after (use `/debug start/stop`)
- [ ] Verify all role checks work correctly on vanilla items
- [ ] Test advancement predicate accuracy (does it fire only on role_farmer?)
- [ ] Ensure 0.5s interval delay doesn't feel clunky for position-based abilities
- [ ] Full player load test (40 players simultaneous)

---

### 9.9 Advantages of This Approach

✅ **No custom items needed** — Uses vanilla apple, feather, shard, axe, etc.  
✅ **Role checked in advancement predicate** — Vanilla items work for all players; only role_farmer triggers Midas Touch  
✅ **Event-driven** — Only executes when player actually uses ability  
✅ **Much lower server load** — 6-8× faster than per-tick checks  
✅ **Backward compatible** — All vanilla items unchanged; no asset modifications  
✅ **Easy to debug** — Advancement criteria visible in JSON, functions are minimal  
✅ **Scalable** — Handles 40+ players without TPS impact  
✅ **Interval reduction** — Position-based checks run only every 10 ticks instead of every tick  

---

### 9.10 Limitations & Mitigations

| Limitation | Mitigation |
|---|---|
| Advancement can only grant once, then must be revoked | Use cooldown scoreboard in reward function; revoke advancement after cooldown expires via function |
| No way to check "holding item in offhand" directly in predicate | Validate in reward function via `@s[nbt={Inventory:[{Slot:-106b}]}]` |
| Entity_killed trigger fires for all kills (not filtered by role in event) | Add role predicate in advancement criteria; reward function validates further |
| Position checks every 10 ticks = 0.5s delay | Accept delay or reduce interval to 5 ticks; test gameplay feel |
| `announce: false` hides advancement notification but doesn't prevent log spam | Consider batch advancement grant to minimize event spam |

---

### 9.11 Recommended Implementation Roadmap

**Phase 1 (Week 1): Advance Triggers + Vanilla Items**
1. Create 4 advancement JSONs for consumable abilities (Midas Touch, Better Together, Nature's Vengeance, Knowledgeable)
2. Test triggers on **vanilla** apple, beetroot, food, etc. (no custom items)
3. Verify role predicate accuracy in advancement criteria

**Phase 2 (Week 2): Item-Use Triggers**
4. Create 4 advancement JSONs for item-use abilities (Sky Mage feather, Dowsing Rod shard, War Cry axe, Weightless Spirit arrow)
5. Test right-click/item-use event handling
6. Validate offhand item detection for Weightless Spirit

**Phase 3 (Week 2): Entity-Kill Triggers**
7. Create 3 advancement JSONs for death-based abilities (Blood Sacrifice, Bloodthirsty, Scavenger)
8. Test entity_killed triggers with role role predicates
9. Add entity name validation (Vessel) in reward functions

**Phase 4 (Week 3): Interval-Based Checks**
10. Build tick counter and check_positions function
11. Convert all 8 position-based abilities to 10-tick intervals
12. Fine-tune effect durations for gameplay feel

**Phase 5 (Week 4): Testing & Measurement**
13. Run `/debug start` before and after optimization
14. Verify TPS improvement (expect 6-8× faster)
15. Full 40-player load test
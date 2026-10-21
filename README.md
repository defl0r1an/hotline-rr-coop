# Hotline Miami Super R-R — Online Co-op Mod

2-player **online co-op** for the Hotline Miami fan mod "Super R-R" (version 29.10.0).

Each player plays on their own PC with their own camera. The host controls the game flow (level selection, floor transitions); enemies, combat, doors, and dialogues are replicated in real time.

## Features (Current State — Beta / Release Candidate)

- **Networking**: ENet-based DLL (`SuperRRCoop.dll`) with a worker thread; CRC32 build validation, auto-reconnect after `game_restart`, Tailscale / Radmin VPN / LAN support.
- **Co-op Menu**: HOST / JOIN / IP entry integrated into the main menu (under CO-OP).
- **Level Sync**: Client follows the host into any chapter and through all floor transitions.
- **Player Visibility**: Both players see each other with full animations (masks, body direction, weapons, legs).
- **Enemy Replication**: Host enemies appear on the client as ghosts (20 Hz); AI targets whichever player is closest.
- **Combat**: Gun shots, melee, throws, pickups, human shields, explosions, and ground executions work both ways.
- **Synchronized Doors**: Doors swing on contact from either player (or enemies), knocking down anyone behind them; swing angle and speed are network-replicated.
- **Story & Dialogue Sync**: Shared dialogue text and animated speaker portraits; picking up ringing phones or talking to NPCs requires both players to be nearby ("WAIT FOR YOUR PARTNER"); host controls advancing and skipping lines.
- **Boss Floors**: Dedicated handlers for Boss 1/2/4, Jones, Panther, Bodyguard, CEO, Inspector, SWAT, and Waiters.
- **Vehicles & Exits**: Cars, bikes, vans, stairs, and elevators can be used by either player once the floor is cleared.
- **Death & Spectator Camera**: When one player dies, their camera smoothly tracks the surviving partner. R restarts only when both players are dead; a dead player automatically respawns on the next floor.

## Quick Start (Pre-built Release)

1. Download the latest `Hotline_Miami_Super_RR_Coop.zip` from [Releases](https://github.com/defl0r1an/hotline-rr-coop/releases).
2. Extract the archive onto both PCs.
3. If using Tailscale / Radmin VPN, run `coop_firewall.bat` once on the host PC to allow incoming UDP on port 27515.
4. Launch `Hotline Miami Super R-R.exe` on both PCs.
5. Host: Go to **CO-OP** → **HOST GAME** (shows your VPN IP).
6. Client: Go to **CO-OP** → **IP:** (enter host's VPN IP) → **JOIN GAME**.
7. Host selects a chapter — both players enter the game together!

## Requirements (for building from source)

- **Hotline Miami Super R-R** v29.10.0
- **Windows** (32-bit GameMaker runner)
- **MSVC 2022 Build Tools** (to compile the DLL)
- **UndertaleModCli 0.9.2** (in `_tools/utmt_cli/`)
- **ENet 1.3.18** source (in `_tools/deps/enet/enet-1.3.18/`)

## Building from source

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File coop\build_all.ps1
```

This compiles `SuperRRCoop.dll`, patches `_backup_original/data.win` → `_work/data.win`, and packages the test build into `_work/game/`.

To package a standalone ready-to-run release zip:
```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File coop\package_release.ps1
```

## Releasing

Release notes are tracked in the repository, in English: `docs/RELEASE_NOTES_v<version>.md`.
Publish (or update) the GitHub release from that file, never from a gitignored local note:

```powershell
gh release create v<version> _dist\Hotline_Miami_Super_RR_Coop.zip --notes-file docs\RELEASE_NOTES_v<version>.md
gh release edit v<version> --notes-file docs\RELEASE_NOTES_v<version>.md
```

## Folder Structure

| Path | Description |
|---|---|
| `coop/dll/` | C++ source for `SuperRRCoop.dll` (ENet networking) |
| `coop/gml/` | New GML scripts and objects (`objCoopNet`, `objCoopPuppet`) |
| `coop/hooks/` | Hooks into existing game events |
| `coop/patch/` | UTMT patcher script (`ApplyCoop.csx`) + special enemy retarget rules |
| `coop/dist/` | Firewall helper scripts (`coop_firewall.bat` / `.ps1`) |
| `coop_notes/` | Architecture design, reviewer notes, subsystem maps |
| `decompiled/` | Decompiled reference code of the original game |

## Configuration

Settings are saved in `coop.ini` next to the executable:

```ini
[coop]
ip=100.x.x.x
port=27515
name=Player1
windowed=0
```

## License

This mod is provided for personal use. Hotline Miami is © Devolver Digital / Dennaton Games.

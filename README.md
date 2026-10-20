# Hotline Miami Super R-R — Online Co-op Mod

2-player **online co-op** for the Hotline Miami fan mod "Super R-R" (version 29.10.0).

Each player plays on their own PC with their own camera. The host controls the game flow (level selection, floor transitions); enemies and combat are replicated to the client in real time.

## Features (current state)

- **Networking**: ENet-based DLL (`SuperRRCoop.dll`) with a worker thread; CRC32 build validation, auto-reconnect after `game_restart`, Tailscale/Radmin VPN support
- **Co-op menu**: HOST / JOIN / IP entry integrated into the main menu
- **Level sync**: client follows the host into any chapter and through floor transitions
- **Player visibility**: both players see each other (puppet rendering with masks, weapons, legs)
- **Enemy replication**: host enemies appear on the client as ghosts; AI targets the nearest player
- **Combat**: gun shots, melee, throws, pickups, and executions work for both players
- **Boss floors**: special handling for Boss1/2/4, Jones, Panther, Bodyguard, CEO, Inspector, SWAT
- **Death/restart**: R only works when both players are dead; either player can use stairs/elevators
- **Spectator camera**: dead player's view follows the partner

## Requirements

- **Hotline Miami Super R-R** v29.10.0 (both players need the same version)
- **Windows** (32-bit GameMaker runner)
- **MSVC 2022 Build Tools** (to compile the DLL)
- **UndertaleModCli 0.9.2** (to patch `data.win`; place in `_tools/utmt_cli/`)
- **ENet 1.3.18** source (place in `_tools/deps/enet/enet-1.3.18/`)
- A VPN for online play: **Tailscale**, **Radmin VPN**, or direct LAN

## Building

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File coop\build_all.ps1
```

This compiles the DLL, patches `_backup_original/data.win` → `_work/data.win`, and assembles the game in `_work/game/`.

## Folder structure

| Path | Description |
|---|---|
| `coop/dll/` | C++ source for `SuperRRCoop.dll` (ENet networking) |
| `coop/gml/` | New GML code entries (scripts + object events) |
| `coop/hooks/` | Patches to existing game events |
| `coop/patch/` | UTMT patcher script (`ApplyCoop.csx`) + AI retarget lists |
| `coop/dist/` | Files to copy into the game folder (firewall scripts) |
| `coop_notes/` | Design docs, architecture, code maps |
| `decompiled/` | Full GML decompilation of the original `data.win` (reference) |
| `_tools/scripts/` | Helper UTMT scripts (.csx) |

## Setup for two players

1. Build the mod (see above)
2. Copy `_work/game/` to the partner's PC
3. Host: run `coop_firewall.bat` once (opens UDP port 27515)
4. Both players launch the game → CO-OP menu → Host enters IP, clicks HOST; partner enters host's VPN IP, clicks JOIN
5. Host selects a chapter → both players enter the level

## Configuration

Edit `coop.ini` in the game folder:

```ini
[coop]
ip=100.x.x.x
port=27515
name=Player1
windowed=0
```

## License

This mod is provided as-is for personal use. Hotline Miami is © Devolver Digital / Dennaton Games.

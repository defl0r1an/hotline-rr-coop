# Hotline Miami Super R-R — Online Co-op v1.0.0

Two-player **online co-op** for the Hotline Miami fan mod "Super R-R" (v29.10.0), playable over **Tailscale**, **Radmin VPN** or a plain **LAN**.

## Features

- **Networking** — `SuperRRCoop.dll` (ENet over UDP, port 27515) with CRC32 build validation: both PCs must run the same `data.win`.
- **Co-op menu** — HOST GAME / JOIN GAME / IP entry built into the main menu; the host's VPN and LAN addresses are shown after hosting.
- **Level sync** — the client follows the host into any chapter and through every floor transition; both players always play the same floor.
- **Player visibility** — both players see each other with full animations: legs, body direction, weapons and masks.
- **Enemy replication** — host enemies, knocked-out enemies and corpses appear on the client at 20 Hz; AI targets whichever player is closer (43 scripts + 18 special events).
- **Combat both ways** — gunfire, melee and punches, ground executions, weapon throws and pickups, human shields, explosions.
- **Synchronized doors** — doors swing open on contact from either player (or enemies) and knock down anyone behind them; angle and speed are replicated.
- **Story and dialogue sync** — phones, answering machines and NPC conversations show the same text and portrait on both screens, and the host controls advancing and skipping. Answering a phone requires both players nearby ("WAIT FOR YOUR PARTNER").
- **Boss floors** — dedicated handling for Boss 1/2/4, Jones, Panther, Bodyguard, CEO, Inspector, SWAT and Waiters.
- **Vehicles and exits** — stairs, elevators, cars, bikes and vans can be used by either player once the floor is cleared.
- **Death and spectator camera** — a dead player's camera moves to the surviving partner; R restarts the floor only when both are dead; a dead player respawns on the next floor.

## Quick start

1. Download `Hotline_Miami_Super_RR_Coop.zip` from the Assets below.
2. Extract it on **both** PCs.
3. (Host only) Run `coop_firewall.bat` once to allow incoming UDP 27515.
4. Launch `Hotline Miami Super R-R.exe` on both PCs.
5. Main menu → **CO-OP**:
   - **Host**: press **HOST GAME** — the game shows your VPN IP.
   - **Client**: select **IP:**, type the host's address, press Enter, then **JOIN GAME**.
6. The host picks a chapter — both players start together.

## Requirements

- Windows 7+ (x86 or x64)
- Both players on the same network (LAN, Tailscale, Radmin VPN, Hamachi, ZeroTier)
- The same mod version on both PCs (CRC32 is checked automatically)

## Known limitations

- Two players only: one host and one client.
- The host chooses the level and controls dialogue progression.
- Interactive objects (phones, answering machines) require both players within ~140 px.
- Scripted boss scenes react to the client only while the host is alive.
- Recommended latency is up to ~400 ms RTT; high-latency relays work, but hit feedback is delayed.

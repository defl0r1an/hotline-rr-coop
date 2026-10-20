# Handover: online co-op for Hotline Miami "Super R-R" (for Codex / any coding agent)

Written 2026-10-20 by Claude Code at the end of milestone M0, while starting M1.
The user speaks Russian — answer in Russian. Code, comments and identifiers are in English.

## 0. Rules from the user (follow them)

- Work inline yourself. Do **not** spawn sub-agents / parallel workflows: they burned the user's usage limit.
- **Never modify** `Super R-R\` (the user's game) or `_backup_original\` (clean copy of the game). All patching reads
  `_backup_original\data.win` and writes to `_work\`.
- Do not change Windows security settings yourself (firewall etc.). Give the user the command / script instead
  (`coop\dist\coop_firewall.bat` already exists for that).
- Before claiming something works, test it (see §6). Say clearly what was not verified.
- The user tests on two PCs over Tailscale (and may use Radmin VPN). Their partner's PC gets a copy of `_work\game`.

## 1. What the project is

Goal: 2-player **online** co-op for the HM1 fan mod "Hotline Miami Super R-R" via an external DLL, with GML
injected into `data.win` by UndertaleModTool (UTMT). Each player plays on their own PC with their own camera;
host-authoritative world (lockstep impossible: `random()` is used ~8000 times, seed set once by `randomize()`).

Engine facts (verified):
- GameMaker: Studio **1.0.0.1763**, bytecode **15**, 32-bit (x86) Windows runner, 60 fps rooms.
- OPTN flags include `VariableErrors` → reading an uninitialised variable is a runtime error popup.
- `external_define` supports only `ty_real` (double) and `ty_string` (char*), max 4 args if any is a string.
- `draw_text`: `#` is a newline in GMS1 strings. No `?:` ternary in GMS1 GML — use `if`.
- `data.win` round-trips byte-identically through UTMT 0.9.2; UTMT compiles bytecode-15 GML fine.
- Backslashes in string literals (`"\hardmode"`) survive recompilation unchanged (verified).
- Script calls add FUNC entries (fine). **Built-in functions not already in the FUNC chunk are unproven** — check
  `decompiled\meta\general.txt` ("Functions referenced") before using a built-in; prefer ones listed there.
  `network_*`, `buffer_write/read`, `window_set_caption` are NOT in FUNC. `buffer_create` is.

## 2. Folder layout

| Path | What |
|---|---|
| `Super R-R\` | user's game — read only |
| `_backup_original\` | clean copy of game files (data.win sha256 starts `bac1a7d5ab2edaa9`) — read only |
| `_work\game\` | current test build (patched data.win, SuperRRCoop.dll, coop.ini, coop_firewall.*, Music junction) |
| `_work\data.win` | last patched data.win |
| `_tools\utmt_cli\` | UndertaleModCli 0.9.2 (official release) |
| `_tools\deps\enet\enet-1.3.18\` | ENet source (official GitHub tag v1.3.18, tarball sha256 28603c89…b0dd) |
| `_tools\scripts\` | helper .csx: ExportMeta (meta + event bindings), TestRecompile, TestBackslash, FontGlyphs |
| `decompiled\CodeEntries\` | full GML decompile of the ORIGINAL data.win (7306 files) — reference, never edit |
| `decompiled\meta\` | objects.tsv, rooms.txt, general.txt, **event_bindings.tsv**, orphan_object_code.txt, options.txt |
| `coop\dll\` | `SuperRRCoop.cpp`, `.def`, `build.bat`, `test_loopback.cpp`; output in `coop\dll\build\` |
| `coop\gml\` | NEW code entries, full files: `gml_Script_*.gml`, `gml_Object_objCoopNet_*.gml` |
| `coop\hooks\` | edits of EXISTING events: `<object>.<Event>.<subtype>.<mode>.gml` |
| `coop\patch\ApplyCoop.csx` | the patcher (creates objCoopNet, imports coop\gml, applies hooks, appends global_init) |
| `coop\dist\` | files copied into the game folder (`coop_firewall.bat/.ps1`) |
| `coop\build_all.ps1` | one-shot build: DLL → patch → assemble `_work\game` |
| `coop\coop.ini.example`, `coop\README_RU.md` | user-facing config/docs (Russian) |
| `coop_notes\COOP_DESIGN_RU.md` | full architecture + reviewer findings (Russian) |
| `coop_notes\maps.json` | 7 detailed subsystem maps of the game code (player, enemies, combat, level flow, camera, infra) |
| `coop_notes\design.json`, `review.json` | architect design (protocol, milestones) and adversarial review |

## 3. Build & tooling

- Full build: `powershell -NoProfile -ExecutionPolicy Bypass -File coop\build_all.ps1`
  (calls `coop\dll\build.bat` → MSVC 2022 BuildTools `vcvars32.bat`, `/MT` static CRT, links ws2_32 winmm iphlpapi;
  then UTMT patch; then copies to `_work\game`). Prints "Imported N co-op code files and M hooks".
- **UndertaleModCli hangs forever if stdin is attached.** Always run it with `< /dev/null` (bash) or `< NUL` (cmd).
  Examples (bash, from `_tools/utmt_cli`):
  - info: `./UndertaleModCli.exe info ../../_work/data.win < /dev/null`
  - decompile some entries: `./UndertaleModCli.exe dump ../../_work/data.win -o ../../_work/verify -c NAME1 -c NAME2 < /dev/null`
    (repeat `-c` per entry; `UMT_DUMP_ALL` for everything)
  - run a script: `./UndertaleModCli.exe load ../../_backup_original/data.win -s script.csx [-o out.win -f] < /dev/null`
- UTMT 0.9 code import API (in .csx): `new UndertaleModLib.Compiler.CodeImportGroup(Data){ AutoCreateAssets = true }`,
  `QueueReplace/QueuePrepend/QueueAppend/QueueRegexFindReplace(codeName, ...)`, `Import()` returns `CompileResult`
  (`.Successful`, `.PrintAllErrors(false)`). `ImportGMLString` does NOT exist in the CLI.
- **Patch by event binding, not by file name.** The mod has orphan code entries whose names look live
  (e.g. `gml_Object_objconsole_Step_0` is dead; the live one is `gml_Object_objConsole_Step_0`). ApplyCoop.csx
  resolves hooks via `BoundCode(object, event, subtype)`; `decompiled\meta\event_bindings.tsv` lists all bindings.
- Hook file modes: `prepend`, `append`, `replace-level0` (special regex for objTitleNew Step). Add new modes in
  ApplyCoop.csx if needed (QueueRegexFindReplace with `ThrowOnNoOpFindReplace = true` so a missed match fails loudly).
- New objects referenced by name in code must exist before compile (ApplyCoop pre-creates `objCoopNet`; do the
  same for new objects such as `objCoopPuppet`, setting Persistent/Visible/Depth/Parent explicitly).
- After patching, verify by dumping the patched entries and `diff` against `decompiled\CodeEntries\…`.

## 4. What exists now (M0 — done, verified by the user on two PCs over Tailscale)

### SuperRRCoop.dll (coop\dll\SuperRRCoop.cpp)
ENet on a worker thread (pings survive long GML stalls); game thread exchanges byte messages through mutex queues.
MTU 1200, payload batches ≤1100 B, channel 0 reliable, channel 1 unreliable-sequenced
(`ENET_PACKET_FLAG_UNRELIABLE_FRAGMENT` if a batch is larger). Peer timeout (32, 3000, 8000) ms. Connect data =
CRC32 of `data.win` → host rejects mismatching builds (reason shown to client). `SIO_UDP_CONNRESET` disabled
(otherwise ENet never times out on Windows). Own 10 s connect timeout. Logs to `coop_log.txt` next to the exe.
Wire format per packet: `u8 proto(1)` then repeated `{u8 type, u16 len, payload}`.

Exports (all cdecl, return double unless "→s"):
- session: `coop_init(s logdir)` (idempotent, survives game_restart) · `coop_host(port)` · `coop_join(s ip, port)` ·
  `coop_state()` 0 idle,1 hosting/waiting,2 connecting,3 connected,4 lost,5 failed · `coop_role()` 0/1 host/2 client ·
  `coop_disconnect()` · `coop_shutdown()` (only for real exit — never on game_restart)
- diag: `coop_rtt()` · `coop_hash()` · `coop_error()→s` · `coop_cfg(s key)→s` ([coop] in exe-dir coop.ini) ·
  `coop_cfg_set(s key, s value)` · `coop_local_ip()→s` (VPN addresses: Tailscale/Radmin/Hamachi/ZeroTier joined by
  " / ", else LAN) · `coop_log(s)` · `coop_time()` ms · `coop_stat(id)` 0 out B/s,1 in B/s,2 loss%,3 queued ·
  `coop_netsim(lag_ms, loss_pct)`
- send: `coop_begin(type)`, `coop_wi(int32)`, `coop_wf(float32)`, `coop_wd(float64)`, `coop_ws(s ≤255)`,
  `coop_w4(a,b,c,d floats)`, `coop_end(reliable)`, `coop_flush()` once per frame (End Step)
- receive: `coop_poll()`, `t = coop_next()` (−1 when empty), then `coop_ri/rf/rd()`, `coop_rs()→s`, `coop_left()`
- Test harness: `coop\dll\build\test_loopback.exe host 27515` / `join 127.0.0.1 27515` (prints received data, loss, RTT).

### GML (coop\gml, coop\hooks)
- `scrCoopInit` — appended to `global_init` (= `gml_Script_script458`, called from `objLanguage` Create in boot room
  `rmEnableSteam`, so it re-runs after every `game_restart`). Sets ALL coop globals unconditionally
  (`coop_dll, coop_active, coop_role, coop_state, coop_partner, coop_notice, coop_notice_time, coop_ip, coop_port`),
  then if `SuperRRCoop.dll` exists: `external_define`s every export into `global.coop_f_*`, reads ip/port from
  coop.ini, creates persistent `objCoopNet`. Without the DLL the game runs unchanged (verified).
- `objCoopNet` (persistent, depth −1000000): Create (name, windowed, netsim, `auto=host|join`), **Begin Step**
  (`Step_1`, unused by the game → runs before all game logic): state edges, sends HELLO on connect, message loop;
  **End Step** (`Step_2`): `coop_flush`; Draw GUI (`Draw_64`): status line outside the new main menu; Room Start:
  `windowed=1` support; KeyPress F7/F8/F11 (host/join/leave, rmMenu only); Game End: only logs (probe whether
  game_restart fires it — still unknown).
- Messages implemented: 1 HELLO (int proto, str modver "29.10.0", str name), 2 WELCOME (int slot), 3 REJECT (str).
- Scripts: `scrCoopHost`, `scrCoopJoin`, `scrCoopLeave`, `scrCoopStatusText`, `scrCoopMenuDraw/Nav/Enter/Back`.
- Main menu (`objTitleNew`, used when options.ini main_menu_new=1, default): item id 4 "CO-OP" shown 3rd via
  `coop_order = [0,1,4,2,3]`; level 2 = co-op submenu HOST GAME/STOP HOSTING, JOIN GAME/LEAVE GAME, IP (typed
  in-game via `keyboard_string`, saved to coop.ini), BACK; status + hints under it. Hooks: Create append,
  KeyPress 13/27/83/87 prepend, Step level-0 drawing block replaced by `scrCoopMenuDraw()`.
- coop.ini keys: `ip, port(27515), name, windowed, auto, netsim_lag, netsim_loss`.

### Network situation of the user
Host PC is behind symmetric NAT without UPnP → Tailscale relays via DERP
Amsterdam: ~140 ms RTT (game showed 191 ms). Suggest enabling UPnP/NAT-PMP or
forwarding UDP 41641 on the router for direct Tailscale, or try Radmin VPN. Design must tolerate ~150 ms.

## 5. NEXT: milestone M1 — two players on the same floor see each other

Not started in code yet. Research already done (below); `coop_notes\maps.json` has much more (search "Level flow",
"Player core", "Camera").

### 5.1 How levels work (from code)
- Story → chapter: room creation code of an apartment `rmSequenceN` sets `global.level` (room index of the chapter's
  first floor), `global.title/pretitle/sequence`. Car → `rmChapter` (12) → `objLevelTitle` sets
  `global.PauseRestart = 1` and `room_goto(global.level)` (objLevelTitle_Draw_0 ~126-137).
- `objEffector` (each floor; children objEffectorHouse/Instant/Hospital are special — skip them in v1) runs a reset
  walk while `global.PauseRestart == 1` (objEffector_Step_0 205-349): jumps to last floor `levelres`
  (table in code5458 = scrLevelRestart), walks back room-by-room with `room_set_persistent(room,0)` + restart, zeroes
  score on the first floor, then `PauseRestart = 0`. Floors are contiguous room indices.
- `objEffector_Other_4` makes each floor room persistent. Floor exits: `objTransitioner` (Collision_98 sets
  `objPlayer.persistent`, addx/addy, `objEffector.next/fade/nextroom`, saves loadout & *save globals), also
  `objTeleporter`, `objElevator`; all go through `objEffector.next` → room change after an 18-frame fade.
- Room-placed player: `code5320` (creation code) destroys itself if another objPlayer exists, else loads
  `global.weaponsprite/ammoweapon`.
- Death → `objPlayerDead`; R restarts only if no objPlayer (objEffector_KeyPress_82) → `room_restart` + *save restore.
- Leaving a level: the game itself uses `game_restart()` (quit to menu) → boots to rmMenu quickly via "skip" file.
  The DLL session survives game_restart (role/state live in the DLL; `objCoopNet` is recreated, re-sends HELLO).
- Pause is a real room (`rmPause`, 9). Disable pause for both while connected (objEffector_KeyPress_27).
- `objConsole` (persistent) sets `room_speed = 30` when the window is unfocused (live entry
  `gml_Object_objConsole_Step_0`, lines ~52-59) — must be patched to stay 60 while connected.

### 5.2 Planned M1 design (agreed direction)
1. **Host → ROOM message** (reliable, new type e.g. 0x10) whenever host's `(room, epoch)` changes; epoch++ on every
   host Room Start. Fields: room (or −1 = "not on a co-op floor"), level, sequence, hardmode, title, pretitle, epoch.
   "Co-op floor" = an instance whose `object_index == objEffector` exists, `global.PauseRestart == 0`, room != rmPause.
   Host also re-sends current ROOM when it receives HELLO (client after game_restart).
2. **Client follows**: if host on floor and client not in that level → set `global.level/sequence/title/pretitle/
   hardmode`, `global.PauseRestart = 1`, `room_goto(global.level)` (game's own reset walk); store
   `global.coop_target_room`; in objCoopNet Begin Step, once `PauseRestart == 0` and objEffector exists and
   `room != target` → `room_goto(target)`. If host room == −1 and client is in a level → `game_restart()` (back to menu).
3. **Client floor rules (M1)**: at client Room Start on a floor destroy host-owned classes (objEnemy family,
   objEnemyIdle, objBoss, objPolice/objPoliceIdle, objKnockedOut, objEHideM16, objESubwayStatic, dogs/panther, …
   — check parents in objects.tsv); block client exits by prepending to objTransitioner Collision_98 (and teleporter/
   elevator) `if (global.coop_role == 2 && global.coop_active) exit;`. Expect cosmetic STAGE CLEAR / GO TO CAR on
   client (no enemies) — acceptable in M1, fixed in M2 by replicated counts.
4. **Client main-menu lock**: in objTitleNew KeyPress_13 hook, if connected as client and `level == 0 && select != 4`
   → notice "HOST CHOOSES THE LEVEL", exit.
5. **PSTATE** (unreliable, every frame, both directions, new type e.g. 0x20) sent in objCoopNet End Step when on a
   floor: x, y, sprite_index, image_index, dir (body angle), left (body yscale sign), image_xscale/yscale, image_alpha,
   legsprite, legindex, legdir, maskindex/maskon (+ global.selectskin slot), light, throwindex, visible/kind
   (body / dead body `objPlayerDead` sprite+angle / hidden while an execution object replaces the player), plus
   room+epoch so stale states are dropped. The local body is "any instance of objPlayer" on this PC
   (objPlayerMouse is destroyed/recreated constantly — never cache its id across frames).
6. **objCoopPuppet** — new object, NOT a child of objPlayer (otherwise 545 files of `objPlayer.x`/`with(objPlayer)`
   break). Created on the floor when PSTATE arrives, destroyed on room change. Smooth: `x += (tx-x)*0.5`, snap if
   >48 px; sprite/frame snap. Draw = copy of `objPlayerMouse_Draw_0` drawing parts only:
   shadow legs `draw_sprite_ext(legsprite, legindex, x+1, y+1, xs, ys, legdir, c_black, 0.5)`, shadow body
   `(sprite, img, x+1, y+1, xs, ys*left, dir, c_black, 0.5)`, legs, body `(…, ys*left, dir, image_blend, alpha)`,
   mask via `scrDrawMask(0)` with `global.maskindex/maskon` temporarily swapped to the partner's values,
   thrown-object branch for `sprPWalkThrow` (`sprThrowWeapons` + `throwadd[]`). Do NOT copy gameplay side effects
   that live in that Draw (reload/light/debuffammo decrements, blood spawning, `global.powerIgel` writes).
   legsprite rule: 42 normal, 43 when myspeed==2.25, 548 for Griffin sprites. Depth like the player's.
7. Set `global.coop_active = 1` only while connected AND on a co-op floor; every patch must be a no-op otherwise.

M1 test: host starts a chapter; client (in menu) is pulled onto the same floor within ~10 s; both see each other
walking/aiming/switching weapons; host taking the stairs pulls the client to the next floor; host leaving the level
sends the client back to menu.

### 5.3 Later milestones (see coop_notes\COOP_DESIGN_RU.md for full protocol)
- **M2**: host-authoritative enemies replicated to client (ENT/DESPAWN/WSNAP), `scrCoopTarget` nearest-player
  targeting in ~20 AI scripts, HASH desync checks, door state replication, replicated enemy counts for the 43 local
  enemy-existence gates.
- **M3**: combat both ways (FIRE events, remote melee on host via attacker-parameterised scrPlayerIsAttacking,
  THROW/PICKUP requests, victim-side deaths from ghost bullets, two-phase melee armor).
- **M4**: transitions by either player (REQ_EXIT/NEXT), synced restarts, death/spectate/respawn rules, disconnects.
- Reviewer's blocker/major list (must handle): don't rewrite `instance_exists(objPlayer)` guards partially;
  executions inside scrPlayerIsAttacking destroy the local body; host-dead deadlocks floor completion; 43
  enemy-count gates on client; doors opened by enemies; coop globals initialised unconditionally (done);
  game_restart must not kill the session (done).

## 6. How to test

- Two copies on one PC: copy `_work\game` to a second folder, set `windowed=1` (+ `ip=127.0.0.1`) in its coop.ini.
  `auto=host` / `auto=join` in coop.ini starts the session at boot without key presses (use it for unattended tests).
- Read `coop_log.txt` in each game folder (DLL + `gml:` lines from objCoopNet).
- Note: the game reads keyboard/mouse even when its window is unfocused, and runs at 30 fps unfocused (objConsole).
- Visual check without input: launch windowed, then capture the window with PowerShell
  (`GetWindowRect` + `Graphics.CopyFromScreen`) and view the PNG. Kill test processes afterwards.
- Saves/options of all copies share AppData (`UseAppDataSaveLocation`), so tests touch the user's options/saves.
- The user's partner needs the **same** data.win (CRC check), the DLL, and the host needs `coop_firewall.bat` once.

## 7. Progress log (newest last — update after every finished step)

- 2026-10-20 — M0 complete and verified by the user over Tailscale (two PCs, ping ~191 ms via DERP).
- 2026-10-20 — M1 started (Claude Code). Steps are logged below as they finish; anything not listed is not done.
- M1 research done: client level entry = copy of objLevelTitle_Draw_0 ~124-137 (`global.NotSaved=1; global.shells=0;
  if (global.level != 148) global.PauseRestart=1; room_goto(global.level)`), skipping rmChapter (its Create calls
  scrSaveUnlocked → would write the client's saves). Level music starts in objMaskMenu_Create (first floor), so the
  client gets it. `global.PauseRestart` is first set in scrTitleInit → guard reads with variable_global_exists.
  Strip set on client floors: objEnemy (covers objEnemyIdle/objPolice/objDogPatrol/objEHideM16), objKnockedOut,
  objBoss, objESubwayStatic, objMiscEnemy, objPanther, objSwat. Exits to block on client: objTransitioner and
  objTeleporter Collision_98 (both check `other.object_index`). Mask drawing (scrDrawMask) reads global.maskindex/
  selectskin and per-instance maskaddx/maskaddy from scrUpdateMaskPos(sprite) (pure); special masks 1(hard)/21/27 call
  other scripts — puppet draws masks itself. throwadd[] comes from scrInitThrowPos(). objConsole_Step_0 (59 lines)
  ends with the unfocused room_speed=30 block → append an override. Pause = objEffector KeyPress_27.
- M1 code written and compiles (27 code files, 11 hooks), NOT yet run in game:
  new scripts scrCoopOnFloor, scrCoopSendRoom, scrCoopClientFollow, scrCoopClientRoomStart, scrCoopSendPState,
  scrCoopReadPState; new object objCoopPuppet (Create/Step/Draw, depth -2, pre-created in ApplyCoop.csx);
  objCoopNet: protocol bumped to 2, handles ROOM(16)/PSTATE(32), sets global.coop_active, host sends ROOM when its
  floor changes (and after HELLO), client follows (game_restart back to menu when host room = -1), PSTATE sent in
  End Step; client strips enemies at Room Start. Hooks: objTransitioner/objTeleporter Collision_98 (client can't
  exit), objEffector KeyPress_27 (no pause while connected), objConsole Step_0 append (60 fps), objTitleNew
  KeyPress_13 (client can only use CO-OP item). Draw GUI status now also shows in the main menu level 0.
- 2026-10-20 first in-game M1 run crashed at connect: "FATAL ERROR ... trying to index a variable which is not an
  array at gml_Script_scrCoopOnFloor". Cause (by elimination; the only new built-in executed): **variable_global_exists
  crashes this runner build** (the game only uses it in the dev console). Also avoided as a precaution: var locals
  inside with() (the game's own code never does it; ApplyCoop.csx now refuses both). Fix: DLL export
  `coop_boot_count()`; scrCoopInit sets defaults for global.PauseRestart/level/sequence/hardmode/title/pretitle only
  on the first boot (count == 1) so later reads never need an existence check.
- Second run: connect OK, host auto-entered level 121, then the host process died ~10 s later (error dialog,
  text not captured). Suspect **variable_local_exists** (also only used by the dev console). scrCoopSendPState rewritten
  without it and without with(): full look only for objPlayerMouse from Create-initialised vars; legsprite derived
  (42 / 43 when myspeed==2.25 / 548 Griffin sprites). ApplyCoop.csx now rejects variable_*_exists.
- Third run: no co-op crash any more; the host crashed in the GAME's code: scrCheckKnifeCombo read global.combo
  unset. Cause: entering a level straight from rmMenu skips scrInitScore(), which the main menu calls before START
  GAME / CHAPTERS (objTitleNew_KeyPress_13). scrCoopEnterLevel now calls scrInitScore() first (50 lines of
  global assignments, no side effects). This also affected the client path.
- 2026-10-20 **M1 first working run** (two copies on one PC, `auto=host` + `test_level=121` / `auto=join`): connect →
  host enters level 121 → sends ROOM 121 → client enters the same level (scrCoopEnterLevel) ~0.5 s later → both log
  "partner puppet created in rmOfficeEntrance"; both processes stay alive; client screenshot shows the floor, mask
  menu and the status line. NOT yet verified (needs real input / two players): puppet drawing while moving,
  following the host down the stairs, client returning to menu when the host leaves the level, deaths.
- `coop.ini` option `test_level=<room>` (host auto-enters that level once a partner is connected) exists for
  unattended tests; `_work\game_client\` is a second copy (ip=127.0.0.1, windowed) for one-PC tests.
- NEXT for whoever continues: ask the user to test M1 on two PCs (CO-OP → HOST, partner JOIN, host starts any
  chapter); fix what they report; then M2 (see §5.3).
- 2026-10-20 user's 2-PC M1 test (METRO, level 89): both entered the level, but after picking a mask the partners
  vanished and the client was not moved when the host took the stairs. Reproduced with `test_auto=1` (new coop.ini
  option, scrCoopTestAuto: confirms the mask menu after 2 s, host leaves for room+1 via objEffector.next after 10 s):
  **objCoopNet gets destroyed ~27 frames after the mask is confirmed** (end of sprPMaskSlip), on host and client, with
  persistent=1, no room end, puppet untouched. Culprit NOT identified (not with(all), not a parent, no game_save/
  game_load, no literal ids; shifting objCoopNet's instance id saved the client but not the host). Fix: objCoopNet's
  Destroy event recreates it unless `global.coop_restarting` (set before our own game_restart). The new instance
  re-sends HELLO; the host answers with WELCOME + ROOM. Verified: after recreation PSTATE flows both ways, host leaves
  89 → ROOM 90 → client follows in 0.2 s, puppets on both. Diagnostics kept: heartbeat line "beat …" every 3 s,
  "room start …", "objCoopNet destroyed …, recreating", "partner puppet created/removed".
  Open question for later: find what destroys objCoopNet (maybe something in the mask/player Animation End path).
- 2026-10-20 **M2 started** (host enemies visible on the client). Plan: host sends ENT (all enemy-family/knocked-out/corpse
  instances, 20 Hz, unreliable) + DESPAWN (reliable) keyed by host instance id; client draws objCoopEnt ghosts; then AI
  targets the nearest of host body / puppet. Client stays invulnerable until M3.
- 2026-10-20 **M2 step 1 done and tested (one PC, test_level=121 + test_auto):** host replicates enemies/corpses to
  the client. Files: scrCoopSendEnts (host, End Step every 3rd frame), scrCoopEntSend (called INSIDE with(entity):
  marks id in coop_ent_now map + list, sends ENT 64: room, nid=host instance id, mode, spr, legspr,
  w4(x,y,img,angle), w4(xs,ys,alpha,legimg); corpses re-sent only every 15th pass), scrCoopLegsFor (leg sprite by
  object ancestry: sprELegs / sprEFatLegs / sprPoliceLegs / none for dogs & searching sprites), DESPAWN 65 (room, nid)
  for ids missing since the previous pass (two ds_lists swapped each pass; ds_map_size does not exist).
  Client: scrCoopReadEnt / scrCoopReadDespawn, object objCoopEnt (pre-created in ApplyCoop; Create/Step/Draw/Destroy;
  modes 1 walker legs+body, 2 knocked out, 3 corpse, 4 plain; depth -2/0/1; timeout 45 frames, corpses 150),
  global.coop_ents ds_map (host id -> ghost). Client Room Start also strips objDeadBody/objSwatKnockedOut/old ghosts.
  Classes sent: objEnemy(+children), objSwat, objKnockedOut(+Fat), objSwatKnockedOut, objDeadBody, objBoss,
  objMiscEnemy, objPanther, objESubwayStatic. Screenshot confirmed: client sees host enemies with legs/weapons.
- Fixes found in that test: (1) instance_find(objPlayer,i) may return an instance destroyed earlier this step →
  "Unable to find any instance" fatal; scrCoopSendPState/scrCoopOnFloor now check instance_exists on every found id.
  (2) Client floors have no enemies → game treats them as cleared → elevators/exits fire by themselves (client
  bounced 122→123 every 3 s). Fix: objElevator Step_0 prepend (client exits), and objCoopNet Begin Step cancels any
  objEffector.next==1 && fade==1 on the client (resets next/fade, objPlayer.persistent=false; throttled log
  "client: cancelled a local floor exit").
- NEXT (M2 step 2): enemies on the host must perceive/target the puppet too (nearest of host body / objCoopPuppet).
- 2026-10-20 **M2 step 2 done and tested:** host enemies react to the nearer player. 26 AI scripts listed in
  coop\patch\ai_retarget.txt get `scrCoopTarget();` prepended and objPlayer.x/.y → global.coop_tx/.coop_ty
  (ApplyCoop.csx, regex on the decompiled source; all 26 only READ the position; scrPlayerDie* excluded on purpose).
  scrCoopTarget = objPlayer position, or the puppet when co-op is active on the host and it is nearer (p_kind==1).
  instance_exists(objPlayer) guards untouched → enemies ignore the puppet while the host is dead (known limitation).
  Boss / special enemies with logic in their own Step events (objBoss1/2/4, objPanther, objBodyguard, objWaiter,
  objCEO, *Old enemies…) are NOT retargeted yet. Test (test_auto: client teleports next to a ghost at 5 s): ghosts
  closed to 0–17 px and switched to melee attack sprites → enemies on the host chase/attack the puppet; no errors.
  The puppet cannot be hurt yet (M3).
- M2 leftovers (not done): HASH/desync check messages; door state replication; client-side STAGE CLEAR / GO TO CAR
  artefacts (client has no local enemies); host floor restart is not mirrored on the client (ghosts just update).
- 2026-10-20 user's 2-PC M2 test (SWAT level 119→120 over Tailscale DERP): following and ghosts worked
  (client ghosts 12 / 15 = host enemies at floor entry; corpses replace killed enemies so the count stays), no
  errors. Observed: (1) partner PC ran ~32 fps already in the menu (beat every 5.6 s) — not the unfocused throttle
  (objConsole Step has no early exit, our append forces 60); likely vsync halving on a slow PC — ask the user.
  (2) RTT 200–400 ms with spikes to 1.0–1.6 s during fights (DERP relay). Mitigation done: ENT now sent only when
  an entity's look checksum changed (ds_map coop_ent_sum, host id -> checksum of x,y,frame,angle,sprite,mode,alpha);
  everything re-sent every 15th pass (~0.75 s); ghost timeout raised to 120 frames. Re-tested on one PC: OK.
- 2026-10-20 **M3 started** (combat both ways). Order: (a) client gun shots replayed on the host as real bullets
  (FIRE), (b) host enemy bullets replayed on the client as real objEBullet so its own collision code decides deaths,
  (c) melee later.
- 2026-10-20 **M3 guns done and tested (one PC, test_auto):** projectile watermark (objCoopMarker created+destroyed
  every End Step → coop_mark = next instance id). Client: scrCoopSendShots sends every new objBullet(+children)/
  objFlame as FIRE 80 (room, obj, spr, w4(x,y,direction,speed), w4(image_angle,friction,xscale,yscale); built-ins
  only). Host: scrCoopReadFire re-creates them as real projectiles (they kill host enemies through the game's own
  collision code) and runs scrHearPlayer as the puppet (scrHearPlayer added to ai_retarget.txt). Host: new objEBullet
  → EFIRE 81 → client re-creates real objEBullet → the client's own Collision_209 kills it. Net-created projectiles
  are kept in global.coop_net_ids (never re-sent). Test: 3 client shots → host enemies 9→8→7; in another run the
  client died to replicated enemy bullets. Not done: host's own bullets are not shown on the client (cosmetic),
  explosions/grenades not replicated, no lag compensation.
- 2026-10-20 **M3 melee done and tested (one PC, test_auto=2):**
  * Client → host: coop\patch\gen_puppet_melee.py generates scrCoopPuppetAttack / scrCoopPuppetPunch from the game's
    scrPlayerIsAttacking / scrPlayerIsPunching (objPlayer→objCoopPuppet, with(objPlayerMouse|objPlayerBiker)→
    with(objCoopPuppet), kill-animation creations objBikerKillFat/objPKillChainsawFat/objPKillDog→objCoopMarker).
    Host runs them in objCoopPuppet Step (p_kind==1) with dir/left from PSTATE, saving/restoring global.my_id (the
    game's "current player"; given a first-boot default noone in scrCoopInit). The puppet's Create defines every
    instance variable those scripts read (found from bytecode with _tools/scripts/SelfVars.csx). Test: client punch →
    host enemy knocked down (sprEGetUp ghost), enemies 9→8.
  * Host enemy → client: scrCoopMeleePuppet(reach) inserted before the contact-kill test of objEnemyMelee,
    objPoliceMelee, objEnemyMeleeStationary, objPoliceMeleeStationary, objEnemyFat (reach 16), objDogPatrol (dog is
    destroyed like on a real bite) via new hook mode "findreplace" (file = exact text, line //@@REPLACE@@,
    replacement). On contact: DEATH_MELEE 96 (room, enemy x/y), 60-frame cooldown on the puppet; the client spawns an
    objEBullet against its player from the enemy side → the game's own hit/armour/death code (shot death pose).
    Test: "objEnemyMeleeStationary hit the partner in melee" → client dead=1.
  * Bug avoided: a `var i` loop in objCoopPuppet Create shadowed the instance variable i the melee script reads.
- M3 NOT done: client executions/ground finishes (Space) and human shield, throws (objWeaponThrow /
  objThrowingWeapon) and pickups of enemy-dropped weapons (client only has its own room-placed weapons), host
  bullets/explosions shown on the client, boss melee (objBoss*, objPanther, objBodyguard...), melee death pose.
  Death/restart rules are M4 (client may press R and restart its own floor locally).
- 2026-10-20 **M3 part 2 started:** host bullets on the client, floor weapons + pickups, client throws, executions.
- M3 part 2 code written (55 code files, 38 hooks), testing next: host bullets → client (82, real objBullet/objFlame,
  harmless there); floor weapons and knocked-out enemies → client as REAL frozen instances (ENT mode 5 weapon / mode 2
  knocked-out; legspr = object index, legimg = ammo; scrCoopFrozen + prepend hooks freeze their Step/collisions/
  alarms/animation end on the client; listed in global.coop_net_ids, back-reference var coop_nid);
  new Destroy events objWeapon_Destroy_0 (PICKUP 66) and objKnockedOut_Destroy_0 (EXECUTE 67), skipped while
  global.coop_netdestroy (network removals) and remembered in global.coop_gone (late ENT ignored);
  client throws/drops (new local objWeaponThrow / objThrowingWeapon) → THROW 83 → host throws the real one, local copy
  removed; client execution corpses (new local objDeadBody) → CORPSE 68 → host corpse kept out of ENT (coop_ent_skip).
  Client Room Start also strips local objWeapon.

- 2026-10-20 M3 part 2 continuation: rebuilt the DLL and patched build from _backup_original; UTMT imported 55 co-op files and 38 hooks. One-PC host/client runtime remained alive through join, floor entry, enemy interaction and client finish action. Automated verification did not reach throw/pickup: client test driver enters that stage only while objPlayerMouse exists, but that instance was absent after the finish event; host log did not confirm receipt of EXECUTE. Throw/pickup and host projectile visuals remain unverified. Test driver finish/throw/pickup frame targets moved earlier (360/400/440) to shorten the interval before the client is killed.
- 2026-10-20 (Claude Code, resumed after a usage-limit break; Codex had meanwhile added scrCoopTryThrow — the client
  intercepts a new local objWeaponThrow/objThrowingWeapon in its own Step, before its collision can destroy it —
  plus test_auto=3 as a safe wire test and test logs in the read scripts; kept as is).
  Found and fixed a real bug: scrCoopEnterLevel skipped objLevelTitle_Create's per-level resets, so with a
  mask.nfo present (left by any earlier run — here the user's own game running at the same time, which shares
  %APPDATA%\Hotline_Miami_Super_R-R) objEffector Step hit a fatal "global variable not set". scrCoopEnterLevel now
  sets global.firsttime, pickedtrunk, overright, maskonsaved, checkpointx/y, limitreload (15 hard / 30) and
  sranklock like objLevelTitle (unlock/save writes still skipped).
  **M3 part 2 verified end-to-end (one PC, test_auto=3):** host bullet shown on the client (82); client pickup of a
  replicated weapon → PICKUP → host removed it; Space on a replicated knocked-out → EXECUTE → host finished it, the
  client's execution corpse → CORPSE → host corpse; client throw → THROW → host threw it and the landed weapon came
  back to the client (weapons=1 on both). No errors.
  Test caveat: never run test copies while the user's own game is open — the save folder (mask.nfo, hardmode,
  saves.dat, options.ini) is shared.
  Still not done (M3): human shield on the client, explosions/grenades, boss/special enemy melee, melee death pose.
- 2026-10-20 **M4 started** (Claude Code): exits by either player (client REQ_EXIT → host triggers the exit even when its body
  is dead), restart gating (R only when both are dead) and synced RESTART.
- 2026-10-20 **M4 done and tested (one PC, test_level=96 House1 stairs, test_auto=4):**
  * Exits by either player: the client's objTransitioner/objTeleporter Collision_98 hooks call scrCoopRequestExit →
    REQ_EXIT 112 (room, exit instance id — room-placed, same on both PCs; 60-frame cooldown). Host scrCoopReadReqExit
    checks scrCoopFloorClear (the transitioner Step's unlock test, which the game skips while the host is dead) and,
    with the host alive, the exit's own solid flag; denied → EXIT_DENIED 113 ("CLEAR THE FLOOR FIRST"). Accepted →
    scrCoopExitVia: the exits' checkpoint saves (*save globals, weapon) + objEffector.next/fade/nextroom, host body
    NOT carried along (both start the next floor at its start point); works while the host is dead.
    Test: client on the stairs → denied while enemies left → host cleared → host left 96→97 → client followed.
  * Death/restart: objEffector KeyPress_82 prepend — while co-op is active R works only when this player AND the
    partner are dead (scrCoopPartnerAlive: puppet present, not stale, p_kind != 2), otherwise notice "YOUR PARTNER IS
    STILL ALIVE" (+ log "restart blocked"). Client R → REQ_RESTART 114 → host scrCoopRestartBoth sends RESTART 115
    and runs objEffector's R past the gate (global.coop_restart_ok); the client restarts the same way on 115. A dead
    player respawns when the partner takes the stairs (follows to the next floor, placed player spawns).
    Test: both dead → client R → "floor restart (both players dead)" on both + room start on both; host dead,
    client alive → host R blocked.
  * Not done: elevators can only be used by the host (client's are frozen); the car/level end is host-only (client
    goes back to the menu); no spectator camera for a dead player; objPlayerDead left in a persistent floor when a
    dead player follows to the next floor.
- 2026-10-20 **Leftovers started** (Claude Code): enemies hunt the client while the host is dead, dead player's camera
  follows the partner, elevators usable by the client.
- Leftovers code written (66 code files, 43 hooks): ai_retarget.txt now also lists 12 enemy Step events
  (@object.Event.subtype) and every entry's instance_exists(objPlayer) → scrCoopHasTarget() (true while the host's
  player exists, or co-op host with a living puppet); ApplyCoop only queues replacements the decompiled source
  contains (hooks fail on no-ops). Spectator camera: objPlayerDead Step lerp targets → scrCoopViewX/Y (partner after
  90 frames of global.coop_spec_t) via new findreplace-x / findreplace-y hook modes + an append that runs the timer.
  Elevators: client objElevator Step prepend → standing in it sends REQ_EXIT (scrCoopSendReqExit, split out of
  scrCoopRequestExit); host accepts objElevator when scrCoopFloorClear and no objEventTriggerElevator.
  NOTE: several coop files now have CRLF line endings — edit them CRLF-aware.
- 2026-10-20 **Leftovers done and tested (one PC):**
  * Enemies hunt the client while the host is dead (test_auto=5, level 96): host died on purpose, then
    "host: objEnemyMeleeStationary hit the partner in melee" → client killed. (Idle/sitting enemies such as
    objEnemySitDrink barely react — same as in single player.)
  * Spectator camera: the dead host's view centre converged to the partner (0 px) ~1.5 s after death.
  * Elevators (test_auto=6, level 121): the client elevator hook uses collision_circle(x, y, 14, objPlayer) —
    place_meeting from the elevator returns 0 on the client because its own Step (skipped there) sets up its mask.
    Client in the elevator → REQ_EXIT → "host: leaving rmOfficeEntrance for room 122" → client followed. On arrival
    the client stands in the next elevator and keeps asking once a second; the host denies until the floor is
    cleared (like the original elevator).
  * Diagnostics added: client logs "asking the host to use exit …", host logs REQ_EXIT denials.
  Remaining known gaps: human shield on the client, explosions/grenades, boss/special enemy melee and AI
  (objBoss*, objPanther, objBodyguard, objSwat, dogs' targeting), melee death pose, car/level end host-only,
  dead player's objPlayerDead left in a persistent floor, a dead client respawns at the floor start.
- 2026-10-20 **Special enemies started** (Claude Code): bosses, SWAT, dogs, panthers should target the client too.
- 2026-10-20 **Special enemies: code done, mostly tested (one PC). One open bug, see the end of this entry.**
  * coop\patch\ai_retarget_special.txt: 16 Step events. Mode "full": objSwat, objDogPatrol, objPanther, objCEO,
    objEFatGunner, objInspector, objBoss1Down, objEDodger (code gml_Object_objEnemyDodger_Step_0), objEDodgerG,
    objEHideM16. Mode "keepguards" (scripted bosses that write objPlayer.persistent/position): objBoss1, objBoss2,
    objBoss4, objBodyguard, objJonesBoss, objHobo. Waiters are excluded (they take the player's weapon).
    ApplyCoop.csx special block: objPlayer.x/.y READS -> global.coop_tx/ty; other objPlayer.<field> READS ->
    global.coop_tinst.<field>, except fields the same event writes anywhere (e.g. Boss2 saves/restores persistent);
    writes, place_meeting and with(objPlayer) stay on the host body; "full" also instance_exists(objPlayer) ->
    scrCoopHasTarget(). scrCoopTarget now sets global.coop_tinst (host body or puppet; init noone in scrCoopInit).
    objCoopPuppet Create/Step got the fields those events read: addx, addy, legindex, myxspeed, myyspeed, prevsprite,
    active, aimfar, maskindex.
  * scrCoopRedirectDeath + `script.<name>.0.prepend` hooks (new ApplyCoop rule: p[0]=="script" -> gml_Script_<name>)
    on scrPlayerDieMelee, scrPlayerDiePantherBite, scrPlayerDieDogBite, scrPlayerShieldDieDogBite: when the kill was
    aimed at the puppet (host dead, or farther than the puppet and not within 24 px) the partner gets DEATH_MELEE 96
    and the host is NOT killed (panther/bodyguard kill by distance to their target, which may be the puppet).
  * objInspector Step findreplace: scrCoopMeleePuppet(16) before its own objPlayer contact test.
  * ai_retarget.txt +4 scripts: scrAim, scrAimFatGun, scrDogCharge, scrHoboGetWeapon (now 31 scripts + 12 events).
    scrAim was missing since M2: armed regular enemies aimed at the HOST beyond 80 px, and with the host dead they
    would crash ("Unable to find any instance for object objPlayer"); scrDogCharge crashed exactly so in a test.
  * scrCoopReadMeleeDeath: sets p.energie = 0 and spawns the bullet ON the player (1 px back, speed 2). Before, the
    client survived a melee hit half the time (objPlayerMouse Create: energie = round(random(1))), and a bullet that
    spawned inside a wall was pushed out and missed.
  * **Boss floors.** Every boss is in an objEffectorHouse room: objJonesBoss 103 rmSecretSewer, objBoss2 111
    rmPhoneHomUpstairs, objBoss4 + 2 objPanther + objBodyguard 136 rmMansionMainHall, objCEO 142
    rmPhoneHomUpstairsBiker. scrCoopOnFloor now accepts objEffectorHouse in exactly these 4 rooms. Restart there
    goes through the bosses' own KeyPress_82 (`objEffector.fade = 1`; objEffectorHouse's fade end calls room_restart
    in those rooms) and bypassed the co-op gate -> gate moved into new script scrCoopRestartGate (returns 1 = stop),
    prepended to KeyPress_82 of objEffector, objBoss2, objBoss4, objJonesBoss, objHobo, objVan, objGirlfriend;
    scrCoopRestartBoth sets fade = 1 on objEffectorHouse instead of event_perform R (its R only serves rmAlley).
    The mansion level is global.level 135 (rmMansionEntrance, plain objEffector) -> 136; entering 136 directly with
    PauseRestart=1 sends the game to room 0 (objEffectorHouse levelres = 0). Boss4 lets the panthers go only after
    its phone conversation (objPhoneConversation).
  * objSwatOpenDoor Step prepend: exits on the client (it counts objEnemy + objKnockedOut; the client holds frozen
    knocked-out copies, so 3 of them would start a local SWAT raid). Host SWAT reach the client as ghosts (objSwat
    is spawned by objSwatSpawn on rmSwatUpstairs 120 when 3 enemies are left; no room places objSwat).
  * scrCoopTestAuto modes (coop.ini `test_target=<substring of the ghost's sprite name>`, default Dog):
    7 host dies at t=200, client teleported 80 px from the nearest matching ghost (mode 1/4) with a clear line;
    8 same with the host alive; 9 = 8 on the level's 2nd floor (host takes the stairs at t=300, skips the phone
    conversation, dies at t=600, presses R via with(all) event_perform at t=720); 10 = 9 on rmSwatUpstairs, host
    removes enemies down to 3 at t=200 (no death/R).
  * Build: 68 co-op code files, 55 hooks, "AI retarget: 43", "AI retarget (special): 16 events".
  * **Tested OK (one PC, no error dialogs):** dog (level 119): hunts and bites the client with the host dead and with
    the host alive, the client dies on the first bite, host unaffected. Panther (test_level=135, mode 9): after the
    conversation it walks to the client, "host: objPanther killed the partner (redirected death)", host alive; both
    dead -> R -> "floor restart (both players dead) in rmMansionMainHall" on both PCs, 3 cycles in a row. SWAT
    (level 119 -> 120, mode 10): raid starts on the host, up to 9 ghosts on the client, they walk to it and fire.
  * **NOT tested:** inspectors (129), fat gunner (101), dodgers, CEO, Boss2, JonesBoss, Boss4/bodyguard attacking
    the client ("keepguards" = only while the host lives), SWAT actually killing the client.
  * **OPEN BUG (last run, mode 10 on rmSwatUpstairs):** the host died at ~41 s and both PCs logged "floor restart
    (both players dead)" right away although the client was alive (client beat dead=0 the whole time). Unknown who
    pressed R: objEffector_Step_0 ~126 does event_perform(ev_keypress, R) on keyboard_check_pressed(global.restartkey)
    (test copies read the real keyboard), or scrCoopPartnerAlive returned 0 (puppet stale > 60 or p_kind == 2).
    NEXT: log in scrCoopRestartGate why it let the restart through (p_kind, stale, coop_restart_ok) and rerun
    `run_pair -Level 119 -Mode 10 -Target Swat`; then test the untested enemies; update README_RU.md.
  * Test configs: _work\game\coop.ini and _work\game_client\coop.ini still hold test keys (auto=host/join,
    test_level, test_auto=10, test_target=Swat) - reset them to plain configs before giving the build to the user.
    The one-PC runner used here is a PowerShell script in the session scratchpad (copies data.win+DLL to
    _work\game_client, writes both coop.ini, starts host then client, reads error-dialog text via EnumChildWindows,
    kills both, greps both coop_log.txt) - not in the repo.
- 2026-10-20 **Special enemies: follow-up (one PC).**
  * The "OPEN BUG" above is NOT a bug: the 115 handler only restarts a PC whose own player is dead, and the client
    did restart, so both were dead (SWAT killed both between two 3 s heartbeats). Nothing in the game presses R by
    itself (only objEffector_Step_0 ~126 on keyboard_check_pressed(ord(global.restartkey))); the R came from the real
    keyboard - test copies read it even in the background, and the user was typing at that moment.
    New diagnostics: "partner died in <room>" (scrCoopReadPState, on PSTATE kind -> 2) and
    "restart key in <object>: partner kind K stale S" (scrCoopRestartGate, when it lets a restart through).
    Rerun of mode 10: SWAT killed the client (22.7 s), then the host (32.6 s), no restart without R.
  * Fat gunner (test_level=106 rmBuildingFloor1, mode 8, test_target=EFat - objEFatGunner patrols with
    sprEFatWalk; on 101 the room code removes the fat enemies): client killed by gunfire ~1 s after standing next
    to it, host alive.
  * Inspectors (test_level=128 -> 129, mode 9, test_target=Inspector): client killed ~1 s after standing next to an
    inspector (by gunfire, not the inspector's melee hook - no "hit the partner" line), host died at t=600, R ->
    "restart key in objEffector: partner kind 2 stale 0" -> restart on both.
  * scrCoopTestAuto: when the target is missing at t=270 it logs every ghost "sprite/mode" ("test: no X ghost").
  * Seen in passing: right after a floor restart the client may log "partner died" once (the host's PSTATE still
    had kind 2 for a moment); scrCoopPartnerAlive can be briefly false then. Harmless so far.
  * README_RU.md updated (special enemies, boss floors, what is still missing / unverified).
  * Still NOT verified: Boss2 (111), JonesBoss (103), CEO (142) floors, Boss4 / bodyguard attacking the client,
    dodgers. Waiters still host-only.
  * Test configs reset: _work/game/coop.ini = coop.ini.example, _work/game_client/coop.ini = ip 127.0.0.1, name
    Client, windowed=1 (no auto/test keys). Build in _work/game is current (68 code files, 55 hooks).
  * NEXT: the user tests on two PCs (SWAT level, a dog level, the mansion boss floor); then human shield /
    explosions / car-level end for the client.

- 2026-10-20 **Car exits, melee death poses, explosions, human shield, persistent corpse cleanup (one PC):**
  * Vehicles / car exit: objPlayerCarEnter and objMCBike Step prepend hooks allow client to request vehicle exit (REQ_EXIT 112). scrCoopReadReqExit accepts vehicle objects (objPlayerCarEnter, objMCBike, objGriffinCar, object1052) when scrCoopFloorClear() || global.done == 1. scrCoopExitVia sets objEffector.nextroom (scrCarNextRoom(room) or scrGetRoom()), plays engine sound, and works even while the host's body is dead (no more softlock on cleared floor!).
  * Dead body persistent cleanup: objCoopNet Other_5 (Room End) and Other_4 (Room Start) destroy objPlayerDead so dead player bodies do not linger in persistent rooms when returning or moving floors.
  * Melee death poses: scrCoopMeleePuppet and scrCoopRedirectDeath pass dtype (0 blunt, 1 cut, 2 dog, 3 panther) via DEATH_MELEE 96. scrCoopReadMeleeDeath sets global.coop_death_sprite (sprPBackCut, sprPBackEaten, sprPBackBlunt/sprPFrontBlunt) and plays authentic sound; objPlayerDead.Step.0.append applies the sprite.
  * Explosions: scrCoopSendShots replicates objExplosion, objExplosionSkippy (client -> host 80) and objExplosion, objExplosionSkippy, objBottleExplosion, objMolotov (host -> client 82).
  * Human shield: scrCoopSendPState now supports objPlayerShieldMouse with proper direction, legs, and mask.
  * Build: 69 co-op code files, 57 hooks. Tested on one PC across 20-30s runs: 60 fps, zero crashes, spectator camera working.

- 2026-10-20 **Doors, STAGE CLEAR gating, Waiter AI, Boss 4 automated test (one PC):**
  * Synchronized doors: objDoorV, objDoorH, objDoorV2, objDoorH2 and all derived doors replicated from host to client via message 70 (DOOR: x, y, image_angle, swingspeed) in scrCoopSendDoors and scrCoopReadDoor. On host, objCoopPuppet_Step_0 opens doors on contact using proper swing velocities, knocking out enemies behind the door. Zero locals inside with() to ensure runner stability.
  * Suppressed false STAGE CLEAR / GO TO CAR on client: script.scrCheckMissionComplete.0.prepend exits early on active client. Host sends FLOOR_DONE 116 when global.done == 1. Client receives 116, sets global.done = 1, and spawns objLevelComplete. Client reset in scrCoopClientRoomStart sets global.done = 0.
  * Waiters: objWaiter.Step.0 and objWaiterStationary.Step.0 added to ai_retarget_special.txt (keepguards). Waiters spot whichever player is closest, drop food trays / wine bottles, pull out uzis and shoot. Mask 11 melee disarm preserved on host.
  * Automated testing with coop/run_test.ps1 on one PC (host + client):
    - Level 121 (Deadline): gunfire, entities, ghost retargeting, 60 fps, 0 crashes.
    - Level 96 (Tension): exit gating (REQ_EXIT rejected while enemies alive, accepted when cleared), transition to floor 97.
    - Level 135 (Showdown, Boss 4): transition from entrance (135) to main hall (136), bodyguard throwing knives, panthers. Zero crashes.
  * Build: 71 co-op code files, 58 hooks. All tests passed cleanly.
- 2026-10-20 **Dialogue synchronization, shared text view, and partner proximity check (one PC):**
  * Partner proximity check (scrCoopPartnerNear): interactions with phones (objPhone, objBossPhone), answering machines (objAnsweringMachine in objPlayerMouseHouse), and dialogue NPCs (objAssassinPizza, objAssassinBar, objAssassinVHS, objPimpPhone) check if the partner is nearby (within 140 px). If the partner is alive and far away, interaction is prevented and a notice 'WAIT FOR YOUR PARTNER' is displayed.
  * Synchronized dialogue (message 50 DIALOGUE): objPhoneConversation state (active, current line index, messages, portrait sprite, line1, line2) is sent reliably from host to client whenever lines change or dialogue starts/finishes. Client creates/updates its objPhoneConversation and draws the exact same portrait and animated text.
  * Host-authoritative dialogue progression: client mouse clicks (Mouse 53 advance, Mouse 51/57 skip) in objPhoneConversation are disabled via hooks. Only the host controls the conversation; when host advances or skips, the client updates or closes simultaneously.
  * Remote phone answering (message 51 REQ_PHONE): if client interacts with a ringing phone while both players are near, client sends REQ_PHONE to host, triggering phone answering on host.
  * Build: 74 co-op code files, 68 hooks.
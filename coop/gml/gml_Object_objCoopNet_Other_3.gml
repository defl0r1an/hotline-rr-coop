// Game End. Only logged for now: it is not yet known whether game_restart also fires it, and the
// session must survive game_restart, so the DLL is not shut down here.
external_call(global.coop_f_log, "Game End event in " + room_get_name(room));

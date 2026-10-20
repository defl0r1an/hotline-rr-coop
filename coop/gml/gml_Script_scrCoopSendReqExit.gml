// Client: ask the host to use exit argument0 (REQ_EXIT 112: room i, exit instance id i - room-placed exits have
// the same id on both PCs). 60-frame cooldown while the player stays on it.
if (global.coop_exit_cd > 0)
{
    exit;
}
global.coop_exit_cd = 60;
external_call(global.coop_f_begin, 112);
external_call(global.coop_f_wi, room);
external_call(global.coop_f_wi, argument0);
external_call(global.coop_f_end, 1);
external_call(global.coop_f_log, "client: asking the host to use exit " + string(argument0) + " (" + object_get_name(argument0.object_index) + ")");
global.coop_notice = "ASKING THE HOST TO GO ON...";
global.coop_notice_time = 90;

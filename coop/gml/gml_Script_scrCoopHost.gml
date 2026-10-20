// Starts hosting on global.coop_port, dropping any session this PC already has.
if (!global.coop_dll)
{
    exit;
}
if (global.coop_state != 0)
{
    external_call(global.coop_f_disconnect);
}
external_call(global.coop_f_host, global.coop_port);
global.coop_notice = "";
global.coop_notice_time = 0;

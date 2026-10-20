// Ends this PC's co-op session (hosting or joined).
if (!global.coop_dll || global.coop_state == 0)
{
    exit;
}
external_call(global.coop_f_disconnect);
global.coop_notice = "LEFT CO-OP";
global.coop_notice_time = 120;

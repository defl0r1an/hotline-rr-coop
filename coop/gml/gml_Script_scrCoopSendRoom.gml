// Host: tells the client which floor to be on. argument0 = room, or -1 when the host is not on a co-op floor.
// ROOM (16): room i, level i, sequence d, hardmode i, title s, pretitle s.
// Story globals always exist: scrCoopInit gives them defaults on first boot.
var lev, seq, hard, ti, pti;
lev = -1;
seq = 0;
hard = 0;
ti = "";
pti = "";
if (argument0 >= 0)
{
    lev = global.level;
    seq = global.sequence;
    hard = global.hardmode;
    ti = string(global.title);
    pti = string(global.pretitle);
}
external_call(global.coop_f_begin, 16);
external_call(global.coop_f_wi, argument0);
external_call(global.coop_f_wi, lev);
external_call(global.coop_f_wd, seq);
external_call(global.coop_f_wi, hard);
external_call(global.coop_f_ws, ti);
external_call(global.coop_f_ws, pti);
external_call(global.coop_f_end, 1);
external_call(global.coop_f_log, "ROOM sent: room " + string(argument0) + " level " + string(lev));

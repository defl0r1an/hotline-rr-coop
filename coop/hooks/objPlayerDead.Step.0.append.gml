
// Co-op: spectate the partner while they are alive (scrCoopViewX/Y read this timer).
if (global.coop_active && scrCoopPartnerAlive())
{
    global.coop_spec_t += 1;
}
else
{
    global.coop_spec_t = 0;
}

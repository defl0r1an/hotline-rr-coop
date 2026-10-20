// F8: join the host set in coop.ini or the CO-OP menu (main menu only).
if (room != rmMenu)
{
    exit;
}
if (global.coop_state == 0 || global.coop_state >= 4)
{
    scrCoopJoin();
}

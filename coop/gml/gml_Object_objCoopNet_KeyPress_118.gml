// F7: host a co-op session (main menu only; the CO-OP menu item does the same).
if (room != rmMenu)
{
    exit;
}
if (global.coop_state == 0 || global.coop_state >= 4)
{
    scrCoopHost();
}

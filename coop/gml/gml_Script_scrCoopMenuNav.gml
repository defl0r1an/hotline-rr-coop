// W/S (argument0 = -1 up, 1 down) in the main menu with the CO-OP item (level 0) and in the
// co-op submenu (level 2). The main menu keeps its original item ids; coop_order is the on-screen order.
var p, k;
if (fade == 1 || wait > 0 || coop_edit)
{
    exit;
}
wait = 3;
repeats = 0;
if (level == 0)
{
    p = 0;
    for (k = 0; k < 5; k += 1)
    {
        if (coop_order[k] == select)
        {
            p = k;
        }
    }
    select = coop_order[(p + argument0 + 5) mod 5];
}
else
{
    select = (select + argument0 + 4) mod 4;
}

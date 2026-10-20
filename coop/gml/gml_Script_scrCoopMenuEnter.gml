// Enter / click in the main menu's CO-OP item (level 0) and in the co-op submenu (level 2).
var st, role;
if (level == 0)
{
    level = 2;
    select = 0;
    coop_edit = 0;
    wait = 3;
    exit;
}
if (coop_edit)
{
    coop_edit = 0;
    global.coop_ip = keyboard_string;
    if (global.coop_dll)
    {
        external_call(global.coop_f_cfg_set, "ip", global.coop_ip);
    }
    exit;
}
st = global.coop_state;
role = global.coop_role;
if (select == 0)
{
    if (role == 1 && (st == 1 || st == 3))
    {
        scrCoopLeave();
    }
    else
    {
        scrCoopHost();
    }
}
else if (select == 1)
{
    if (role == 2 && (st == 2 || st == 3))
    {
        scrCoopLeave();
    }
    else if (global.coop_ip == "")
    {
        select = 2;
        coop_edit = 1;
        coop_blink = 0;
        keyboard_string = "";
    }
    else
    {
        scrCoopJoin();
    }
}
else if (select == 2)
{
    coop_edit = 1;
    coop_blink = 0;
    keyboard_string = global.coop_ip;
}
else
{
    scrCoopMenuBack();
}

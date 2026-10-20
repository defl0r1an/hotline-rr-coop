if (global.coop_role == 2 && global.coop_state == 3 && level == 0 && select != 4)
{
    global.coop_notice = "THE HOST CHOOSES THE LEVEL";
    global.coop_notice_time = 180;
    exit;
}
if ((level == 0 && select == 4) || level == 2)
{
    scrCoopMenuEnter();
    exit;
}

if (global.coop_active && global.coop_role == 2)
{
    if (on == 1 && talked == 0)
    {
        if (scrCoopPartnerNear(140))
        {
            external_call(global.coop_f_begin, 51);
            external_call(global.coop_f_wi, round(x));
            external_call(global.coop_f_wi, round(y));
            external_call(global.coop_f_end, 1);
        }
    }
    exit;
}
if (!scrCoopPartnerNear(140))
{
    exit;
}

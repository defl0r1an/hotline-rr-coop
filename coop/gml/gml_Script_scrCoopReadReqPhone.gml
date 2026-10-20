var px, py, ph;
px = external_call(global.coop_f_ri);
py = external_call(global.coop_f_ri);
if (global.coop_active && global.coop_role == 1)
{
    ph = instance_nearest(px, py, objPhone);
    if (ph != noone && point_distance(ph.x, ph.y, px, py) < 32)
    {
        with (ph)
        {
            event_perform(ev_mouse, 54);
        }
    }
    else
    {
        ph = instance_nearest(px, py, objBossPhone);
        if (ph != noone && point_distance(ph.x, ph.y, px, py) < 32)
        {
            with (ph)
            {
                event_perform(ev_mouse, 54);
            }
        }
    }
}

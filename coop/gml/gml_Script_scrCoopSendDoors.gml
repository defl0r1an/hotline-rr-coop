with (objDoorV)
{
    if (abs(swingspeed) > 0)
    {
        external_call(global.coop_f_begin, 70);
        external_call(global.coop_f_wi, round(x));
        external_call(global.coop_f_wi, round(y));
        external_call(global.coop_f_wf, image_angle);
        external_call(global.coop_f_wf, swingspeed);
        external_call(global.coop_f_end, 0);
    }
}

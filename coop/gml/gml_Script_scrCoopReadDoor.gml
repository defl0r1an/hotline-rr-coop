var dx, dy, d_angle, d_speed, d_inst;
dx = external_call(global.coop_f_ri);
dy = external_call(global.coop_f_ri);
d_angle = external_call(global.coop_f_rf);
d_speed = external_call(global.coop_f_rf);

d_inst = instance_nearest(dx, dy, objDoorV);
if (d_inst != noone)
{
    if (point_distance(d_inst.x, d_inst.y, dx, dy) < 16)
    {
        d_inst.image_angle = d_angle;
        d_inst.swingspeed = d_speed;
        if (abs(d_speed) > 0)
        {
            d_inst.swinger = 1;
        }
    }
}

image_speed = 0.1;
shotgunned = 0;
hits = 0;
blood = 120;
wait = 0;
reload = 0;
state = 0;
wait = 40;
path = -1234;
alert = 0;
alarm[0] = 1;
ammo = 10;
scrInitPathFinding();
dennisknife = 0;
if (global.talked == 1 || room != rmPoliceHQFloor3)
{
    state = 2;
    image_index = 0;
    image_speed = 0.15;
    sprite_index = sprChiefArm;
    viewx = view_xview[0];
    viewy = view_yview[0];
    with (objEffector)
    {
        instance_destroy();
    }
    my_id = instance_create(x, y, objEffector);
    my_id.blackx = 15;
    my_id.amount = 180;
    view_xview[0] = viewx;
    view_yview[0] = viewy;
}

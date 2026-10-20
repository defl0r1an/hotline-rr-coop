image_speed = 0;
image_index = 0;
reload = floor(random(10));
alert = 0;
ammo = 0;
path = path_add();
type = 0;
on = 0;
if (object_index == objEMafiaShitStandIdle)
{
    with (instance_nearest(x, y, objToilet))
    {
        image_index = 0;
    }
}

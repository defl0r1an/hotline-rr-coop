if (image_index < 2)
{
    image_index += addspeed;
}
else
{
    if (huy == 0)
    {
        repeat (5 + random(4))
        {
            dir = (image_angle - 30) + random(60);
            length = 7 + random(10);
            my_id = instance_create(x + lengthdir_x(length, dir), y + lengthdir_y(length, dir), objBloodSpeck);
            my_id.image_angle = dir;
            my_id.surface = surface;
        }
        if (!(place_meeting(x, y, objSewerWaterWave) && global.maskindex == 19))
        {
            if (surface)
            {
                addToSurface(global.surf2, 0);
            }
        }
        speed = 0;
    }
    huy = 1;
}
if (AIDS == 0)
{
    AIDS = speed;
}
else if (image_index < 2)
{
    speed = AIDS;
}
else
{
    speed = 0;
}

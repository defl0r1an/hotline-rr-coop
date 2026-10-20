if (global.xbox == 1)
{
    if (checkbutton(0, getid(5)) || checkbutton(0, getid(6)))
    {
        if (presstart == 0)
        {
            presstart = 1;
            scrXboxBikeEndingStart();
        }
    }
    else
    {
        presstart = 0;
    }
}
if ((current_time - start_time) > 250000)
{
    image_index = 0;
    if (global.gotbeaten == 1)
    {
        sprite_index = sprMCDriveOff;
    }
    else
    {
        sprite_index = sprBikerDriveOffUnmasked;
    }
    fade = 1;
}
if (sprite_index == sprMCDrive || sprite_index == sprBikerDriveUnmasked)
{
    if (x > 200)
    {
        if (state == 0)
        {
            if (x < 232)
            {
                hspeed = point_distance(x, y, 232, y) * 0.1;
            }
            if (hspeed > 8)
            {
                hspeed = 8;
            }
            if (hspeed < 0.5)
            {
                hspeed = 0.5;
            }
            if (x >= 232 && random(10) == 4)
            {
                state = 1;
            }
            if (image_index < 3.5)
            {
                image_index += 0.4;
            }
            else
            {
                image_index = 0;
            }
        }
        if (state == 1)
        {
            if (x > 200)
            {
                hspeed -= 0.1;
            }
            else if (hspeed < 0)
            {
                hspeed += 0.05;
            }
            else
            {
                hspeed = 0;
            }
            if (hspeed < -1)
            {
                hspeed = -1;
            }
            if (x <= 200 && random(10) == 4)
            {
                x = 200;
                hspeed = 0;
                state = 0;
            }
            if (image_index < 3.5)
            {
                image_index += 0.4;
            }
            else
            {
                image_index = 0;
            }
        }
    }
    else
    {
        hspeed += 0.04;
    }
}
else
{
    hspeed += 0.5;
}
my_id = instance_create(x + 16, y, objDriveSmoke);
my_id.hspeed = -8;
if (round(random(32)) == 2)
{
    targety = (centery - 6) + random(12);
}
if (y < targety)
{
    y += 0.1;
}
if (y > targety)
{
    y -= 0.1;
}
if (state == 1)
{
    credits_y -= 0.2;
}

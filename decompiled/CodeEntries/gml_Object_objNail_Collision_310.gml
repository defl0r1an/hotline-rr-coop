if (other.object_index == objWallSoftH || other.object_index == objWallSoftV)
{
    if (solid == 1)
    {
        x += hspeed;
        y += vspeed;
    }
    my_id = instance_create(x + lengthdir_x(14, direction), y + lengthdir_y(14, direction), objHit);
    my_id.image_angle = direction;
    my_id = instance_create(x + lengthdir_x(14, direction), y + lengthdir_y(14, direction), objSmokeHit);
    my_id.image_angle = direction;
    my_id.direction = random(360);
    my_id.speed = random(0.5);
    repeat (4)
    {
        my_id = instance_create(x + lengthdir_x(14, direction), y + lengthdir_y(14, direction), objDebris);
        my_id.direction = random(360);
        my_id.speed = random(4);
    }
    if (passed == 0)
    {
        passed = 1;
        dirx = x - lengthdir_x(16, direction);
        diry = y - lengthdir_y(16, direction);
    }
    exit;
}
if (other.object_index == objGlassPanelH)
{
    ini_open("Achievements.ini");
    count = ini_read_real("AchData", "Windows broken", 0);
    if (!(count == 50))
    {
        count++;
        ini_write_real("AchData", "Windows broken", count);
    }
    else
    {
        scrAchievementSet("Vandal");
    }
    ini_close();
    if (vspeed > 0)
    {
        other.add = -1;
    }
    else
    {
        other.add = 1;
    }
    with (other.id)
    {
        i = 0;
        repeat (24)
        {
            my_id = instance_create(x + (i * 1.5), y, objShard);
            my_id.speed = random(5);
            my_id.direction = ((add * 90) - 8) + random(16);
            i += 1;
        }
        instance_create(x, y, objGlassPanelHBroken);
        instance_destroy();
        if (!audio_is_playing(sndGlass1) && !audio_is_playing(sndGlass2))
        {
            audio_play_sound(choose(sndGlass1, sndGlass2), 0, false);
        }
    }
    exit;
}
if (other.object_index == objGlassPanelV)
{
    ini_open("Achievements.ini");
    count = ini_read_real("AchData", "Windows broken", 0);
    if (!(count == 50))
    {
        count++;
        ini_write_real("AchData", "Windows broken", count);
    }
    else
    {
        scrAchievementSet("Vandal");
    }
    ini_close();
    if (hspeed > 0)
    {
        other.add = -1;
    }
    else
    {
        other.add = 1;
    }
    with (other.id)
    {
        i = 0;
        repeat (24)
        {
            my_id = instance_create(x, y + (i * 1.5), objShard);
            my_id.speed = random(5);
            my_id.direction = ((90 + (add * 90)) - 8) + random(16);
            i += 1;
        }
        instance_create(x, y, objGlassPanelVBroken);
        instance_destroy();
        if (!audio_is_playing(sndGlass1) && !audio_is_playing(sndGlass2))
        {
            audio_play_sound(choose(sndGlass1, sndGlass2), 0, false);
        }
    }
    exit;
}
if (other.object_index == objWallBoardsH && other.sprite_index != sprWallBrokenBoardsH)
{
    if (solid == 1)
    {
        x += hspeed;
        y += vspeed;
    }
    if (vspeed > 0)
    {
        other.add = -1;
    }
    else
    {
        other.add = 1;
    }
    with (other.id)
    {
        global.my_id = id;
        i = 0;
        repeat (24)
        {
            if (round(random(20)) == 1)
            {
                my_id = instance_create(x + (i * 1.5), y, objShard);
                my_id.speed = random(5);
                my_id.direction = ((add * 90) - 8) + random(16);
                my_id.sprite_index = sprBoardsWallDebris;
                my_id.image_index = random(7);
            }
            i += 1;
        }
        bullets = 0;
        with (objBullet)
        {
            if (place_meeting(x, y, global.my_id))
            {
                global.my_id.bullets += 1;
            }
        }
        energie -= (1 + (objBullet.caliber * 3));
        if (bullets > 3)
        {
            energie = -1;
        }
    }
    move_contact_solid(direction, speed * 2);
    my_id = instance_create(x + lengthdir_x(14, direction), y + lengthdir_y(14, direction), objSmokeHit);
    my_id.image_angle = direction;
    my_id.direction = direction - 180;
    my_id.speed = random(1);
    amount = random(0.5);
    my_id.color1 = merge_color(c_gray, c_dkgray, amount);
    my_id.color2 = merge_color(c_dkgray, c_black, amount);
    my_id = instance_create(x + lengthdir_x(14, direction), y + lengthdir_y(14, direction), objHit);
    my_id.image_angle = direction;
    exit;
}

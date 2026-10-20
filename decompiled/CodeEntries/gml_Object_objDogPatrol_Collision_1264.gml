global.my_id = id;
image_xscale = 1.5;
image_yscale = 1.5;
bullets = 0;
energie -= 1;
with (objNail)
{
    if (place_meeting(x, y, global.my_id))
    {
        my_id = instance_create(x, y, objBloodSmoke);
        my_id.direction = (direction - 170) + random(10);
        my_id.speed = 1;
        my_id.image_angle = my_id.direction;
        my_id.image_xscale = 0.8 + random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        instance_destroy();
        global.my_id.bullets += 1;
    }
}
image_xscale = 1;
image_yscale = 1;
edir = other.direction;
if (point_distance(other.x, other.y, other.startx, other.starty) > 150)
{
    ds_list_add(global.bonuslist, "Sharp Shooter");
    if (global.bonustime < 12)
    {
        global.bonustime = 12;
    }
}
test = 0;
repeat (2 * bullets)
{
    my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, edir), (y - 3) + random(6) + lengthdir_y(8, edir), objBloodDrop);
    my_id.image_xscale = 1 - random(0.2);
    my_id.image_yscale = my_id.image_xscale;
    my_id.image_angle = point_direction(x + lengthdir_x(8, edir), y + lengthdir_y(8, edir), my_id.x, my_id.y);
    my_id.sprite_index = sprBloodSplatSmall;
    my_id.direction = my_id.image_angle;
    my_id.speed = 2 + random(4);
}
repeat (1 + random(bullets))
{
    my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, edir), (y - 3) + random(6) + lengthdir_y(8, edir), objBloodDrop);
    my_id.image_xscale = 1 - random(0.2);
    my_id.image_yscale = my_id.image_xscale;
    my_id.image_angle = point_direction(x + lengthdir_x(8, edir), y + lengthdir_y(8, edir), my_id.x, my_id.y);
    my_id.direction = my_id.image_angle;
    my_id.speed = 1 + random(5);
}
repeat (bullets)
{
    my_id = instance_create((x - 3) + random(6) + lengthdir_x(16, edir), (y - 3) + random(6) + lengthdir_y(16, edir), objBloodSmoke);
    my_id.image_xscale = 1.2 - random(0.2);
    my_id.image_yscale = my_id.image_xscale;
    my_id.image_angle = (edir - 20) + random(40);
    my_id.direction = my_id.image_angle;
    my_id.speed = 2 + random(1);
    my_id.friction = 0.15;
}
if (bullets > 1 || round(random(1)) || energie < 0)
{
    if (instance_exists(objPlayerMouse))
    {
        ini_open("Achievements.ini");
        objPlayerMouse.count = ini_read_real("AchData", "Dogs Killed", 0);
        if (!(objPlayerMouse.count == 99))
        {
            objPlayerMouse.count++;
            ini_write_real("AchData", "Dogs Killed", objPlayerMouse.count);
        }
        else
        {
            scrAchievementSet("Dog Lover");
        }
        ini_close();
    }
    my_id = instance_create(x, y - 12, objScore);
    my_id.text = "+" + string(100 + (bullets * 20) + (200 * global.factor)) + "pts" + string(textmercy);
    global.myscore += (100 + (bullets * 20) + (200 * global.factor));
    global.killscore += (100 + (bullets * 20));
    global.boldscore += (200 * global.factor);
    global.combo += 1;
    global.combotime = 240;
    global.killx[global.kills] = x;
    global.killy[global.kills] = y;
    global.kills += 1;
    global.blink = 1;
    if (global.bonustime < (12 + (global.factor * 4)))
    {
        global.bonustime = 12 + (global.factor * 4);
    }
    if (global.factor == 2)
    {
        ds_list_add(global.bonuslist, "Exposure");
    }
    if (global.factor == 3)
    {
        ds_list_add(global.bonuslist, "Double Exposure");
    }
    if (global.factor == 4)
    {
        ds_list_add(global.bonuslist, "Triple Exposure");
    }
    if (global.factor > 4)
    {
        ds_list_add(global.bonuslist, "Severe Exposure");
    }
    audio_sound_pitch(audio_play_sound(choose(sndBulletHit1, sndBulletHit2, sndBulletHit3), 0, false), 1.5);
    my_id = instance_create(x, y, objDeadBody);
    my_id.image_yscale = choose(-1, 1);
    my_id.sprite_index = sprDogDeadNailgun;
    SteamIncStat("Dogs", 1);
    my_id.image_index = floor(random(sprite_get_number(sprite_index)));
    my_id.direction = edir;
    my_id.speed = 1.5 + random(1) + (bullets * 0.15);
    my_id.image_angle = my_id.direction;
    if (object_index == objDogPatrolFriend)
    {
        global.dogsave -= 1;
    }
    instance_destroy();
}

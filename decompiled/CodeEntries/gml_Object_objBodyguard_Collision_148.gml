if (state < 3)
{
    exit;
}
if (sprite_index == sprBodyguardGetUp)
{
    exit;
}
if (global.maskindex == 24)
{
    repeat (3)
    {
        my_id = instance_create((x - 2) + random(2), (y - 2) + random(2), objWeaponThrow);
        my_id.image_index = 37;
        my_id.direction = random(360);
        my_id.speed = 3 + random(1.5);
    }
    repeat (12)
    {
        my_id = instance_create(x, y, objBloodSmoke);
        my_id.image_xscale = 1.2 - random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        if ((room == rmHouse1Downstairs && instance_exists(objBoss1)) || instance_exists(objVan))
        {
            my_id.decadenced = 1;
        }
        my_id.image_angle = random(360);
        my_id.direction = my_id.image_angle;
        my_id.speed = 2 + random(1);
        my_id.friction = 0.15;
    }
    my_id = instance_create(x, y, objDeadBody);
    my_id.direction = other.direction;
    my_id.speed = 2 + random(1);
    my_id.image_angle = my_id.direction;
    my_id.sprite_index = sprBodyguardBlunt;
    my_id.image_index = 12;
    audio_play_sound(sndHit, 0, false);
    audio_play_sound(sndPunch, 0, false);
    audio_play_sound(sndBonesBreak, 0, false);
    global.shake = 10;
    with (objBoss4)
    {
        scrGetMessage(1);
        with (objPlayerMouse)
        {
            my_id = instance_create(x, y, objPlayerMouseHouse);
            my_id.active = 0;
            my_id.dir = dir;
            my_id.legindex = legindex;
            my_id.sprite_index = sprite_index;
            my_id.image_index = image_index;
            my_id.direction = 90;
            my_id.legdir = 90;
            my_id.maskon = 1;
            my_id.maskindex = maskindex;
            instance_destroy();
        }
        state = 4;
    }
    instance_destroy();
    exit;
}
path_end();
sprite_index = sprBodyguardGetUp;
image_index = 1;
speed = 1.5;
friction = 0.1;
direction = other.direction;
global.shake = 2;
reload = 50 + random(60);
audio_play_sound(sndDoorHit, 1, false);
with (other.id)
{
    move_bounce_all(0);
}

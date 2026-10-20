if (global.shells > 0 && sprite_index == sprJacketWalkShorty && ammo < 2 && global.maskindex == 3)
{
    if (ammo == 1)
    {
        my_id = instance_create(x + lengthdir_x(5, dir - (5 * left)), y + lengthdir_y(5, dir - (5 * left)), objShell);
        my_id.sprite_index = sprShotgunShell;
        my_id.image_angle = dir;
        my_id.direction = (dir - (180 * left) - 20) + random(30);
        my_id.speed = 1.5 + random(1.5);
        sprite_index = sprAubreyReloadShorty1ShellLeft;
        image_speed = 0.25;
        audio_play_sound(double_barrel_shotgun_reload_single, 0, false);
    }
    else if (ammo == 0 && global.shells == 1)
    {
        my_id = instance_create(x + lengthdir_x(5, dir - (5 * left)), y + lengthdir_y(5, dir - (5 * left)), objShell);
        my_id.sprite_index = sprShotgunShell;
        my_id.image_angle = dir;
        my_id.direction = (dir - (180 * left) - 20) + random(30);
        my_id.speed = 1.5 + random(1.5);
        sprite_index = sprAubreyReloadShorty1ShellRight;
        image_speed = 0.25;
        audio_play_sound(double_barrel_shotgun_reload_single, 0, false);
    }
    else
    {
        repeat (2)
        {
            my_id = instance_create(x + lengthdir_x(5, dir - (5 * left)), y + lengthdir_y(5, dir - (5 * left)), objShell);
            my_id.sprite_index = sprShotgunShell;
            my_id.image_angle = dir;
            my_id.direction = (dir - (180 * left) - 20) + random(30);
            my_id.speed = 1.5 + random(1.5);
        }
        sprite_index = sprAubreyReloadShorty2Shells;
        image_speed = 0.25;
        audio_play_sound(double_barrel_shotgun_reload, 0, false);
    }
}

if (reload > 0)
{
    reload -= 1;
    exit;
}
switch (sprite_index)
{
    case sprEMafiaAmbush9mm:
        shake = 1;
        if (global.hardmode == 0)
        {
            reload = 20;
        }
        else
        {
            reload = 14;
        }
        my_id = instance_create(x + lengthdir_x(22, dir - (20 * deltax)), y + lengthdir_y(22, dir - (20 * deltay)), objEBullet);
        my_id.direction = (dir - 2) + random(6);
        my_id.speed = 16;
        my_id.image_angle = my_id.direction;
        audio_play_sound(snd9mm, 0, false);
        break;
    case sprEMafiaAmbushSilencer:
        shake = 1;
        reload = 10;
        my_id = instance_create(x + lengthdir_x(26, dir - (20 * deltax)), y + lengthdir_y(26, dir - (20 * deltay)), objEBullet);
        my_id.direction = (dir - 2) + random(6);
        my_id.speed = 16;
        my_id.image_angle = my_id.direction;
        audio_play_sound(sndSilencer, 0, false);
        break;
    case sprEMafiaAmbushScorpion:
        shake = 1;
        reload = 3;
        my_id = instance_create(x + lengthdir_x(26, dir - (20 * deltax)), y + lengthdir_y(26, dir - (20 * deltay)), objEBullet);
        my_id.direction = (dir - 4) + random(8);
        my_id.speed = 16;
        my_id.image_angle = my_id.direction;
        audio_play_sound(sndScorpion, 0, false);
        break;
}
my_id = instance_create(x + lengthdir_x(5, dir - 5), y + lengthdir_y(5, dir - 5), objShell);
my_id.sprite_index = sprUziShell;
my_id.image_angle = dir;
my_id.direction = (dir - 90 - 20) + random(30);
my_id.speed = 1 + random(3);

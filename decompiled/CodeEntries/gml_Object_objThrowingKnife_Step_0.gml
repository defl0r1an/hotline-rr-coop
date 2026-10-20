if (bounced == 1)
{
    image_angle += (dir_add * speed * 10);
    friction = 0.2;
}
if (speed > 0)
{
    mask_index = sprite_index;
    global.my_id = id;
    with (objEnemy)
    {
        if (object_index == objDogPatrol || object_index == objEDodger || object_index == objEDodgerG || object_index == objEDodgerPatrol || object_index == objEDodgerGPatrol)
        {
            nothing = 1;
        }
        else if (object_index == objEnemyFat || object_index == objInspector || object_index == objChief || object_index == objEFatGunner)
        {
            if (place_meeting(x, y, global.my_id))
            {
                edir = other.direction;
                knife += 1;
                hits += 2;
                audio_play_sound(choose(sndCut1, sndCut2), 0, false);
                repeat (2)
                {
                    my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, edir), (y - 3) + random(6) + lengthdir_y(8, edir), objBloodDrop);
                    my_id.image_xscale = 1 - random(0.2);
                    my_id.image_yscale = my_id.image_xscale;
                    my_id.image_angle = point_direction(x + lengthdir_x(8, edir), y + lengthdir_y(8, edir), my_id.x, my_id.y);
                    my_id.sprite_index = sprBloodSplatSmall;
                    my_id.direction = my_id.image_angle;
                    my_id.speed = 2 + random(4);
                }
                repeat (1 + random(1))
                {
                    my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, edir), (y - 3) + random(6) + lengthdir_y(8, edir), objBloodDrop);
                    my_id.image_xscale = 1 - random(0.2);
                    my_id.image_yscale = my_id.image_xscale;
                    my_id.image_angle = point_direction(x + lengthdir_x(8, edir), y + lengthdir_y(8, edir), my_id.x, my_id.y);
                    my_id.direction = my_id.image_angle;
                    my_id.speed = 1 + random(5);
                }
                repeat (2)
                {
                    my_id = instance_create((x - 3) + random(6) + lengthdir_x(16, edir), (y - 3) + random(6) + lengthdir_y(16, edir), objBloodSmoke);
                    my_id.image_xscale = 1.2 - random(0.2);
                    my_id.image_yscale = my_id.image_xscale;
                    my_id.image_angle = (edir - 20) + random(40);
                    my_id.direction = my_id.image_angle;
                    my_id.speed = 2 + random(1);
                    my_id.friction = 0.15;
                }
                with (global.my_id)
                {
                    my_id = instance_create(x, y, objBloodSmoke);
                    my_id.direction = (direction - 170) + random(10);
                    my_id.speed = 1;
                    my_id.image_angle = my_id.direction;
                    my_id.image_xscale = 0.8 + random(0.2);
                    my_id.image_yscale = my_id.image_xscale;
                    instance_destroy();
                }
            }
        }
        else if (place_meeting(x, y, global.my_id))
        {
            scrKnifeThrowHits();
            ds_list_add(global.bonuslist, "Projectile Kill");
            global.combotime = 240;
            if (global.bonustime < (12 + (global.factor * 4)))
            {
                global.bonustime = 12 + (global.factor * 4);
            }
        }
    }
    mask_index = sprWeaponMask;
}

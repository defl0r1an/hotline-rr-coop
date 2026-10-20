if (!instance_exists(objPlayer))
{
    exit;
}
if (scrIsAttacking(objPlayer.sprite_index) && ((objPlayer.sprite_index != sprPAttackPunch || (global.maskindex == 11 && global.hardmode == 1) || global.maskindex == 27) && place_meeting(x - lengthdir_x(12, objPlayer.dir), y - lengthdir_y(12, objPlayer.dir), objPlayer)))
{
    global.test = 0;
    with (objPlayer)
    {
        if (place_meeting(x + lengthdir_x(16, dir), y + lengthdir_y(16, dir), objBoss2Pry))
        {
            global.test = 1;
        }
    }
    if (global.test == 1)
    {
        audio_play_sound(sndHit, 0, false);
        audio_play_sound(sndHitWall, 0, false);
        global.shake = 5;
        if (energie >= 2)
        {
            my_id = instance_create(x + lengthdir_x(14, image_angle + 135), y + lengthdir_y(14, image_angle + 135), objBoss2GetUp);
            my_id.image_angle = point_direction(objPlayer.x, objPlayer.y, my_id.x, my_id.y);
            if (glass == 0)
            {
                audio_play_sound(choose(sndGlass1, sndGlass2), 0, false);
                with (my_id)
                {
                    repeat (16)
                    {
                        my_id = instance_create((x - 5) + random(10), (y - 5) + random(10), objTinyShard);
                        my_id.direction = point_direction(x, y, my_id.x, my_id.y);
                        my_id.speed = 1 + random(1.5);
                        my_id.image_blend = c_black;
                    }
                }
                glass = 1;
            }
            my_id.glass = 1;
            my_id.energie = energie - 1;
            if (energie == 2)
            {
                my_id.sprite_index = sprBoss2GetUp2;
            }
        }
        else
        {
            my_id = instance_create(x + lengthdir_x(14, image_angle + 135), y + lengthdir_y(14, image_angle + 135), objBoss2Crawl);
            my_id.image_angle = image_angle;
            my_id = instance_create(x, y, objMCHelmet);
            my_id.direction = random(360);
            my_id.speed = 1.5 + random(1);
            my_id.sprite_index = sprBikerHelmetSmashed;
            if (global.maskindex == 11 && global.hardmode == 1)
            {
                objPlayer.sprite_index = sprPWalkCleaver;
                objPlayer.left = 1;
            }
            else
            {
                my_id3 = instance_create(x, y, objCleaverDrop);
                if (global.maskindex == 11 && file_exists(working_directory + "\hardmode"))
                {
                    my_id3.pickable = 1;
                }
                my_id3.direction = (image_angle - 70) + random(40);
                my_id3.speed = 1 + random(0.5);
            }
        }
        with (my_id)
        {
            pdir = point_direction(objPlayer.x, objPlayer.y, x, y);
            repeat (4)
            {
                my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, pdir), (y - 3) + random(6) + lengthdir_y(8, pdir), objBloodDrop);
                my_id.image_xscale = 1 - random(0.2);
                my_id.image_yscale = my_id.image_xscale;
                my_id.image_angle = point_direction(x + lengthdir_x(8, pdir), y + lengthdir_y(8, pdir), my_id.x, my_id.y);
                my_id.sprite_index = sprBloodSplatSmall;
                my_id.direction = my_id.image_angle;
                my_id.speed = 2 + random(4);
            }
            repeat (2 + random(3))
            {
                my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, pdir), (y - 3) + random(6) + lengthdir_y(8, pdir), objBloodDrop);
                my_id.image_xscale = 1 - random(0.2);
                my_id.image_yscale = my_id.image_xscale;
                my_id.image_angle = point_direction(x + lengthdir_x(8, pdir), y + lengthdir_y(8, pdir), my_id.x, my_id.y);
                my_id.direction = my_id.image_angle;
                my_id.speed = 1 + random(5);
            }
            repeat (3)
            {
                my_id = instance_create((x - 3) + random(6) + lengthdir_x(16, pdir), (y - 3) + random(6) + lengthdir_y(16, pdir), objBloodSmoke);
                my_id.image_xscale = 1.2 - random(0.2);
                my_id.image_yscale = my_id.image_xscale;
                my_id.image_angle = (pdir - 20) + random(40);
                my_id.direction = my_id.image_angle;
                my_id.speed = 2 + random(1);
                my_id.friction = 0.15;
            }
        }
        instance_destroy();
    }
}

if (global.god == 0)
{
    with (objPlayer)
    {
        audio_play_sound(sndDogAttack, 0, false);
        pdir = point_direction(global.my_id.x, global.my_id.y, x, y);
        repeat (8)
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
        repeat (4)
        {
            my_id = instance_create((x - 3) + random(6) + lengthdir_x(16, pdir), (y - 3) + random(6) + lengthdir_y(16, pdir), objBloodSmoke);
            my_id.image_xscale = 1.2 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            my_id.image_angle = (pdir - 20) + random(40);
            my_id.direction = my_id.image_angle;
            my_id.speed = 2 + random(1);
            my_id.friction = 0.15;
        }
        if (global.maskindex == 21 && !scrCheckMeleeEnergie())
        {
            global.shake = 8;
            with (global.my_id)
            {
                edir = point_direction(objPlayer.x, objPlayer.y, x, y);
                audio_play_sound(sndDoorHit, 1, false);
                my_id = instance_create(x, y, objKnockedOut);
                my_id.type = object_index;
                my_id.reload = 45 + random(30);
                my_id.sprite_index = sprEDogGetUp;
                my_id.speed = 3.5;
                my_id.direction = (edir - 10) + random(20);
                my_id.angle = my_id.direction;
                with (my_id)
                {
                    move_outside_solid(angle - 180, 16);
                }
                my_id.speed = 2;
                instance_destroy();
            }
            if (objPlayer.object_index == objPlayerMouse)
            {
                meleeenergie -= 1;
            }
            else
            {
                global.meleeenergie -= 1;
            }
            if (objPlayer.object_index == objPlayerBiker)
            {
                objPlayer.melenergie -= 1;
            }
            objEffector.morj = 1;
        }
        else
        {
            my_id = instance_create(x, y, objPlayerDead);
            if (object_index == objPlayerBiker)
            {
                my_id.sprite_index = sprMCDeadDog;
            }
            else if (room == rmGriffin || room == rmGriffinUpstairs)
            {
                my_id.sprite_index = sprGriffinDeadDog;
            }
            else
            {
                my_id.sprite_index = sprPBackEaten;
            }
            my_id.direction = pdir;
            my_id.speed = 2.5 + random(1);
            my_id.image_angle = my_id.direction;
            master = my_id;
            if (object_index == objPlayerBiker)
            {
                my_id = instance_create(x, y, objMCHelmet);
                my_id.direction = random(360);
                my_id.speed = 5 + random(2);
            }
            else
            {
                my_id = instance_create(x + lengthdir_x(24, pdir), y + lengthdir_y(24, pdir), objMaskDrop);
            }
            my_id.direction = (pdir - 40) + random(80);
            my_id.speed = 1.5 + random(1);
            my_id = instance_create(master.x, master.y, objDogBite);
            my_id.image_angle = master.image_angle;
            my_id.master = master;
            if (sprite_index == sprPWalkUnarmed || sprite_index == sprPAttackPunch || object_index == objPlayerBiker || sprite_index == sprPWalkBag || sprite_index == sprPAttackBag || sprite_index == sprPBagKill || sprite_index == sprPTigerKill || sprite_index == sprPPushing || sprite_index == sprPKillHeadComeOff || sprite_index == sprPJacketAttackKnuckles || sprite_index == sprPJacketKillDog)
            {
                noweapon = 1;
            }
            else
            {
                noweapon = 0;
            }
            if (noweapon == 0)
            {
                my_id = instance_create(x, y, objWeaponThrow);
                my_id.direction = (pdir - 25) + random(50);
                my_id.speed = 2 + random(1);
                my_id.image_index = scrCurrentWeaponExt(sprite_index);
                my_id.ammo = ammo;
            }
            if (sprite_index == sprPAttackBash || sprite_index == sprPTigerKill)
            {
                my_id = instance_create(x, y, objKnockedOut);
                my_id.angle = image_angle;
                my_id.type = 275;
            }
            instance_destroy();
        }
    }
}
else
{
    exit;
}

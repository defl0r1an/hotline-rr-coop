if (global.notarget == 0)
{
    if (alert == 0)
    {
        if (instance_exists(objPlayer) && global.notarget == 0)
        {
            scrMeleeSearch(objPlayer.x, objPlayer.y, 4);
        }
        if (alertwait > -1)
        {
            alertwait -= 1;
            if (alertwait == 0)
            {
                path_end();
                alert = 1;
            }
        }
        if (scrIsSearching(sprite_index))
        {
            image_speed = 0.2;
            speed = 0;
        }
        if (scrEnemyIsAttacking(sprite_index))
        {
            image_speed = 1;
        }
        if (returning == 0)
        {
            speed = 1;
            direction = round(direction * 0.1) * 10;
            scrPatrol();
        }
        else
        {
            returning = 0;
            speed = 1;
            direction = round(direction * 0.1) * 10;
        }
    }
    if (alertwait > -1)
    {
        if (alertwait == 0)
        {
            path_end();
            alert = 1;
        }
        alertwait -= 1;
    }
    if (path_position == 1)
    {
        path_end();
        alert = 0;
        lookreload = 0;
    }
    if (lookreload > 0)
    {
        lookreload -= 1;
    }
    else
    {
        seen = scrLook(objPlayer.x, objPlayer.y, 12);
        if (seen == 0)
        {
            path_end();
            alert = 1;
        }
        if (seen == 2)
        {
            path_end();
            alert = 2;
        }
        if (seen == 1 && alert > 0)
        {
            if (alert < 3)
            {
                alert = 4;
                chasereload = 0;
            }
        }
        lookreload = 8;
    }
    if (instance_exists(objPlayerDead))
    {
        alert = 0;
        path_end();
        findwall = 1;
        speed = sign(speed);
    }
    if (object_index != objEDodgerG)
    {
        if (alert < 2 && alert > 0)
        {
            scrAttack(objPlayer.x, objPlayer.y, 10, 4);
            if (reload > 0)
            {
                reload -= 1;
            }
            else if (point_distance(x, y, objPlayer.x, objPlayer.y) < 22)
            {
                sound_play(choose(sndSwing1, sndSwing2));
                if (!scrIsAttacking(sprite_index))
                {
                    sprite_index = scrGetAttack(sprite_index);
                    image_index = 1;
                    reload = 30;
                    image_speed = 0.5;
                }
            }
        }
        if (alert == 2)
        {
            scrChase(path, objPlayer.x, objPlayer.y);
            alert = 3;
        }
        if (alert == 3)
        {
            scrMeleeChaseSearch(objPlayer.x, objPlayer.y, 4);
        }
        if (!scrIsAttacking(sprite_index))
        {
            if (path_index >= 0)
            {
                image_speed = path_speed * 0.1;
            }
            else
            {
                image_speed = speed * 0.1;
            }
        }
        if (scrIsAttacking(sprite_index) && !instance_exists(objPlayerDead))
        {
            angle = direction;
            image_speed = 0.5;
            if (place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objPlayer) || place_meeting(x, y, objPlayer))
            {
                global.my_id = id;
                global.sprite = sprite_index;
                with (objPlayer)
                {
                    scrPlayerDieMelee();
                }
                killed = 1;
                speed = 0;
            }
        }
    }
}
scrMoveSolidOff();

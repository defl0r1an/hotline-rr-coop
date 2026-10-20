if (global.maskindex == 13 && global.hardmode == 1 && global.done == 0 && instance_exists(objPlayer) && !instance_exists(objVan))
{
    if (global.killscoresave < global.killscore && global.killscored == 0)
    {
        global.killscored = 1;
    }
    if (global.combo == 0 && global.combotime == 0 && global.killscored != 0 && instance_number(objEnemy) > 0)
    {
        if (instance_exists(objClubOwner))
        {
            if (objClubOwner.state < 1)
            {
                instance_destroy();
                instance_create(x, y, objPlayerDead);
                objPlayerDead.sprite_index = sprPJacketHeadBlow;
                objPlayerDead.image_speed = 0.2;
                objPlayerDead.image_angle = dir;
                my_id = instance_create(x + lengthdir_x(2, (dir - 40) + random(80)), y + lengthdir_y(2, (dir - 40) + random(80)), objMaskDrop);
                my_id.image_index = global.maskindex;
                my_id.direction = (dir - 40) + random(80);
                my_id.speed = 1.5 + random(0.5);
            }
        }
        else
        {
            instance_destroy();
            instance_create(x, y, objPlayerDead);
            objPlayerDead.sprite_index = sprPJacketHeadBlow;
            objPlayerDead.image_speed = 0.2;
            objPlayerDead.image_angle = dir;
            my_id = instance_create(x + lengthdir_x(2, (dir - 40) + random(80)), y + lengthdir_y(2, (dir - 40) + random(80)), objMaskDrop);
            my_id.image_index = global.maskindex;
            my_id.direction = (dir - 40) + random(80);
            my_id.speed = 1.5 + random(0.5);
        }
    }
}

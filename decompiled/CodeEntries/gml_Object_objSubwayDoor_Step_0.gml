if (visible == false)
{
    solid = 1;
    exit;
}
if (wait > 0)
{
    wait -= 1;
    exit;
}
if (on == 1)
{
    solid = 0;
    if (image_index < 12)
    {
        image_index += 0.5;
    }
    else
    {
        if (spawned < 2)
        {
            with (objTrain)
            {
                solid = 0;
            }
            with (objTrainTransition)
            {
                solid = 0;
            }
            if (global.hardmode == 1)
            {
                if (id_ == 0)
                {
                    my_id = instance_create(x - 20, y, objEnemyPatrol);
                    my_id.sprite_index = sprEWalkSilencer;
                    my_id.ammo = 13;
                }
                else
                {
                    if (instance_number(objEnemyMelee) <= 2 && global.maskindex != 3)
                    {
                        my_id = instance_create(x + 20, y, objEnemyMelee);
                    }
                    else
                    {
                        my_id = instance_create(x + 20, y, objEnemyPatrol);
                        my_id.sprite_index = sprEWalkSilencer;
                        my_id.ammo = 13;
                    }
                    my_id.direction = 180;
                }
            }
            else
            {
                my_id = instance_create(x - 20, y, objEnemyMelee);
            }
            spawned = 2;
            scrInitPathFinding();
        }
        if (wait2 > 0)
        {
            wait2 -= 1;
        }
        else
        {
            on = 2;
        }
    }
}
if (on == 2 || on == 3)
{
    if (collision_circle(x + lengthdir_x(-21 * image_xscale, image_angle), y + lengthdir_y(-21 * image_xscale, image_angle), 21, objPlayer, 0, 1) || collision_circle(x + lengthdir_x(-21 * image_xscale, image_angle), y + lengthdir_y(-21 * image_xscale, image_angle), 21, objEnemy, 0, 1))
    {
        if (image_index < 12)
        {
            image_index += 0.5;
        }
        solid = 0;
        exit;
    }
    if (image_index > 0)
    {
        image_index -= 0.5;
    }
    else
    {
        on = 3;
        solid = 1;
    }
}

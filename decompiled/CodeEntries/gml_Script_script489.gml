global.my_id = argument0;
global.test = argument1;
if (!instance_exists(global.my_id))
{
    exit;
}
with (objEHideTrigger)
{
    active = 1;
}
global.list = ds_list_create();
with (objEnemy)
{
    if (object_index == objEDodger || object_index == objEDodgerG || object_index == objEDodgerPatrol || object_index == objEDodgerGPatrol)
    {
        if (scrIsDodging(sprite_index) == 1)
        {
            exit;
        }
    }
    if ((object_index == objDogPatrol && sprite_index == sprDogSit) || object_index == objChief || object_index == objEHideM16 || object_index == objEnemyAmbush)
    {
        exit;
    }
    if (object_get_parent(object_index) == 332 || object_get_parent(object_index) == 1327)
    {
        if (room == rmPoliceHQFloor1 || room == rmHotel1 || room == rmHotel3 || room == rmBuildingFloor4 || room == rmHouse1Downstairs || global.hardmode == 1)
        {
            on = 1;
        }
    }
    if (object_index == objEnemyStationary || object_get_parent(object_index) == 332 || object_index == objChief)
    {
        valid = 0;
    }
    else if (alert > 0)
    {
        valid = 0;
    }
    else
    {
        dist = global.test;
        if (point_distance(x, y, global.my_id.x, global.my_id.y) > dist)
        {
            valid = 0;
        }
        else if (sprite_index == sprEWalkUnarmed || sprite_index == sprEGiveUp)
        {
            valid = 0;
        }
        else
        {
            targetx = (global.my_id.x - 64) + random(128);
            targety = (global.my_id.y - 64) + random(128);
            while (collision_line(global.my_id.x, global.my_id.y, targetx, targety, objSolid, true, true))
            {
                targetx = (global.my_id.x - 64) + random(128);
                targety = (global.my_id.y - 64) + random(128);
            }
            if (mp_grid_path(global.grid, path, x, y, targetx, targety, true))
            {
                valid = 1;
            }
            else
            {
                valid = 0;
            }
        }
    }
}
with (objEnemy)
{
    if (path_exists(path) && valid == 1)
    {
        ds_list_add(global.list, path_get_length(path));
    }
}
ds_list_sort(global.list, 1);
while (ds_list_size(global.list) > 3)
{
    ds_list_delete(global.list, 3);
}
global.test = 0;
with (objEnemy)
{
    if (alert != 4)
    {
        if (valid == 1)
        {
            if (ds_list_find_value(global.list, 0) == path_get_length(path) || ds_list_find_value(global.list, 1) == path_get_length(path) || ds_list_find_value(global.list, 2) == path_get_length(path))
            {
                if (global.test < 3)
                {
                    if (alert == 1)
                    {
                        nothing = 1;
                    }
                    else
                    {
                        path_end();
                        path_start(path, 2, path_action_stop, 1);
                        chase = 1;
                        alert = 2;
                    }
                }
                global.test += 1;
            }
        }
        if (path_speed == 0)
        {
            path_speed = 2;
        }
    }
}

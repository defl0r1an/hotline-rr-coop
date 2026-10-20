if (global.maskindex != 1 && global.maskon == 1)
{
    with (all)
    {
        if (!(object_index == objEffector || object_index == objBackgroundColor || object_index == objSurfacer || object_index == objSecretRoom) && place_meeting(x, y, objSecretRoom))
        {
            instance_destroy();
        }
    }
    iii = 0;
    repeat (tile)
    {
        i = 0;
        repeat (xtile)
        {
            tile_layer_delete_at(depthtile[iii], xdestroy + i, ydestroy);
            ii = 0;
            repeat (ytile)
            {
                tile_layer_delete_at(depthtile[iii], xdestroy + i, ydestroy + ii);
                ii += 16;
            }
            i += 16;
        }
        iii += 1;
    }
    instance_destroy();
}
if (!switchalpha && instance_exists(objPlayer) && collision_rectangle(xdestroy + 7, ydestroy + 7, xdestroy2, ydestroy2, objPlayer, 0, 1))
{
    with (objSecretRoom)
    {
        switchalpha = 1;
    }
}
alpha = lerp(alpha, switchalpha, 0.1);
if (alpha >= 1)
{
    instance_destroy();
}
if (End == 1)
{
    exit;
}
if (instance_exists(objPlayerCarEnter) && global.maskon == 0)
{
    with (all)
    {
        if (!(object_index == objEffector || object_index == objBackgroundColor || object_index == objSurfacer || object_index == objSecretRoom) && place_meeting(x, y, objSecretRoom))
        {
            visible = false;
        }
    }
    visible = false;
}
else
{
    with (all)
    {
        if (!(object_index == objEffector || object_index == objBackgroundColor || object_index == objSurfacer || object_index == objSecretRoom || object_index == objEventTrigger) && place_meeting(x, y, objSecretRoom))
        {
            visible = true;
        }
    }
    with (objCorner)
    {
        if ((nonshadow == -1 || nonshadow == -2) && global.maskindex == 1)
        {
            visible = true;
        }
    }
    if (global.maskindex == 1 && id_ == 1)
    {
        if (room == rmApartment1Entrance)
        {
            with (objBloodPool)
            {
                mask_index = sprNothing;
            }
            my_id = instance_create(224, 288, objPoliceTape);
            my_id.image_angle = 90;
            with (objDoorV)
            {
                if (distance_to_object(objPoliceTape) < 5)
                {
                    instance_destroy();
                }
            }
        }
        if (room == rmBossClubFloor1)
        {
            with (objDoorV)
            {
                if (x == 421 && y == 272)
                {
                    solid = 0;
                }
            }
        }
        tiles = tile_get_ids();
        _tile = tiles[1];
        tiles = tile_get_ids_at_depth(100);
        if (array_length_1d(tiles) > 1)
        {
            for (i = 0; i < array_length_1d(tiles); i++)
            {
                _back = tile_get_background(tiles[i]);
                if (_back == 31)
                {
                    tile_set_background(tiles[i], background0);
                }
            }
        }
        tiles = tile_get_ids_at_depth(1000);
        if (array_length_1d(tiles) > 1)
        {
            for (i = 0; i < array_length_1d(tiles); i++)
            {
                _back = tile_get_background(tiles[i]);
                if (_back == 31)
                {
                    tile_set_background(tiles[i], background0);
                }
            }
        }
    }
    visible = true;
    End = 1;
}

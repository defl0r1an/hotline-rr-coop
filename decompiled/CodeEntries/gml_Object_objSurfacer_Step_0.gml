global.factor = 1;
if (testsurface == 1)
{
    scrSurfaceTiles();
    testsurface = 0;
}
if (!surface_exists(global.surf2))
{
    global.surf2 = surface_create(room_width * 3, room_height * 3);
    if (surface_exists(global.surf2))
    {
        surface_set_target(global.surf2);
        draw_clear_alpha(make_color_hsv(0, 0, 2), 0);
        surface_reset_target();
    }
}
if (!surface_exists(global.surf3))
{
    global.surf3 = surface_create(room_width * 3, room_height * 3);
    scrSurfaceTiles();
}
if (global.check >= 4)
{
    tile_layer_show(1000);
    tile_layer_show(1002);
    tile_layer_show(1000000);
}
if (global.maskindex == 26 && global.maskon == 1)
{
    tiles = tile_get_ids();
    _tile = tiles[1];
    if (tile_get_background(_tile) != 29)
    {
        russell = 0;
    }
}
if (global.maskindex == 26 && global.maskon == 1 && russell == 0)
{
    tiles = tile_get_ids_at_depth(1000000);
    if (array_length_1d(tiles) > 1)
    {
        for (i = 0; i < array_length_1d(tiles); i++)
        {
            _back = tile_get_background(tiles[i]);
            if (_back == 0)
            {
                tile_set_background(tiles[i], bk_tileswhite);
            }
            if (_back == 8 || _back == 2)
            {
                tile_set_background(tiles[i], background1_white);
            }
        }
    }
    for (j = 0; j < 1001; j++)
    {
        tiles = tile_get_ids_at_depth(j);
        if (array_length_1d(tiles) > 1)
        {
            for (i = 0; i < array_length_1d(tiles); i++)
            {
                _back = tile_get_background(tiles[i]);
                if (_back == 0)
                {
                    tile_set_background(tiles[i], bk_tileswhite);
                }
                if (_back == 8 || _back == 2)
                {
                    tile_set_background(tiles[i], background1_white);
                }
            }
        }
    }
    tiles = tile_get_ids_at_depth(-999);
    if (array_length_1d(tiles) > 1)
    {
        for (i = 0; i < array_length_1d(tiles); i++)
        {
            _back = tile_get_background(tiles[i]);
            if (_back == 0)
            {
                tile_set_background(tiles[i], bk_tileswhite);
            }
            if (_back == 8 || _back == 2)
            {
                tile_set_background(tiles[i], background1_white);
            }
        }
    }
    tiles = tile_get_ids_at_depth(-99);
    if (array_length_1d(tiles) > 1)
    {
        for (i = 0; i < array_length_1d(tiles); i++)
        {
            _back = tile_get_background(tiles[i]);
            if (_back == 0)
            {
                tile_set_background(tiles[i], bk_tileswhite);
            }
            if (_back == 8 || _back == 2)
            {
                tile_set_background(tiles[i], background1_white);
            }
        }
    }
    russell = 1;
}

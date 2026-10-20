if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_player);
}
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (image_index < 3)
{
    scrDrawMask(1);
}
else
{
    global.maskon = 0;
    if (global.maskindex == 26 && russell == 0)
    {
        tiles = tile_get_ids();
        _tile = tiles[1];
        tiles = tile_get_ids_at_depth(100);
        if (array_length_1d(tiles) > 1)
        {
            for (i = 0; i < array_length_1d(tiles); i++)
            {
                _back = tile_get_background(tiles[i]);
                if (_back == 29)
                {
                    tile_set_background(tiles[i], background0);
                }
                if (_back == 30)
                {
                    tile_set_background(tiles[i], Corners);
                }
            }
        }
        tiles = tile_get_ids_at_depth(1000);
        if (array_length_1d(tiles) > 1)
        {
            for (i = 0; i < array_length_1d(tiles); i++)
            {
                _back = tile_get_background(tiles[i]);
                if (_back == 29)
                {
                    tile_set_background(tiles[i], background0);
                }
                if (_back == 30)
                {
                    tile_set_background(tiles[i], Corners);
                }
            }
        }
        tiles = tile_get_ids_at_depth(-99);
        if (array_length_1d(tiles) > 1)
        {
            for (i = 0; i < array_length_1d(tiles); i++)
            {
                _back = tile_get_background(tiles[i]);
                if (_back == 29)
                {
                    tile_set_background(tiles[i], background0);
                }
                if (_back == 30)
                {
                    tile_set_background(tiles[i], Corners);
                }
            }
        }
        russell = 1;
    }
}
shader_reset();

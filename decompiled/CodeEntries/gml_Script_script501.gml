if (global.interfaceon == 1)
{
    with (objCheckpoint)
    {
        d3d_set_projection_ortho(0, 0, global.viewwview, global.viewhview, 0);
        if (surface_exists(surface))
        {
            color = merge_color(c_black, c_yellow, blink);
            draw_surface_ext(surface, 0, 1, 1, 1, 0, color, 1);
            draw_surface_ext(surface, 0, -1, 1, 1, 0, color, 1);
            draw_surface_ext(surface, 1, 0, 1, 1, 0, color, 1);
            draw_surface_ext(surface, -1, 0, 1, 1, 0, color, 1);
            draw_surface_ext(surface, 0, 0, 1, 1, 0, c_white, 1);
            if (blink > 0.1)
            {
                blink -= 0.05;
            }
        }
    }
}

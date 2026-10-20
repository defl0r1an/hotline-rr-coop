surface_free(global.surf1);
surface_free(global.surf2);
surface_free(global.surf3);
i = 0;
repeat (global.cursurf)
{
    if (surface_exists(global.surface[i]))
    {
        surface_free(global.surface[i]);
    }
    if (surface_exists(global.surface2[i]))
    {
        surface_free(global.surface2[i]);
    }
    i += 1;
}
global.surf1 = surface_create(room_width, room_height);
surface_set_target(global.surf1);
draw_clear_alpha(make_color_hsv(0, 0, 2), 0);
surface_alpha();
surface_reset_target();
global.surf2 = surface_create(1920, 1440);
surface_set_target(global.surf2);
draw_clear_alpha(make_color_hsv(0, 0, 2), 0);
surface_alpha();
surface_reset_target();
global.surf3 = surface_create(1920, 1440);
surface_set_target(global.surf3);
draw_clear_alpha(make_color_hsv(0, 0, 2), 0);
surface_alpha();
surface_reset_target();
global.cursurf = 0;

if (surface_exists(global.surf2))
{
    surface_free(global.surf2);
    global.surf2 = surface_create(room_width * 3, room_height * 3);
}
if (surface_exists(global.surf3))
{
    surface_free(global.surf3);
    global.surf3 = surface_create(room_width * 3, room_height * 3);
}
if (surface_exists(global.surf2))
{
    surface_set_target(global.surf2);
    draw_clear_alpha(make_color_hsv(0, 0, 2), 0);
    surface_alpha();
    surface_reset_target();
}
if (surface_exists(global.surf3))
{
    surface_set_target(global.surf3);
    draw_clear_alpha(make_color_hsv(0, 0, 2), 0);
    surface_alpha();
    surface_reset_target();
}
if (surface_exists(global.surface[global.cursurf]))
{
    surface_free(global.surface[global.cursurf]);
    global.surface[global.cursurf] = surface_create(room_width * 3, room_height * 3);
    surface_set_target(global.surface[global.cursurf]);
    draw_clear_alpha(make_color_hsv(0, 0, 2), 0);
    surface_alpha();
    surface_reset_target();
}
if (surface_exists(global.surface2[global.cursurf]))
{
    surface_free(global.surface2[global.cursurf]);
    global.surface2[global.cursurf] = surface_create(room_width * 3, room_height * 3);
    surface_set_target(global.surface2[global.cursurf]);
    draw_clear_alpha(make_color_hsv(0, 0, 2), 0);
    surface_alpha();
    surface_reset_target();
}
cleanmem();
curs = global.cursurf;
save = 0;
testsurface = 0;
surf2 = 1;
surf3 = 1;
global.check = 0;
russell = 0;

if (surface_exists(global.surf1))
{
    surface_free(global.surf1);
}
global.surf1 = surface_create(750, 288);
surface_set_target(global.surf1);
draw_clear(c_white);
surface_reset_target();
talk = 0;
reload = 0;
i = 0;
repeat (30)
{
    size[i] = 1 + random(2);
    global.myx[i] = random(room_width);
    global.myy[i] = random(room_height);
    mydir[i] = random(360);
    myspeed[i] = 1 + random(2);
    diradd[i] = -4 + random(8);
    i += 1;
}
skip = 0;
on = 1;
time = 1;
baseheight = room_height * 0.2;
lines = 0;
factor = 0;
alpha = 1;

if (global.language == 1)
{
    dialoguefont = 8;
}
else if (global.dialoguestyle == 0)
{
    dialoguefont = 44;
}
else
{
    dialoguefont = 7;
}
draw_clear(c_black);
screen_refresh();
surface_free(global.surf2);
global.surf2 = surface_create(view_wport, view_hport);
surface_set_target(global.surf2);
draw_clear_alpha(make_color_hsv(0, 0, 2), 0);
surface_alpha();
surface_reset_target();
save = 0;
global.draw = 1;
dizziness = 0.1;
myx1 = 0;
myy1 = 0;
myx2 = 0;
myy2 = 0;
h1 = 0;
h2 = 155;
dir = random(10000);
noiseindex = 0;
cdir = 0;
alpha = random(1);
time = 1;
baseheight = room_height * 0.2;
lines = 0;
factor = 0;

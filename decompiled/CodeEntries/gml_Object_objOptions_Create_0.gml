if (global.xbox == 1)
{
    scrInitXboxButtons();
}
global.upkey = "W";
global.downkey = "S";
global.leftkey = "A";
global.rightkey = "D";
scrLoadKeys();
scrLoadVol();
dir = 0;
textdir = 0;
nerkusha_disc = 0;
nerkusha_disc_ = 0;
colorwoag = 128;
if (surface_exists(global.surf1))
{
    surface_free(global.surf1);
}
global.surf1 = surface_create(room_width, room_height);
surface_set_target(global.surf1);
draw_clear_alpha(c_black, 0);
surface_reset_target();
gamepg = 1;
gamepgquery = 0;
gamepgalpha = 0;
i = 0;
current = 0;
addx = 0;
blackx = 30;
fade = 0;
c_amount = 0;
level = "MAIN";
select = 0;
repeats = 0;
wait = 0;
altdesc[0] = "CONTROLS SETTINGS";
altdesc[1] = "GRAPHICS SETTINGS";
altdesc[2] = "AUDIO SETTINGS";
altdesc[3] = "GAME SETTINGS";
altdesc[4] = "SUPER R-R SETTINGS";
altdesc[5] = "ACHIEVEMENTS MENU";
alt[0] = "CONTROLS";
alt[1] = "GRAPHICS";
alt[2] = "AUDIO";
alt[3] = "GAME";
alt[4] = "EXTRA";
alt[5] = "ACHIEVEMENTS";
max_alt = 5;
nextrm = 4;
altchoise = "";
for (v = 0; v < 7; v++)
{
    yyyy[v] = 500 + (v * 100);
}
alarm[0] = 1;
brotheriamtimer = 0;

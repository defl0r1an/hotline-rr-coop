audio_stop_sound(sndFlameThrower);
if (global.xbox == 1)
{
    scrInitXboxButtons();
}
scrLoadVol();
blur = 0;
on = 1;
dir = 0;
blacky = 0;
target_blur = 1;
textdir1 = 0;
textdir2 = 0;
surface_set_target(global.surf1);
draw_clear_alpha(c_black, 0);
surface_alpha();
surface_reset_target();
test = 1;
test1 = 1;
i = 0;
global.pause = 1;
repeat (16)
{
    if (global.letter[i] == 1)
    {
        test = 0;
    }
    i += 1;
}
if (global.NotSaved == 1)
{
    test1 = 0;
}
choice[0] = "Resume";
choice[1] = "Puzzle";
choice[2] = "Restart";
choice[3] = "Options";
choice[4] = "Quit";
select = 0;
fade = 0;
c_amount = 180;
state = 0;
wait = 0;
width = window_get_width();
lowres = 0.4;
song = 0;
view_w = room_width;
view_h = room_height;
surf_w = surface_get_width(global.psurf);
surf_h = surface_get_height(global.psurf);
levelgetsongforrestart();
cleanmem();

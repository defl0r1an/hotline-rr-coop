scrLoadVol();
off = 0;
dir = 0;
select = 0;
factor = 0;
textdir3 = 0;
addx = 0;
level = 0;
pageoffset = 0;
selectmax = 5;
surf2 = surface_create(room_width, room_height);
choicetext[0] = "HUD";
choicetext[1] = "Crosshair";
choicetext[2] = "Master";
choicetext[3] = "SFX";
choicetext[4] = "Music";
choicetext[5] = "Next Page";
choicetext[6] = "Weapon Impact";
choicetext[7] = "Screen Shake";
choicetext[8] = "Back";
if (global.interfaceon == 0)
{
    choice[0] = "Off";
}
else
{
    choice[0] = "On";
}
if (global.cursoron == 0)
{
    choice[1] = "Off";
}
else
{
    choice[1] = "On";
}
choice[2] = round(global.smvol * 100);
choice[3] = round(global.svol * 100);
choice[4] = round(global.mvol * 100);
choice[5] = "";
if (global.impact == 0)
{
    choice[6] = "Off";
}
else
{
    choice[6] = "On";
}
if (global.shakeoption == 0)
{
    choice[7] = "Orig";
}
else
{
    choice[7] = "New";
}
choice[8] = "";
surface_set_target(surf2);
draw_clear_alpha(c_black, 0);
surface_reset_target();

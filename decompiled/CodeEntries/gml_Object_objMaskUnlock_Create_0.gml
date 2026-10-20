dir = random(10000);
factor = 0;
mask = floor(random(6));
amount = 180;
maskamount = 180;
on = 0;
fade = 0;
currentmask = 0;
scrInitXboxButtons();
name[0] = "Richard";
name[1] = "Rasmus";
name[2] = "Tony";
name[3] = "Aubrey";
name[4] = "Don Juan";
name[5] = "Graham";
name[6] = "Dennis";
name[7] = "George";
name[8] = "Ted";
name[9] = "Rufus";
name[10] = "Rami";
name[11] = "Willem";
name[12] = "Peter";
name[13] = "Zack";
name[14] = "Oscar";
name[15] = "Rick";
name[16] = "Brandon";
name[17] = "Charlie";
name[18] = "Louie";
name[19] = "Phil";
name[20] = "Nigel";
name[21] = "Earl";
name[22] = "Jones";
name[23] = "Carl";
name[24] = "Jake";
name[25] = "Richter";
name[26] = "Russell";
global.currentmask = 0;
if (global.sequence == 44)
{
    global.currentmask = 1;
}
if (global.sequence == 46)
{
    global.currentmask = 2;
}
if (global.sequence == 48)
{
    global.currentmask = 3;
}
if (global.sequence == 50)
{
    global.currentmask = 4;
}
if (global.sequence == 52)
{
    global.currentmask = 5;
}
if (global.sequence == 54)
{
    global.currentmask = 6;
}
if (global.sequence == 56)
{
    global.currentmask = 7;
}
if (global.sequence == 71)
{
    global.currentmask = 8;
}
if (global.sequence == 73)
{
    global.currentmask = 9;
}
if (global.sequence == 75)
{
    global.currentmask = 10;
}
if (global.sequence == 77)
{
    global.currentmask = 11;
}
if (global.sequence == 79)
{
    global.currentmask = 12;
}
if (global.sequence == 84)
{
    global.currentmask = 13;
}
if (global.sequence == 86)
{
    global.currentmask = 14;
}
if (global.sequence == 37)
{
    global.currentmask = 15;
}
if (global.sequence == 38)
{
    global.currentmask = 16;
}
if (global.sequence == 40)
{
    global.currentmask = 17;
}
if (global.lastgrade < 7 || global.masks[global.currentmask] == 1)
{
    global.currentmask = global.newmask[0];
    currentmask = 1;
}
surface_set_target(global.surf1);
draw_clear_alpha(c_black, 0);
surface_reset_target();
alarm[0] = 100;
shine = 0;

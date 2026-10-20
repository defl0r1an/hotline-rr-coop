alpha = 1;
coldir = 0;
amount = 0;
fade = 0;
my_y = 0;
global.dir = 0;
restart = 0;
update = 0;
dir = 0;
ammoy = -32;
next = 0;
showfinished = 0;
image_speed = 0.4;
action = 0;
wait = 0;
phonex = 0;
nextroom = room_next(room);
global.combo = 0;
global.combotime = 0;
combo = 0;
width = display_get_width();
height = display_get_height();
global.mousex = (display_mouse_get_x() - (width * 0.5)) * (view_wview[0] / width);
global.mousey = (display_mouse_get_y() - (height * 0.5)) * (view_hview[0] / height);
global.done = 0;
if (global.xbox == 1)
{
    scrInitXboxButtons();
}
showammo = 0;
maxammo = 0;
alpha = 1;
coldir = 0;
amount = 0;
fade = 0;
my_y = 0;
global.dir = 0;
restart = 0;
update = 0;
dir = 0;
ammoy = -32;
next = 0;
showfinished = 0;
image_speed = 0.4;
action = 0;
wait = 0;
phonex = 0;
global.loaded = 0;
nextroom = room_next(room);
newsong = 0;
song = -1;
blackx = 0;
bamount = 0;
width = display_get_width();
height = display_get_height();
global.mousex = (display_mouse_get_x() - (width * 0.5)) * (view_wview[0] / width);
global.mousey = (display_mouse_get_y() - (height * 0.5)) * (view_hview[0] / height);
vlastx = view_xview[0];
vlasty = view_yview[0];
global.enemy = -1234;
leveltitle = "";
levelshow = 240;
gridon = 0;
shellsline = 0;
shellsstring = 0;
uzisnd = 0;
arrowdir = 0;
if (instance_exists(objMaskMenu))
{
    if (global.maskindex == 19)
    {
        if (global.sequence == 44)
        {
            leveltitle = "Station de métro Brickell";
        }
        if (global.sequence == 46)
        {
            leveltitle = "East 7th St";
        }
        if (global.sequence == 48)
        {
            leveltitle = "Nord Ouest 184th St";
        }
        if (global.sequence == 50)
        {
            leveltitle = "Sud Ouest 53ème place";
        }
        if (global.sequence == 52)
        {
            leveltitle = "Nord Ouest 24th St";
        }
        if (global.sequence == 54)
        {
            leveltitle = "Sud Ouest 104th St";
        }
        if (global.sequence == 56)
        {
            leveltitle = "Nord Ouest 151st Place";
        }
        if (global.sequence == 71)
        {
            leveltitle = "Sud East 122nd St";
        }
        if (global.sequence == 73)
        {
            leveltitle = "Nord East 165th ";
        }
        if (global.sequence == 75)
        {
            leveltitle = "Nord East 24th St";
        }
        if (global.sequence == 77)
        {
            leveltitle = "East 7th St";
        }
        if (global.sequence == 79)
        {
            leveltitle = "Sud East 24th St";
        }
        if (global.sequence == 84)
        {
            leveltitle = "Ouest 25th St";
        }
        if (global.sequence == 86)
        {
            leveltitle = "Sud 86th St";
        }
    }
    else
    {
        if (global.sequence == 44)
        {
            leveltitle = "Brickell Metro Station";
        }
        if (global.sequence == 46)
        {
            leveltitle = "East 7th St";
        }
        if (global.sequence == 48)
        {
            leveltitle = "North West 184th St";
        }
        if (global.sequence == 50)
        {
            leveltitle = "South West 53rd Place";
        }
        if (global.sequence == 52)
        {
            leveltitle = "North West 24th St";
        }
        if (global.sequence == 54)
        {
            leveltitle = "South West 104th St";
        }
        if (global.sequence == 56)
        {
            leveltitle = "North West 151st Place";
        }
        if (global.sequence == 71)
        {
            leveltitle = "South East 122nd St";
        }
        if (global.sequence == 73)
        {
            leveltitle = "North East 165th ";
        }
        if (global.sequence == 75)
        {
            leveltitle = "North East 24th St";
        }
        if (global.sequence == 77)
        {
            leveltitle = "East 7th St";
        }
        if (global.sequence == 79)
        {
            leveltitle = "South East 24th St";
        }
        if (global.sequence == 84)
        {
            leveltitle = "West 25th St";
        }
        if (global.sequence == 86)
        {
            leveltitle = "South 86th St";
        }
    }
}
if (instance_exists(objPlayerBiker))
{
    if (room == rmNoodleShop)
    {
        leveltitle = "North East 56th St";
    }
    if (room == rmArcadeDownstairs)
    {
        leveltitle = "South West 107th Place";
    }
    if (room == rmPhoneHomEntranceBiker)
    {
        leveltitle = "North West 342nd St";
    }
    if (room == rmJanitors)
    {
        leveltitle = "North 87th Place";
    }
}

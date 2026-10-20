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
alpha = 1;
alphacursor = 1;
amount = 0;
coldir = 0;
amount = 0;
fade = 0;
my_y = 0;
global.dir = 0;
restart = 0;
global.restart = restart;
update = 0;
dir = 0;
text_y = 0;
next = 0;
showfinished = 0;
image_speed = 0.4;
action = 0;
wait = 0;
phonex = 0;
carred = 0;
blackx = -15;
line1x = 0;
line2x = 0;
nextroom = room_next(room);
newsong = 0;
song = -1;
index = 0;
shouldscreenshot = 0;
show_date = 0;
start = 0;
sprite = 1297;
lastgrade = "";
if (room == rmHospitalTopFloor && global.skipdata == 0)
{
    global.skipdata = 1;
    scrShowDate(room);
}
start = 1;
lastbrus = 0;
brus = 0;
global.loaded = 0;
width = display_get_width();
height = display_get_height();
global.mousex = ((display_mouse_get_x() - (width * 0.5)) * view_wview[0]) / width;
global.mousey = ((display_mouse_get_y() - (height * 0.5)) * view_hview[0]) / height;
black = 0;
blackout = 0;
scrInitXboxButtons();

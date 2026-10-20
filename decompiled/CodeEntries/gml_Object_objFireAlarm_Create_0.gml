door_wasnt_open = 1;
audio = 0.4;
light = 0;
dir = 0;
event = 0;
if (room == rmPoliceHQFloor2)
{
    global.firealarmertime = global.savedtime;
    if (global.firealarmertime > 1)
    {
        global.firealarmer = 1;
    }
}

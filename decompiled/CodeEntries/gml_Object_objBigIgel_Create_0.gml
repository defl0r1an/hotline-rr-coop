image_index = 0;
image_speed = 0;
image_xscale = 0;
image_yscale = image_xscale;
image_angle = 270;
if (global.hardmode == 0)
{
    dir = 0;
}
else
{
    dir = 180;
}
stage = -1;
stagespeed = 0;
minipop = 0;
wait = 0;
scalespeed = 0.15;
Emotion = "Start";
waitsound = 50;
sound = 0;
soundpitch = 1;
if (!(room == rmDream1))
{
    sxeasy_setVolume(1);
}
vol = 0;

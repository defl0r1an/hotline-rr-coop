movex = 264;
movey = -32;
if (global.hardmode == 1 && global.maskindex == 2)
{
    nextroom = 131;
}
else
{
    nextroom = room_next(room);
}
with (objRain)
{
    visible = true;
}

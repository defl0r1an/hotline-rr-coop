image_speed = 0;
image_index = 0;
reload = floor(random(10));
alert = 0;
ammo = 0;
path = path_add();
if (global.maskindex == 3 && global.hardmode == 1)
{
    type = choose(275, 277);
}
else if (room == rmTrainstationEntrance || room == rmBossClubFloor1)
{
    type = 279;
}
else if (room == rmHotelEntrance)
{
    type = choose(275);
}
type = choose(275, 279);
on = 0;
alarm[1] = random(250);

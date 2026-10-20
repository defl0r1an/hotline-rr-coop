x += lengthdir_x(16, direction);
y += lengthdir_y(16, direction);
if (room == rmTrainstationEntrance || room == rmBossClubFloor1)
{
    if (global.maskindex == 3 && global.hardmode == 1)
    {
        type = choose(275, 277);
    }
    else
    {
        type = 279;
    }
}
else if (global.maskindex == 3 && global.hardmode == 1)
{
    type = choose(275, 277);
}
else if (room == rmHotelEntrance)
{
    type = choose(275);
}
else
{
    type = choose(275, 279);
}
my_id = instance_create(x, y, type);
my_id.alert = 1;
my_id.checkreload = 15;
if (global.enemy == id)
{
    global.enemy = my_id;
}
scrMoveSolidOn();
scrMoveSolidOff();
instance_destroy();

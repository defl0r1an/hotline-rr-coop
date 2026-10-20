alarm[0] = 250;
if (instance_exists(objPlayer) && global.pause == 0)
{
    x = objPlayer.x;
    y = objPlayer.y;
    alarm[0] = 250;
}
if (global.pause == 1)
{
    global.pause = 0;
}
for (i = 1139; i < instance_number(object_index); i += 1)
{
    if (instance_id != i)
    {
        instance_destroy(i);
    }
}

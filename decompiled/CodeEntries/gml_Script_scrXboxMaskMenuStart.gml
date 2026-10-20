if (global.masks[select] == 0)
{
    exit;
}
if (on == 0)
{
    exit;
}
on = 0;
with (objPlayer)
{
    reload = 30;
    image_index = 0;
    image_speed = 0.15;
    sprite_index = sprPMaskSlip;
}
if (select == 0)
{
    objPlayer.masksprite = 1413;
}
if (select == 1)
{
    objPlayer.masksprite = 1272;
}
if (select == 2)
{
    objPlayer.masksprite = 1528;
}
if (select == 3)
{
    objPlayer.masksprite = 1310;
}
if (select == 4)
{
    objPlayer.masksprite = 1059;
}
if (select == 5)
{
    objPlayer.masksprite = 1398;
}
if (select == 6)
{
    objPlayer.masksprite = 1635;
}
if (select == 7)
{
    objPlayer.masksprite = 1000;
}
if (select == 8)
{
    objPlayer.masksprite = 848;
}
if (select == 9)
{
    objPlayer.masksprite = 932;
}
if (select == 10)
{
    objPlayer.masksprite = 783;
}
if (select == 11)
{
    objPlayer.masksprite = 1220;
}
if (select == 12)
{
    objPlayer.masksprite = 1561;
}
if (select == 13)
{
    objPlayer.masksprite = 996;
}
if (select == 14)
{
    objPlayer.masksprite = 1217;
}
if (select == 15)
{
    objPlayer.masksprite = 991;
}
if (select == 16)
{
    objPlayer.masksprite = 1282;
}
if (select == 17)
{
    objPlayer.masksprite = 1250;
}
if (select == 18)
{
    objPlayer.masksprite = 809;
}
if (select == 19)
{
    objPlayer.masksprite = 979;
}
if (select == 20)
{
    objPlayer.masksprite = 651;
}
if (select == 21)
{
    objPlayer.masksprite = 1608;
}
if (select == 22)
{
    objPlayer.masksprite = 859;
}
if (select == 23)
{
    objPlayer.masksprite = 1181;
}
if (select == 24)
{
    objPlayer.masksprite = 844;
}
if (select == 25)
{
    objPlayer.masksprite = 1403;
}
global.maskindex = select;
objPlayer.maskindex = select;
if (global.maskindex == 10)
{
    with (objEnemy)
    {
        ammo = ceil(ammo * 1.33);
    }
    with (objWeapon)
    {
        ammo = ceil(ammo * 1.33);
    }
}
if (file_exists(working_directory + "\mask.nfo"))
{
    file_delete(working_directory + "\mask.nfo");
}
file = file_text_open_write(working_directory + "\mask.nfo");
file_text_write_string(file, string(select));
file_text_close(file);

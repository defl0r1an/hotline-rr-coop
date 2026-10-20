sprite_index = global.weaponsprite;
ammo = global.ammoweapon;
global.shells = global.shellssave;
if (instance_number(objPlayer) > 1)
{
    instance_destroy();
}
if (global.overright == 1)
{
    switch (room)
    {
        case rmApartment2Upstairs:
            x += 464;
            break;
        case rmHotelSuite:
            x += 96;
            break;
    }
}
scrPlayerAnimationEnd();

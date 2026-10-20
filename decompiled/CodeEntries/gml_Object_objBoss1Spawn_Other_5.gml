with (objWeapon)
{
    if (spawn == -1)
    {
        global.weaponsavegroundx[global.nextweapon] = x;
        global.weaponsavegroundy[global.nextweapon] = y;
        global.nextweapon++;
        spawn = 1;
    }
}

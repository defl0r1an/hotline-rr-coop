if (sprite_index != sprEFatGunAttackMelee && sprite_index != sprEFatGunAttack && sprite_index != sprEFatGunReload)
{
    image_speed = speed * 0.1;
}
if (alert == 0)
{
    if (instance_exists(objPlayer) && global.notarget == 0)
    {
        scrSearch(objPlayer.x, objPlayer.y, 4);
    }
    if (alertwait > -1)
    {
        if (alertwait == 0)
        {
            path_end();
            alert = 1;
        }
        alertwait -= 1;
    }
    if (returning == 0)
    {
        if (speed == 0)
        {
            speed = 1;
            direction = startdir;
        }
        scrPatrol();
    }
    else
    {
        returning = 0;
        speed = 1;
        direction = round(direction * 0.1) * 10;
    }
}
if (!instance_exists(objPlayer))
{
    alert = 0;
    if (speed > 1)
    {
        speed = 1;
    }
    direction = round(direction * 0.1) * 10;
    exit;
}
if (path_index >= 0)
{
    if (sprite_index != sprEFatGunAttackMelee && sprite_index != sprEFatGunAttack && sprite_index != sprEFatGunReload)
    {
        image_speed = path_speed * 0.1;
    }
}
if (alert == 1 && global.notarget == 0)
{
    scrChargeFatGun(objPlayer.x, objPlayer.y, 10, 4);
}
if (alert == 2 && global.notarget == 0)
{
    scrAimFatGun(objPlayer.x, objPlayer.y, 10, 4);
}
if (alert == 3 && global.notarget == 0)
{
    scrChaseSearch(objPlayer.x, objPlayer.y, 4);
}
scrMoveSolidOff();

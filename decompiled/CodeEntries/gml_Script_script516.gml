if (sprite_index != sprEDodgerGunAttackRight && sprite_index != sprEDodgerGunAttackLeft && sprite_index != sprEDodgerGReload)
{
    image_speed = speed * 0.1;
}
if (sprite_index == sprEWalkUnarmed)
{
    scrGoGetWeapon();
}
else if (global.notarget == 0)
{
    if (alert == 0)
    {
        if (instance_exists(objPlayer) && global.notarget == 0)
        {
            scrMeleeSearch(objPlayer.x, objPlayer.y, 4);
        }
        if (alertwait > -1)
        {
            alertwait -= 1;
            if (alertwait == 0)
            {
                path_end();
                alert = 1;
            }
        }
        if (scrIsSearching(sprite_index))
        {
            image_speed = 0.2;
            speed = 0;
        }
        if (scrEnemyIsAttacking(sprite_index))
        {
            image_speed = 1;
        }
        if (returning == 0)
        {
            speed = 1;
            direction = round(direction * 0.1) * 10;
            scrPatrol();
        }
        else
        {
            returning = 0;
            speed = 1;
            direction = round(direction * 0.1) * 10;
        }
    }
    if (path_index >= 0)
    {
        if (sprite_index != sprEDodgerGunAttackRight && sprite_index != sprEDodgerGunAttackLeft && sprite_index != sprEDodgerGReload)
        {
            image_speed = path_speed * 0.1;
        }
    }
    if (alert < 2 && alert > 0)
    {
        scrCharge(objPlayer.x, objPlayer.y, 10, 4);
    }
    if (alert == 2)
    {
        scrAim(objPlayer.x, objPlayer.y, 10, 4);
    }
    if (alert == 3)
    {
        scrChaseSearch(objPlayer.x, objPlayer.y, 4);
    }
    if (alert == 4 && object_index != objEDodgerG)
    {
        scrEHideStep(path);
    }
}
scrMoveSolidOff();

if (instance_number(objPlayer) > 1)
{
    instance_destroy();
}
x = global.checkpointx;
y = global.checkpointy;
if (global.hardmode == 1)
{
    if (global.maskindex == 6)
    {
        sprite_index = sprPWalkButterfly;
    }
}
if (global.maskindex == 1)
{
    sprite_index = global.weaponsprite;
    ammo = global.ammoweapon;
    throwindex = global.throwindex;
}

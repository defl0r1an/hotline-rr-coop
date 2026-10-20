sprite_index = global.weaponsprite;
ammo = global.ammoweapon;
global.shells = global.shellssave;
if (instance_number(objPlayer) > 1)
{
    instance_destroy();
}
scrPlayerAnimationEnd();

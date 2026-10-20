hurtindex = 0;
targetindex = 0;
image_speed = 0;
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
ammo = 0;
edir = 0;
if (global.weaponsprite == 12)
{
    sprite_index = sprPBatKill;
}
if (global.weaponsprite == 16)
{
    sprite_index = sprPKillCrowbar;
}
if (global.weaponsprite == 29)
{
    sprite_index = sprPPipeKill;
}
if (global.weaponsprite == 32)
{
    sprite_index = sprPKillPot;
}
if (global.weaponsprite == 28)
{
    sprite_index = sprPKillPan;
}
if (global.weaponsprite == 27)
{
    sprite_index = sprPNightStickKill;
}
if (global.weaponsprite == 38)
{
    sprite_index = sprPKillSledgeHammerBiker;
}
if (global.weaponsprite == 2686)
{
    sprite_index = sprPJacketKillSkateboard2;
}

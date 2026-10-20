if (room == rmMansionBalcony)
{
    exit;
}
if (objBossPhone.talked == 0 || global.maskindex == 27)
{
    exit;
}
if (place_meeting(x, y, objPlayer))
{
    with (objPlayer)
    {
        if (sprite_index == sprPWalkUnarmed || sprite_index == sprPAttackPunch || sprite_index == sprPAttackBash || sprite_index == sprPPushing || sprite_index == sprPJacketAttackKnuckles || sprite_index == sprPJacketKillDog)
        {
            noweapon = 1;
        }
        else
        {
            noweapon = 0;
        }
        if (noweapon == 0)
        {
            my_id = instance_create(x, y, objWeaponThrow);
            my_id.direction = random(360);
            my_id.speed = 2 + random(1);
            my_id.image_index = scrCurrentWeaponExt(sprite_index);
            my_id.ammo = ammo;
        }
    }
    objPlayer.sprite_index = sprPWalkBossgun;
    audio_play_sound(sndPickupWeapon, 0, false);
    global.done = 0;
    instance_destroy();
}

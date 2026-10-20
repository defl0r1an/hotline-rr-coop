if (!instance_exists(objPlayerMouseHouse) || talked == 1)
{
    exit;
}
if (place_meeting(x + lengthdir_x(12, objPlayer.dir - 180), y + lengthdir_y(12, objPlayer.dir - 180), objPlayer) && on == 1)
{
    with (objPlayer)
    {
        if (sprite_index == sprPWalkUnarmed || sprite_index == sprPAttackPunch || sprite_index == sprPAttackBash || sprite_index == sprPPushing || sprite_index == sprPJacketAttackKnuckles || sprite_index == sprPJacketKillDog || (global.maskindex == 6 && global.hardmode))
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
    objPlayer.sprite_index = sprPTakePhone;
    objPlayer.image_index = 0;
    objPlayer.active = 0;
    image_index = 1;
    scrGetMessage(4);
    talked = 1;
    audio_stop_sound(sndPhoneCall);
    audio_play_sound(sndPhone, 0, false);
    if (global.maskindex == 27)
    {
        global.done = 0;
    }
    else
    {
        global.done = 1;
    }
}

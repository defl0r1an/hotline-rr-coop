if (sprite_index == sprPWalkSkippy && global.powerIgel == 0 && global.deadIgel == 0)
{
    image_index = 0;
    sprite_index = sprPSkippyPunchStart;
    image_speed = 0.2;
}
if ((global.knives > 0 || global.infiniteknives == 1) && global.maskindex == 6)
{
    if (reload > 0)
    {
        exit;
    }
    prevsprite = sprite_index;
    reload = 30;
    sprite_index = sprPThrowKnife;
    image_speed = 0.5;
    if (global.infiniteknives == 0)
    {
        global.knives -= 1;
    }
    my_id = instance_create(x, y, objDennisThrowingKnife);
    global.dir = dir;
    with (my_id)
    {
        move_contact_solid(global.dir, 12);
    }
    my_id.direction = dir;
    my_id.image_angle = dir;
    my_id.speed = 12;
    audio_play_sound(sndThrow, 0, false);
}
if (sprite_index == sprPWalkChainsaw && (ammo - 25) >= 0 && HotWeaponAlpha <= 1 && global.maskindex == 22)
{
    image_index = 0;
    left = -left;
    sprite_index = sprPStartChainsaw;
    image_speed = 0.11;
    audio_play_sound(sndChainsawStart, 0, false);
    ammo -= 25;
}

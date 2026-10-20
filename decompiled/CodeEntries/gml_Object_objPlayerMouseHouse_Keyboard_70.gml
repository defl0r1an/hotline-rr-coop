if (knifeammo > 0 && global.maskindex == 6 && global.maskon == 1 && sprite_index != sprPTakePhone && sprite_index != sprPWalkGirlfriend && sprite_index != sprPTakePhone2 && sprite_index != sprPWalkBossgun && !instance_exists(objPhoneConversation))
{
    if (reload > 0)
    {
        exit;
    }
    prevsprite = sprite_index;
    reload = 30;
    sprite_index = sprPThrowKnife;
    image_speed = 0.5;
    global.knives -= 1;
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

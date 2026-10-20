if (sprite_index != sprJonesSprintChainsaw)
{
    image_speed = 0;
}
if (sprite_index == sprJonesSprintChainsaw)
{
    audio_play_sound(sndDoubleChainsawAttack, 0, false);
}
if (sprite_index == sprJonesStartChainsaw && state == 2)
{
    state = 3;
    audio_play_sound(sndDoubleChainsawAttack, 0, false);
    sprite_index = sprJonesSprintChainsaw;
    image_speed = 0.35;
}
if (sprite_index == sprJonesSprintChainsaw && !instance_exists(objPlayerMouse))
{
    sprite_index = sprJonesStartChainsaw;
    image_index = 0;
    image_speed = 0;
    state = 4;
}

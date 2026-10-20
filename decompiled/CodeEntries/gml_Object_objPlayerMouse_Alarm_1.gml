if (sprite_index == sprPOverheatingChainsaw)
{
    if (slowhit == 3)
    {
        scrAchievementSet("Thick skin");
    }
    cooldown = 0;
    slowhit = 0;
    audio_stop_sound(sndDoubleChainsawAttack);
    image_index = 0;
    image_speed = 0.1;
    sprite_index = sprPCoolingChainsaw;
}

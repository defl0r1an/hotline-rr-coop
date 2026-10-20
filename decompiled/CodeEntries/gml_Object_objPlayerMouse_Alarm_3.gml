if (sprite_index == sprPSprintChainsaw)
{
    HotWeaponSpeed = 0.025;
    HotWeaponSwitch = 0;
    image_speed = 0.15;
    image_index = 0;
    sprite_index = sprPOverheatingChainsaw;
    if (cooldown == 1)
    {
        alarm[1] = 120;
    }
    else
    {
        alarm[1] = 180 + (60 * slowhit);
    }
}

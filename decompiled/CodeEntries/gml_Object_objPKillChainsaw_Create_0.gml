image_speed = 0;
dead = 0;
cobra = 0;
left = 1;
ammo = 0;
HotWeaponAlpha = 0;
sprite_index = choose(sprPExecuteChainsaw, sprPExecuteChainsaw2);
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
if (room == rmPoliceHQFloor1 || room == rmPoliceHQFloor2 || room == rmPoliceHQFloor3)
{
    if (sprite_index == sprPExecuteChainsaw)
    {
        sprite = 576;
        audio_play_sound(sndChainsawExecution1, 0, false);
    }
    if (sprite_index == sprPExecuteChainsaw2)
    {
        sprite = 577;
        audio_play_sound(sndChainsawExecution2, 0, false);
    }
    my_id1 = instance_create(x, y, objPoliceHat);
    my_id1.speed = 1 + random(2);
}
else
{
    if (sprite_index == sprPExecuteChainsaw)
    {
        sprite = 478;
        audio_play_sound(sndChainsawExecution1, 0, false);
    }
    if (sprite_index == sprPExecuteChainsaw2)
    {
        sprite = 479;
        audio_play_sound(sndChainsawExecution2, 0, false);
    }
}

image_speed = 0;
dead = 0;
cobra = 0;
left = 1;
ammo = 0;
HotWeaponAlpha = 0;
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
sprite_index = sprPKillChainsawLean;
audio_play_sound(choose(sndChainsawExecution1, sndChainsawExecution2), 0, false);
if (room == rmPoliceHQFloor1 || room == rmPoliceHQFloor2 || room == rmPoliceHQFloor3)
{
    sprite = 2061;
    my_id1 = instance_create(x, y, objPoliceHat);
    my_id1.speed = 1 + random(2);
}
else
{
    sprite = 480;
}
energie = round(random(1));

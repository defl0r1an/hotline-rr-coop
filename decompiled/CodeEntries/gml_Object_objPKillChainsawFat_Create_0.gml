targetindex = 0;
index = 0;
image_speed = 0;
dead = 0;
cobra = 0;
left = 1;
ammo = 0;
HotWeaponAlpha = 0;
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
ini_open("Achievements.ini");
count = ini_read_real("AchData", "Fat Chainsaw Killed", 0);
if (count++ <= 15)
{
    count++;
    ini_write_real("AchData", "Fat Chainsaw Killed", count);
}
else
{
    scrAchievementSet("Butcher");
}
ini_close();
audio_play_sound(sndChainsawExecution2, 0, false);
global.combotime = 240;

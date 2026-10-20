image_speed = 0;
friction = 0.1;
image_yscale = -1 + (round(random(1)) * 2);
bled = 0;
sled = 1;
otkat = 2;
brain = 0;
explode = 0;
scrAchievementSet("First Time?");
ini_open("Achievements.ini");
count = ini_read_real("AchData", "Deaths", 0);
if (!(count == 100))
{
    count++;
    ini_write_real("AchData", "Deaths", count);
}
else
{
    scrAchievementSet("Karma");
}
ini_close();
decadenced = 0;
surface = 0;
global.NotDead = 0;
audio_stop_sound(sndFlameThrower);
vdir = 0;
vdist = 0;
if (instance_exists(objEffector))
{
    objEffector.playeroncareffector = 1;
}
if (instance_exists(objEffectorHouse))
{
    objEffectorHouse.playeroncareffector = 1;
}
endtransition = 0;
sound = 0;

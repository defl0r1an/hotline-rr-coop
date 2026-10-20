sprite_index = choose(sprEBackBlunt, sprEBackBlunt, sprEFrontBlunt);
image_index = 4 + floor(random(11));
image_speed = 0;
friction = 0.1;
bled = 0;
wait = 500;
life = 100 + random(60);
ini_open("Achievements.ini");
count = ini_read_real("AchData", "Kills", 0);
if (!(count == 1989))
{
    count++;
    ini_write_real("AchData", "Kills", count);
}
else
{
    scrAchievementSet("1989");
}
ini_close();
headshot = 0;
deadlined = 0;
sled = 1;
otkat = 1.5;
brain = 0;
cap = 0;
glasses = 0;
panter = 0;
sound = 0;

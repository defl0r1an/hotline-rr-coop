image_angle = random(360);
image_index = floor(random(35));
while ((global.newgun[15] == 0 && image_index == 7) || (global.newgun[0] == 0 && image_index == 8) || (global.newgun[8] == 0 && image_index == 9) || (global.newgun[2] == 0 && image_index == 10) || (global.newgun[5] == 0 && image_index == 11) || (global.newgun[12] == 0 && image_index == 12) || image_index == 13 || image_index == 14 || (global.newgun[13] == 0 && image_index == 15) || image_index == 16 || image_index == 17 || (global.newgun[3] == 0 && image_index == 18) || (global.newgun[9] == 0 && image_index == 19) || image_index == 20 || image_index == 21 || image_index == 22 || image_index == 23 || image_index == 24 || image_index == 25 || image_index == 26 || image_index == 27 || (global.newgun[14] == 0 && image_index == 30) || (global.newgun[1] == 0 && image_index == 31) || (global.newgun[4] == 0 && image_index == 32) || (global.newgun[7] == 0 && image_index == 33) || (global.newgun[10] == 0 && image_index == 34) || (global.newgun[6] == 0 && image_index == 35) || (global.newgun[11] == 0 && image_index == 36))
{
    image_index = round(random(36));
}
ammo = 0;
if (global.maskindex == 17)
{
    image_index = choose(2, 3, 4, 5);
}
if (global.maskindex == 3)
{
    image_index = choose(0, 1, 6, 7, 9, 10, 11, 12, 28);
}
if (image_index == 0)
{
    ammo = 20;
}
if (image_index == 1)
{
    ammo = 6;
}
if (image_index == 6)
{
    ammo = 2;
}
if (image_index == 7)
{
    ammo = 13;
}
if (image_index == 9)
{
    ammo = 30;
}
if (image_index == 10)
{
    ammo = 6;
}
if (image_index == 11)
{
    ammo = 20;
}
if (image_index == 12)
{
    ammo = 32;
}
if (image_index == 28)
{
    ammo = 13;
}
if (image_index == 29)
{
    ammo = 24;
}
if (global.maskindex == 10)
{
    ammo = ceil(ammo * 1.33);
}
image_speed = 0;
dir = random(360);
light = 0;
enemyused = 0;
train = 0;
decadenced = 0;
maxammo = 0;
hotalpha = 0;
const = 0;
if (global.hardmode == 0)
{
    jones = choose(0, 1, 2);
    countgas = 3;
}
else
{
    jones = choose(0, 1);
    countgas = 4;
}
aubrey = choose(0, 1);
spawn = -1;

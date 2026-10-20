bloodsled = 0;
bloodstep = 0;
bloodscale = 1;
scrERandomInit();
image_speed = 0;
image_index = random(1000);
angle = random(360);
direction = angle;
speed = round(random(1));
if (room == rmTutorial)
{
    image_index = 0;
    speed = 0;
    direction = point_direction(x, y, objPlayer.x, objPlayer.y);
}
image_speed = speed * 0.1;
alarm[0] = 60 + random(60);
if (global.hardmode == 1)
{
    energie = round(random(2));
}
else
{
    energie = round(random(1));
}
checkreload = floor(random(30 / (1 + global.hardmode)));
ammo = 20;
alert = 0;
reload = 13;
light = 0;
weaponfind = 0;
shake = 0;
if (sprite_index == sprEWalkM16)
{
    sprite_index = choose(sprEWalkM16, sprEWalkShotgun, sprEWalkDoubleBarrel, sprEWalkKalashnikov);
}
if (global.maskindex == 3 || global.hardmode == 1)
{
    sprite_index = choose(sprEWalkM16, sprEWalkShotgun, sprEWalkDoubleBarrel, sprEWalkKalashnikov, sprEWalk9mm, sprEWalkScorpion, sprEWalkSilencer);
}
if (sprite_index == sprEWalkM16)
{
    ammo = 20;
}
if (sprite_index == sprEWalkKalashnikov)
{
    ammo = 24;
}
if (sprite_index == sprEWalkShotgun)
{
    ammo = 6;
}
if (sprite_index == sprEWalkDoubleBarrel)
{
    ammo = 2;
}
if (sprite_index == sprEWalkSilencer)
{
    ammo = 13;
}
if (sprite_index == sprEWalk9mm)
{
    ammo = 13;
}
if (sprite_index == sprEWalkScorpion)
{
    ammo = 20;
}
if (global.maskindex == 10)
{
    ammo = ceil(ammo * 1.33);
}
ammoget = 0;
decadenced = 0;

global.done = 0;
state = 0;
image_speed = 0;
vspeed = 12;
with (objDoorH)
{
    image_angle = 0;
}
with (objDoorH2)
{
    image_angle = 0;
}
image_angle = 270;
image_yscale = 2;
audio_play_sound(sndCarThrottle, 0, false);
brake = 0;
if (global.playing == 0)
{
    sxeasy_play(global.Release);
    global.playing = 1;
}
if (global.hardmode == 1)
{
    global.infiniteknives = 1;
}
doorangle = 0;
reload = 0;
if (global.hardmode == 0)
{
    MaxEnemies = 5;
    Enemy[0] = 276;
    EnemySprite[0] = 423;
    EnemyAmmo[0] = 6;
    Enemy[1] = 281;
    EnemySprite[1] = -1;
    EnemyAmmo[1] = -1;
    Enemy[2] = 281;
    EnemySprite[2] = -1;
    EnemyAmmo[2] = -1;
    Enemy[3] = 276;
    EnemySprite[3] = 423;
    EnemyAmmo[3] = 6;
    Enemy[4] = 276;
    EnemySprite[4] = 423;
    EnemyAmmo[4] = 6;
}
else
{
    MaxEnemies = 6;
    Enemy[0] = 276;
    EnemySprite[0] = 423;
    EnemyAmmo[0] = 6;
    Enemy[1] = 281;
    EnemySprite[1] = -1;
    EnemyAmmo[1] = -1;
    Enemy[2] = 278;
    EnemySprite[2] = -1;
    EnemyAmmo[2] = -1;
    Enemy[3] = 1277;
    EnemySprite[3] = -1;
    EnemyAmmo[3] = 26;
    Enemy[4] = 276;
    EnemySprite[4] = 423;
    EnemyAmmo[4] = 6;
    Enemy[5] = 1220;
    EnemySprite[5] = -1;
    EnemyAmmo[5] = 32;
}
if (global.maskindex == 3 && global.hardmode == 1)
{
    Enemy[2] = 276;
    EnemySprite[2] = 423;
    EnemyAmmo[2] = 6;
    Enemy[3] = 281;
    EnemySprite[3] = -1;
    EnemyAmmo[3] = -1;
}
enemies = 0;
headdir = 90;
molotovs = 2;
with (objEffector)
{
    viewx = view_xview[0];
    viewy = view_yview[0];
    instance_create(x, y, objEffectorHouse);
    view_xview[0] = viewx;
    view_yview[0] = viewy;
    instance_destroy();
}
test = objPlayer.persistent;
objPlayer.persistent = false;
thrown = 0;
global.loaded = 1;
objEffectorHouse.amount = 0;
global.loaded = 0;
objEffectorHouse.amount = 180;
objPlayer.persistent = test;

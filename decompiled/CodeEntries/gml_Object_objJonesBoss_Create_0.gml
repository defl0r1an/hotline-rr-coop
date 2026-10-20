if (global.hardmode == 0)
{
    instance_destroy();
    exit;
}
image_index = 0;
image_speed = 0;
global.maskon = 1;
light = 0;
alphaEyes = 1;
my_id = instance_create(169, 48, objDeadBody);
my_id.sprite_index = sprEBackSlashed;
my_id.image_index = 4;
HotWeaponAlpha = 0;
HotWeaponSwitch = 0;
HotWeaponSpeed = 0;
if (global.playing == 0)
{
    state = -4;
    global.player_lock = 1;
    sound = -1;
    sxeasy_play(global.SewerAlligator);
}
else
{
    state = 1;
    objSecretSewerShadow.dir = 160;
    x = 106;
    y = 48;
    alphaEyes = 0;
    with (objFluorescentLamp)
    {
        if (CrocodileMan == 1)
        {
            broken = 1;
        }
    }
    i = 0;
    repeat (16)
    {
        my_id = instance_create(169 + i, 48, objBloodSled);
        my_id.image_angle = direction;
        my_id.image_index = round(random(2));
        i += 4.4375;
    }
    i = 0;
    repeat (8)
    {
        my_id = instance_create(169 + i, 48, objGuts2);
        my_id.speed = random(0.5);
        my_id.direction = direction;
        my_id.image_xscale = choose(1, -1);
        i += 8.875;
    }
    my_id = instance_create(240, 48, objBloodPool);
    my_id.image_index = 25;
    my_id = instance_create(240, 48, objDeadBody);
    my_id.sprite_index = sprECrawlPieceFrontDieJones;
    my_id.image_index = 20;
    sound = 0;
}
wait = 100;
bloodsled = 0;
bloodstep = 0;
bloodscale = 1;
speedSprint = 2;
alarm[0] = -1;

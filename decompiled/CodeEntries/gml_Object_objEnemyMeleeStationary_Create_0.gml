scrEMeleeStationaryInit();
image_speed = 0;
image_index = random(1000);
image_speed = 0;
direction = random(360);
my_path = path_add();
path_set_kind(my_path, 1);
path_set_precision(my_path, 2);
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
reload = 0;
light = 0;
start_x = x;
start_y = y;
weaponfind = 0;
lastsprite = sprite_index;
sprite_index = choose(sprEWalkClub, sprEWalkPipe, sprEWalkKnife, sprEWalkBat);
if (global.maskindex == 3 && global.hardmode == 1)
{
    instance_destroy();
    my_id = instance_create(x, y, objEnemyStationary);
    my_id.sprite_index = choose(sprEWalk9mm, sprEWalkScorpion);
}
bloodsled = 0;
bloodstep = 0;
bloodscale = 1;

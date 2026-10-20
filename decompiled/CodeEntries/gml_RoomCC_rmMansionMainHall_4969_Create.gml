depth = -1;
image_index = 20;
if ((global.hardmode == 1 && global.maskindex == 2) || global.maskindex == 27)
{
    my_id = instance_create(x, y, objDecorativeWeapon);
    my_id.depth = -1;
    my_id.image_index = image_index;
    my_id.image_angle = image_angle;
    instance_destroy();
}
if (global.hardmode == 1 && global.maskindex == 6)
{
    my_id = instance_create(x, y, objDennisThrowingKnife);
    my_id.depth = -1;
    instance_destroy();
}

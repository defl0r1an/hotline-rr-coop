if (global.hardmode == 0)
{
    instance_destroy();
}
if (global.hardmode == 1 && global.maskindex == 6)
{
    instance_create(x, y, objDennisThrowingKnife);
    instance_destroy();
}
else
{
    image_index = 1;
}

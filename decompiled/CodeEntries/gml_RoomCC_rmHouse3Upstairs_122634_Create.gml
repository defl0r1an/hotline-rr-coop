if (global.hardmode == 1)
{
    instance_destroy();
}
if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_wall);
}
nonshadow = 1;
shader_reset();

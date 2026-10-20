if (instance_exists(objMuzzle))
{
    with (objMuzzle)
    {
        instance_destroy();
    }
    muzzle = instance_create(argument0, argument1, objMuzzle);
    muzzle.image_angle = argument2;
    muzzle.sprite_index = argument3;
    muzzle.sprite_index = argument3;
    muzzle.image_xscale = objMuzzle.image_xscale * argument4;
    muzzle.image_yscale = objMuzzle.image_yscale * argument5;
}
else
{
    muzzle = instance_create(argument0, argument1, objMuzzle);
    muzzle.image_angle = argument2;
    muzzle.sprite_index = argument3;
    muzzle.image_xscale = objMuzzle.image_xscale * argument4;
    muzzle.image_yscale = objMuzzle.image_yscale * argument5;
}

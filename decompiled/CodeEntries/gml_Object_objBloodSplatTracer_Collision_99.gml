with (instance_create(x, y, choose(objBloodDrop, objBloodSplat, objBloodDrop2, objBloodSplat2)))
{
    image_angle = other.image_angle;
}
instance_destroy();

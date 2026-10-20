image_angle += (rotspeed * speed);
if (image_index == 1 && change && !instance_exists(objPlayer) && changemask == 0)
{
    instance_change(objMaskOwlDrop, true);
}

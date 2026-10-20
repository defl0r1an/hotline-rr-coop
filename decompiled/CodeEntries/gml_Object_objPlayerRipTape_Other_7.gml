if (sprite_index != sprPJacketRipTape)
{
    my_id = instance_create(x + 16, y - 6, objPlayerMouseHouse);
    my_id.sprite_index = sprPWalkHospital;
    my_id = instance_create(x, y, objPoliceTapeRipped);
}
else
{
    my_id = instance_create(x, y, objPlayerMouse);
    my_id = instance_create(x + 5, y + 16, objPoliceTapeRipped);
    my_id.image_angle = 90;
}
my_id.image_blend = c_ltgray;
instance_destroy();

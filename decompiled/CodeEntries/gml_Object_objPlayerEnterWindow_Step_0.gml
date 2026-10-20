if (image_index < 12)
{
    image_index += 0.15;
}
else
{
    viewx = view_xview[0];
    viewy = view_yview[0];
    my_id = instance_create(x + 3, y, objPlayerHospital);
    global.CheckpointHospital = 1;
    my_id.xview = view_xview[0];
    my_id.yview = view_yview[0];
    instance_destroy();
    view_xview[0] = viewx;
    view_yview[0] = viewy;
}

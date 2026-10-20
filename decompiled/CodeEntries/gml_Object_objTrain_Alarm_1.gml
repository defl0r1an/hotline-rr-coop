viewx = view_xview[0];
viewy = view_yview[0];
with (objPlayerMouseHouse)
{
    my_id = instance_create(x, y, objPlayerMouse);
    my_id.sprite_index = sprite_index;
    my_id.image_index = 0;
    my_id.dir = dir;
    my_id.active = 0;
    my_id.maskon = 1;
    my_id.maskindex = global.maskindex;
    global.maskon = 1;
    my_id.left = left;
    instance_destroy();
}
view_xview[0] = viewx;
view_yview[0] = viewy;

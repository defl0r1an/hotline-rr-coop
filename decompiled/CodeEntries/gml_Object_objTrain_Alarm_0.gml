if (objPlayer.persistent == true)
{
    alarm[0] = 2;
    exit;
}
viewx = view_xview[0];
viewy = view_yview[0];
with (objPlayerMouse)
{
    my_id = instance_create(x, y, objPlayerMouseHouse);
    my_id.sprite_index = sprPWalkBag;
    my_id.image_index = 0;
    my_id.dir = dir;
    my_id.active = 0;
    my_id.maskon = 1;
    my_id.maskindex = global.maskindex;
    my_id.left = left;
    instance_destroy();
}
view_xview[0] = viewx;
view_yview[0] = viewy;
alarm[1] = 100;

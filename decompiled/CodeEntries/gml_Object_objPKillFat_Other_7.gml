image_speed = 0;
image_index = 0;
if (sprite_index == sprTigerKillFat)
{
    my_id = instance_create(x, y, objPlayerMouse);
    my_id.sprite_index = sprPWalkUnarmed;
}
instance_destroy();

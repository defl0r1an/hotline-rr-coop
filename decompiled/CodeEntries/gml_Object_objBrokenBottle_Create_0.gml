image_angle = random(360);
image_speed = 0;
repeat (8)
{
    my_id = instance_create(x, y, objShard);
    my_id.sprite_index = sprBottlePieces;
    my_id.speed = random(5);
    my_id.direction = random(360);
}
instance_destroy();

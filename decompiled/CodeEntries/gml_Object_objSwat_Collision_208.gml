with (other.id)
{
    x -= hspeed;
    y -= vspeed;
    my_id = instance_create(x, y, objSmokeHit);
    my_id.image_angle = direction - 180;
    instance_destroy();
}
if (sprite_index == sprESwatStumble)
{
    exit;
}
sprite_index = sprESwatStumble;
direction = other.direction;
speed = 1;
image_index = 0;
image_speed = 0.2;

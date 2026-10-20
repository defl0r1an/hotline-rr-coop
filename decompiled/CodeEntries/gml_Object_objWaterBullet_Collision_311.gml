move_contact_solid(direction, speed * 2);
my_id = instance_create(x + lengthdir_x(-26, direction), y + lengthdir_y(-26, direction), objHitWater);
my_id.image_angle = direction;
my_id.direction = random(360);
my_id.speed = random(0.5);
my_id.image_blend = image_blend;
my_id.image_alpha = image_alpha;
repeat (3 + round(random(2)))
{
    my_id = instance_create(x + lengthdir_x(-6, direction), y + lengthdir_y(-6, direction), objWaterPuddle2);
    my_id.direction = direction - 140 - random(80);
    my_id.speed = 0.15 + random(3.5);
    my_id.image_blend = image_blend;
    my_id.image_alpha = image_alpha;
    my_id.image_xscale = 0.5;
    my_id.image_yscale = my_id.image_xscale;
}
instance_destroy();
if (other.solid == 1)
{
    exit;
}
if (abs(other.swingspeed) < 8)
{
    other.swingspeed += (-hspeed * 0.2);
    if (other.swingspeed > 3.5)
    {
        other.swinger = 1;
    }
}

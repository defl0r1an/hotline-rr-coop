wave = lerp(wave, wavelerp, 0.05);
image_xscale = lerp(image_xscale, 1.5, 0.0875);
image_yscale = image_xscale;
alpha = lerp(alpha, 1, 0.15);
if (instance_exists(flame) && flame != 0)
{
    image_angle = point_direction(x, y, flame.x, flame.y);
}
if (round(random(6)) == 1)
{
    my_id = instance_create(x + lengthdir_y(wave, image_angle), y + lengthdir_x(wave, image_angle), objFlameBall);
    my_id.direction = direction + random_range(-5, 5);
    my_id.speed = 6;
    my_id.image_alpha = image_alpha;
    my_id.image_xscale = clamp(image_xscale - 0.25, 1, 2);
    my_id.image_yscale = my_id.image_xscale;
}
if (round(random(10)) == 2)
{
    my_id = instance_create(x + lengthdir_y(wave, image_angle), y + lengthdir_x(wave, image_angle), objFireBall);
    my_id.flamethrower = 1;
    my_id.direction = direction + random_range(-5, 5);
    my_id.speed = 6;
    my_id.image_angle = my_id.direction;
    my_id.image_alpha = image_alpha;
    my_id.image_xscale = clamp(image_xscale - 0.25, 1, 2);
    my_id.image_yscale = my_id.image_xscale;
}

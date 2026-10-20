if (sprite_index == sprSnipperIdle && image_index > 16 && smoke == 0)
{
    my_id = instance_create(x, y + 5, objSmokeExhale);
    my_id.direction = image_angle - 90;
    my_id.image_angle = my_id.direction - random_range(6, -6);
    my_id.speed = 0.15 - random_range(0.1, -0.15);
    my_id.image_alpha = 0.45;
    smoke = 1;
}
if (sprite_index == sprSnipperIdle && image_index > 4 && image_index < 9)
{
    cigarette = lerp(cigarette, 1.5, 0.15);
}
else
{
    cigarette = lerp(cigarette, 0, 0.0025);
}
if (sprite_index == sprSnipperRepairing && image_index > 33 && electric == 0)
{
    repeat (1 + round(random(1)))
    {
        my_id = instance_create(x, y - -14, objElectricity);
        my_id.direction = random(360);
        my_id.speed = random(1);
        my_id.image_xscale = 0.165 + random(0.33);
        my_id.image_yscale = my_id.image_xscale;
    }
    repeat (4 + round(random(3)))
    {
        my_id = instance_create(x - random_range(5, -5), y - -14 - random_range(5, -5), objElectricSpark);
        my_id.direction = -point_direction(x, y, my_id.x, my_id.y);
        my_id.speed = 3 + random(2);
        my_id.image_angle = my_id.direction;
    }
    electric = 1;
}

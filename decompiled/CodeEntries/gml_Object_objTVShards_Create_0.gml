friction = 0.2;
image_speed = 0;
diradd = -1 + (round(random(1)) * 2);
image_angle = random(360);
image_index = floor(random(sprite_get_number(sprite_index)));
savingPassing = 0;
if (instance_exists(objBoss))
{
    savingPassing = 1;
}

image_speed = 0;
image_angle = random(360);
image_index = floor(random(3));
if (round(random(3)) == 2 && room != rmSecretSewer)
{
    sprite_index = sprOpenTrashbag;
    image_speed = 0.25;
}

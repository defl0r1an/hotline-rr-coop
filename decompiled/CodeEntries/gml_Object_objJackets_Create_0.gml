image_speed = 0;
image_index = floor(random(sprite_get_number(sprite_index)));
image_angle = random(360);
if (image_index == 11 || image_index == 12)
{
    image_blend = choose(c_aqua, c_ltgray, c_white, c_green, c_lime, c_blue, c_dkgray, c_maroon, c_ltgray, c_gray, c_maroon, c_navy, c_teal);
}

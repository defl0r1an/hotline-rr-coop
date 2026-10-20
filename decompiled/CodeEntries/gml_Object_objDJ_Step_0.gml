if (global.done == 1 && smoke == 0)
{
    sprite_index = sprDJSmoking;
    image_speed = 0;
    alarm[0] = 300 + random(350);
    image_index = 0;
    y = 422;
    smoke = 1;
}

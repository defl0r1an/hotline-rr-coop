areas = 3;
number = 5;
image_speed = number;
areax1[0] = 96;
areay1[0] = 64;
areax2[0] = 232;
areay2[0] = 232;
areax1[1] = 232;
areay1[1] = 128;
areax2[1] = 328;
areay2[1] = 232;
areax1[2] = 152;
areay1[2] = 296;
areax2[2] = 488;
areay2[2] = 408;
max_raindrops = 150;
max_splashes = 150;
offset_x = 0;
offset_y = 0;
for (i = 0; i < max_raindrops; i++)
{
    raindrop_active[i] = 0;
    raindrop_x[i] = 0;
    raindrop_y[i] = 0;
    raindrop_height[i] = 0;
}
for (i = 0; i < max_splashes; i += 1)
{
    splash_active[i] = 0;
    splash_x[i] = 0;
    splash_y[i] = 0;
    splash_frame[i] = 0;
    splash_speed[i] = 0.25;
    splash_angle[i] = random(360);
}

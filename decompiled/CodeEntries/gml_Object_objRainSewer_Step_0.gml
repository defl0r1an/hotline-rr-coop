for (i = 0; i < number; i++)
{
    j = 0;
    while (j < max_raindrops)
    {
        if (!raindrop_active[j])
        {
            cam_x = view_xview[0];
            cam_y = view_yview[0];
            cam_w = view_wview[0];
            cam_h = view_hview[0];
            raindrop_x[j] = cam_x + random(cam_w);
            raindrop_y[j] = cam_y + random(cam_h);
            raindrop_height[j] = 100;
            raindrop_active[j] = 1;
            k = 0;
            while (k < areas)
            {
                if (raindrop_x[j] > areax1[k] && raindrop_x[j] < areax2[k] && raindrop_y[j] > areay1[k] && raindrop_y[j] < areay2[k])
                {
                    raindrop_active[j] = 0;
                    break;
                }
                else
                {
                    k++;
                }
            }
            break;
        }
        else
        {
            j++;
        }
    }
}
for (i = 0; i < max_raindrops; i++)
{
    if (raindrop_active[i])
    {
        raindrop_y[i] += offset_y;
        raindrop_x[i] += offset_x;
        raindrop_height[i] -= 10;
        if (raindrop_y[i] > (view_yview[0] + view_hview[0]) || raindrop_height[i] <= 0)
        {
            if (raindrop_y[i] >= view_yview[0] && raindrop_y[i] <= (view_yview[0] + view_hview[0]) && raindrop_x[i] >= view_xview[0] && raindrop_x[i] <= (view_xview[0] + view_wview[0]))
            {
                j = 0;
                while (j < max_splashes)
                {
                    if (!splash_active[j])
                    {
                        splash_active[j] = 1;
                        splash_x[j] = raindrop_x[i];
                        splash_y[j] = raindrop_y[i];
                        splash_frame[j] = 0;
                        splash_speed[j] = 0.3;
                        break;
                    }
                    else
                    {
                        j++;
                    }
                }
            }
            raindrop_active[i] = 0;
        }
    }
}
for (i = 0; i < max_splashes; i++)
{
    if (splash_active[i])
    {
        splash_frame[i] += splash_speed[i];
        if (splash_frame[i] >= sprite_get_number(sprRainHit))
        {
            splash_active[i] = 0;
        }
    }
}
for (i = 0; i < max_raindrops; i++)
{
    if (raindrop_active[i])
    {
        if (raindrop_x[i] < (view_xview[0] - 100) || raindrop_x[i] > (view_xview[0] + view_wview[0] + 100) || raindrop_y[i] < (view_yview[0] - 100) || raindrop_y[i] > (view_yview[0] + view_hview[0] + 100))
        {
            raindrop_active[i] = 0;
        }
    }
}

draw_sprite_ext(legs, image_index * 2, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(legs, image_index * 2, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle + shaketors, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle + shaketors, image_blend, image_alpha);
left = 1;
dir = image_angle;
maskdir = point_direction(0, 0, maskaddx[floor(image_index)], maskaddy[floor(image_index)] * left) + dir;
dist = point_distance(0, 0, maskaddx[floor(image_index)], maskaddy[floor(image_index)] * left);
maddx = lengthdir_x(dist, maskdir);
maddy = lengthdir_y(dist, maskdir);
shakehead = random_range(16, -16);
shaketors = random_range(3, -3);
if (sprite_index == last_sprite)
{
    nothing = 1;
}
else
{
    scrUpdateHeadPos(sprite_index);
    last_sprite = sprite_index;
}
draw_sprite_ext(head, headindex, x + maddx, y + maddy, image_xscale, image_yscale, dir - (shakehead / 4), image_blend, image_alpha);
for (i = 0; i < 4; i += 1)
{
    if (round(random(2)) == 2 || shakeheadtime[i] <= 70)
    {
        draw_sprite_ext(head, headindex, x + maddx + lengthdir_x(shakeheadlength[i], (dir + (i * 60)) - 90) + (shakehead / 12), y + maddy + lengthdir_y(shakeheadlength[i], (dir + (i * 60)) - 90) + (shakehead / 12), image_xscale, image_yscale, dir + shakehead, image_blend, 0.5 + random(0.25));
    }
    if (shakeheadtime[i] <= 0)
    {
        shakeheadtime[i] = 130 + round(random(95));
    }
    if (round(random(28)) == 2)
    {
        shakeheadimage[i] = round(random(3));
        shakeheadlength[i] = random(3);
    }
}
if (sprite_index != splBullet)
{
    exit;
}
draw_set_colour(c_blue);
draw_set_font(fntDate);
draw_text_transformed(x, y, "alarm/" + string(alarm[0]), 1, 1, 180);
draw_text_transformed(x, y + 10, "stage/" + string(stage), 1, 1, 180);

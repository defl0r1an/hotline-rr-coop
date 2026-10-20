i = 0;
global.undead = ds_list_create();
repeat (68)
{
    maskaddx[i] = 0;
    maskaddy[i] = 0;
    i += 1;
}
scrUpdateHeadPos(2789);
shakehead = 0;
i = 0;
repeat (4)
{
    shakeheadimage[i] = round(random(3));
    shakeheadtime[i] = 130 + round(random(95));
    shakeheadlength[i] = random(3);
    i++;
}
sprite_index = asset_get_index("sprWalkUndead" + string(floor(random(11))));
head = 2787;
headindex = floor(random(sprite_get_number(sprHeadUndead)));
legs = asset_get_index("sprLegsUndead" + string(floor(random(5))));
image_speed = 0;
last_sprite = sprite_index;
stage = "Look";
left = 1;
dir = image_angle;
maskdir = point_direction(0, 0, maskaddx[floor(image_index)], maskaddy[floor(image_index)] * left) + dir;
dist = point_distance(0, 0, maskaddx[floor(image_index)], maskaddy[floor(image_index)] * left);
maddx = lengthdir_x(dist, maskdir);
maddy = lengthdir_y(dist, maskdir);
shakehead = random_range(16, -16);
shaketors = random_range(8, -8);
xstop = round(random_range(292, 452));
ystop = round(random_range(2700, 2770));
ds_list_add(global.undead, xstop, ystop);
if (ds_list_find_value(global.undead, xstop) == xstop && ds_list_find_value(global.undead, ystop) == ystop)
{
    xstop = round(random_range(292, 452));
    ystop = round(random_range(2700, 2770));
}
stop = 0;

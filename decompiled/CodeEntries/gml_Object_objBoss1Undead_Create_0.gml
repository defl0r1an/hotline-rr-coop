i = 0;
repeat (68)
{
    maskaddx[i] = 0;
    maskaddy[i] = 0;
    i += 1;
}
scrUpdateHeadPos(sprite_index);
shakehead = 0;
i = 0;
repeat (4)
{
    shakeheadimage[i] = round(random(3));
    shakeheadtime[i] = 130 + round(random(95));
    shakeheadlength[i] = random(3);
    i++;
}
image_speed = 0;
last_sprite = sprite_index;
stage = "Noone";
alarm[0] = -1;
alarm[1] = -1;
global.my_id = id;
global.Paranormal = 0;
volume = 0;

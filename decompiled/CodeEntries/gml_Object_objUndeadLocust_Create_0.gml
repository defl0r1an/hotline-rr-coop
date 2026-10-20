image_speed = 0;
image_index = 0;
stage = "Noone";
headdir = image_angle;
alphaeyes = 1;
shakehead = 0;
i = 0;
repeat (4)
{
    shakeheadimage[i] = round(random(3));
    shakeheadtime[i] = 130 + round(random(95));
    shakeheadlength[i] = random(3);
    i++;
}
shakeheadlerp = 0;
headsprite = 2887;

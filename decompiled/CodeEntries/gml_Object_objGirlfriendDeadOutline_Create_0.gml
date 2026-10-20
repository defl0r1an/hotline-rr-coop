image_speed = 0;
state = "None";
alpha = 0;
wait = 180;
i = 0;
index = 0;
repeat (28)
{
    size[i] = 1 + random(2);
    myx[i] = 0;
    myy[i] = 0;
    mydir[i] = random(360);
    myspeed[i] = 0.5 + random(1.5);
    diradd[i] = -4 + random(8);
    i += 1;
}

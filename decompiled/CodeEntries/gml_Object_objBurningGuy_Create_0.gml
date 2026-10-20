direction = random(360);
speed = 2;
image_speed = 0.25;
diradd = -4 + random(8);
alarm[0] = 160 + round(random(40));
mysprite = -1;
repeat (30)
{
    my_id = instance_create(x, y, objFlameParticle);
    my_id.direction = random(360);
    my_id.speed = 2 + random(3);
    my_id.friction = 0.15;
}
i = 0;
repeat (4)
{
    xtrail[i] = x;
    ytrail[i] = y;
    i += 1;
}
player = 0;
alpha = 0.75;
mylegs = 778;
legindex = 0;
color = 0;

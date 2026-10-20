my_id = instance_create(x + lengthdir_x(4, direction), y + lengthdir_y(4, direction), objSmokeExhale);
my_id.direction = direction;
my_id.image_angle = my_id.direction - random_range(6, -6);
my_id.speed = 0.5 - random_range(0.15, -0.15);
image_speed = 0;
alarm[0] = 100 + random(200);

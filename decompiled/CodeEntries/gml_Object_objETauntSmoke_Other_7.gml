image_speed = 0;
my_id = instance_create(x + lengthdir_x(4, image_angle), y + lengthdir_y(4, image_angle), objSmokeExhale);
my_id.direction = image_angle;
my_id.image_angle = my_id.direction - random_range(6, -6);
my_id.speed = 0.5 - random_range(0.15, -0.15);
my_id.depth = -1;

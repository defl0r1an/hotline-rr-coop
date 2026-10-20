my_id = instance_create(x + lengthdir_x(7, image_angle - 180), y + lengthdir_y(7, image_angle - 180), objSmokeExhale);
my_id.direction = image_angle;
my_id.image_angle = my_id.direction - random_range(6, -6) - 180;
my_id.speed = -0.5 - random_range(0.15, -0.15);

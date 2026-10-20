image_speed = 0;
my_id = instance_create(x, y, objLukeMorgueBottom);
my_id.image_angle = image_angle;
open = 0;
indexDeadBoby = floor(random(sprite_get_number(sprGurneyMetalHospitalDeadBody)));
yFixTruck = 2;
moveTruck = 30;
xTruck = x + lengthdir_x(moveTruck, image_angle);
yTruck = y + lengthdir_y(moveTruck, image_angle);
if (image_angle == 180)
{
    yFixTruck = -2;
}

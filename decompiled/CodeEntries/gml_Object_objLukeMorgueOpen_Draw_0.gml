xTruck = x + lengthdir_x(moveTruck, image_angle);
yTruck = y + lengthdir_y(moveTruck, image_angle);
draw_sprite_ext(sprGurneyMetalHospitalDeadBody, indexDeadBoby, xTruck + 1, yTruck + yFixTruck + 1, image_xscale, image_yscale, image_angle + -90, c_black, 0.5);
draw_sprite_ext(sprGurneyMetalHospitalDeadBody, indexDeadBoby, xTruck, yTruck + yFixTruck, image_xscale, image_yscale, image_angle + -90, image_blend, image_alpha);
draw_self();

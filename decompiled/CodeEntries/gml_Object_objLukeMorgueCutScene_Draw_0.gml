xTruck = x + lengthdir_x(moveTruck, image_angle) + -2;
yTruck = y + lengthdir_y(moveTruck, image_angle);
draw_sprite_ext(sprGurneyMetalHospitalDeadBody, indexTruck, xTruck + 1, yTruck + 1, image_xscale, image_yscale, image_angle + -90, c_black, 0.5);
draw_sprite_ext(spriteTruck, indexTruck, xTruck, yTruck, image_xscale, image_yscale, image_angle + -90, image_blend, image_alpha);
draw_self();

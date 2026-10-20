scale = lerp(scale, 1.5, speedend / 4);
image_alpha = lerp(image_alpha, 0, speedend / 14);
image_speed = speedend;
speed -= (0.00025 + (speed / 42));
speed = clamp(speed, 0.015, 1);
if (image_index < 5 && instance_exists(objPlayerHospital))
{
    x = objPlayer.x + lengthdir_x(2 - speed, objPlayer.dir);
    y = objPlayer.y + lengthdir_y(2 - speed, objPlayer.dir);
}

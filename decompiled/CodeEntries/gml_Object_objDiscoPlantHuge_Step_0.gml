if (instance_exists(objPlayer))
{
    image_alpha = lerp(image_alpha, clamp(point_distance(x, y, objPlayer.x, objPlayer.y) / 29, 0.5, 1), 0.25);
}
else
{
    image_alpha = lerp(image_alpha, 1, 0.25);
}

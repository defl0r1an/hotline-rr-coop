dead = clamp(point_distance(x, y, objPlayer.x, objPlayer.y) / 250, 0, 1);
objPlayer.alphaundead = dead;
if (place_meeting(x, y, objPlayer))
{
    objPlayer.alphaundead = 0;
    instance_destroy();
}

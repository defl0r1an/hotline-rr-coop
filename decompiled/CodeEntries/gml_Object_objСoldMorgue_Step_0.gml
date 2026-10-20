if (instance_exists(objPlayer))
{
    if (collision == 0)
    {
        cold = clamp(1 - (point_distance(x, y, objPlayer.x, objPlayer.y) / 250), 0, 0.5);
    }
    if (collision == 1 || place_meeting(x, y, objPlayer))
    {
        cold = 0.5;
    }
    if (collision_ellipse(272, 720, 448, 752, objPlayer, 0, 1))
    {
        collision = 1;
    }
    if (place_meeting(x, y, objPlayer))
    {
        collision = 0;
    }
    objPlayer.leaksled = cold;
}

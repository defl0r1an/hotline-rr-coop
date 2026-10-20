if (smirked == 0)
{
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 80)
    {
        scrGetMessage(1);
        smirked = 1;
    }
}

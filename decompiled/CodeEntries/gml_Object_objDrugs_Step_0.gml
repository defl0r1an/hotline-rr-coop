if (instance_exists(objPlayer))
{
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 24 && !event)
    {
        scrSetRasmusEvent(choose("You shouldnt try this", "What is this...?", "Seems...unsafe"), 15, 100, "mystical");
        event = 1;
    }
}

if (objPlayer.object_index != objPlayerMouse)
{
    if (objPlayer.object_index == objPlayerBiker)
    {
        if (melenergie <= 0)
        {
            return 1;
        }
        else
        {
            return 0;
        }
    }
    else if (global.meleeenergie <= 0)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}
else if (meleeenergie <= 0)
{
    return 1;
}
else
{
    return 0;
}

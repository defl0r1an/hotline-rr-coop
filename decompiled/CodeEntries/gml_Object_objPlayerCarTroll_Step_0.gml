if (wait > 0)
{
    wait -= 1;
}
if (wait == 0)
{
    if (stage == "")
    {
        yy += (0.25 + (yy / 28));
        shake = lerp(shake, 1, 0.15);
    }
    if (stage == "MegaTroll")
    {
        x = objPlayer.x;
        yy -= (0.35 + (yy / 20));
        view_xview[0] = lerp(view_xview[0], x - (view_wview[0] / 2), 0.15);
        view_yview[0] = lerp(view_yview[0], y - (view_hview[0] / 2), 0.15);
        shake = 1.5;
    }
}
y -= yy;
if (endcar == 1)
{
    with (objPlayer)
    {
        speeddeadIgel = lerp(speeddeadIgel, 0, 0.015);
    }
}

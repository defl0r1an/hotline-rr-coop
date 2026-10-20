scrMoveSolidOn();
if (!place_free(x + lengthdir_x(8, direction), y + lengthdir_y(8, direction)))
{
    direction += (diradd * 10);
}
else if (abs(frac(direction * 0.011111111111111112)) > 0)
{
    direction += (diradd * 10);
}
scrMoveSolidOff();

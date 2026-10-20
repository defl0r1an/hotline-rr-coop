if (!global.coop_active)
{
    instance_destroy();
    exit;
}
// Changed entities arrive up to 20 times a second, everything at least once a second; DESPAWN removes them
// normally, the timeout only catches lost messages.
stale += 1;
if (stale > 120 && mode != 3)
{
    instance_destroy();
    exit;
}
if (stale > 150)
{
    instance_destroy();
    exit;
}
if (point_distance(x, y, t_x, t_y) > 64)
{
    x = t_x;
    y = t_y;
}
else
{
    x += (t_x - x) * 0.4;
    y += (t_y - y) * 0.4;
}

if (!(speed <= 0))
{
    speed -= 0.003;
}
if (!place_meeting(x, y, objSolid))
{
    instance_destroy();
}

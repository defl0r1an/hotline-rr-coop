if (global.hardmode == 1)
{
    if (!instance_exists(objPlayerHospital))
    {
        view_angle[0] = (lengthdir_y(vdist * 0.00625, vdir * 2) - 180) + global.angleshake;
    }
    else
    {
        view_angle[0] = lengthdir_y(objDizzy.dizziness * 20, lengthdir_x(objDizzy.dizziness * 30, global.dir * 3)) + 180;
    }
    if (instance_exists(objPlayerMouseHouse))
    {
        if (objPlayer.active == 0)
        {
        }
    }
}

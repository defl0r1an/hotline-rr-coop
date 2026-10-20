face_dir = argument0 - 180;
point_dir = argument1;
if (face_dir < 0)
{
    face_dir += 360;
}
global.check = 0;
if (face_dir < 90)
{
    if (point_dir > (face_dir + 90) && (point_dir - 360) < (face_dir - 90))
    {
        global.check = 1;
    }
}
else if (face_dir > 270)
{
    if (point_dir < (face_dir - 90) && (point_dir + 360) > (face_dir + 90))
    {
        global.check = 1;
    }
}
else if (point_dir < (face_dir - 90) || point_dir > (face_dir + 90))
{
    global.check = 1;
}
return global.check;

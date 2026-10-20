if (sprite_index == sprDoctorAlarm1 || sprite_index == sprDoctorAlarm2)
{
    speed = 1;
    sprite_index = sprDoctorWalk;
    direction = pathdir;
}
if (sprite_index == sprDoctorPoint)
{
    speed = 0;
    image_index = -1;
}

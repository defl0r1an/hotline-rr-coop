if (speed > 0)
{
    image_angle += 23;
}
if (room == rmPhoneHomUpstairs)
{
    if (place_meeting(x, y, objPlayer) && speed > 0)
    {
        global.my_id = id;
        scrPlayerDieMelee();
    }
}

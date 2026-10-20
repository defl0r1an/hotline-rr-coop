if (collision_ellipse(272, 1312, 448, 1360, objPlayer, 0, 1) && stage == "Noone")
{
    audio_play_sound(sndCarlJumpscareFull, 0, false);
    image_speed = 0.15;
    objEffectorHospital.blackout = 2;
    stage = "Look";
}
if (collision_circle(x, y, 70, objPlayer, 0, 1) && stage == "Look")
{
    if (round(random(150)) <= 4)
    {
        objEffectorHospital.blackout = 4 + round(random(3));
        if (headsprite == 2887)
        {
            headsprite = 2891;
        }
        else
        {
            headsprite = 2887;
        }
    }
}
else if (headsprite == 2891)
{
    objEffectorHospital.blackout = 4 + round(random(3));
    headsprite = 2887;
}

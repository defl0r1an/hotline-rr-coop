if (collision_ellipse(272, 2464, 448, 2528, objPlayer, 0, 1) && stage == "Noone" && alarm[1] == -1)
{
    audio_play_sound(sndPipeHits, 0, false);
    objPlayer.active = 0;
    alarm[1] = 300;
}
if (collision_ellipse(272, 2464, 448, 2528, objPlayer, 0, 1))
{
    volume = lerp(volume, 1, 0.015);
}
audio_sound_gain(global.currentsong, clamp(global.mvol - volume, 0, 1), 0);
if (stage == "Walk")
{
    objPlayer.dir = point_direction(objPlayer.x, objPlayer.y, x, y);
    objPlayer.aimfar = 0;
    if (round(random(145)) <= 10)
    {
        objEffectorHospital.blackout = 4 + round(random(3));
        if (sprite_index == sprWalkUndeadFatBoss1)
        {
            sprite_index = sprBoss1Walk;
        }
        else
        {
            sprite_index = sprWalkUndeadFatBoss1;
        }
    }
    if (image_speed < 1)
    {
        image_speed = speed * 0.1;
    }
    if (point_distance(x, y, 368, 2528) > 1)
    {
        objPlayer.active = 0;
        move_towards_point(368, 2528, speed);
        speed = 0.45;
    }
    else
    {
        stage = "Point";
        image_index = 0;
        sprite_index = sprFatBoss1UndeadPoint;
    }
}
if (stage == "Point")
{
    _diff = angle_difference(point_direction(x, y, objPlayer.x, objPlayer.y), image_angle);
    image_angle += (_diff * 0.1);
    speed = 0;
    if (alarm[0] == -1)
    {
        image_speed = 0.15;
    }
}

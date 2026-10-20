if (!instance_exists(objPlayer) || !on)
{
    exit;
}
dist = y - 352;
xshift = abs(dtan(angle - 90)) * dist * sign(90 - angle);
if (scrCollisionLineDouble(x, y, x + xshift, 352, 3, 135, 134))
{
    dist = y - 448;
    xshift = abs(dtan(angle - 90)) * dist * sign(90 - angle);
}
yshift = dist;
laserx = x + xshift;
lasery = (y - yshift) + 4;
if (scrCollisionLine(x, y, laserx, lasery, 3, 98) && !shot)
{
    objPlayer.energie = 0;
    my_id = instance_create(objPlayer.x, objPlayer.y, objEBullet);
    my_id.caliber = 1;
    my_id.visible = false;
    my_id.direction = point_direction(x, y, laserx, lasery);
    my_id.speed = 1;
    my_id = instance_create(laserx, lasery, objEBullet);
    my_id.visible = false;
    my_id.direction = point_direction(x, y, laserx, lasery);
    my_id.speed = 1;
    my_id = scrCollisionLineId(x, y, laserx, lasery, 3, 113);
    if (my_id != -4)
    {
        audio_play_sound(sndGlass1, 0, false);
        audio_play_sound(sndSniper, 0, false);
        my_id.sprite_index = sprWindowDownBroken;
    }
    shot = 1;
}
else
{
    shot = 0;
}
if (!back)
{
    if (angle > startangle)
    {
        angle = scrRotate(angle, startangle, 0.35);
    }
    else
    {
        back = 1;
    }
}
else if (angle < endangle)
{
    angle = scrRotate(angle, endangle, 0.35);
}
else
{
    back = 0;
}

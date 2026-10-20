scrMoveSolidOn();
if (destroyed == 0)
{
    if (checkreload > 0)
    {
        checkreload -= 1;
    }
    else
    {
        if (instance_exists(objPlayer))
        {
            global.check = scrLook(objPlayer.x, objPlayer.y, 4);
        }
        if (collision_circle(x + lengthdir_x(37, camangle), y + lengthdir_y(37, camangle), 28, objPlayer, 0, 1) && (global.check == 0 || global.check == 2))
        {
            alert = 1;
        }
        else
        {
            alert = 0;
        }
        if (alert == 1 && observer == 1 && instance_exists(objPlayer))
        {
            image_index += 0.5;
            dir = lerp(dir, 0, 0.15);
            _diff = angle_difference(point_direction(x, y, objPlayer.x, objPlayer.y) - image_angle, angle);
            angle += (_diff * 0.06);
            radius = lerp(radius, 10, 0.2);
        }
        if (observer == 0 || !instance_exists(objPlayer) || (alert == 0 && observer == 1))
        {
            diradd += 1;
            image_index += 0.25;
            dir = lerp(dir, lengthdir_x(40, diradd), 0.25);
            _diff = angle_difference(0, angle);
            angle += (_diff * 0.1);
            radius = lerp(radius, 26, 0.2);
        }
        checkreload = round(random(2));
    }
}
if (destroyed == 1)
{
    observer = 0;
    dirlerp = lerp(dirlerp, 0, 0.25);
    diradd += dirlerp;
    dir = lengthdir_x(45, diradd);
    blinklight = lerp(blinklight, 0, random(0.025)) - random(0.5);
    if (life > 0)
    {
        life -= 1;
        if (round(random(3)) == 2)
        {
            my_id = instance_create(x, y, objElectricity);
            my_id.direction = random(360);
            my_id.speed = random(1);
        }
        if (round(random(2)) == 1)
        {
            my_id = instance_create((x - 8) + random(16), (y - 8) + random(16), objElectricSpark);
            my_id.direction = point_direction(x, y, my_id.x, my_id.y);
            my_id.speed = 3 + random(2);
            my_id.image_angle = my_id.direction;
        }
    }
}
scrMoveSolidOff();

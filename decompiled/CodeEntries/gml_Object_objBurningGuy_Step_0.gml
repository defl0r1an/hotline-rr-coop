if (round(random(20)) == 2)
{
    diradd = -4 + random(8);
}
scrMoveSolidOn();
if (!place_free(x + (hspeed * 4), y))
{
    hspeed = -hspeed;
}
if (!place_free(x, y + vspeed))
{
    vspeed = -vspeed;
}
scrMoveSolidOff();
direction += diradd;
legindex += 0.4;
if (round(random(5)) == 1)
{
    my_id = instance_create((x + lengthdir_x(random_range(-2.5, 2.5), image_angle)) - lengthdir_x(random(2.5), image_angle - (90 * choose(-1, 1))), (y + lengthdir_y(random_range(-2.5, 2.5), image_angle)) - lengthdir_y(random(5), image_angle - (90 * choose(-1, 1))), objFireBall);
    my_id.direction = direction - random_range(35, -35) - 180;
    my_id.friction = 0.1;
    my_id.speed = 1 + random(0.5);
}
if (round(random(5)) == 1)
{
    my_id = instance_create((x + lengthdir_x(random_range(-2.5, 2.5), image_angle)) - lengthdir_x(random(2.5), image_angle - (90 * choose(-1, 1))), (y + lengthdir_y(random_range(-2.5, 2.5), image_angle)) - lengthdir_y(random(2.5), image_angle - (90 * choose(-1, 1))), objFlameBall);
    my_id.direction = direction - random_range(35, -35) - 180;
    my_id.image_angle = my_id.direction;
    my_id.speed = 3 - random_range(1, -0.5);
}
if (sprite_index != sprBurningWalk)
{
    exit;
}
if (round(random(5)) == 1)
{
    my_id = instance_create((x + lengthdir_x(random_range(-2.5, 2.5), image_angle)) - lengthdir_x(random(2.5), image_angle - (90 * choose(-1, 1))), (y + lengthdir_y(random_range(-2.5, 2.5), image_angle)) - lengthdir_y(random(2.5), image_angle - (90 * choose(-1, 1))), objFlameSmoke);
    my_id.direction = direction - random_range(35, -35) - 180;
    my_id.image_angle = my_id.direction;
    my_id.speed = 3 + random(0.5);
}
if (player)
{
    if (global.maskindex != 7)
    {
        vdist = point_distance(x, y, room_width / 2, room_height / 2);
        vdir = point_direction(room_width / 2, room_height / 2, x, y);
        viewspeed = point_distance(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180)) * 0.1;
        viewdir = point_direction(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180));
        view_xview[0] += lengthdir_x(viewspeed, viewdir);
        view_yview[0] += lengthdir_y(viewspeed, viewdir);
        view_angle[0] = lengthdir_y(vdist * 0.01, vdir * 2);
    }
    scrHardMode();
}

move_contact_solid(direction, speed * 2);
my_id = instance_create(x + lengthdir_x(-2, direction), y + lengthdir_y(-2, direction), objHitWater);
my_id.image_angle = direction;
my_id.direction = random(360);
my_id.speed = random(0.5);
my_id.image_blend = image_blend;
my_id.image_alpha = image_alpha;
repeat (3 + round(random(2)))
{
    my_id = instance_create(x + lengthdir_x(14, direction), y + lengthdir_y(14, direction), objWaterPuddle2);
    my_id.direction = direction - 140 - random(80);
    my_id.speed = 0.15 + random(3.5);
    my_id.image_blend = image_blend;
    my_id.image_alpha = image_alpha;
    my_id.image_xscale = 0.5;
    my_id.image_yscale = my_id.image_xscale;
}
if (other.object_index == objWallHeavyH || other.object_index == objWallSoftH || other.object_index == objWallBrickH || other.object_index == objWallArcadeH || other.object_index == objWallBathroomH || other.object_index == objWallArcadeSoftH || other.object_index == objWallArcadeInteriorH || other.object_index == objCellWallH || other.object_index == objWallHeavyV || other.object_index == objWallSoftV || other.object_index == objWallBrickV || other.object_index == objWallArcadeV || other.object_index == objWallBathroomV || other.object_index == objWallArcadeSoftV || other.object_index == objWallArcadeInteriorV)
{
    water = instance_create(x, y, objWallWater);
    wall_left = other.x;
    wall_right = other.x + other.sprite_width;
    wall_top = other.y;
    wall_bottom = other.y + other.sprite_height;
    if (other.object_index == objWallHeavyH || other.object_index == objWallSoftH || other.object_index == objWallBrickH || other.object_index == objWallArcadeH || other.object_index == objWallBathroomH || other.object_index == objWallArcadeSoftH || other.object_index == objWallArcadeInteriorH || other.object_index == objCellWallH)
    {
        water.x = clamp(water.x, wall_left + 1, wall_right);
        if (water.y > other.y)
        {
            water.y = other.y + (other.sprite_height * 0.8);
            water.image_angle = 270;
        }
        else
        {
            water.y = other.y + 1;
            water.image_angle = 90;
        }
    }
    else
    {
        water.y = clamp(water.y, wall_top + 7, wall_bottom - 1);
        if (water.x > other.x)
        {
            water.x = other.x + (other.sprite_width * 0.8);
            water.image_angle = 0;
        }
        else
        {
            water.x = other.x + 1;
            water.image_angle = 180;
        }
    }
    water.direction = water.image_angle;
    water.image_alpha = image_alpha / 2;
    instance_destroy();
}
instance_destroy();

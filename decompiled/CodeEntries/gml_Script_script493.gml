if (other.object_index == objWallHeavyH || other.object_index == objWallSoftH || other.object_index == objWallBrickH || other.object_index == objWallArcadeH || other.object_index == objWallBathroomH || other.object_index == objWallArcadeSoftH || other.object_index == objWallArcadeInteriorH || other.object_index == objCellWallH || other.object_index == objWallHeavyV || other.object_index == objWallSoftV || other.object_index == objWallBrickV || other.object_index == objWallArcadeV || other.object_index == objWallBathroomV || other.object_index == objWallArcadeSoftV || other.object_index == objWallArcadeInteriorV)
{
    blood = instance_create(x, y, objWallBlood);
    wall_left = other.x;
    wall_right = other.x + other.sprite_width;
    wall_top = other.y;
    wall_bottom = other.y + other.sprite_height;
    if (other.object_index == objWallHeavyH || other.object_index == objWallSoftH || other.object_index == objWallBrickH || other.object_index == objWallArcadeH || other.object_index == objWallBathroomH || other.object_index == objWallArcadeSoftH || other.object_index == objWallArcadeInteriorH || other.object_index == objCellWallH)
    {
        blood.x = clamp(blood.x, wall_left + 1, wall_right);
        if (blood.y > other.y)
        {
            blood.y = other.y + (other.sprite_height * 0.8);
            blood.image_angle = 270;
        }
        else
        {
            blood.y = other.y + 1;
            blood.image_angle = 90;
        }
    }
    else
    {
        blood.y = clamp(blood.y, wall_top + 7, wall_bottom - 1);
        if (blood.x > other.x)
        {
            blood.x = other.x + (other.sprite_width * 0.8);
            blood.image_angle = 0;
        }
        else
        {
            blood.x = other.x + 1;
            blood.image_angle = 180;
        }
    }
    blood.direction = blood.image_angle;
    instance_destroy();
}

repeat (4)
{
    tempid = instance_create(argument0, argument1, objBloodDrop2);
    tempid.speed = 2 + random(1);
    tempid.direction = random(360);
    tempid.image_angle = tempid.direction;
}
repeat (4)
{
    tempid = instance_create((argument0 - 2) + random(4), (argument1 - 2) + random(4), objBloodSmoke2);
    tempid.speed = 2 + random(1);
    tempid.direction = point_direction(argument0, argument1, tempid.x, tempid.y);
    tempid.image_angle = tempid.direction;
}
dir = random(360);
repeat (6)
{
    tempid = instance_create((argument0 - 1) + random(2), (argument1 - 1) + random(2), objBloodHit);
    tempid.speed = 1 + random(2);
    tempid.friction = 0.2;
    tempid.direction = (dir - 45) + random(90);
    tempid.image_angle = tempid.direction;
}
repeat (1 + round(random(1)))
{
    instance_create((argument0 - 7) + random(14), (argument1 - 7) + random(14), objBloodSplat2);
}
repeat (2)
{
    repeat (3)
    {
        tempid = instance_create(argument0, argument1, objBloodDrop2);
        tempid.speed = 2 + random(1);
        tempid.direction = random(360);
        tempid.image_angle = tempid.direction;
    }
    repeat (4)
    {
        tempid = instance_create((argument0 - 2) + random(4), (argument1 - 2) + random(4), objBloodSmoke2);
        tempid.speed = 2 + random(1);
        tempid.direction = point_direction(argument0, argument1, tempid.x, tempid.y);
        tempid.image_angle = tempid.direction;
    }
    dir = random(360);
    repeat (5)
    {
        tempid = instance_create((argument0 - 1) + random(2), (argument1 - 1) + random(2), objBloodHit);
        tempid.speed = 1 + random(2);
        tempid.friction = 0.2;
        tempid.direction = (dir - 45) + random(90);
        tempid.image_angle = tempid.direction;
    }
    repeat (1 + round(random(1)))
    {
        instance_create((argument0 - 7) + random(14), (argument1 - 7) + random(14), objBloodSplat2);
    }
    if (argument4)
    {
        repeat (1 + round(random(1)))
        {
            tempid = instance_create(argument0 + lengthdir_x(23, argument2 - 180), argument1 + lengthdir_y(23, argument2 - 180), objSkinPiece2);
            tempid.speed = 1 + random(1);
            tempid.direction = point_direction(argument0, argument1, tempid.x, tempid.y);
            tempid.image_angle = tempid.direction;
            if (object_index == objPKillFat)
            {
                tempid.sprite_index = sprSkinPieceBlack;
                tempid.image_blend = make_color_hsv(0, 64, 64);
            }
        }
    }
    if (argument3)
    {
        if (round(random(1)) == 0)
        {
            repeat (3)
            {
                tempid = instance_create(argument0 + lengthdir_x(23, argument2 - 180), argument1 + lengthdir_y(23, argument2 - 180), objBrains2);
                tempid.speed = 2 + random(1);
                tempid.direction = point_direction(argument0, argument1, tempid.x, tempid.y);
                tempid.image_angle = tempid.direction;
            }
        }
        else
        {
            repeat (1 + round(random(1)))
            {
                tempid = instance_create(argument0 + lengthdir_x(23, argument2 - 180), argument1 + lengthdir_y(23, argument2 - 180), objBrainChunk2);
                tempid.speed = 1 + random(0.5);
                tempid.direction = point_direction(argument0, argument1, tempid.x, tempid.y);
                tempid.image_angle = tempid.direction;
            }
        }
    }
}

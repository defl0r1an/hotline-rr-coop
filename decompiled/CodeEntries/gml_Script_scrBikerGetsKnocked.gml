global.shake = 10;
global.gotbeaten = 1;
instance_create(x, y, objLevelComplete);
global.done = 1;
global.my_id = id;
audio_play_sound(sndHit, 0, false);
audio_play_sound(sndPunch, 0, false);
with (objElevator)
{
    valid = 1;
}
with (objDoorH)
{
    solid = 0;
}
with (objDoorH2)
{
    solid = 0;
}
with (objPlayer)
{
    pdir = point_direction(global.my_id.x, global.my_id.y, x, y);
    if (global.my_id.sprite_index == sprPInspectorAttack)
    {
        nothing = 1;
    }
    else
    {
        repeat (8)
        {
            my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, pdir), (y - 3) + random(6) + lengthdir_y(8, pdir), objBloodDrop);
            my_id.image_xscale = 1 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            my_id.image_angle = point_direction(x + lengthdir_x(8, pdir), y + lengthdir_y(8, pdir), my_id.x, my_id.y);
            my_id.sprite_index = sprBloodSplatSmall;
            my_id.direction = my_id.image_angle;
            my_id.speed = 2 + random(4);
        }
        repeat (2 + random(3))
        {
            my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, pdir), (y - 3) + random(6) + lengthdir_y(8, pdir), objBloodDrop);
            my_id.image_xscale = 1 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            my_id.image_angle = point_direction(x + lengthdir_x(8, pdir), y + lengthdir_y(8, pdir), my_id.x, my_id.y);
            my_id.direction = my_id.image_angle;
            my_id.speed = 1 + random(5);
        }
        repeat (4)
        {
            my_id = instance_create((x - 3) + random(6) + lengthdir_x(16, pdir), (y - 3) + random(6) + lengthdir_y(16, pdir), objBloodSmoke);
            my_id.image_xscale = 1.2 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            my_id.image_angle = (pdir - 20) + random(40);
            my_id.direction = my_id.image_angle;
            my_id.speed = 2 + random(1);
            my_id.friction = 0.15;
        }
    }
    my_id = instance_create(x, y, objBikerKnocked);
    my_id.speed = 3;
    my_id.direction = (pdir - 10) + random(20);
    my_id.image_angle = my_id.direction;
    my_id = instance_create(x, y, objMCHelmet);
    my_id.direction = (pdir - 40) + random(80);
    my_id.speed = 1.5 + random(1);
    my_id.sprite_index = sprBikerHelmetSmashed;
    instance_destroy();
}

move_contact_solid(direction, speed * 2);
my_id = instance_create(x + lengthdir_x(-19, direction), y + lengthdir_y(-19, direction), objHitWater);
my_id.image_angle = direction;
my_id.direction = random(360);
my_id.speed = random(0.5);
my_id.image_blend = image_blend;
my_id.image_alpha = image_alpha;
repeat (3 + round(random(2)))
{
    my_id = instance_create(x + lengthdir_x(-3, direction), y + lengthdir_y(-3, direction), objWaterPuddle2);
    my_id.direction = direction - 140 - random(80);
    my_id.speed = 0.15 + random(3.5);
    my_id.image_blend = image_blend;
    my_id.image_alpha = image_alpha;
    my_id.image_xscale = 0.5;
    my_id.image_yscale = my_id.image_xscale;
}
with (objEnemy)
{
    if (place_meeting(x, y, objWaterBullet))
    {
        if (speed >= 1)
        {
            speed = 0.15;
        }
        if (image_blend != c_aqua)
        {
            image_blend += merge_colour(c_white, c_aqua, 0.05);
        }
        if (image_blend == $08FFFF80)
        {
            if (sprite_index == sprEWalkUnarmed || sprite_index == sprPoliceWalkUnarmed)
            {
                noweapon = 1;
            }
            else
            {
                noweapon = 0;
            }
            if (noweapon == 1)
            {
                factor = 0.5;
            }
            else
            {
                factor = 1;
            }
            my_id = instance_create(x, y - 12, objScore);
            my_id.text = "Splash!";
            my_id.col = 3;
            global.myscore += ((1600 + (80 * factor)) * global.factor);
            global.killscore += 1600;
            global.boldscore += (80 * factor);
            if (global.bonustime < (12 + (global.factor * 4)))
            {
                global.bonustime = 12 + (global.factor * 4);
            }
            ds_list_add(global.bonuslist, "Fun!");
            image_blend = c_aqua;
        }
        alert = 1;
        checkreload = 15;
    }
}
instance_destroy();

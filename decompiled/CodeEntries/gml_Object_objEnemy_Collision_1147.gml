global.my_id = id;
if (global.hardmode)
{
    if (other.touch == 0)
    {
        with (objEAmbushTrigger)
        {
            if (place_meeting(x, y, global.my_id) && global.my_id.alert == 3)
            {
                if (global.my_id.sprite_index == sprEWalk9mm || global.my_id.sprite_index == sprEWalkSilencer || global.my_id.sprite_index == sprEWalkScorpion)
                {
                    my_id = instance_create(x, y, objEnemyAmbush);
                    my_id.direction = image_angle;
                    my_id.deltay = image_yscale;
                    my_id.deltax = image_xscale;
                    my_id.image_yscale = image_yscale;
                    my_id.image_xscale = image_xscale;
                    my_id.sprite_index = scrEnemyAmbushSprite(global.my_id.sprite_index);
                    my_id.spritehand = scrEnemyAmbushSpriteHand(global.my_id.sprite_index);
                    my_id.dir = my_id.direction;
                    touch = 1;
                    with (global.my_id)
                    {
                        instance_destroy();
                    }
                }
            }
        }
    }
}

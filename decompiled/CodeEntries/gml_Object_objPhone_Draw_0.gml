if (!instance_exists(objPhoneConversation) && answered == 1 && instance_exists(objPlayer))
{
    if (objPlayer.sprite_index == sprPTakePhone)
    {
        with (objPlayerMouseHouse)
        {
            active = 1;
            sprite_index = sprPWalkUnarmed;
            my_id = instance_create(x, y, objPlayerMouse);
            my_id.maskon = 1;
            my_id.maskindex = maskindex;
            my_id.ammo = ammo;
            my_id.throwindex = throwindex;
            global.maskon = 1;
            my_id.sprite_index = sprite_index;
            instance_destroy();
        }
    }
    image_index = 0;
}
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x - 1, y - 1, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if ((instance_number(objEnemy) + instance_number(objKnockedOut)) == 0 && instance_exists(objPlayer))
{
    if (wait > 0)
    {
        wait -= 1;
    }
    else if (called == 0)
    {
        alarm[0] = 1;
        alarm[1] = 90;
        called = 1;
        with (objPlayerMouse)
        {
            my_id = instance_create(x, y, objPlayerMouseHouse);
            my_id.maskon = 1;
            my_id.maskindex = maskindex;
            my_id.active = 0;
            my_id.ammo = ammo;
            my_id.throwindex = throwindex;
            global.maskon = 1;
            my_id.sprite_index = sprite_index;
            with (objEffector)
            {
                instance_destroy();
            }
            my_id = instance_create(x, y, objEffectorHouse);
            my_id.blackx = 0;
            my_id.alpha = 0;
            my_id.amount = 180;
            instance_destroy();
        }
    }
}
dir += 4;

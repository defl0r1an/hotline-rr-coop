image_angle += (rotspeed * speed);
if (pickable == 1)
{
    if (instance_exists(objPlayer) && point_distance(objPlayer.x, objPlayer.y, x, y) < 32 && mouse_check_button(mb_right))
    {
        if (objPlayer.sprite_index != sprPWalkUnarmed)
        {
            global.dir = dir;
            my_id = instance_create(x, y, objWeaponThrow);
            with (my_id)
            {
                move_contact_solid(global.dir, 12);
            }
            audio_play_sound(sndThrow, 0, false);
            my_id.speed = 10;
            my_id.direction = (dir - 5) + random(10);
            my_id.ammo = objPlayer.ammo;
            my_id.image_index = scrCurrentWeaponExt(objPlayer.sprite_index);
        }
        objPlayer.sprite_index = sprPWalkCleaver;
        objPlayer.ammo = 0;
        objPlayer.reload = 10;
        objPlayer.left = 1;
        audio_play_sound(sndPickupWeapon, 0, false);
        instance_destroy();
    }
}
if (instance_exists(objPlayerBiker) && point_distance(objPlayerBiker.x, objPlayerBiker.y, x, y) < 32 && mouse_check_button(mb_right))
{
    global.CleaverSteel = 1;
    audio_play_sound(sndPickupWeapon, 0, false);
    if (!instance_exists(objPhoneConversation))
    {
        scrAchievementSet("Pickpocket");
        scrGetMessage(5);
    }
    instance_destroy();
}

if (instance_exists(objPlayer))
{
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 18 && use == 0)
    {
        with (objDecorativeWeapon)
        {
            my_id = instance_create(x, y, objSpecificWeapon);
            my_id.image_index = image_index;
            my_id.ammo = ammo;
            my_id.image_angle = image_angle;
            my_id.direction = direction;
            my_id.dir = 0;
            instance_destroy();
        }
        with (objPlayer)
        {
            reload = 20;
        }
        with (objSecretRoom)
        {
            switchalpha = 1;
        }
        audio_play_sound(sndDoorOpen, 0, false);
        audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
        audio_play_sound(sndBoxingBag, 0, false);
        scrSetRasmusEvent(choose("What do we have here?", "Art of Blood", "Hide better next time"), 1, 50);
        use = 1;
    }
}

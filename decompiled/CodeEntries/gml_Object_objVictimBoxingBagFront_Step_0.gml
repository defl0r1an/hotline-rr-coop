if (scrMovingPlayerExists() && (image_index == 0 || image_index > 5))
{
    if (scrIsAttacking(objPlayer.sprite_index) && place_meeting(x - lengthdir_x(12, objPlayer.dir), y - lengthdir_y(12, objPlayer.dir), objPlayer))
    {
        image_angle = point_direction(objPlayer.x, objPlayer.y, x, y);
        if ((objPlayer.sprite_index == sprPAttackAxe || objPlayer.sprite_index == sprPAttackMachete || objPlayer.sprite_index == sprPAttackChainsaw || objPlayer.sprite_index == sprPAttackSword || objPlayer.sprite_index == sprPJacketAttackCleaver2 || objPlayer.sprite_index == sprPJacketAttackCleaver || objPlayer.sprite_index == sprPAttackKnife || objPlayer.sprite_index == sprPAttackButterfly) && blood >= 0)
        {
            audio_play_sound(choose(sndCut1, sndCut2), 0, false);
            edir = point_direction(objPlayer.x, objPlayer.y, x, y);
            repeat (2)
            {
                my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, edir), (y - 3) + random(6) + lengthdir_y(8, edir), objBloodDrop);
                my_id.image_xscale = 1 - random(0.2);
                my_id.image_yscale = my_id.image_xscale;
                my_id.image_angle = point_direction(x + lengthdir_x(8, edir), y + lengthdir_y(8, edir), my_id.x, my_id.y);
                my_id.sprite_index = sprBloodSplatSmall;
                my_id.direction = my_id.image_angle;
                my_id.speed = 2 + random(4);
            }
            repeat (1 + random(1))
            {
                my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, edir), (y - 3) + random(6) + lengthdir_y(8, edir), objBloodDrop);
                my_id.image_xscale = 1 - random(0.2);
                my_id.image_yscale = my_id.image_xscale;
                my_id.image_angle = point_direction(x + lengthdir_x(8, edir), y + lengthdir_y(8, edir), my_id.x, my_id.y);
                my_id.direction = my_id.image_angle;
                my_id.speed = 1 + random(5);
            }
            repeat (2)
            {
                my_id = instance_create((x - 3) + random(6) + lengthdir_x(16, edir), (y - 3) + random(6) + lengthdir_y(16, edir), objBloodSmoke);
                my_id.image_xscale = 1.2 - random(0.2);
                my_id.image_yscale = my_id.image_xscale;
                my_id.image_angle = (edir - 20) + random(40);
                my_id.direction = my_id.image_angle;
                my_id.speed = 2 + random(1);
                my_id.friction = 0.15;
            }
            angleshake = random_range(-30, 30);
            blood--;
        }
        else
        {
            audio_play_sound(sndBoxingBag, 0, false);
            angleshake = random_range(-15, 15);
        }
        if (blood == -1 && bloodpool == 0)
        {
            instance_create(x, y, objBloodPool);
            scrSetRasmusEvent(choose("Have you calmed down?", "Are your nerves unwell?", "Want some more?"), 5, 100);
            bloodpool = 1;
        }
        image_index = 0;
        image_speed = 0.2;
    }
}
angleshake = lerp(angleshake, 0, 0.15);

audio_play_sound(sndHitWall, 0, false);
my_id = instance_create(lengthdir_x(distance_to_object(objDoorH) - 8, direction) + x, lengthdir_y(distance_to_object(objDoorH) - 8, direction) + y, objNailAmmo);
my_id.speed = 2 + random(2);
my_id.direction = direction - 140 - random(80);
instance_destroy();
exit;

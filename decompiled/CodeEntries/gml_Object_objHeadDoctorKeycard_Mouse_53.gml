if (instance_exists(objPlayerHospital) && point_distance(x, y, objPlayerHospital.x, objPlayerHospital.y) <= 25 && global.hardmode == 1)
{
    instance_destroy();
    global.locked = 2;
    audio_play_sound(sndPickupWeapon, 0, false);
}

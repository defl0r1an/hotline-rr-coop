if (place_meeting(x, y, objPlayer) && stage == 0)
{
    sxeasy_stop(0);
    audio_play_sound(sndPickupWeapon, 0, false);
    image_speed = 0.25;
    stage = 1;
    unlock = 1;
    dir = 0;
    wait = 110;
    global.igelcutscenes = -1;
}

if (global.maskindex == 1 && global.maskon == 1 && instance_exists(objPlayerMouse) && point_distance(trunkx, trunky, objPlayer.x, objPlayer.y) < 20)
{
    if (taken == 0)
    {
        audio_play_sound(sndPickupWeapon, 0, false);
        with (objCopCarRasmus)
        {
            if (taken == 0)
            {
                taken = 1;
            }
        }
        scrSetRasmusEvent(choose("Someone forgot to close it", "Im wondering what this is"), 1, 50);
        global.lockedcardpolice = 1;
    }
}

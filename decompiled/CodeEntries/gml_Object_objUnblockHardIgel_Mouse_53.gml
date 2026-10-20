if (place_meeting(x, y, objPlayer) && on == 0 && global.puzzleIgel == 1)
{
    SizeCircle = 250;
    audio_play_sound(sndPickupWeapon, 0, false);
    global.puzzleIgel = 0;
    scrSaveUnlocked();
    on = 1;
}

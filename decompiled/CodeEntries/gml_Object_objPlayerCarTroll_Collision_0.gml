if (stage == "MegaTroll")
{
    if (sound == 0)
    {
        audio_sound_pitch(audio_play_sound(sndCarSkid, 0, false), 0.9);
        audio_sound_pitch(audio_play_sound(sndBreakDoor, 0, false), 0.9);
        sound = 1;
    }
    audio_stop_sound(sndCarThrottle);
    room_goto(rmSequence5);
    objEffector.fade = 1;
    objEffector.newsong = 1;
    objEffector.song = global.DeepCover;
}

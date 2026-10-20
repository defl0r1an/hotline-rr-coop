if (!instance_exists(objPlayer))
{
    exit;
}
if (objPlayer.legindex > 0)
{
    my_id = instance_create(x, y, objDeadBody);
    my_id.sprite_index = sprScorpionSquished;
    audio_play_sound(sndHit, 1, false);
    audio_play_sound(sndBonesBreak, 1, false);
    instance_destroy();
}

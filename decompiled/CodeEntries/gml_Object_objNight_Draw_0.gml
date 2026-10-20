if (instance_exists(objPlayer))
{
    if (objPlayer.sprite_index == sprPSneakM16)
    {
        draw_sprite(sprMask, 0, x, y);
        draw_text(x, y - 10, "objNight");
    }
}

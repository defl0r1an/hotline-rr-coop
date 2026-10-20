if (sprite_index == sprDeputyTelephoneDieMelee || sprite_index == sprDeputyFatmanTelephoneDie)
{
    if (image_index < 4)
    {
        image_index += 0.2;
    }
    image_speed = 0;
    exit;
}
if (sprite_index == sprFatmansDeadTKnife)
{
    exit;
}
if (!instance_exists(objPlayer))
{
    exit;
}
if (sprite_index == sprDeputyFatmanTelephone)
{
    test = scrLook(objPlayer.x, objPlayer.y, 4);
    if (test == 0 || test == 2)
    {
        image_index = 0;
        image_speed = 0;
        sprite_index = sprDeputyFatmanTelephoneGiveUp;
    }
}
if (sprite_index == sprDeputyFatmanTelephoneGiveUp)
{
    if (image_index < 4)
    {
        image_index += 0.2;
    }
}

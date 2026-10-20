image_speed = 0;
smoke = 0;
electric = 0;
if (rest == 0)
{
    sprite_index = sprSnipperRepairing;
    rest = 2 + round(random(3));
    exit;
}
if (sprite_index == sprSnipperRepairing)
{
    ColorWire = choose(255, 16776960, 65280);
    sprite_index = sprSnipperIdle;
    rest = 2 + round(random(2));
}
rest -= 1;

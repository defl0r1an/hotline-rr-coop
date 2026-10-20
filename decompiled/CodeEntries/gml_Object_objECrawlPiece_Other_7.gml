if (dead == 1 && (sprite_index == sprECrawlPieceDie || sprite_index == sprECrawlPieceFrontDie || sprite_index == sprECrawlPieceFrontDieJones))
{
    my_id = instance_create(x, y, objBloodPool);
    my_id = instance_create(x, y, objDeadBody);
    my_id.image_angle = image_angle;
    if (bottom == "Police" && sprite_exists(asset_get_index(sprite_get_name(sprite_index) + "Police")))
    {
        sprite_index = asset_get_index(sprite_get_name(sprite_index) + "Police");
    }
    my_id.sprite_index = sprite_index;
    my_id.image_index = image_index - 1;
    my_id.image_yscale = image_yscale;
    instance_destroy();
}
if (sprite_index == sprECrawlPiece)
{
    if (time <= 0)
    {
        dead = 1;
        speed = 0;
        sprite_index = sprECrawlPieceDie;
        image_index = 0;
        imagespeed = 0.2;
    }
}
if (sprite_index == sprECrawlPieceFront)
{
    if (time <= 0)
    {
        dead = 1;
        speed = 0;
        sprite_index = sprECrawlPieceFrontDie;
        if (bottom == "" && round(random(100)) == 1)
        {
            sprite_index = sprECrawlPieceFrontDieJones;
        }
        image_index = 0;
        imagespeed = 0.2;
    }
}

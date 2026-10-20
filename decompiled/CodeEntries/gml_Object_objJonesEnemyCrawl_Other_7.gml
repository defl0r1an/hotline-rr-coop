if (dead == 1 && sprite_index == sprECrawlPieceFrontDieJones)
{
    objJonesBoss.state = -3;
    my_id = instance_create(x, y, objBloodPool);
    my_id = instance_create(x, y, objDeadBody);
    my_id.image_angle = image_angle;
    my_id.sprite_index = sprite_index;
    my_id.image_index = image_index - 1;
    my_id.image_yscale = image_yscale;
    instance_destroy();
}

image_speed = 0.15;
image_index = random(1000);
reload = floor(random(10));
alert = 0;
ammo = 0;
path = path_add();
if (global.maskindex == 3 && global.hardmode == 1 && global.maskon == 1)
{
    my_id = instance_create(x, y, objEnemyIdleGuard);
    my_id.sprite_index = choose(sprEMafiaStandGuardScorpion, sprEMafiaStandGuard9mm, sprESearchSilencer);
    my_id.direction = direction;
    instance_destroy();
}

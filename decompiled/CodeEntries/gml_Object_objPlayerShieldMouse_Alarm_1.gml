my_id = instance_create(x, y, objDeadBody);
global.dir = dir;
with (my_id)
{
    move_contact_solid(global.dir - 45, 12);
}
if (bottom == "Police")
{
    if (shotgunned)
    {
        my_id.sprite_index = choose(sprPoliceBackShotgun, sprPoliceBackShotgun, sprPoliceFrontShotgun);
        my_id.image_index = floor(random(2));
    }
    else
    {
        my_id.sprite_index = choose(sprPoliceBackMachinegun, sprPoliceBackMachinegun, sprPoliceFrontMachinegun);
        my_id.image_index = floor(random(3));
    }
}
if (bottom == "")
{
    if (shotgunned)
    {
        my_id.sprite_index = choose(sprEBackShotgun, sprEBackShotgun, sprEFrontShotgun);
        my_id.image_index = floor(random(2));
    }
    else
    {
        my_id.sprite_index = choose(sprEBackMachinegun, sprEBackMachinegun, sprEFrontMachinegun);
        my_id.image_index = floor(random(3));
    }
}
my_id.direction = dir - 180;
my_id.speed = random(1) + (bullets * 0.15);
my_id.image_angle = my_id.direction;
my_id = instance_create(x, y, objPlayerMouse);
my_id.ammo = ammo;
if (sprite_index == sprPHumanShieldDoubleBarrel)
{
    my_id.sprite_index = sprPWalkDoubleBarrel;
}
if (sprite_index == sprPHumanShieldMagnum)
{
    my_id.sprite_index = sprPWalkMagnum;
}
if (sprite_index == sprPHumanShieldScorpion)
{
    my_id.sprite_index = sprPWalkScorpion;
}
if (sprite_index == sprPHumanShieldUzi)
{
    my_id.sprite_index = sprPWalkUzi;
}
if (sprite_index == sprPHumanShieldMP5)
{
    my_id.sprite_index = sprPWalkMP5;
}
if (sprite_index == sprPHumanShieldSilencer)
{
    my_id.sprite_index = sprPWalkSilencer;
}
if (sprite_index == sprPWalkHumanShieldSilencedUzi)
{
    my_id.sprite_index = sprPWalkSilencedUzi;
}
if (sprite_index == sprPWalkHumanShieldAks)
{
    my_id.sprite_index = sprPWalkAks;
}
if (sprite_index == sprPWalkHumanShieldNailgun)
{
    my_id.sprite_index = sprPWalkNailgun;
}
if (sprite_index == sprPHumanShield9mm)
{
    my_id.sprite_index = sprPWalk9mm;
}
instance_destroy();

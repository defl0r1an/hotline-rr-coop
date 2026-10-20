if (reload > 0)
{
    exit;
}
lastweapon = scrCurrentWeapon();
lastammo = ammo;
global.executionx = x;
global.executiony = y;
scrHeadButtEnemy();
if (global.test == 3)
{
    exit;
}
global.exposed = 0;
release = 0;
with (objKnockedOut)
{
    image_xscale = 3;
    image_yscale = 3;
}
global.test = 0;
global.drop = 1;
if (place_meeting(x, y, objKnockedOut) && global.exposed == 0)
{
    with (objKnockedOut)
    {
        image_xscale = 3;
        image_yscale = 3;
        if (place_meeting(x, y, objPlayer) && global.test == 0)
        {
            global.test = 2;
            if (sprite_index == sprEGetUp)
            {
                my_id = instance_create(x, y, scrPigGetKill(objPlayer.sprite_index));
                if (objPlayer.sprite_index == sprPigButcherWalkBat || objPlayer.sprite_index == sprPigButcherAttackBat)
                {
                    my_id.sprite_index = sprPigKillBat;
                }
                if (objPlayer.sprite_index == sprPigButcherWalkPipe || objPlayer.sprite_index == sprPigButcherAttackPipe)
                {
                    my_id.sprite_index = sprPigKillPipe;
                }
                if (objPlayer.sprite_index == sprPigButcherWalkClub || objPlayer.sprite_index == sprPigButcherAttackClub)
                {
                    my_id.sprite_index = sprPigKillClub;
                }
                if (objPlayer.sprite_index == sprPigButcherWalkKnife || objPlayer.sprite_index == sprPigButcherAttackKnife)
                {
                    my_id.sprite_index = sprPigKillKnife;
                }
            }
            if (sprite_index == sprEGetUpLean)
            {
                my_id = instance_create(x, y, objPigButcherWallKill);
                global.test = 1;
            }
            my_id.image_angle = angle;
            my_id.maskon = global.maskon;
            instance_destroy();
        }
        image_xscale = 1;
        image_yscale = 1;
    }
    with (objKnockedOut)
    {
        image_xscale = 1;
        image_yscale = 1;
    }
    if (global.test == 1)
    {
        if (sprite_index == sprPigButcher)
        {
            nothing = 1;
        }
        else
        {
            my_id = instance_create(objPlayer.x + lengthdir_x(8, objPlayer.dir + 90), objPlayer.y + lengthdir_y(8, objPlayer.dir + 90), objWeaponThrow);
            my_id.image_index = lastweapon;
            my_id.direction = dir + 70 + random(40);
            my_id.speed = 1 + random(2);
            my_id.ammo = lastammo;
        }
        instance_destroy();
        exit;
    }
    if (global.test == 2)
    {
        with (objKnockedOut)
        {
            image_xscale = 1;
            image_yscale = 1;
        }
        instance_destroy();
        exit;
    }
}
with (objKnockedOut)
{
    image_xscale = 1;
    image_yscale = 1;
}

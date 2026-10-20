if (instance_exists(objPlayer) && global.maskindex == 27)
{
    if (objPlayer.sprite_index == sprPAttackSkippyBig || objPlayer.sprite_index == sprPAttackSkippyLow || objPlayer.sprite_index == sprPAttackSkippyMedium || objPlayer.sprite_index == sprPEndSkippyAim || objPlayer.sprite_index == sprPStartSkippy || objPlayer.sprite_index == sprPStartSkippyAim || objPlayer.sprite_index == sprPWalkSkippy || objPlayer.sprite_index == sprPWalkSkippyAim || objPlayer.sprite_index == sprPKillSkippyEnd || objPlayer.sprite_index == sprPIdleSkippy2 || objPlayer.sprite_index == sprPIdleSkippy2End || objPlayer.sprite_index == sprPKillSkippy || objPlayer.sprite_index == sprPSkippyPunch || objPlayer.sprite_index == sprPSkippyPunchStart || objPlayer.sprite_index == sprPSkippyPunchWalk)
    {
        global.powerIgel = 0;
        if (objPlayer.ammo <= 0 && !instance_exists(objBulletSkippy))
        {
            objPlayer.reload = 20;
            objPlayer.ammo = 0;
            objPlayer.throwindex = 8;
            objPlayer.sprite_index = sprPWalkThrow;
            global.IgelEmotions = "IgelBlink";
            global.IgelEmotionsimageindex = 2;
            global.IgelEmotionsWait = 0;
            global.IgelEmotionsEnd = 0;
            global.GlowSkippyEnd = 1;
        }
        else
        {
            global.GlowSkippyEnd = 0;
        }
    }
    else if (!(objPlayer.sprite_index == sprPWalkThrow && objPlayer.throwindex == 8) && global.igelcutscenes == 0)
    {
        global.powerIgel = 1;
    }
}
if (!surface_exists(surf1))
{
    surf1 = surface_create(room_width, room_height);
}
if (!surface_exists(surf2))
{
    surf2 = surface_create(room_width, room_height);
}
surface_copy(surf2, 0, 0, surf1);
surface_set_target(surf1);
draw_surface_ext(surf2, 0, 0, 1, 1, 0, c_white, 0.99);
i = 0;
repeat (16)
{
    draw_sprite_ext(sprSpread, spreadindex[i], spreadx[i], spready[i], spreadscale[i], spreadscale[i], spreadangle[i], c_white, 1);
    if (global.blink > 0)
    {
        addspeed = 1;
    }
    else
    {
        addspeed = 0;
    }
    spreadindex[i] += 0.15 + (addspeed * 0.5);
    spreadx[i] += xspeed[i] * (1 + (addspeed * 4));
    spready[i] += yspeed[i] * (1 + (addspeed * 4));
    if (spreadindex[i] > 28)
    {
        spreadindex[i] = 0;
        dir = random(360);
        xspeed[i] = lengthdir_x(0.15, dir);
        yspeed[i] = lengthdir_y(0.15, dir);
        spreadx[i] = random(192);
        spready[i] = random(102);
        spreadangle[i] = random(360);
        spreadscale[i] = 1 + random(1);
    }
    i += 1;
}
surface_reset_target();

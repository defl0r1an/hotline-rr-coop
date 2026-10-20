// Every End Step on a co-op floor (called by objCoopNet): how this PC's player looks right now.
// PSTATE (32): room i, kind i (0 hidden, 1 body, 2 corpse), obj i, spr i, legspr i, mask i, maskon i, throwidx i,
//              w4(x, y, img, ang), w4(left, xscale, yscale, alpha), w4(legimg, legdir, light, 0).
// The player instance is recreated after every execution/window/stairs, so it is looked up each frame.
// variable_local_exists crashes this runner build, so the detailed look is read only from objPlayerMouse and only
// variables its Create sets (legsprite is assigned in its Draw, so it is derived here with the same rule).
var coop_p, coop_i, coop_inst, s_kind, s_obj, s_spr, s_legspr, s_maskon, s_thr, s_x, s_y, s_img, s_ang, s_left, s_xs, s_ys, s_al, s_legimg, s_legdir, s_light;
s_kind = 0;
s_obj = -1;
s_spr = -1;
s_legspr = -1;
s_maskon = 0;
s_thr = 0;
s_x = 0;
s_y = 0;
s_img = 0;
s_ang = 0;
s_left = 1;
s_xs = 1;
s_ys = 1;
s_al = 1;
s_legimg = 0;
s_legdir = 0;
s_light = 0;
// instance_find can return an instance destroyed earlier this step (the game recreates its player all the
// time); reading its variables would be a fatal error, so every found id is checked with instance_exists.
coop_p = noone;
for (coop_i = 0; coop_i < instance_number(objPlayer); coop_i += 1)
{
    coop_inst = instance_find(objPlayer, coop_i);
    if (coop_inst != noone && instance_exists(coop_inst))
    {
        coop_p = coop_inst;
        break;
    }
}
if (coop_p == noone)
{
    coop_p = instance_find(objPlayerDead, 0);
    if (coop_p != noone && instance_exists(coop_p))
    {
        s_kind = 2;
    }
}
else if (!coop_p.persistent && coop_p.visible)
{
    s_kind = 1;
}
if (s_kind != 0)
{
    s_obj = coop_p.object_index;
    s_spr = coop_p.sprite_index;
    s_x = coop_p.x;
    s_y = coop_p.y;
    s_img = coop_p.image_index;
    s_ang = coop_p.image_angle;
    s_xs = coop_p.image_xscale;
    s_ys = coop_p.image_yscale;
    s_al = coop_p.image_alpha;
}
if (s_kind == 1 && s_obj == objPlayerMouse)
{
    s_ang = coop_p.dir;
    s_left = coop_p.left;
    s_legimg = coop_p.legindex;
    s_legdir = coop_p.legdir;
    s_maskon = coop_p.maskon;
    s_thr = coop_p.throwindex;
    s_light = coop_p.light;
    s_legspr = 42;
    if (coop_p.myspeed == 2.25)
    {
        s_legspr = 43;
    }
    if (s_spr == sprGriffinWalk || s_spr == sprGriffinAttackKnife || s_spr == sprGriffinAttack9mm)
    {
        s_legspr = 548;
    }
}
external_call(global.coop_f_begin, 32);
external_call(global.coop_f_wi, room);
external_call(global.coop_f_wi, s_kind);
external_call(global.coop_f_wi, s_obj);
external_call(global.coop_f_wi, s_spr);
external_call(global.coop_f_wi, s_legspr);
external_call(global.coop_f_wi, global.maskindex);
external_call(global.coop_f_wi, s_maskon);
external_call(global.coop_f_wi, s_thr);
external_call(global.coop_f_w4, s_x, s_y, s_img, s_ang);
external_call(global.coop_f_w4, s_left, s_xs, s_ys, s_al);
external_call(global.coop_f_w4, s_legimg, s_legdir, s_light, 0);
external_call(global.coop_f_end, 0);
global.coop_ps_out += 1;

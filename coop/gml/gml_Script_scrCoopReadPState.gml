// Reads a partner PSTATE (32; field order in scrCoopSendPState) and applies it to objCoopPuppet,
// creating the puppet when the partner is on this PC's floor. Fields are always read in full.
var r, k, o, spr, lspr, m, mon, thr, px, py, img, ang, lft, xs, ys, al, limg, ldir, lt, pup;
r = external_call(global.coop_f_ri);
k = external_call(global.coop_f_ri);
o = external_call(global.coop_f_ri);
spr = external_call(global.coop_f_ri);
lspr = external_call(global.coop_f_ri);
m = external_call(global.coop_f_ri);
mon = external_call(global.coop_f_ri);
thr = external_call(global.coop_f_ri);
px = external_call(global.coop_f_rf);
py = external_call(global.coop_f_rf);
img = external_call(global.coop_f_rf);
ang = external_call(global.coop_f_rf);
lft = external_call(global.coop_f_rf);
xs = external_call(global.coop_f_rf);
ys = external_call(global.coop_f_rf);
al = external_call(global.coop_f_rf);
limg = external_call(global.coop_f_rf);
ldir = external_call(global.coop_f_rf);
lt = external_call(global.coop_f_rf);
external_call(global.coop_f_rf);
global.coop_ps_in += 1;
if (!global.coop_active || r != room)
{
    with (objCoopPuppet)
    {
        instance_destroy();
    }
    exit;
}
pup = instance_find(objCoopPuppet, 0);
if (pup == noone)
{
    pup = instance_create(px, py, objCoopPuppet);
    external_call(global.coop_f_log, "partner puppet created in " + room_get_name(room));
}
pup.stale = 0;
if (k == 2 && pup.p_kind != 2)
{
    external_call(global.coop_f_log, "partner died in " + room_get_name(room));
}
pup.p_kind = k;
pup.p_obj = o;
pup.t_x = px;
pup.t_y = py;
if (k != 0 && sprite_exists(spr))
{
    pup.sprite_index = spr;
    pup.image_index = img;
    pup.image_xscale = xs;
    pup.image_yscale = ys;
    pup.image_alpha = al;
}
pup.p_ang = ang;
pup.p_left = lft;
pup.p_legspr = lspr;
pup.p_legimg = limg;
pup.p_legdir = ldir;
pup.p_mask = m;
pup.p_maskon = mon;
pup.p_thr = thr;
pup.p_light = lt;

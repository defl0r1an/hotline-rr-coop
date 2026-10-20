// Client: applies one ENT (64, field order in scrCoopEntSend) to the local copy of that host instance, creating
// it when new. global.coop_ents maps host instance id -> local instance. Knocked-out enemies (mode 2) and floor
// weapons (mode 5) are REAL instances of the host's object, frozen by scrCoopFrozen (listed in coop_net_ids), so
// the client's own execution and pickup code can use them; everything else is an objCoopEnt ghost.
var r, nid, mode, spr, lspr, px, py, img, ang, xs, ys, al, limg, g, obj;
r = external_call(global.coop_f_ri);
nid = external_call(global.coop_f_ri);
mode = external_call(global.coop_f_ri);
spr = external_call(global.coop_f_ri);
lspr = external_call(global.coop_f_ri);
px = external_call(global.coop_f_rf);
py = external_call(global.coop_f_rf);
img = external_call(global.coop_f_rf);
ang = external_call(global.coop_f_rf);
xs = external_call(global.coop_f_rf);
ys = external_call(global.coop_f_rf);
al = external_call(global.coop_f_rf);
limg = external_call(global.coop_f_rf);
if (global.coop_role != 2 || !global.coop_active || r != room || !sprite_exists(spr))
{
    exit;
}
if (ds_map_exists(global.coop_gone, nid))
{
    exit;  // picked up / finished here; the host's removal is on its way
}
g = noone;
if (ds_map_exists(global.coop_ents, nid))
{
    g = ds_map_find_value(global.coop_ents, nid);
    if (!instance_exists(g))
    {
        ds_map_delete(global.coop_ents, nid);
        g = noone;
    }
}
if (mode == 2 || mode == 5)
{
    if (g == noone)
    {
        obj = lspr;
        if (obj == objSpecificWeapon)
        {
            obj = objWeapon;  // its Room Start logic would re-pick the weapon
        }
        if (!object_exists(obj))
        {
            exit;
        }
        g = instance_create(px, py, obj);
        ds_map_add(global.coop_net_ids, g, 1);
        ds_map_add(global.coop_ents, nid, g);
        g.coop_nid = nid;
    }
    g.x = px;
    g.y = py;
    g.speed = 0;
    g.image_index = img;
    if (mode == 2)
    {
        g.sprite_index = spr;
        g.angle = ang;
    }
    else
    {
        g.image_angle = ang;
        g.ammo = limg;
    }
    exit;
}
if (g == noone)
{
    g = instance_create(px, py, objCoopEnt);
    ds_map_add(global.coop_ents, nid, g);
    g.nid = nid;
    // Same layering as the originals: walkers -2, knocked out / plain 0, corpses 1.
    if (mode == 1)
    {
        g.depth = -2;
    }
    else if (mode == 3)
    {
        g.depth = 1;
    }
    else
    {
        g.depth = 0;
    }
}
g.stale = 0;
g.mode = mode;
g.t_x = px;
g.t_y = py;
g.sprite_index = spr;
g.image_index = img;
g.e_ang = ang;
g.image_xscale = xs;
g.image_yscale = ys;
g.image_alpha = al;
g.e_legspr = lspr;
g.e_legimg = limg;

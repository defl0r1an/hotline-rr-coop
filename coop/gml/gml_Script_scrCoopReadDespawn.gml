// Client: DESPAWN (65: room i, nid i) removes the local copy of a host instance that no longer exists.
// coop_netdestroy tells the Destroy events of real copies (weapons, knocked out) not to report it back.
var r, nid, g;
r = external_call(global.coop_f_ri);
nid = external_call(global.coop_f_ri);
if (global.coop_role != 2 || r != room || !ds_map_exists(global.coop_ents, nid))
{
    exit;
}
g = ds_map_find_value(global.coop_ents, nid);
ds_map_delete(global.coop_ents, nid);
if (instance_exists(g))
{
    ds_map_delete(global.coop_net_ids, g);
    global.coop_netdestroy = 1;
    with (g)
    {
        instance_destroy();
    }
    global.coop_netdestroy = 0;
}

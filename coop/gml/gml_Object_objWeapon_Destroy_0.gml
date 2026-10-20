// Co-op client (also inherited by objWeaponThrow / objSpecificWeapon): a weapon replicated from the host was
// picked up here -> the host removes its copy (PICKUP 66: room i, nid i). Network removals set coop_netdestroy.
if (global.coop_role == 2 && !global.coop_netdestroy && ds_map_exists(global.coop_net_ids, id))
{
    if (objCoopNet.test_auto == 3)
    {
        external_call(global.coop_f_log, "test: client reports PICKUP " + string(coop_nid));
    }
    external_call(global.coop_f_begin, 66);
    external_call(global.coop_f_wi, room);
    external_call(global.coop_f_wi, coop_nid);
    external_call(global.coop_f_end, 1);
    ds_map_add(global.coop_gone, coop_nid, 1);
    ds_map_delete(global.coop_ents, coop_nid);
    ds_map_delete(global.coop_net_ids, id);
}

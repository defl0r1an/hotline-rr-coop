// Co-op client (also inherited by objFatKnockedOut / objSubwayKnockedOut): a knocked-out enemy replicated from
// the host was finished here (execution, human shield) -> the host removes the real one (EXECUTE 67: room i, nid i).
// The corpse the client's execution leaves is sent separately (CORPSE, scrCoopSendShots).
if (global.coop_role == 2 && !global.coop_netdestroy && ds_map_exists(global.coop_net_ids, id))
{
    if (objCoopNet.test_auto == 3)
    {
        external_call(global.coop_f_log, "test: client reports EXECUTE " + string(coop_nid));
    }
    external_call(global.coop_f_begin, 67);
    external_call(global.coop_f_wi, room);
    external_call(global.coop_f_wi, coop_nid);
    external_call(global.coop_f_end, 1);
    ds_map_add(global.coop_gone, coop_nid, 1);
    ds_map_delete(global.coop_ents, coop_nid);
    ds_map_delete(global.coop_net_ids, id);
    external_call(global.coop_f_log, "client: finished knocked-out " + string(coop_nid));
}

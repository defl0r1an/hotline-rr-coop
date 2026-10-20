if (ds_map_exists(global.coop_ents, nid))
{
    if (ds_map_find_value(global.coop_ents, nid) == id)
    {
        ds_map_delete(global.coop_ents, nid);
    }
}

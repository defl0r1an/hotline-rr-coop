// True on the client for instances replicated from the host (real objWeapon / objKnockedOut copies): their own
// Step, collision and animation logic must not run here, the host's ENT messages drive them.
if (global.coop_role != 2 || !global.coop_active)
{
    return 0;
}
return ds_map_exists(global.coop_net_ids, id);

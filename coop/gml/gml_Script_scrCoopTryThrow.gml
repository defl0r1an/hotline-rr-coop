// Client, called inside a newly created objWeaponThrow / objThrowingWeapon before its normal Step can
// collide with something and destroy it. The host creates the real projectile from THROW (83).
if (global.coop_role != 2 || !global.coop_active || ds_map_exists(global.coop_net_ids, id))
{
    return 0;
}
if (objCoopNet.test_auto == 3)
{
    external_call(global.coop_f_log, "test: client intercepts thrown weapon " + string(id));
}
scrCoopThrowSend();
global.coop_netdestroy = 1;
instance_destroy();
global.coop_netdestroy = 0;
return 1;

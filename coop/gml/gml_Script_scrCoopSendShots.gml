// End Step on a co-op floor (called by objCoopNet): projectiles created on this PC since the last frame
// (instance id above the coop_mark watermark) go to the partner. The client sends its own bullets / flames (FIRE),
// which the host re-creates as real projectiles that hit its enemies; the host sends its enemies' bullets (EFIRE),
// which the client re-creates as real objEBullet so its own collision code decides whether it dies.
// Projectiles that came from the network are listed in global.coop_net_ids and never sent back.
if (global.coop_role == 2)
{
    with (objBullet)
    {
        if (id > other.coop_mark && !ds_map_exists(global.coop_net_ids, id))
        {
            scrCoopFireSend(80);
        }
    }
    with (objFlame)
    {
        if (id > other.coop_mark && !ds_map_exists(global.coop_net_ids, id))
        {
            scrCoopFireSend(80);
        }
    }
    with (objExplosion)
    {
        if (id > other.coop_mark && !ds_map_exists(global.coop_net_ids, id))
        {
            scrCoopFireSend(80);
        }
    }
    with (objExplosionSkippy)
    {
        if (id > other.coop_mark && !ds_map_exists(global.coop_net_ids, id))
        {
            scrCoopFireSend(80);
        }
    }
    // Throws / drops: the host throws the real weapon; the local one is removed so it does not land twice.
    with (objWeaponThrow)
    {
        if (id > other.coop_mark && !ds_map_exists(global.coop_net_ids, id))
        {
            scrCoopThrowSend();
            global.coop_netdestroy = 1;
            instance_destroy();
            global.coop_netdestroy = 0;
        }
    }
    with (objThrowingWeapon)
    {
        if (id > other.coop_mark && !ds_map_exists(global.coop_net_ids, id))
        {
            scrCoopThrowSend();
            instance_destroy();
        }
    }
    // Corpses left by the client's own executions: the host creates the same one (it is not sent back).
    with (objDeadBody)
    {
        if (id > other.coop_mark && !ds_map_exists(global.coop_net_ids, id))
        {
            if (other.test_auto == 3)
            {
                external_call(global.coop_f_log, "test: client reports CORPSE");
            }
            external_call(global.coop_f_begin, 68);
            external_call(global.coop_f_wi, room);
            external_call(global.coop_f_wi, sprite_index);
            external_call(global.coop_f_wf, image_index);
            external_call(global.coop_f_w4, x, y, image_angle, 0);
            external_call(global.coop_f_end, 1);
        }
    }
}
else if (global.coop_role == 1)
{
    with (objEBullet)
    {
        if (id > other.coop_mark && !ds_map_exists(global.coop_net_ids, id))
        {
            scrCoopFireSend(81);
        }
    }
    // The host's own bullets / flames, shown on the client (82; real projectiles there, harmless to it).
    with (objBullet)
    {
        if (id > other.coop_mark && !ds_map_exists(global.coop_net_ids, id))
        {
            scrCoopFireSend(82);
        }
    }
    with (objFlame)
    {
        if (id > other.coop_mark && !ds_map_exists(global.coop_net_ids, id))
        {
            scrCoopFireSend(82);
        }
    }
    with (objExplosion)
    {
        if (id > other.coop_mark && !ds_map_exists(global.coop_net_ids, id))
        {
            scrCoopFireSend(82);
        }
    }
    with (objExplosionSkippy)
    {
        if (id > other.coop_mark && !ds_map_exists(global.coop_net_ids, id))
        {
            scrCoopFireSend(82);
        }
    }
    with (objBottleExplosion)
    {
        if (id > other.coop_mark && !ds_map_exists(global.coop_net_ids, id))
        {
            scrCoopFireSend(82);
        }
    }
    with (objMolotov)
    {
        if (id > other.coop_mark && !ds_map_exists(global.coop_net_ids, id))
        {
            scrCoopFireSend(82);
        }
    }
}

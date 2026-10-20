// End Step: this PC's player look and new projectiles for the partner (and, on the host, the enemies every 3rd
// frame), then the projectile watermark is moved past everything created so far, and the frame is sent.
coop_frame += 1;
if (global.coop_active)
{
    scrCoopSendPState();
    scrCoopSendShots();
    if (global.coop_role == 1)
    {
        if ((coop_frame mod 3) == 0)
        {
            scrCoopSendEnts();
        }
        scrCoopSendDoors();
    }
}
with (instance_create(0, 0, objCoopMarker))
{
    other.coop_mark = id;
    instance_destroy();
}
external_call(global.coop_f_flush);

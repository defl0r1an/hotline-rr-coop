// Co-op client: the elevator does not run here; standing in it asks the host to take both players on.
if (global.coop_role == 2 && global.coop_active)
{
    // The elevator's own Step (skipped here) sets up its collision mask, so test the distance to its centre.
    if (collision_circle(x, y, 14, objPlayer, false, true) != noone)
    {
        scrCoopSendReqExit(id);
    }
    exit;
}

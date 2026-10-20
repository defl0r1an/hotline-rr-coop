// Co-op: the SWAT raid is the host's (it counts enemies, and the client holds frozen copies of the knocked-out
// ones); its SWAT reach the client as ghosts.
if (global.coop_active && global.coop_role == 2)
{
    exit;
}

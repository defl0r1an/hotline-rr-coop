// Co-op client: the host decides floor changes; reaching an exit asks the host to use it (scrCoopRequestExit).
if (global.coop_role == 2 && global.coop_active)
{
    scrCoopRequestExit();
    exit;
}

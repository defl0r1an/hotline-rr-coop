// Co-op client: copies replicated from the host are driven by its ENT messages only.
if (scrCoopFrozen())
{
    exit;
}
if (scrCoopTryThrow())
{
    exit;
}

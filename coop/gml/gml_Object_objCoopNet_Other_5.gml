// Room End: destroy dead bodies so they do not persist into the room's persistent save
with (objPlayerDead)
{
    instance_destroy();
}

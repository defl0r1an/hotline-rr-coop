// Leg sprite an enemy of object argument0 draws under body sprite argument1 (as in the enemies' Draw events),
// or -1 when it draws none (searching / special poses).
var coop_o, coop_guard;
if (scrIsSearching(argument1))
{
    return -1;
}
coop_o = argument0;
coop_guard = 0;
while (coop_o >= 0 && coop_guard < 12)
{
    if (coop_o == objEnemyFat)
    {
        return sprEFatLegs;
    }
    if (coop_o == objPolice)
    {
        return sprPoliceLegs;
    }
    if (coop_o == objDogPatrol)
    {
        return -1;
    }
    coop_o = object_get_parent(coop_o);
    coop_guard += 1;
}
return sprELegs;

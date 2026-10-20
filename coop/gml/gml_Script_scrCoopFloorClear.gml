// Host: the condition objTransitioner_Step_0 uses to unlock the floor's exits (it skips that test while the host's
// player is dead, so co-op checks it directly).
if (instance_exists(objEnemy) || instance_exists(objKnockedOut) || instance_exists(objBoss) || instance_exists(objEHideM16) || instance_exists(objESubwayStatic))
{
    return 0;
}
if (instance_exists(objTrainTransition))
{
    if (objTrainTransition.stage != 2)
    {
        return 0;
    }
}
return 1;

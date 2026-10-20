// Client, from an exit's Collision_98 (self = exit, other = the player): the host decides floor changes, so ask
// it to use this exit.
if (other.object_index != objPlayerMouse && other.object_index != objPlayerMouseHouse && other.object_index != objPlayerShieldMouse && other.object_index != objPlayerBiker && other.object_index != objPlayerBikerHouse && other.object_index != objPlayerGriffin)
{
    exit;
}
scrCoopSendReqExit(id);

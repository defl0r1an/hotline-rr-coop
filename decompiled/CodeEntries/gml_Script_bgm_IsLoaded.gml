var ret;
if (is_real(argument0))
{
    ret = external_call(global._bgm_IsLoadedById, argument0);
}
else
{
    ret = external_call(global._bgm_IsLoadedByFname, argument0);
}
return ret;

var ret;
if (is_real(argument0))
{
    ret = external_call(global._bgm_FadeVolById, argument0, argument1, argument2);
}
else
{
    ret = external_call(global._bgm_FadeVolByFname, argument0, argument1, argument2);
}
if (!ret && global._bgm_showErrors)
{
    show_error(external_call(global._bgm_Error), 0);
}
return ret;

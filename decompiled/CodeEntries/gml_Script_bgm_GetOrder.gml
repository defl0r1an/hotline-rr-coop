var ret;
if (is_real(argument0))
{
    ret = external_call(global._bgm_GetOrderById, argument0);
}
else
{
    ret = external_call(global._bgm_GetOrderByFname, argument0);
}
if (ret == -1 && global._bgm_showErrors)
{
    show_error(external_call(global._bgm_Error), 0);
}
return ret;

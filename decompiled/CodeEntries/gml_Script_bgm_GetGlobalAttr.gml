var ret = external_call(global._bgm_GetAttrById, 0, argument0);
if (ret == "-1000000" && global._bgm_showErrors)
{
    show_error(external_call(global._bgm_Error), 0);
}
if (external_call(global._bgm_GetAttrTypeLast) == 1)
{
    return real(ret);
}
return ret;

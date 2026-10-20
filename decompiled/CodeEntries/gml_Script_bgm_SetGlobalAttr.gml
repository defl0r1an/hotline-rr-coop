if (is_real(argument1))
{
    argument1 = string(argument1);
}
var ret = external_call(global._bgm_SetAttrById, 0, argument0, argument1);
if (!ret && global._bgm_showErrors)
{
    show_error(external_call(global._bgm_Error), 0);
}
return ret;

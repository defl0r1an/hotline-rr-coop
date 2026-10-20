if (is_real(argument2))
{
    argument2 = string(argument2);
}
var ret;
if (is_real(argument0))
{
    ret = external_call(global._bgm_SetAttrById, argument0, argument1, argument2);
}
else
{
    ret = external_call(global._bgm_SetAttrByFname, argument0, argument1, argument2);
}
if (!ret && global._bgm_showErrors)
{
    show_error(external_call(global._bgm_Error), 0);
}
return ret;

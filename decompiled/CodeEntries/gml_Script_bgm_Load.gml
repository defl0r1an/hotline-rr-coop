var ret = external_call(global._bgm_Load, argument0, argument1, 0);
if (ret == 0 && global._bgm_showErrors != 0)
{
    show_error(external_call(global._bgm_Error), 0);
}
return ret;

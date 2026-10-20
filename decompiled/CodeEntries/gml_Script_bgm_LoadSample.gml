var ret = external_call(global._bgm_LoadSample, argument0, 0);
if (ret == 0 && global._bgm_showErrors != 0)
{
    show_error(external_call(global._bgm_Error), 0);
}
return ret;

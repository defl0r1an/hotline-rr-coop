if (bgm_IsLoaded(argument0))
{
    var ret;
    if (is_real(argument0))
    {
        ret = external_call(global._bgm_UnloadById, argument0);
    }
    else
    {
        ret = external_call(global._bgm_UnloadByFname, argument0);
    }
    if (!ret && global._bgm_showErrors)
    {
        show_error(external_call(global._bgm_Error), 0);
    }
    return ret;
}

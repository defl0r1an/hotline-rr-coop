if (argument1 >= 2)
{
    return ds_map_find_value(ds_list_find_value(ds_list_find_value(global.skins, argument0), argument1 - 2), argument2);
}
else
{
    return asset_get_index("sprMasks" + string_repeat(argument2, argument2 != "Mask") + string_repeat("Hard", argument1));
}

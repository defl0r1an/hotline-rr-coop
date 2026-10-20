surface_free(surf1);
surface_free(surf2);
if (ds_exists(rain_drops, ds_type_list))
{
    ds_list_clear(rain_drops);
    ds_list_destroy(rain_drops);
}

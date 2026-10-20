var dll = "CleanMem.dll";
if (argument0)
{
    external_free(dll);
    exit;
}
global._cleanmem = external_define(dll, "halo_shg_clean", dll_cdecl, ty_real, 0);
global._cleanmem_get_mem = external_define(dll, "halo_shg_get_mem", dll_cdecl, ty_real, 0);
return 0;

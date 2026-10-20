if (!external_call(global.get_instance_fields, argument0, 100))
{
    cl_print("DLL call failed", 255);
}
var out;
out[0] = "persistent";
return out;

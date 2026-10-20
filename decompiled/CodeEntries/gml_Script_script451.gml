var error_type = "";
switch (argument1)
{
    case 0:
        if (!is_numeric(argument0))
        {
            error_type = "number";
        }
        break;
    case 1:
        if (!(is_numeric(argument0) || argument0 == "true" || argument0 == "false"))
        {
            error_type = "bool";
        }
    default:
        return 0;
}
if (error_type)
{
    cl_print("Invalid argument of type <" + error_type + "> " + argument0, 255);
    return 1;
}
return 0;

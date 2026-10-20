if (instance_exists(objPlayer))
{
    return 0;
}
else
{
    cl_print("This command can be executed only at the play time", 255);
    return 1;
}

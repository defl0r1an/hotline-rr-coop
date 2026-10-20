if (state == 0 && test == 0)
{
    if (!file_exists(working_directory + "\hardmode"))
    {
        exit;
    }
    c_amount1 = 0;
    global.hardmode = !global.hardmode;
}

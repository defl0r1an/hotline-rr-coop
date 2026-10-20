if (fade == 1)
{
    exit;
}
if (level == 0)
{
    file_delete(working_directory + "\skip");
    fade = 1;
    select = 3;
}
if (level == 1)
{
    select = 0;
    alt[0] = "NEW GAME";
    alt[1] = "CONTINUE";
    level = 0;
}

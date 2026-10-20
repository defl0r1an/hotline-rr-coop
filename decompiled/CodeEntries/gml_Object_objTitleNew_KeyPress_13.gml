if (level == 0)
{
    if (select == 0)
    {
        if (file_exists(working_directory + "\hardmode"))
        {
            level = 1;
            alt[0] = "NORMAL";
            alt[1] = "HARD";
            exit;
        }
        else
        {
            select = 0;
            fade = 1;
            scrInitScore();
        }
    }
    if (select == 1)
    {
        fade = 1;
        scrInitScore();
    }
    if (select == 2)
    {
        fade = 1;
    }
    if (select == 3)
    {
        file_delete(working_directory + "\skip");
        fade = 1;
    }
}
if (level == 1)
{
    if (select == 0)
    {
        fade = 1;
        scrInitScore();
    }
    if (select == 1)
    {
        fade = 1;
        scrInitScore();
    }
}

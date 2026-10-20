if (fade == 1 || wait > 0)
{
    exit;
}
wait = 3;
repeats = 0;
if (level == 0)
{
    if (select < 3)
    {
        select += 1;
    }
    else
    {
        select = 0;
    }
}
if (level == 1)
{
    if (select < 1)
    {
        select += 1;
    }
    else
    {
        select = 0;
    }
}

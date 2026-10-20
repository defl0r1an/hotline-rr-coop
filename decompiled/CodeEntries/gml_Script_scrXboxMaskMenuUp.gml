if (!on)
{
    exit;
}
select -= 1;
if (select < 0)
{
    select = masks - 1;
}
exit;

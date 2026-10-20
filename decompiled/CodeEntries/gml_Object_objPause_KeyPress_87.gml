if (on == 0 || fade == 1 || wait > 0 || instance_exists(objOptionsPause) || instance_exists(objPuzzle))
{
    exit;
}
wait = 3;
if (select > 0)
{
    select -= 1;
}
else
{
    select = 4;
}
if (select == 2 && test1 == 1)
{
    select = 1;
}
if (select == 1 && test == 1)
{
    select = 0;
}

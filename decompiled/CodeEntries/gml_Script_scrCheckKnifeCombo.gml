if (((global.combo + 1) % 5) == 0)
{
    global.combogift = 1;
}
if ((global.combo % 5) == 0 && global.combogift == 1)
{
    global.knives += 1;
    global.combogift = 0;
}

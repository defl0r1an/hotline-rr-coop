if (argument1 > 100)
{
    argument1 = 100;
}
if (argument1 < 0)
{
    argument1 = 0;
}
return bgm_SetAttr(argument0, "cVolume", argument1);

if (room == rmMCBar)
{
    global.done = 0;
    global.phone = 0;
    global.package = 0;
    global.level = 138;
    global.pretitle = "SIXTEENTH CHAPTER";
    global.title = "SAFEHOUSE";
    global.sequence = 37;
    global.revisit = 0;
    return 13;
}
if (room == rmNoodleShop)
{
    return 16;
}
if (room == rmMCSequence2Downstairs)
{
    return 13;
}
if (room == rmArcadeDownstairs)
{
    return 16;
}
if (room == rmMCSequence3Downstairs)
{
    return 13;
}
if (room == rmPhoneHomEntranceBiker)
{
    return 42;
}
if (room == rmMCSequence4Downstairs)
{
    return 13;
}
if (room == rmJanitors)
{
    return 88;
}
return room;

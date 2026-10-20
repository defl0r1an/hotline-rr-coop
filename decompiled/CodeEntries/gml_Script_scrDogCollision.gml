if (place_meeting(argument0, argument1, objGlassPanelH) || place_meeting(argument0, argument1, objGlassPanelV))
{
    global.check = 1;
    stop = 1;
    return 0;
}
if (place_meeting(argument0, argument1, objGlassPanelHBroken) || place_meeting(argument0, argument1, objGlassPanelVBroken) || place_meeting(argument0, argument1, objFurniture))
{
    return 1;
}
else
{
    return 0;
}

if (global.combo > 1)
{
    switch (timer)
    {
        case 0:
            comboline += 5;
            break;
        case 1:
            comboline += 7.5;
            break;
        case 2:
            comboline += 10;
            break;
        case 3:
            comboline += 10;
            break;
        case 4:
            comboline += 10;
            break;
        case 5:
            comboline += 7.5;
            break;
        case 6:
            comboline += 5;
            break;
        case 7:
            comboline = 0;
            movingline = 0 + (global.combotime / 1.95);
            break;
    }
}

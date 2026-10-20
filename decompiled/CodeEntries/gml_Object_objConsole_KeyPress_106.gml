switch (global.debugstep)
{
    case 1:
        global.debugstep = 0.1;
        break;
    case 0.1:
        global.debugstep = 0.01;
        break;
    case 0.01:
        global.debugstep = 10;
        break;
    case 10:
        global.debugstep = 1;
        break;
}

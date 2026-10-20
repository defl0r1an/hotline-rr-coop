switch (global.debugmode)
{
    case "i":
        global.debugmode = "j";
        break;
    case "j":
        global.debugmode = "k";
        break;
    case "k":
        global.debugmode = "i";
        break;
}

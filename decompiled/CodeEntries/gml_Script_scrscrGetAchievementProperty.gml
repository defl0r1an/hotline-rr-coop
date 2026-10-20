ini_open("Achievements.ini");
switch (argument0)
{
    case "Dog Lover":
        count = 1;
        counttext = string(ini_read_real("AchData", "Dogs Killed", 0)) + "/99";
        countcolor = ini_read_real("AchData", "Dogs Killed", 0) / 99;
        break;
    case "Butcher":
        count = 1;
        counttext = string(ini_read_real("AchData", "Fat Chainsaw Killed", 0)) + "/15";
        countcolor = ini_read_real("AchData", "Fat Chainsaw Killed", 0) / 15;
        break;
    case "Guns for a show":
        count = 1;
        counttext = string(ini_read_real("AchData", "UsedGuns", 0)) + "/18";
        countcolor = ini_read_real("AchData", "UsedGuns", 0) / 18;
        break;
    case "Knife for pros":
        count = 1;
        counttext = string(ini_read_real("AchData", "UsedMelee", 0)) + "/21";
        countcolor = ini_read_real("AchData", "UsedMelee", 0) / 21;
        break;
    case "Pitcher":
        count = 1;
        counttext = string(ini_read_real("AchData", "UsedThrows", 0)) + "/7";
        countcolor = ini_read_real("AchData", "UsedThrows", 0) / 7;
        break;
    case "Always on top":
        count = 1;
        counttext = string(ini_read_real("AchData", "UsedKills", 0)) + "/51";
        countcolor = ini_read_real("AchData", "UsedKills", 0) / 51;
        break;
    case "Zoo Keeper":
        count = 1;
        counttext = string(ini_read_real("AchData", "Masks", 0)) + "/28";
        countcolor = ini_read_real("AchData", "Masks", 0) / 28;
        break;
    case "I Got New Friends":
        count = 1;
        counttext = string(ini_read_real("AchData", "Guns", 0)) + "/16";
        countcolor = ini_read_real("AchData", "Guns", 0) / 16;
        break;
    case "Eye For Details":
        count = 1;
        counttext = string(ini_read_real("AchData", "Letters", 0)) + "/16";
        countcolor = ini_read_real("AchData", "Letters", 0) / 16;
        break;
    case "Animals Fight":
        count = 1;
        counttext = string(ini_read_real("AchData", "UsedMasks", 0)) + "/28";
        countcolor = ini_read_real("AchData", "UsedMasks", 0) / 28;
        break;
    case "Karma":
        count = 1;
        counttext = string(ini_read_real("AchData", "Deaths", 0)) + "/100";
        countcolor = ini_read_real("AchData", "Deaths", 0) / 100;
        break;
    case "Vandal":
        count = 1;
        counttext = string(ini_read_real("AchData", "Windows broken", 0)) + "/50";
        countcolor = ini_read_real("AchData", "Windows broken", 0) / 50;
        break;
    case "You're Dead Meat":
        count = 1;
        counttext = string(ini_read_real("AchData", "Deaths Biker", 0)) + "/4";
        countcolor = ini_read_real("AchData", "Deaths Biker", 0) / 4;
        break;
    case "101 Dalmatiner":
        count = 1;
        counttext = string(ini_read_real("AchData", "Save dog", 0)) + "/101";
        countcolor = ini_read_real("AchData", "Save dog", 0) / 101;
        break;
    case "60 To Car":
        count = 1;
        counttext = string(ini_read_real("AchData", "Dopefish", 0)) + "/60";
        countcolor = ini_read_real("AchData", "Dopefish", 0) / 60;
        break;
    case "1989":
        count = 1;
        counttext = string(ini_read_real("AchData", "Kills", 0)) + "/1989";
        countcolor = ini_read_real("AchData", "Kills", 0) / 1989;
        break;
    case "Camera Shy":
        count = 1;
        counttext = string(ini_read_real("AchData", "CameraDestroy", 0)) + "/8";
        countcolor = ini_read_real("AchData", "CameraDestroy", 0) / 8;
        break;
    default:
        count = 0;
}
ini_close();

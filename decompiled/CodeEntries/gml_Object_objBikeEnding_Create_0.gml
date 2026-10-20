if (global.xbox == 1)
{
    scrInitXboxButtons();
}
global.levels[19] = 1;
scrSaveUnlocked();
global.newguns = 0;
if (global.ending == 0 && global.masks[18] == 0)
{
    SteamSetAchievement("ACH_THATS_IT");
    global.sequence = 39;
    global.newmask[global.newmasks] = 18;
    global.newmasks += 1;
    global.lastgrade = 0;
}
if (global.ending == 1 && global.masks[20] == 0)
{
    scrAchievementSet("That Is It");
    global.sequence = 41;
    global.masks[20] = 1;
    global.newmask[global.newmasks] = 20;
    global.newmasks += 1;
    global.lastgrade = 0;
}
scrCheckMasks();
image_speed = 0.2;
x = -96;
state = 1;
targety = (y - 6) + random(12);
centery = y;
dir = 0;
fade = 0;
c_amount = 0;
credits_y = room_height;
if (global.gotbeaten == 1)
{
    sprite_index = sprBikerDriveUnmasked;
}
else
{
    sprite_index = sprMCDrive;
}
if (global.hardmode == 0)
{
    global.grade[19] = 16;
}
else
{
    global.hardmodegrade[19] = 16;
}
start_time = current_time;
credits = "'Hotline Miami: Super R-R'###A modification by#@Pi0h1 (original creator)#Skide (Lead R-R)#Nerkusha (R-R)#Tonis (R-R)#Snipper (R-R)#Dgamza (R-R), (SUPER R-R)#hikitok (R-R), (SUPER R-R)#The Denny (R-R), (SUPER R-R)#Maxim_S (left R-R)#Xesed (R-R)#Aura (left R-R)#Gelecsone (R-R)#Crypt Voice (Left R-R)#OldFilin (SUPER R-R)#Hints of Blue (Outsource)#Shosray#Altro50#THELEGOMack#Dr. Wizard#Asire#a1337spy#Fencing Man#Cam#Aronanners#ChargerHM###Based on the game##'HOTLINE MIAMI'##by##DENNATON GAMES####game design by##JONATAN SÖDERSTRÖM##& DENNIS WEDIN####graphics artist##DENNIS WEDIN####additional graphics##JONATAN SÖDERSTRÖM####programmer##JONATAN SÖDERSTRÖM######additional programming##OSCAR DRAGEN####sound effects##JORDAN FEHR####mac version##LEON ARNOTT######published by##DEVOLVER DIGITAL##-----------##GRAEME STRUTHERS##NIGEL LOWRIE##RICK STULTS##MIKE WILSON##HARRY MILLER##STEPHANIE TINSLEY-SCHOPP##KIRK JOHNSON##WILL ELLIOTT######music by##SUN ARAW##COCONUTS##M|O|O|N##JASPER BYRNE##EL HUERVO##PERTURBATOR##SCATTLE##ELIOTT BERLIN##EIRIK SUHRKE######special thanks to####TIM W##VILLE KRUMLINDE##JEFF ROBERTS##NIKLAS AKERBLAD##MATS EK##PETER RASMUSSON##MARTIN SVENSSON##OSCAR DRAGEN##MARKUS LARSSON##LINDA PARLESTEN##NIGEL LOWRIE##JAN WILLEM NIJMAN##RAMI ISMAIL#############THE END#######################THANK YOU FOR PLAYING!";

if (!instance_exists(objHLM1Scanlines))
{
    instance_create(x, y, objHLM1Scanlines);
}
if (!instance_exists(objHLM2Noise))
{
    instance_create(x, y, objHLM2Noise);
}
global.CarDebug = 0;
global.igelcutscenes = 0;
global.executionx = 0;
global.executiony = 0;
global.CleaverSteel = 1;
global.deadScreenIgelSpeed = 0;
global.deadScreenIgel = 0;
global.chargeSkippy = 0;
global.GlowSkippyEnd = 0;
global.datefix = 0;
global.datefix1 = 0;
global.dog = 0;
global.angleshake = 0;
global.dir = 0;
global.bigballs = 0;
global.bigballssave = 0;
global.powerIgel = 0;
global.pickedtrunk = 0;
global.hospitalelevator = 1;
global.RasmusMadnes = 0;
color = 16777215;
global.xbox = 0;
scrInitXboxButtons();
if (file_exists(working_directory + "\xbox"))
{
    global.xbox = 1;
    dllinit();
}
global.mvol = 1;
global.svol = 1;
global.smvol = 1;
global.colorRedux = 0;
scrLoadVol();
cleanmem_init(0);
global.shells = 0;
global.shellssave = 0;
global.achcount = 0;
global.limitreload = 30;
global.killscored = 0;
global.cheater = 0;
global.scoreupdategrade = 1;
global.currentsongmuffled = 0;
sxeasy_setMasterVolume();
wait = 0;
global.alienware = 0;
if (file_exists(working_directory + "\alienware"))
{
    global.alienware = 1;
    scrAlienWareInit();
    scrAlienWarePink();
}
else
{
    global.alienware = 0;
}
global.overleft = 0;
global.overright = 0;
global.NotSaved = 0;
global.combogift = 0;
global.knives = 3;
global.knivessave = 3;
global.meleeenergiesave = 2;
global.meleeenergie = 2;
global.infiniteknives = 0;
global.sprinttime = -1;
global.coolingtime = -1;
global.gascount = 0;
global.willemweapon = 0;
global.willemammo = 0;
global.willemget = 0;
global.throwindex = 0;
global.controllertype = 1;
global.upkey = "W";
global.downkey = "S";
global.leftkey = "A";
global.rightkey = "D";
global.restartkey = "R";
global.debugi = 0;
global.debugj = 0;
global.debugk = 0;
global.debugstep = 1;
global.debugmode = "i";
scrLoadKeys();
global.surface[0] = surface_create(room_width * 3, room_height * 3);
surface_set_target(global.surface[0]);
draw_clear_alpha(c_black, 0);
surface_alpha();
surface_reset_target();
global.surface2[0] = surface_create(room_width * 3, room_height * 3);
surface_set_target(global.surface2[0]);
draw_clear_alpha(c_black, 0);
surface_alpha();
surface_reset_target();
global.surface[1] = 0;
global.surface2[1] = 0;
global.surface[2] = 0;
global.surface2[2] = 0;
global.surface[3] = 0;
global.surface2[3] = 0;
global.surface[4] = 0;
global.surface2[4] = 0;
global.surface[5] = 0;
global.surface2[5] = 0;
global.surface[6] = 0;
global.surface2[6] = 0;
global.surface[7] = 0;
global.surface2[7] = 0;
global.surface[8] = 0;
global.surface2[8] = 0;
global.surface[9] = 0;
global.surface2[9] = 0;
global.PastSaved[0] = 0;
global.PastSaved[1] = 0;
global.PastSaved[2] = 0;
global.PastSaved[3] = 0;
global.PastSaved[4] = 0;
global.PastSaved[5] = 0;
global.maskload = 0;
global.masksaved = 0;
global.maskonsaved = 0;
global.weaponsprite = 45;
global.ammoweapon = 0;
global.PauseRestart = 0;
coldir = 0;
x = room_width / 2;
y = (room_height / 3) - 12;
dir = random(10000);
repeats = 1;
global.shake = 0;
alt[0] = "START GAME";
scrLoadUnlocked();
alt[1] = "CONTINUE";
i = 0;
repeat (20)
{
    if (global.levels[i] == 1)
    {
        i += 1;
    }
}
if (i == 20)
{
    alt[1] = "CHAPTERS";
}
i = 0;
alt[2] = "OPTIONS";
alt[3] = "EXIT GAME";
global.bonuslist = ds_list_create();
global.bonustime = 0;
global.newmasks = 0;
global.ammotype = 0;
nextlevel = 22;
level = 0;
select = 0;
rdir = 0;
global.paused = 0;
global.surf1 = surface_create(room_width + 160, room_height + 64);
surface_set_target(global.surf1);
draw_clear_alpha(c_black, 0);
surface_alpha();
surface_reset_target();
global.surf2 = surface_create(1920, 1440);
surface_set_target(global.surf2);
draw_clear_alpha(c_black, 0);
surface_alpha();
surface_reset_target();
global.surf3 = surface_create(1920, 1440);
surface_set_target(global.surf3);
draw_clear_alpha(c_black, 0);
surface_alpha();
surface_reset_target();
cleanmem();
c_amount = 0;
fade = 0;
volume = 1;
presstart = 0;
pressup = 0;
pressdown = 0;
global.controller = 0;
pindex = 0;
alarm[0] = 45;
global.talked = 1;
global.talkedhospital = 0;
global.headdoctor = 0;
global.i = 0;
repeat (10)
{
    my_id = instance_create(x, y, objPalmTree);
    with (my_id)
    {
        repeat (global.i * 45)
        {
            amount *= 1.01;
            amount2 *= 1.012;
        }
    }
    global.i += 1;
}
global.blood = 1;
if (file_exists(working_directory + "\blood"))
{
    global.blood = 0;
}
global.phone = 0;
global.surfaces = 1;
global.surfacesprites = 0;
global.resetstory = 0;
global.comboflash = 0;
global.parttitle[0] = "PART ONE:";
global.parttitle[1] = "PHONECALLS.";
global.title = "CHEATER";
global.nextlevel = 22;
global.sequence = 44;
global.revisit = 0;
global.maskon = 1;
global.cursurf = 9;
global.maskindex = 0;
quit = 0;
scrAchievementsInit();
scrLoadAchievements();
scrLoadUnlocked();
scrCheckLetters();
scrCheckGuns();
scrCheckMasks();
global.interfaceon = 1;
global.cursoron = 1;
global.limitreload = 30;
surface_free(global.surf1);
surface_free(global.surf2);
surface_free(global.surf3);
global.surf1 = surface_create(room_width, room_height);
global.surf2 = surface_create(room_width * 3, room_height * 3);
global.surf3 = surface_create(room_width * 3, room_height * 3);
surface_set_target(global.surf1);
draw_clear_alpha(c_black, 0);
surface_reset_target();
surface_set_target(global.surf2);
draw_clear_alpha(c_black, 0);
surface_reset_target();
surface_set_target(global.surf3);
draw_clear_alpha(c_black, 0);
surface_reset_target();
global.viewwview = view_wview[0];
global.viewhview = view_hview[0];
global.wview = view_wview[0];
global.hview = view_hview[0];
global.ErrorText = "";
if (global.MissingSkinWarning == 1)
{
    global.ErrorText = "SKIN MISSING WARNING, SKIN BY DEFAULT";
    my_id = instance_create(x, y, objError);
    global.MissingSkinWarning = 0;
}

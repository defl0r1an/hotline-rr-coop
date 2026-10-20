if (global.resetstory)
{
    exit;
}
global.done = 0;
global.phone = 0;
global.package = 0;
global.level = 98;
global.pretitle = "FOURTH CHAPTER";
global.title = "TENSION";
global.sequence = 52;
global.revisit = 0;
if (global.igelcutscenes == -2)
{
    sxeasy_stop(1);
    global.masks[27] = 1;
    scrCheckMasks();
    audio_play_sound(sndToken, 0, false);
    my_id = instance_create(x, y, objLetterFound);
    my_id.text = '"' + scrMaskGetName(37) + '"';
    scrAchievementSet("Sneeze");
    objEffectorHouse.brus = 35;
    objEffectorHouse.newsong = 1;
    objEffectorHouse.song = global.DeepCover;
    global.igelcutscenes = 0;
    scrSaveUnlocked();
}

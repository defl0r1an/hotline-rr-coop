folder = "original";
switch (global.crypt_voice)
{
    case 0:
        folder = "crypt_voice";
        break;
    case 1:
        folder = "original";
        break;
    case 2:
        folder = "custom";
        break;
}
global.Daisuke = working_directory + "\music\" + folder + "\Daisuke.mp3";
global.Paris2 = working_directory + "\music\" + folder + "\Paris2.mp3";
global.Crystals = working_directory + "\music\" + folder + "\Crystals.mp3";
global.Hotline = working_directory + "\music\" + folder + "\Hotline.mp3";
global.Hydrogen = working_directory + "\music\" + folder + "\Hydrogen.mp3";
global.Perturbator = working_directory + "\music\" + folder + "\Perturbator.mp3";
global.Crystals = working_directory + "\music\" + folder + "\Crystals.mp3";
global.Knock = working_directory + "\music\" + folder + "\Knock.mp3";
global.InnerAnimal = working_directory + "\music\" + folder + "\InnerAnimal.mp3";
global.TurfMain = working_directory + "\music\" + folder + "\TurfMain.mp3";
global.ToTheTop = working_directory + "\music\" + folder + "\ToTheTop.mp3";
global.Musikk2 = working_directory + "\music\" + folder + "\Musikk2.mp3";
global.Miami2 = working_directory + "\music\" + folder + "\Miami2.mp3";
global.ANewMorning = working_directory + "\music\" + folder + "\ANewMorning.mp3";
global.DeepCover = working_directory + "\music\" + folder + "\DeepCover.mp3";
global.TurfIntro = working_directory + "\music\" + folder + "\TurfIntro.mp3";
global.ItsSafeNow = working_directory + "\music\" + folder + "\ItsSafeNow.mp3";
global.Static = working_directory + "\music\" + folder + "\Static.mp3";
global.HorseSteppin = working_directory + "\music\" + folder + "\HorseSteppin.mp3";
global.SilverLights = working_directory + "\music\" + folder + "\SilverLights.mp3";
global.Flatline = working_directory + "\music\" + folder + "\Flatline.mp3";
global.Scavenger = working_directory + "\music\" + folder + "\Scavenger.mp3";
global.Release = working_directory + "\music\" + folder + "\Release.mp3";
global.ElectricDreams = working_directory + "\music\" + folder + "\ElectricDreams.mp3";
global.Bridal = working_directory + "\music\" + folder + "\Bridal.mp3";
global.BlackTar = working_directory + "\music\" + folder + "\BlackTar.mp3";
global.Lady = working_directory + "\music\" + folder + "\Lady.mp3";
global.MadnessAlligatorLoop = working_directory + "\music\" + folder + "\MadnessAlligatorLoop.mp3";
global.SewerAlligator = working_directory + "\music\" + folder + "\SewerAlligator.mp3";
global.SilentNeighbors = working_directory + "\music\" + folder + "\SilentNeighbors.mp3";
global.TheKnockOfTheCoffin = working_directory + "\music\" + folder + "\TheKnockOfTheCoffin.mp3";
if (!file_exists(working_directory + "\music\" + folder + "\muffled\Knock.ogg"))
{
    res = external_call(global._lowpass, working_directory + "\music\" + folder + "\Knock.ogg", working_directory + "\music\" + folder + "\muffled\Knock.ogg", 2500, 0.65);
}
global.KnockMuffled = working_directory + "\music\" + folder + "\muffled\Knock.mp3";
